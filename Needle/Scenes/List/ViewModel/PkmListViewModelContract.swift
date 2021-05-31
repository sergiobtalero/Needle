import Combine
import Domain

protocol PkmListViewModelContract {
    var selectedPokemon: PkmEntry? { get }
    
    func didSelectPokemon(at row: Int)
    func buildOutput(input: PkmListInput) -> PkmListOutput
}

struct PkmListInput {}

struct PkmListOutput {
    let state: AnyPublisher<PkmListViewState, Never>
}
