import NeedleFoundation
import Combine
import SnapKit
import UIKit

final class PKMListViewController: UIViewController {
    let viewModel: PkmListViewModel
    
    // MARK: - Initializer
    init(viewModel: PkmListViewModel) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Pokedex"
    }
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func didTapButton(sender: UIButton) {
        viewModel.didSelectPokemon(at: 1)
    }
}
