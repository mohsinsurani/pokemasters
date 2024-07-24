//
//  DummyData.swift
//  PokeMasters
//
//  Created by Admin on 24/07/2024.
//

import Foundation

// Dummy Pokemon Details Model to preview and test
struct DummyData {
    
    static let dummypokemon = Pokemon(url: "https://pokeapi.co/api/v2/pokemon/2/", name: "ivysaur")
    static let dummyPokemonSpecs = PokemonSpecsModel(
        id: 1,
        baseExperience: 112,
        height: 4,
        isDefault: true,
        order: 1,
        weight: 60,
        abilities: [
            Ability(isHidden: false, slot: 1, ability: AbilityDetail(name: "static", url: "https://pokeapi.co/api/v2/ability/9/")),
            Ability(isHidden: false, slot: 2, ability: AbilityDetail(name: "lightning-rod", url: "https://pokeapi.co/api/v2/ability/22/"))
        ],
        gameIndices: [
            GameIndex(gameIndex: 1, version: Version(name: "red", url: "https://pokeapi.co/api/v2/version/1/")),
            GameIndex(gameIndex: 2, version: Version(name: "blue", url: "https://pokeapi.co/api/v2/version/2/"))
        ],
        heldItems: [
            HeldItem(item: Item(name: "light-ball", url: "https://pokeapi.co/api/v2/item/1/"), versionDetails: [
                VersionDetail(rarity: 5, version: Version(name: "red", url: "https://pokeapi.co/api/v2/version/1/"))
            ])
        ],
        locationAreaEncounters: "pallet-town",
        moves: [
            Move(move: MoveDetail(name: "thunderbolt", url: "https://pokeapi.co/api/v2/move/1/"), versionGroupDetails: [
                VersionGroupDetail(levelLearnedAt: 1, versionGroup: VersionGroup(name: "generation-i", url: "https://pokeapi.co/api/v2/version-group/1/"), moveLearnMethod: MoveLearnMethod(name: "level-up", url: "https://pokeapi.co/api/v2/move-learn-method/1/"))
            ]),
            Move(move: MoveDetail(name: "quick-attack", url: "https://pokeapi.co/api/v2/move/2/"), versionGroupDetails: [
                VersionGroupDetail(levelLearnedAt: 5, versionGroup: VersionGroup(name: "generation-i", url: "https://pokeapi.co/api/v2/version-group/1/"), moveLearnMethod: MoveLearnMethod(name: "level-up", url: "https://pokeapi.co/api/v2/move-learn-method/1/"))
            ])
        ],
        species: Species(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon-species/1/"),
        cries: Cries(latest: "https://pokeapi.co/api/v2/cry/1/latest/", legacy: "https://pokeapi.co/api/v2/cry/1/legacy/"),
        stats: [
            Stat(baseStat: 35, effort: 0, stat: StatDetail(name: "hp", url: "https://pokeapi.co/api/v2/stat/1/")),
            Stat(baseStat: 55, effort: 0, stat: StatDetail(name: "attack", url: "https://pokeapi.co/api/v2/stat/2/"))
        ],
        types: [
            TypeElement(slot: 1, type: TypeDetail(name: "electric", url: "https://pokeapi.co/api/v2/type/13/"))
        ]
    )
    
    static let dummyEffectModel = AbilityEffectModel(
            effectEntries: [
                EffectEntry(
                    effect: "This Pokémon's ability boosts its attack stat when it is hit by an attack move.",
                    shortEffect: "Boosts attack when hit by an attack move.",
                    language: NamedResource(name: "en", url: "https://pokeapi.co/api/v2/language/1/")
                ),
                EffectEntry(
                    effect: "Increases the likelihood of the Pokémon's attacks causing status conditions.",
                    shortEffect: "Increases status condition chances.",
                    language: NamedResource(name: "es", url: "https://pokeapi.co/api/v2/language/2/")
                )
            ]
        )
    
    static let dummyPokeStats = PokeStats(
            id: 1,
            name: "speed",
            gameIndex: 1,
            isBattleOnly: false,
            affectingMoves: AffectingMoves(
                name: "speed",
                increase: [
                    AffectingMove(
                        change: 2,
                        move: NamedResource(name: "quick-attack", url: "https://pokeapi.co/api/v2/move/1/")
                    ),
                    AffectingMove(
                        change: 1,
                        move: NamedResource(name: "agility", url: "https://pokeapi.co/api/v2/move/2/")
                    )
                ],
                decrease: [
                    AffectingMove(
                        change: -1,
                        move: NamedResource(name: "slow-start", url: "https://pokeapi.co/api/v2/move/3/")
                    )
                ]
            ),
            affectingNatures: AffectingNatures(
                increase: [
                    NamedResource(name: "jolly", url: "https://pokeapi.co/api/v2/nature/1/"),
                    NamedResource(name: "timid", url: "https://pokeapi.co/api/v2/nature/2/")
                ],
                decrease: [
                    NamedResource(name: "brave", url: "https://pokeapi.co/api/v2/nature/3/"),
                    NamedResource(name: "relaxed", url: "https://pokeapi.co/api/v2/nature/4/")
                ]
            ),
            characteristics: [
                Characteristic(url: "https://pokeapi.co/api/v2/characteristic/1/"),
                Characteristic(url: "https://pokeapi.co/api/v2/characteristic/2/")
            ],
            moveDamageClass: MoveDamageClass(
                name: "physical",
                url: "https://pokeapi.co/api/v2/move-damage-class/1/"
            ),
            names: [
                Name(name: "speed", language: NamedResource(name: "en", url: "https://pokeapi.co/api/v2/language/1/")),
                Name(name: "vitess", language: NamedResource(name: "fr", url: "https://pokeapi.co/api/v2/language/2/"))
            ]
        )

    let dummyAbilityEffectModel = AbilityEffectModel(
        effectEntries: [
            EffectEntry(
                effect: "Raises the user's speed stat by 1 stage.",
                shortEffect: "Increases speed.",
                language: NamedResource(
                    name: "en",
                    url: "https://pokeapi.co/api/v2/language/9/"
                )
            ),
            EffectEntry(
                effect: "May cause paralysis.",
                shortEffect: "May paralyze the target.",
                language: NamedResource(
                    name: "en",
                    url: "https://pokeapi.co/api/v2/language/9/"
                )
            )
        ]
    )
}

