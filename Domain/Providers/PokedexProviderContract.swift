import Combine

public enum PokedexProviderError: Error {
    case invalidURL
    case generic
}

public protocol PokedexProviderContract {
    func getPokedex(offset: Int, limit: Int) -> AnyPublisher<Result<Pokedex, PokedexProviderError>, Never>
}
