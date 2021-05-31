import NeedleFoundation
import Combine
import SnapKit
import UIKit

final class PKMListViewController: UIViewController {
    let viewModel: PkmListViewModelContract
    
    // MARK: - Initializer
    init(viewModel: PkmListViewModelContract) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        
        let showButton = UIButton()
        showButton.addTarget(self,
                             action: #selector(didTapButton(sender:)),
                             for: .touchUpInside)
        showButton.setTitle("Show Pkm", for: .normal)
        showButton.setTitleColor(.systemBlue, for: .normal)
        view.addSubview(showButton)
        showButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
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
