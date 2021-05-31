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
    private let tableView = UITableView()
    private let viewModel: PkmListViewModelContract
    private var subscriptions = Set<AnyCancellable>()
    
    private var pkmEntries: [PkmEntry] = []
    
    // MARK: - Initializer
    init(viewModel: PkmListViewModelContract) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        setupSubscriptions()
        setupTableView()
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
}

private extension PKMListViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PkmListTableViewCell.self,
                           forCellReuseIdentifier: "PkmListTableViewCell")
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupSubscriptions() {
        let input = PkmListInput()
        let output = viewModel.buildOutput(input: input)
        
        output.state
            .sink { [weak self] state in
                if case let .render(pokedex) = state {
                    self?.pkmEntries = pokedex.results
                    self?.tableView.reloadData()
                }
            }
            .store(in: &subscriptions)
    }
}

// MARK: - UITableViewDataSource
extension PKMListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pkmEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PkmListTableViewCell") as? PkmListTableViewCell else {
            return UITableViewCell()
        }
        
        let entry = pkmEntries[indexPath.row]
        cell.configure(name: entry.name)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PKMListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectPokemon(at: indexPath.row)
    }
}
