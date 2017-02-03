#!/bin/bash
if test -r "$1" -a -f "$1"
	then
		cat "$1" | jq --slurp --compact-output '[.[] | {faction: .faction} ] | unique | .[]' > factions.jsonl
		cat "$1" | jq --slurp --compact-output '[.[] | {type: .type} ] | unique | .[] | select(.type !=null)' > types.jsonl
		cat "$1" | jq --slurp --compact-output '[.[] | {rarity: .variations[].rarity} ] | unique | .[]' > rarities.jsonl
		cat "$1" | jq --slurp --compact-output '[.[] | .category] | flatten | unique | to_entries | .[] | select(.value !=null) | {category: .value}' > categories.jsonl
else
	echo "Error: File doesn't exists or can't read file."
fi