import Combine
import Domain

final class PkmListViewModel {
    private let router: PkmListRouterContract
    private let getPokedexUseCase: GetPokedexUseCaseContract
    
    private(set) var selectedPokemon: PkmEntry?
    
    private var state = CurrentValueSubject<PkmListViewState, Never>(.notStarted)
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Initializer
    init(router: PkmListRouterContract,
         getPokedexUseCase: GetPokedexUseCaseContract) {
        self.router = router
        self.getPokedexUseCase = getPokedexUseCase
    }
    
    func buildOutput(input: PkmListInput) -> PkmListOutput {
        getPokedexUseCase.execute(offset: 0, limit: 0)
            .handleEvents(receiveRequest: { [weak self] _ in
                self?.state.value = .loading
            })
            .receive(on: RunLoop.main)
            .sink { [weak self] result in
                switch result {
                case .failure:
                    self?.state.value = .error
                case let .success(pokedex):
                    self?.state.value = .render(pokedex)
                }
            }
            .store(in: &subscriptions)
        
        return PkmListOutput(state: state.eraseToAnyPublisher())
    }
}

// MARK: - PkmListViewModelContract
extension PkmListViewModel: PkmListViewModelContract {
    func didSelectPokemon(at row: Int) {
        guard case let .render(pokedex) = state.value else {
            return
        }
        selectedPokemon = pokedex.results[row]
        router.showDetail()
    }
}
