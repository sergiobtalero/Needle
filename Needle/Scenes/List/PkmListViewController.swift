import Combine
import Domain
import SnapKit
import UIKit

enum PkmListViewState {
    case notStarted
    case loading
    case render(Pokedex)
    case error
}

final class PKMListViewController: UIViewController {
    private let viewModel: PkmListViewModelContract
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Initializer
    init(viewModel: PkmListViewModelContract) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        setupSubscriptions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Pokedex"
    }
    
    @objc private func didTapButton(sender: UIButton) {
        viewModel.didSelectPokemon(at: 1)
    }
}

private extension PKMListViewController {
    func setupSubscriptions() {
        let input = PkmListInput()
        let output = viewModel.buildOutput(input: input)
        
        output.state
            .sink { state in
                print(state)
            }
            .store(in: &subscriptions)
    }
}
