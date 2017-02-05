#!/bin/bash
if test -r "$1" -a -f "$1"
	then
		cat "$1" | jq --slurp --compact-output 'def flatten: reduce .[] as $i ([]; if $i | type == "array" then . + ($i | flatten) else . + [$i] end); [.[] | {faction: .faction} ] | unique | .[]' > factions.jsonl
		cat "$1" | jq --slurp --compact-output 'def flatten: reduce .[] as $i ([]; if $i | type == "array" then . + ($i | flatten) else . + [$i] end); [.[] | {type: .type} ] | unique | .[] | select(.type !=null)' > types.jsonl
		cat "$1" | jq --slurp --compact-output 'def flatten: reduce .[] as $i ([]; if $i | type == "array" then . + ($i | flatten) else . + [$i] end); [.[] | {rarity: .variations[].rarity} ] | unique | .[]' > rarities.jsonl
		cat "$1" | jq --slurp --compact-output 'def flatten: reduce .[] as $i ([]; if $i | type == "array" then . + ($i | flatten) else . + [$i] end); [.[] | .category] | flatten | unique | to_entries | .[] | select(.value !=null) | {category: .value}' > categories.jsonl
else
	echo "Error: File doesn't exists or can't read file."
fi