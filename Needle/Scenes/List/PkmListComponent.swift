import NeedleFoundation
import UIKit

class PkmListComponent: BootstrapComponent {
    var pokemon: Pokemon {
        viewModel.selectedPokemon ?? Pokemon(name: "none")
    }
    
    var router: PkmListRouterContract {
        PkmListRouter(pkmDetailBuilder: pkmDetailComponent)
    }
    
    var viewModel: PkmListViewModelContract {
        shared { PkmListViewModel(router: router) }
    }
    
    var viewController: UIViewController {
        PKMListViewController(viewModel: viewModel)
    }
    
    // MARK: - Children
    var pkmDetailComponent: PkmDetailComponent {
        PkmDetailComponent(parent: self)
    }
}
