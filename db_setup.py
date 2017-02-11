#!/usr/bin/python3
# -*- coding: utf-8 -*-

import os.path
import json
import sys
import time
import argparse
import uuid
import pymongo

args = {}

client = None
gwentDB = None

SOURCE_FOLDER = "./"
FILES = {"rarities": SOURCE_FOLDER + "rarities.jsonl", "groups": SOURCE_FOLDER + "groups.jsonl",
         "factions": SOURCE_FOLDER + "factions.jsonl", "categories": SOURCE_FOLDER + "categories.jsonl"}

CARDS_FILE = SOURCE_FOLDER + "cards.jsonl"


# Set the command line parameters.
def set_parser():
    parser = argparse.ArgumentParser(description='This script allows you to perform the initial seed '
                                                 'for the gwentapi db.')
    parser.add_argument('-f', '--force', help='Disable safeguards and force the database to be dropped'
                                              'before the insertion of the data.',
                        action='store_true', required=False)
    parser.add_argument('-u', '--username', help='Username used for authentication')
    parser.add_argument('-p', '--password', help='Indicate that a password is needed for the authenticated user.'
                                                 'Will start an interactive prompt.', action='store_true')
    parser.add_argument('--host', help='The host to connect to.')
    parser.add_argument('--port', help='Port to connect to.')
    parser.add_argument('--authenticationDatabase', help='Database to authenticate to. Where your user account '
                                                         'was created.')

    global args
    args = parser.parse_args()


def is_insert_safe():
    collections = gwentDB.collection_names(include_system_collections=False)
    for collection, path in FILES.items():
        if collection in collections:
            return False
    if "cards" in collections:
        return False
    if "variations" in collections:
        return False
    return True


def insertUUID(item):
    id = str(uuid.uuid4())
    item["uuid"] = id


def testIfFileExists():
    for key, path in FILES.items():
        if not os.path.isfile(path):
            print("Error: " + path + " doesn't exists.")
            return False
    return True


def drop_collections(collection):
    print("Dropping the '" + collection + "' collection.")
    gwentDB[collection].drop()


def mongodb_conn():
    try:
        if args.host and args.port:
            return pymongo.MongoClient(args.host, args.port)
        elif args.host:
            return pymongo.MongoClient(args.host)
        else:
            return pymongo.MongoClient()
    except pymongo.errors.ConnectionFailure as e:
        print("Could not connect to the server: %s" % e)


# Untested on other platforms other than Linux.
def getpass():
    password = ""
    if sys.platform != "win32":
        os.system("stty -echo")
        password = input("Enter Password: ")
        os.system("stty echo")
        print("")
    else:
        password = input("Enter Password: ")
    return password


def mongodb_auth():
    try:
        if args.password and args.username and args.authenticationDatabase:
            password = getpass()
            client.gwentapi.authenticate(args.username, password, source=args.authenticationDatabase)
        elif args.password and args.username:
            password = getpass()
            client.gwentapi.authenticate(args.username, password)
        return True
    except pymongo.errors.OperationFailure as e:
        print("Error: %s" % e)
        return False


def main():
    global gwentDB
    global client

    client = mongodb_conn()

    gwentDB = client.gwentapi
    if not mongodb_auth():
        return

    if not testIfFileExists():
        return
    if not args.force and not is_insert_safe():
        print("The database already contain some collections.")
        print("The operation was aborted.")
        return

    for collection, path in FILES.items():
        print("Working on: " + collection)
        drop_collections(collection)
        with open(path, encoding="utf-8", newline="\n") as f:
            for line in f:
                data = json.loads(line)
                insertUUID(data)
                gwentDB[collection].insert_one(data)
            gwentDB[collection].create_index([('name', pymongo.ASCENDING)], unique=True)
            gwentDB[collection].create_index([('uuid', pymongo.ASCENDING)], unique=True)
    # Processing cards
    print("Working on: cards")
    drop_collections("cards")
    drop_collections("variations")
    with open(CARDS_FILE, encoding="utf-8", newline="\n") as f:
        for line in f:
            data = json.loads(line)
            for variation in data["variations"]:
                variation["art"]["fullsizeImage"] = data["key"] + "_full.png"
                variation["art"]["thumbnailImage"] = data["key"] + "_thumbnail.png"
            data.pop("key", None)
            # Manual reference for faction
            if "faction" in data:
                faction_id = gwentDB.factions.find_one({"name": data["faction"]})["_id"]
                data["faction_id"] = faction_id
            # Renaming type to group until the jsonl format change.
            # Manual reference for group
            if "type" in data:
                data["group"] = data.pop("type")
                group_id = gwentDB.groups.find_one({"name": data["group"]})["_id"]
                data["group_id"] = group_id
            if "categories" in data:
                categories_id = list()
                for category in data["categories"]:
                    category_id = gwentDB.categories.find_one({"name": category})["_id"]
                    categories_id.append(category_id)
                data["categories_id"] = categories_id

            insertUUID(data)
            variations = data.pop("variations")
            card_id = gwentDB.cards.insert_one(data).inserted_id
            for variation in variations:
                if "rarity" in variation:
                    rarity_id = gwentDB.rarities.find_one({"name": variation["rarity"]})["_id"]
                    variation["rarity_id"] = rarity_id
                    variation["card_id"] = card_id
            gwentDB.variations.insert_many(variations)
        gwentDB.cards.create_index([('name', pymongo.ASCENDING)], unique=True)
        gwentDB.cards.create_index([('uuid', pymongo.ASCENDING)], unique=True)
        gwentDB.variations.create_index([('card_id', pymongo.ASCENDING)])

if __name__ == '__main__':
    set_parser()
    print("Starting")
    start = time.time()
    main()
    print("Elapsed Time: %s" % (time.time() - start))
