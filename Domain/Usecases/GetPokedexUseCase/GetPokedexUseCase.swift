import Combine

public enum GetPokedexUseCaseError: Error {
    case generic
}

public protocol GetPokedexUseCaseContract {
    func execute(offset: Int, limit: Int) -> AnyPublisher<Result<Pokedex, PokedexProviderError>, Never>
}

public final class GetPokedexUseCase {
    private let provider: PokedexProviderContract
    
    public init(provider: PokedexProviderContract) {
        self.provider = provider
    }
}

extension GetPokedexUseCase: GetPokedexUseCaseContract {
    public func execute(offset: Int, limit: Int) -> AnyPublisher<Result<Pokedex, PokedexProviderError>, Never> {
        provider.getPokedex(offset: offset, limit: limit)
    }
}
