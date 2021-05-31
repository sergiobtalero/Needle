import Alamofire
import Combine
import Domain

public final class PokedexProvider {    
    public init() {}
    
    var subscriptions = Set<AnyCancellable>()
}

// MARK: - PokedexProviderContract
extension PokedexProvider: PokedexProviderContract {
    public func getPokedex(offset: Int, limit: Int = 40) -> AnyPublisher<Result<Pokedex, PokedexProviderError>, Never> {
        guard let request = try? URLRequest(url: "https://www.pokeapi.co/api/v2/pokemon?limit=100&offset=0", method: .get) else {
            return Just<Result<Pokedex, PokedexProviderError>>(Result.failure(PokedexProviderError.invalidURL))
                .eraseToAnyPublisher()
        }
        return AF.request(request)
            .validate()
            .publishDecodable(type: PokedexEntity.self)
            .result()
            .flatMap { result -> AnyPublisher<Result<Pokedex, PokedexProviderError>, Never> in
                guard case let .success(response) = result else {
                    return Just<Result<Pokedex, PokedexProviderError>>(Result.failure(PokedexProviderError.invalidURL))
                        .eraseToAnyPublisher()
                }
                
                let results = response.results.compactMap { entity -> PkmEntry? in
                    guard let url = URL(string: entity.url) else {
                        return nil
                    }
                    return PkmEntry(name: entity.name,
                                    url: url)
                }
                
                let pokedex = Pokedex(count: response.count,
                                      next: response.next.flatMap { URL(string: $0) },
                                      previous: response.previous.flatMap { URL(string: $0) },
                                      results: results)
                return Just<Result<Pokedex, PokedexProviderError>>(Result.success(pokedex))
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
