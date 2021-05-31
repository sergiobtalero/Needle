struct Pokemon {
    let name: String
}

protocol PkmDetailViewModelContract {
    var pokemon: Pokemon { get }
}

final class PkmDetailViewModel {
    let pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
}

// MARK: - PkmDetailViewModelContract
extension PkmDetailViewModel: PkmDetailViewModelContract {}
