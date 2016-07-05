#Types
INSERT INTO Types
(id, name)
VALUES
('special', 'Special'),
('leader', 'Leader'),
('troop', 'Troop'),
('character', 'Character'),
('hero', 'Hero'),
('loyal', 'Loyal'),
('disloyal', 'Disloyal');

#Factions
INSERT INTO Factions
(id, name)
VALUES
('neutral', 'Neutral'),
('northern-realms', 'Northern Realms'),
('scoiatael', 'Scoia\'tael'),
('monsters', 'Monsters'),
('skellige', 'Skellige');



#Rarities
INSERT INTO Rarities
(id, name)
VALUES
('common','Common'),
('rare','Rare'),
('epic','Epic'),
('legendary','Legendary');


#Rows
INSERT INTO Rows
(id, name)
VALUES
('melee','Melee'),
('ranged','Ranged'),
('siege','Siege');


#Glyphs
INSERT INTO Glyphs
(id, name, isWeatherGlyph, text)
VALUES
('spores', 'Spores', false, 'This glyph adds +4 to the Strength of all non-Hero Units.'),
('fog', 'Fogs', true, 'This glyph reduces the base Strength of non-Hero Units to 1.'),
('inspire', 'Inspire', false, 'This glyph doubles the Strength of all non-Hero Units.'),
('frost', 'Frost', true, 'This glyph reduces the base Strength of all non-Hero Units to 1.'),
('rain', 'Rain', true, 'This glyph reduces the base Strength of non-Hero Units to 1.');


#Abilities
INSERT INTO Abilities
(id, name, description)
VALUES
('inspire','Inspire', null),
('swap','Swap', null),
('fogwalker-legion','Fogwalker Legion', null),
('spy','Spy', null),
('frost','Frost', null),
('muster','Muster', null),
('encourage','Encourage', null),
('summon','Summon', null),
('faithful-servant','Faithful Servant', null),
('horde','Horde', null),
('resurrection','Resurrection', null),
('withdrawal','Withdrawal', null),
('empower','Empower', null),
('fair-weather','Fair Weather', null),
('shaman','Shaman', null),
('ambush','Ambush', null),
('plague','Plague', null),
('weatherbound','Weatherbound', null),
('commander-of-the-north','Commander of the North', null),
('igni','Igni', null),
('deathwish','Deathwish', null),
('the-frosts-harbingers','The Frost\'s Harbingers', null),
('fog','Fog', null),
('resilient','Resilient', null),
('spores','Spores', null),
('incinerate','Incinerate', null),
('ill-be-there-for-you','I\'ll be there for you', null),
('choice','Choice', null),
('rain','Rain', null),
('discourage','Discourage', null),
('frostwalker-legion','Frostwalker Legion', null);



