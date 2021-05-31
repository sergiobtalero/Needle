protocol PkmListViewModelContract {
    var selectedPokemon: Pokemon? { get }
    func didSelectPokemon(at row: Int)
}

final class PkmListViewModel {
    let router: PkmListRouterContract
    var pokemonList: [Pokemon] = [Pokemon(name: "Bulbasaur"),
                                  Pokemon(name: "Squirtle"),
                                  Pokemon(name: "Charmander")]
    private(set) var selectedPokemon: Pokemon?
    
    init(router: PkmListRouterContract) {
        self.router = router
    }
}

// MARK: - PkmListViewModelContract
extension PkmListViewModel: PkmListViewModelContract {
    func didSelectPokemon(at row: Int) {
        selectedPokemon = pokemonList[row]
        router.showDetail()
    }
}
