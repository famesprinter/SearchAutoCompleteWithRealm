import UIKit
import RxSwift

class SearchFroAddViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    let service = Service()
    let searchController = UISearchController(searchResultsController: nil)
    let disposeBag = DisposeBag()
    
    var result = Variable([Car]())
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.searchBar.tintColor = .white
        let leftNavBarButton = UIBarButtonItem(customView:searchController.searchBar)
        navigationItem.leftBarButtonItem = leftNavBarButton
        
        result.asObservable()
            .skip(1)
            .subscribe(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        searchController.isActive = true
    }
    
    deinit {
        print("SearchFroAddViewController DEINIT ><")
    }
}

extension SearchFroAddViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = result.value[indexPath.row].name
        return cell
    }
}

extension SearchFroAddViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    func didPresentSearchController(_ searchController: UISearchController) {
        DispatchQueue.main.async {
            searchController.searchBar.becomeFirstResponder()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel")
        searchController.isActive = false
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchBarText = searchController.searchBar.text else {
            return
        }
        
        if !searchBarText.isEmpty && searchController.isActive {
            let searchResult = service.searchCars(char: searchBarText)
            result.value = searchResult
        } else if searchController.isActive {
            result.value = []
        }
    }
}
