import NeedleFoundation
import Domain
import UIKit

protocol PkmDetailDependency: Dependency {
    var pokemon: PkmEntry { get }
}

protocol PkmDetailBuilder {
    var viewController: UIViewController { get }
}

class PkmDetailComponent: Component<PkmDetailDependency> {
    var viewModel: PkmDetailViewModelContract {
        shared { PkmDetailViewModel(pokemon: dependency.pokemon) }
    }
}

// MARK: - PkmDetailBuilder
extension PkmDetailComponent: PkmDetailBuilder {
    var viewController: UIViewController {
        return PkmDetailViewController(viewModel: viewModel)
    }
}
