//
//  PkmListViewModel.swift
//  Needle
//
//  Created by Sergio Bravo on 30/05/21.
//

import Foundation

final class PkmListViewModel {
    let router: PkmListRouter
    var pokemonList: [Pokemon] = [Pokemon(name: "Bulbasaur"),
                                  Pokemon(name: "Squirtle"),
                                  Pokemon(name: "Charmander")]
    var selectedPokemon: Pokemon?
    
    init(router: PkmListRouter) {
        self.router = router
    }
    
    func didSelectPokemon(at row: Int) {
        selectedPokemon = pokemonList[row]
        router.showDetail()
    }
}
