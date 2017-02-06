#!/usr/bin/python3
# -*- coding: utf-8 -*-

import os.path
import json
import time
import argparse
import uuid
import pymongo

from unidecode import unidecode

args = {}

client = pymongo.MongoClient()
gwentDB = client.gwentapi
SOURCE_FOLDER = "./"
FILES = {"rarities": SOURCE_FOLDER + "rarities.jsonl", "groups": SOURCE_FOLDER + "groups.jsonl",
         "factions": SOURCE_FOLDER + "factions.jsonl", "categories": SOURCE_FOLDER + "categories.jsonl"}

CARDS_FILE = SOURCE_FOLDER + "cards.jsonl"

# Save a list of cards in a file in the json format.
# filename is the name under which the file will be saved.
# cardList is the list of cards.
# The file is saved in the same path as where the script is ran from.
def saveJson(filename, cardList):
    filepath = os.path.join('./output/' + filename)
    print("Saving %s cards to: %s" % (len(cardList), filepath))
    with open(filepath + ".json", "w", encoding="utf-8", newline="\n") as f:
        json.dump(cardList, f, ensure_ascii=False, sort_keys=True, indent=2, separators=(',', ': '))
    with open(filepath + ".jsonl", "w", encoding="utf-8", newline="\n") as f:
        isFirst = True
        for card in cardList:
            if not isFirst:
                f.write("\n")
            else:
                isFirst = False
            json.dump(card, f, ensure_ascii=False, sort_keys=True)


def insertUUID(item):
    id = str(uuid.uuid4())
    item["uuid"] = id


def insertInitial():
    pass


def testIfFileExists():
    for key, path in FILES.items():
        if not os.path.isfile(path):
            print("Error: " + path + " doesn't exists.")
            return False
    return True


def dropCollections(collection):
    gwentDB[collection].drop()


def main():
    if not testIfFileExists():
        return

    for collection, path in FILES.items():
        print("Working on: " + collection)
        dropCollections(collection)
        with open(path, encoding="utf-8", newline="\n") as f:
            for line in f:
                data = json.loads(line)
                insertUUID(data)
                gwentDB[collection].insert_one(data)
            gwentDB[collection].create_index([('name', pymongo.ASCENDING)], unique=True)
            gwentDB[collection].create_index([('uuid', pymongo.ASCENDING)], unique=True)
    # Processing cards
    dropCollections("cards")
    with open(CARDS_FILE, encoding="utf-8", newline="\n") as f:
        for line in f:
            data = json.loads(line)
            for variation in data["variations"]:
                # Empty fullsizeImageUrl until we are ready to deal with it
                variation["art"]["fullsizeImageUrl"] = ""
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
            for variation in data["variations"]:
                if "rarity" in variation:
                    rarity_id = gwentDB.rarities.find_one({"name": variation["rarity"]})["_id"]
                    variation["rarity_id"] = rarity_id
            if "categories" in data:
                categories_id = list()
                for category in data["categories"]:
                    category_id = gwentDB.categories.find_one({"name": category})["_id"]
                    categories_id.append(category_id)
                data["categories_id"] = categories_id
            insertUUID(data)
            gwentDB.cards.insert_one(data)
        gwentDB.cards.create_index([('name', pymongo.ASCENDING)], unique=True)
        gwentDB.cards.create_index([('uuid', pymongo.ASCENDING)], unique=True)

if __name__ == '__main__':
    # setParser()
    print("Starting")
    start = time.time()
    main()
    print("Elapsed Time: %s" % (time.time() - start))
