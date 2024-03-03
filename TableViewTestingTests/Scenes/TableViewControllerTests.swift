import UIKit
import XCTest
@testable import TableViewTesting

final class TableViewControllerTests: XCTestCase {

    // MARK: - Private Property

    private var sut: TableViewController!

    // MARK: - lifeCycle

    override func setUp() {
        super.setUp()
        sut = loadStoryboard()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Tests

    func test_tableViewDelegates_shouldBeConnected() {
        XCTAssertNotNil(sut.tableView.dataSource, "dataSource")
        XCTAssertNotNil(sut.tableView.delegate, "delegate")
    }

    func test_numberOfRows_shouldBe3() {
        XCTAssertEqual(sut.tableView.dataSource?.tableView(sut.tableView,
                                                           numberOfRowsInSection: 0), 3)
    }

    // MARK: - Helpers

    private func loadStoryboard() -> TableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sut = storyboard.instantiateViewController(identifier: String(describing: TableViewController.self)) as? TableViewController else { return TableViewController () }
        sut.loadViewIfNeeded()

        return sut
    }
}
