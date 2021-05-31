import Domain

protocol PkmDetailViewModelContract {
    var pokemon: PkmEntry { get }
}

final class PkmDetailViewModel {
    let pokemon: PkmEntry
    
    init(pokemon: PkmEntry) {
        self.pokemon = pokemon
    }
}

// MARK: - PkmDetailViewModelContract
extension PkmDetailViewModel: PkmDetailViewModelContract {}
