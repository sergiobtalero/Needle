public struct Pokedex {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [PkmEntry]
    
    public init(count: Int,
                next: URL?,
                previous: URL?,
                results: [PkmEntry]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
