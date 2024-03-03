import UIKit
import XCTest
@testable import TableViewTesting

final class TableViewControllerTests: XCTestCase {

    func test_tableViewDelegates_shouldBeConnected() {
        let sut = loadStoryboard()

        XCTAssertNotNil(sut.tableView.dataSource, "dataSource")
        XCTAssertNotNil(sut.tableView.delegate, "delegate")
    }

    // MARK: - Helpers

    private func loadStoryboard() -> TableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sut = storyboard.instantiateViewController(identifier: String(describing: TableViewController.self)) as? TableViewController else { return TableViewController () }
        sut.loadViewIfNeeded()

        return sut
    }
}
