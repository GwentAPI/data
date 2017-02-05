#!/bin/bash
if test -r "$1" -a -f "$1"
	then
		cat "$1" | jq --slurp --compact-output 'def flatten: reduce .[] as $i ([]; if $i | type == "array" then . + ($i | flatten) else . + [$i] end); [.[] | {name: .faction} ] | unique | .[]' > factions.jsonl
		cat "$1" | jq --slurp --compact-output 'def flatten: reduce .[] as $i ([]; if $i | type == "array" then . + ($i | flatten) else . + [$i] end); [.[] | {name: .type} ] | unique | .[] | select(.name !=null)' > 'groups.jsonl'
		cat "$1" | jq --slurp --compact-output 'def flatten: reduce .[] as $i ([]; if $i | type == "array" then . + ($i | flatten) else . + [$i] end); [.[] | {name: .variations[].rarity} ] | unique | .[]' > rarities.jsonl
		cat "$1" | jq --slurp --compact-output 'def flatten: reduce .[] as $i ([]; if $i | type == "array" then . + ($i | flatten) else . + [$i] end); [.[] | .category] | flatten | unique | to_entries | .[] | select(.value !=null) | {name: .value}' > categories.jsonl
else
	echo "Error: File doesn't exists or can't read file."
fi