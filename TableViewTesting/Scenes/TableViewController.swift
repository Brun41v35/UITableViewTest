import UIKit

final class TableViewController: UITableViewController {

    // MARK: - Private Property

    private let model = [
        "One",
        "Two",
        "Three"
    ]

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {

        print(model[indexPath.row])
    }
}
