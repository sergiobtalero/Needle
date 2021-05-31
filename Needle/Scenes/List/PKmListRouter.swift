import UIKit

protocol PkmListRouterContract {
    func showDetail()
}

final class PkmListRouter {
    let pkmDetailBuilder: PkmDetailComponent
    
    init(pkmDetailBuilder: PkmDetailComponent) {
        self.pkmDetailBuilder = pkmDetailBuilder
    }
}

// MARK: - PkmListRouterContract
extension PkmListRouter: PkmListRouterContract {
    func showDetail() {
        guard let vc = pkmDetailBuilder.viewController as? PkmDetailViewController else {
            return
        }
        print(vc.viewModel.pokemon.name)
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
