import UIKit

class SearchFroAddViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    let service = Service()
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
    }
}

extension SearchFroAddViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("Update Search..")
    }
}
