import NeedleFoundation
import Domain
import UIKit
import Data

class PkmListComponent: BootstrapComponent {
    var pokemon: PkmEntry {
        viewModel.selectedPokemon ?? PkmEntry(name: "Error", url: URL(string: "url")!)
    }
    
    var router: PkmListRouterContract {
        PkmListRouter(pkmDetailBuilder: pkmDetailComponent)
    }
    
    var pokedexProvider: PokedexProviderContract {
        PokedexProvider()
    }
    
    var getPokedexUseCase: GetPokedexUseCaseContract {
        GetPokedexUseCase(provider: pokedexProvider)
    }
    
    var viewModel: PkmListViewModelContract {
        shared { PkmListViewModel(router: router,
                                  getPokedexUseCase: getPokedexUseCase) }
    }
    
    var viewController: UIViewController {
        PKMListViewController(viewModel: viewModel)
    }
    
    // MARK: - Children
    var pkmDetailComponent: PkmDetailComponent {
        PkmDetailComponent(parent: self)
    }
}
