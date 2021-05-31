@testable import Data
import XCTest

class PokedexProviderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPokedexParseWithSuccess() throws {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Pokedex", withExtension: "json") else {
            XCTFail("Could not load json")
            return
        }
        
        guard let data = try? Data(contentsOf: url),
              let result = try? JSONDecoder().decode(PokedexEntity.self, from: data) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(result.results.first?.name, "bulbasaur")
    }
}
