import NeedleFoundation
import UIKit

class PkmListComponent: BootstrapComponent {
    var pokemon: Pokemon {
        viewModel.selectedPokemon ?? Pokemon(name: "none")
    }
    
    var router: PkmListRouter {
        PkmListRouter(pkmDetailBuilder: pkmDetailComponent)
    }
    
    var viewModel: PkmListViewModel {
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
