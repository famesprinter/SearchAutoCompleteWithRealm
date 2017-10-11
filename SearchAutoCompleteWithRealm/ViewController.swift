import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    var myCars = [Car]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    deinit {
        print("ViewController DEINIT ><")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
