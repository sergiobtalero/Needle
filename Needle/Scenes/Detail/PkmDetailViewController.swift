import UIKit

final class PkmDetailViewController: UIViewController {
    let viewModel: PkmDetailViewModelContract

    // MARK: - Initializer
    init(viewModel: PkmDetailViewModelContract) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MAKR: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = viewModel.pokemon.name
    }
}
