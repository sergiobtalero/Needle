import NeedleFoundation
import UIKit

protocol PkmDetailDependency: Dependency {
    var pokemon: Pokemon { get }
}

protocol PkmDetailBuilder {
    var viewController: UIViewController { get }
}

class PkmDetailComponent: Component<PkmDetailDependency>, PkmDetailBuilder {
    var viewController: UIViewController {
        let viewModel = PkmDetailViewModel(pokemon: dependency.pokemon)
        return PkmDetailViewController(viewModel: viewModel)
    }
}