#Cards
INSERT INTO Cards
(id, name, idRarity, idFaction, idType, idAbility,  strength, text, flavor)
VALUES
('alchemist', 'Alchemist', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Inspire'), 2,
'Inspire: Fresh Recruits
Passive: 2x Strength of all Units without any Ability on row, unless another card with Inspire: Fresh Recruits is already on row.' , null),

('ancient-foglet', 'Ancient Foglet', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Fogwalker Legion'), 3,
'Fogwalker Legion
When Played: Play every copy of this card from your Deck and Hand.
Passive: Double its Strength when a Fog glyph is on the Battlefield.' , null),

('avallach-mysterious-elf', 'Avallac\'h: Mysterious Elf', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Spy'), 12,
'Spy: False Prophecy
Played: Draw 2 cards from your Deck. Place one in your Hand, the other in your Graveyard.' , null),

('avallach-the-sage', 'Avallac\'h: The Sage', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Spy'), 10,
'Spy: Emissary
Played: Draw 2 cards from your Deck to your Hand. Your opponent Draws 1 card from their Deck to their Hand. This card is revealed to you.' , null),

('biting-frost', 'Biting Frost', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Special'), (SELECT idAbility FROM Abilities WHERE name = 'Frost'), null,
'Frost
When Played: Place a Frost Glyph on both players\' Melee rows. Reduces base Strength of all cards on row to 1.' , null),

('blue-mountain-commando', 'Blue Mountain Commando', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 3,
'Muster: All For One
When Played: Play every copy of this card, from your Deck, Hand and Graveyard.' , null),

('blue-stripes-commando', 'Blue Stripes Commando', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Northern Realms'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 2,
'Muster: Unity
When Played: Play a copy of this card from your Deck or Hand.
Passive: Double the Strength of any copies of this card on the same row.' , null),

('blue-stripes-scout', 'Blue Stripes Scout', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Northern Realms'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Encourage'), 4,
'Encourage
Passive: Increase the Strength of every non-Hero Unit on its row (except this card) by +2.' , null),

('blueboy-lugos', 'Blueboy Lugos', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Summon'), 4,
'Summon: Leviathan
When Played: Spawn and play a Whale which changes rows randomly after each turn and reduces the Strength of any non-Hero Units on its row by -2.' , null),

('brouver-hoog', 'Brouver Hoog', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Leader'), (SELECT idAbility FROM Abilities WHERE name = 'Faithful Servant'), null,
'Faithful Servant
Use Once: Pick 1 Character from your Deck and play it instantly.' , null),

('caranthir', 'Caranthir', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Horde'), 2,
'Horde: Wild Hunt
When Played: Copy every Wild Hunt Unit on row.',
'A favorite son who chose a life of villainy.'),

('caretaker', 'Caretaker', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Resurrection'), 8,
'Resurrection: Graverobber
When Played: Take any non-Hero Unit from your opponent\'s Graveyard. Play it instantly.' , null),

('cerys', 'Cerys', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 6,
'Muster: Royal Retinue
When Played: Play all Queensguards from your Deck, Hand, or Graveyard.' , null),

('ciri-blink', 'Ciri: Blink', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Withdrawal'), 10,
'Withdrawal
Passive: Returns to your Hand if you lose the round.' , null),

('clan-an-craite-warrior', 'Clan an Craite Warrior', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Empower'), 6,
'Empower: Revenge
Passive: Increase its Strength by +6 when it is played from the Graveyard.' , null),

('clan-dimun-pirate-captain', 'Clan Dimun Pirate Captain', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Empower'), 6,
'Empower: Revenge
Passive: Increases its Strength by +6 when it is played from the Graveyard.' , null),

('clan-tordarroch-armorsmith', 'Clan Tordarroch Armorsmith', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Encourage'), 4,
'Encourage
Passive: Increase the Strength of every non-Hero Unit on its row (except this card) by +2.' , null),

('clear-skies', 'Clear Skies', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Special'), (SELECT idAbility FROM Abilities WHERE name = 'Fair Weather'), null,
'Fair Weather
When Played: Remove all weather glyphs from the Battlefield.' , null),

('commanders-horn', 'Commander\'s Horn', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Special'), (SELECT idAbility FROM Abilities WHERE name = 'Inspire'), null,
'Inspire
When Played: Place an Inspire glyph on its row. This glyph doubles the Strength of all non-Hero Units.' , null),

('coral', 'Coral', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Resurrection'), 8,
'Resurrection:Decompression
When Played: Take any non-Hero Unit or Special Card from your Graveyard. Play it instantly.
Discarded when removed from the Battlefield.' , null),

('crash-an-craite', 'Crach An Craite', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Leader'), (SELECT idAbility FROM Abilities WHERE name = 'Summon'), null,
'Summon: An Craite Clansmen
Use Once: Spawn and play 2 An Craite Clansmen.' , null),

('crone-brewess', 'Crone: Brewess', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 7,
'Muster: Crones
When Played: Play all other Crones from your Deck or Hand.' , null),

('crone-weavess', 'Crone: Weavess', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 7,
'Muster: Crones
When Played: Play all other Crones from your Deck or Hand.' , null),

('crone-whispess', 'Crone: Whispess', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 7,
'Muster: Crones
When Played: Play all other Crones from your Deck or Hand.' , null),

('dagon', 'Dagon', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Leader'), (SELECT idAbility FROM Abilities WHERE name = 'Shaman'), null,
'Shaman
Use Once: Spawn and play a Weather Card of your choice.' , null),

('dandelion', 'Dandelion', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Inspire'), 1,
'Inspire
When Played: Place an Inspire glyph on its row. This glyph doubles the Strength of all non-hero Units.' , null),

('decoy', 'Decoy', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Special'), (SELECT idAbility FROM Abilities WHERE name = 'Swap'), null,
'Swap
When Played: Return a loyal, non-Hero Unit on the Battlefield to your Hand and play this in its place. Cannot replace Units which have the Swap ability.' , null),

('dijkstra', 'Dijkstra', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Northern Realms'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Spy'), 8,
'Spy
When Played: Draw 2 cards from your Deck, one face up and once face down. Pick one card and put it in your Hand. Return the other to your Deck.',
'Gwent\'s like politics, just more honest.'),

('dol-blathanna-marksman', 'Dol Blathanna Marksman', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 3,
'Muster: All For One
When Played: Play every copy of this card, from your Deck, Hand and Graveyard.' , null),

('donar-an-hindar', 'Donar an Hindar', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Spy'), 8,
'Spy: Diplomat
Played: Draw 1 card from your Deck to your Hand and 1 card from your Deck to your Graveyard.' , null),

('dun-banner-light-cavalry', 'Dun Banner Light Cavalry', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Northern Realms'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 2,
'Muster: Unity
When Played: Play a copy of this card from your Deck or Hand.
Passive: Double the Strength of any copies of this card on the same row.' , null),

('eithne', 'Eithne', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Leader'), (SELECT idAbility FROM Abilities WHERE name = 'Ambush'), null,
'Ambush
Use Once: Transform all loyal cards with Swap into Dol Blathanna Archers',
'"The dryad queen has eyes of molten silver, and heart of cold-forged steel."'),

('epidemic', 'Epidemic', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Special'), (SELECT idAbility FROM Abilities WHERE name = 'Plague'), null,
'Plague
When Played: Remove weakest Unit(s) on Battlefield' , null),

('eredin', 'Eredin', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Leader'), (SELECT idAbility FROM Abilities WHERE name = 'Summon'), null,
'Summon: Auberon\'s Assassin
Use Once: Eredin steps onto the Battlefield' , null),

('foglet', 'Foglet', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Weatherbound'), 1,
'Weatherbound: Fog
Passive: Whenever a Fog glyph is placed, play this card from your Deck, Hand or Graveyard and double its Strength. Send this card to the Graveyard when the Fog glyph is removed.' , null),

('foltest', 'Foltest', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Northern Realms'), (SELECT idType FROM Types WHERE name = 'Leader'), (SELECT idAbility FROM Abilities WHERE name = 'Commander of the North'), null,
'Commander of the North
Use Once: Choose a loyal Troop on the battlefield and spawn and play a copy of it',
'Don\'t need advisors and their schemes. I place my trust in my soldiers\' blades.'),

('frightener', 'Frightener', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Spy'), 8,
'Spy: Carcass Eater
Played: Draw 1 card and banish 1 Unit from opponent\'s Graveyard.',
'"What have I done?" the mage cried out, frightened of his own creation.'),

('geralt-igni', 'Geralt: Igni', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Igni'), 10,
'Igni
When Played: If the opponent\'s Melee row\'s total Strength is equal to or greater than 15, send the strongest card(s) from that row to the Graveyard.
Also remove all Frost glpyphs from the battlfield',
'A twist of a witcher\'s fingers can light a lamp... or incinerate a foe.'),

('geralt-swordmaster', 'Geralt: Swordmaster', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Hero'), null, 15, null , null),

('giant-toad', 'Giant Toad', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Empower'), 8,
'Empower: Rainwalker
Passive: Rain grants 2x Strength',
'Big, bad, ugly. Squats in the sewers.'),

('golem', 'Golem', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Deathwish'), 4,
'Deathwish: Lesser Golems
When Removed: Spawn 2 Lesser Golems' , null),

('griffin', 'Griffin', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Troop'), null, 8, null , null),

('havcaaren-healer', 'Hav\'caaren Healer', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Resurrection'), 0,
'Resurrection
When Played: Take any non-Hero Unit from your Graveyard. Play it instantly.', null),

('hjalmar', 'Hjalmar', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Hero'), null, 15, null , null),

('ice-giant', 'Ice Giant', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Empower'), 8,
'Empower: Frostwalker
Passive: Double its Strength when a Frost glyph is on the Battlefield.' , null),

('imlerith', 'Imlerith', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'The Frost\'s Harbingers'), 6,
'The Frost\'s Harbingers
When Played: Cast Frost and spawn and play 2 Wild Hunt Hounds with the Frostbound ability.',
'Ladd nahw! Kill them! Litter the earth with their entrails!'),

('impenetrable-fog', 'Impenetrable Fog', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Special'), (SELECT idAbility FROM Abilities WHERE name = 'Fog'), null,
'Fog
When Played: Place a Fog glyph on both players\' Ranged rows. This glyph reduces the base Strength of non-Hero Units to 1.' , null),

('ithlinne-aegli', 'Ithlinne Aegli', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Spy'), 4,
'Spy: Prophetic Powers
When Played: Draw a random Special Card from your Deck to your Hand.' , null),

('jade-golem', 'Jade Golem', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Deathwish'), 4,
'Deathwish: Lesser Jade Golems
When Removed: Spawn 2 Lesser Jade Golems' , null),

('kaedweni-siege-support', 'Kaedweni Siege Support', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Northern Realms'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Encourage'), 4,
'Encourage
Passive: Increase the Strength of every non-Hero Unit on its row (except this card) by +2.' , null),

('katakan', 'Katakan', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Spy'), 8,
'Spy: Carcass Eater
Played: Draw 1 card and banish 1 Unit from opponent\'s Graveyard',
'Drinking the blood of the Continent since the Conjunction.'),

('lambert', 'Lambert', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 8,
'Muster: Witchers
When Played: Play all Witchers from Deck & Hand' , null),

('leshen', 'Leshen', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Summon'), 5,
'Summon: Beastly Companions
When Played: Spawn and play 3 Wolves and 1 Bear.' , null),

('mahakaman-guard', 'Mahakaman Guard', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Resilient'), 6,
'Resilient
Passive: Keep on the Battlefield after each round.' , null),

('morenn', 'Morenn', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Encourage'), 8,
'Encourage
Passive: Increase the Strength of every non-Hero Unit on its row (except this card) by +2.' , null),

('morkvarg', 'Morkvarg', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Resilient'), 8,
'Resilient: Revenant
When Removed: Return to the Battlefield. Reduce its Strength by -2.',
'The vilest man Skellige\'s ever known'),

('mushrooms', 'Mushrooms', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Special'), (SELECT idAbility FROM Abilities WHERE name = 'Spores'), null,
'Spores
When Played: Place a Spores glyph on a row, adding +4 to the Strength of all non-Hero Units' , null),

('myrgtabrakke', 'Myrgtabrakke', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Incinerate'), 6,
'Incinerate: Siege
When Played: if your opponent\'s Siege row\'s total Strength is equal to or greater than 15, send the strongest non-Hero Unit(s) on that row to the Graveyard.' , null),

('nithral', 'Nithral', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 2,
'Muster: Wild Hunt Warrior
When Played: Play a Wild Hunt Warrior from your deck.' , null),

('olaf-the-bear', 'Olaf the Bear', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 9,
'Muster: Vabjorn
When Played: Play Vabjorn from your Deck or Hand.' , null),

('operator', 'Operator', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 8,
'Muster: Hero
When Played: Play random hero from Deck
When Removed: Discard.' , null),

('priestess-of-freya', 'Priestess of Freya', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Resurrection'), 0,
'Resurrection
When Played: Take any non-Hero Unit from your Graveyard. Play it instantly.' , null),

('prize-winning-cow', 'Prize Winning Cow', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Deathwish'), 0,
'Deathwish: Bovine Defense Force
When Removed: Spawn a Chort',
'"Mooooooo."'),

('queensguard', 'Queensguard', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 4,
'Muster
When Played: Play every copy of this card from your Deck and Hand.' , null),

('redanian-elite', 'Redanian Elite', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Northern Realms'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 4,
'Muster: Fearless
When Played: Play a copy of this card from your Deck or Hand.
Passive: If there are 3 or more copies of this card on the same row, promote all of them to Heroes.' , null),

('riordain', 'Riordain', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Deathwish'), 4,
'Deathwish: Vrihedd Brigade
When Removed: Spawn and play a Vrihedd Brigade.' , null),

('roach', 'Roach', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'I\'ll be there for you'), 4,
'I\'ll be there for you
Passive: Play this card from your Deck, Hand or Graveyard on a random row whenever anyone plays a hero',
'Geralt, we gotta have a man-to-horse talk. No offense, but your riding skills? They leave a bit to be desired, buddy.'),

('sarah', 'Sarah', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Fair Weather'), 4,
'Fair Weather
When Played: Remove all Weather glyphs from the battlefield.' , null),

('saskia', 'Saskia', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Choice'), 6,
'Choice: Incinerate or Inspire
When Played: Either Incinerate (remove strongest Unit(s) in play) or Inspire (double the Strength of Units on a row).' , null),

('scorch', 'Scorch', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Special'), (SELECT idAbility FROM Abilities WHERE name = 'Incinerate'), null,
'Incinerate
When Played: Send the strongest non-Hero Unit(s) on the battlefield to the Graveyard.' , null),

('shani', 'Shani', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Northern Realms'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Resurrection'), 6,
'Resurrection: Oxenfurt Expertise
When Played: Take any non-Hero Unit from your Graveyard. Play and promote it to a Hero instantly.' , null),

('sheldon-skaggs', 'Sheldon Skaggs', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 4,
'Muster: Mahakaman Guard
When Played: Play a Mahakaman Guard from your Deck.' , null),

('sigfrida', 'Sigfrida', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Resurrection'), 2,
'Resurrection: Freya\'s Grace
When Played: Take any non-Hero Unit from your Graveyard. Play it instantly.
Passive: Increase its Strength by +1 whenever anyone plays a card from the Graveyard.' , null),

('skellige-storm', 'Skellige Storm', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Special'), (SELECT idAbility FROM Abilities WHERE name = 'Choice'), null,
'Choice: Fog or Rain
When Played: Spawn and play either Impenetrable Fog or Torrential Rain.' , null),

('thaler', 'Thaler', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Northern Realms'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Spy'), 8,
'Spy
When Played: Draw 2 cards from your Deck, one face up and one face down. Pick ne card and put it in your hand. Return the other to your Deck.' , null),

('tordarroch-shieldsmith', 'Tordarroch Shieldsmith', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Encourage'), 4,
'Encourage
Passive: Increase the Strength of every non-Hero Unit on its row (except this card) by +2.' , null),

('torrential-rain', 'Torrential Rain', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Special'), (SELECT idAbility FROM Abilities WHERE name = 'Rain'), null,
'Rain
When Played: Place a Rain glyph on both players\' Siege rows. This glyph reduces the base Strength of non-Hero Units to 1.' , null),

('triss-butterfly-spell', 'Triss: Butterfly Spell', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Fog'), 11,
'Fog
When Played: Place a Fog Glyph on both player\'s Ranged rows. This glyph reduces the base Strength of non-Hero Units to 1.' , null),

('triss-mistress-of-magic', 'Triss: Mistress of Magic', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Choice'), 4,
'Choice: Incinerate or Fair Weather
When Played: Either Incinerate (remove the strongest Unit(s) in play) or Fair Weather (remove all Weather glyphs)' , null),

('trololo', 'Trololo', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Northern Realms'), (SELECT idType FROM Types WHERE name = 'Character'), null, 12, null, null),

('vabjorn', 'Vabjorn', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 9,
'Muster: Olaf the Bear
When Played: Play Olaf the Bear from your Deck or Hand.' , null),

('vernon-roche', 'Vernon Roche', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Northern Realms'), (SELECT idType FROM Types WHERE name = 'Hero'), null, 15, null , null),

('ves', 'Ves', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Northern Realms'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 4,
'Muster: Blue Stripes
When Played: Play a Blue Stripes Scout from your Deck.' , null),

('vesemir', 'Vesemir', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Muster'), 8,
'Muster: Witchers
When Played: Play all Witchers from Deck & Hand' , null),

('vrihedd-vanguard', 'Vrihedd Vanguard', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Encourage'), 4,
'Encourage
Passive: Increase the Strength of every non-Hero Unit on its row (except this card) by +2.' , null),

('whale-from-the-cave-of-dreams', 'Whale from the Cave of Dreams', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Skellige'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Discourage'), 0,
'Discourage: Curse Bringer
Passive: Move to random row at start of opponent\'s turn. -2 Strength to all on row (except self).' , null),

('white-frost', 'White Frost', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Special'), (SELECT idAbility FROM Abilities WHERE name = 'Choice'), null,
'Choice: Frost or Fog
When Played: Spawn Biting Frost or Impenetrable Fog card.' , null),

('wild-hunt-rider', 'Wild Hunt Rider', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Frostwalker Legion'), 3,
'Frostwalker Legion
When Played: Play every copy of this card from your Deck and Hand.
Passive: Double its Strength when a Frost glyph is on the Battlefield.',
'The White Frost is coming.'),

('wild-hunt-warrior', 'Wild Hunt Warrior', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Empower'), 6,
'Empower: Frostwalker
Passive: Double its Strength when a Frost glyph is on the Battlefield.' , null),

('wyvern', 'Wyvern', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Troop'), null, 8, null, null),

('yaevinn', 'Yaevinn', (SELECT idRarity FROM Rarities WHERE name = 'Rare'), (SELECT idFaction FROM Factions WHERE name = 'Scoia\'tael'), (SELECT idType FROM Types WHERE name = 'Character'), (SELECT idAbility FROM Abilities WHERE name = 'Spy'), 8,
'Spy: Commando
When Played: Draw a card from your Deck to your Hand.
Passive: -2 Strength to all other Units its row.' , null),

('zoltan-animal-tamer', 'Zoltan: Animal Tamer', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Choice'), 6,
'Choice: Bring on the Field Marshal!
When Played: Spawn Field Marshal Duda, who either grants +2 Strength or -2 Strength to all on row.' , null),

('zoltan-the-brawler', 'Zoltan: The Brawler', (SELECT idRarity FROM Rarities WHERE name = 'Epic'), (SELECT idFaction FROM Factions WHERE name = 'Neutral'), (SELECT idType FROM Types WHERE name = 'Hero'), (SELECT idAbility FROM Abilities WHERE name = 'Resilient'), 6,
'Resilient
Passive: Keep on the Battlefield after each round.',
'Drinkin\' alone\'s like crappin\' with company.'),

('wild-hunt-hound', 'Wild Hunt Hound', (SELECT idRarity FROM Rarities WHERE name = 'Common'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Troop'), (SELECT idAbility FROM Abilities WHERE name = 'Weatherbound'), 2,
'Weatherbound: Frost
Passive: Whenever a Frost glyph is placed, play this card from your Deck, Hand, or Graveyard and double its Strength. Send this card to the Graveyard when the Frost glyph is removed.' , null),

('eredin-hero', 'Eredin (Hero)', (SELECT idRarity FROM Rarities WHERE name = 'Legendary'), (SELECT idFaction FROM Factions WHERE name = 'Monsters'), (SELECT idType FROM Types WHERE name = 'Hero'), null, 15, null,
'Have some dignity. You know how this will end.');




INSERT INTO CardsSubTypes
(idCard, idType)
VALUES
((SELECT idCard FROM Cards WHERE name = 'Alchemist') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Ancient Foglet') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Avallac\'h: Mysterious Elf') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Avallac\'h: The Sage') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Biting Frost') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Biting Frost') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Blue Mountain Commando') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Blue Stripes Commando') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Blue Stripes Scout') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Blueboy Lugos') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Caranthir') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Caretaker') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Cerys') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Ciri: Blink') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Clan an Craite Warrior') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Clan Dimun Pirate Captain') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Clan Tordarroch Armorsmith') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Commander\'s Horn') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Coral') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Crone: Brewess') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Crone: Weavess') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Crone: Whispess') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Dandelion') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Decoy') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Dijkstra') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Dol Blathanna Marksman') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Donar an Hindar') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Dun Banner Light Cavalry') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Foglet') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Frightener') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Geralt: Igni') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Geralt: Swordmaster') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Giant Toad') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Golem') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Griffin') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Hav\'caaren Healer') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Hjalmar') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Ice Giant') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Imlerith') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Impenetrable Fog') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Impenetrable Fog') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Ithlinne Aegli') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Jade Golem') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Kaedweni Siege Support') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Katakan') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Lambert') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Leshen') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Mahakaman Guard') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Morenn') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Morkvarg') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Mushrooms') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Myrgtabrakke') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Nithral') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Olaf the Bear') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Operator') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Priestess of Freya') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Prize Winning Cow') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Queensguard') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Redanian Elite') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Riordain') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Roach') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Sarah') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Saskia') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Shani') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Sheldon Skaggs') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Sigfrida') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Skellige Storm') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Skellige Storm') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Thaler') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Tordarroch Shieldsmith') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Torrential Rain') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Torrential Rain') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Triss: Butterfly Spell') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Triss: Mistress of Magic') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Trololo') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Vabjorn') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Vernon Roche') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Ves') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Vesemir') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Vrihedd Vanguard') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Whale from the Cave of Dreams') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'White Frost') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'White Frost') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Wild Hunt Rider') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Wild Hunt Warrior') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Wyvern') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Yaevinn') , (SELECT idType FROM Types WHERE name = 'Disloyal')),
((SELECT idCard FROM Cards WHERE name = 'Zoltan: Animal Tamer') , (SELECT idType FROM Types WHERE name = 'Loyal')),
((SELECT idCard FROM Cards WHERE name = 'Zoltan: The Brawler') , (SELECT idType FROM Types WHERE name = 'Loyal'));





INSERT INTO CardsRows
(idCard, idRow)
VALUES
((SELECT idCard FROM Cards WHERE name = 'Alchemist') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Alchemist') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Alchemist') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Ancient Foglet') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Avallac\'h: Mysterious Elf') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Avallac\'h: The Sage') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Biting Frost') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Blue Mountain Commando') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Blue Stripes Commando') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Blue Stripes Scout') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Blueboy Lugos') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Caranthir') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Caretaker') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Cerys') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Ciri: Blink') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Clan an Craite Warrior') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Clan Dimun Pirate Captain') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Clan Tordarroch Armorsmith') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Commander\'s Horn') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Commander\'s Horn') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Commander\'s Horn') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Coral') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Crone: Brewess') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Crone: Weavess') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Crone: Whispess') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Dandelion') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Decoy') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Decoy') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Decoy') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Dijkstra') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Dol Blathanna Marksman') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Donar an Hindar') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Dun Banner Light Cavalry') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Foglet') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Frightener') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Geralt: Igni') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Geralt: Swordmaster') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Giant Toad') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Golem') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Griffin') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Hav\'caaren Healer') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Hav\'caaren Healer') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Hjalmar') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Ice Giant') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Imlerith') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Impenetrable Fog') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Ithlinne Aegli') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Jade Golem') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Kaedweni Siege Support') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Katakan') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Lambert') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Leshen') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Mahakaman Guard') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Morenn') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Morenn') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Morkvarg') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Mushrooms') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Mushrooms') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Mushrooms') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Myrgtabrakke') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Nithral') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Olaf the Bear') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Operator') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Priestess of Freya') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Prize Winning Cow') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Queensguard') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Redanian Elite') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Riordain') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Roach') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Roach') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Roach') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Sarah') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Saskia') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Saskia') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Saskia') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Shani') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Sheldon Skaggs') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Sigfrida') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Skellige Storm') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Skellige Storm') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Thaler') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Tordarroch Shieldsmith') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Torrential Rain') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Triss: Butterfly Spell') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Triss: Mistress of Magic') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Trololo') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Vabjorn') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Vernon Roche') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Ves') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Vesemir') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Vrihedd Vanguard') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Vrihedd Vanguard') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Whale from the Cave of Dreams') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Whale from the Cave of Dreams') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Whale from the Cave of Dreams') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'White Frost') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'White Frost') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Wild Hunt Rider') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Wild Hunt Warrior') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Wyvern') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Yaevinn') , (SELECT idRow FROM Rows WHERE name = 'Ranged')),
((SELECT idCard FROM Cards WHERE name = 'Yaevinn') , (SELECT idRow FROM Rows WHERE name = 'Siege')),
((SELECT idCard FROM Cards WHERE name = 'Zoltan: Animal Tamer') , (SELECT idRow FROM Rows WHERE name = 'Melee')),
((SELECT idCard FROM Cards WHERE name = 'Zoltan: The Brawler') , (SELECT idRow FROM Rows WHERE name = 'Siege'));


SELECT * FROM Cards;