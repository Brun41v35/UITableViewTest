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
        XCTAssertEqual(numberOfRows(in: sut.tableView), 3)
    }

    func test_cellForRowAt_withRow0_shouldCellLabelToOne() {
        let cell = cellForRowAt(in: sut.tableView)
        XCTAssertEqual(cell?.textLabel?.text, "One")
    }

    func test_cellForRowAt_withRow1_shouldCellLabelToTwo() {
        let cell = cellForRowAt(in: sut.tableView, row: 1)
        XCTAssertEqual(cell?.textLabel?.text, "Two")
    }

    func test_cellForRowAt_withRow2_shouldCellLabelToThree() {
        let cell = cellForRowAt(in: sut.tableView, row: 2)
        XCTAssertEqual(cell?.textLabel?.text, "Three")
    }

    // MARK: - Helpers

    private func loadStoryboard() -> TableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sut = storyboard.instantiateViewController(identifier: String(describing: TableViewController.self)) as? TableViewController else { return TableViewController () }
        sut.loadViewIfNeeded()

        return sut
    }

    private func numberOfRows(in tableView: UITableView,
                              section: Int = 0) -> Int? {
        
        return tableView.dataSource?.tableView(tableView,
                                               numberOfRowsInSection: section)
    }

    private func cellForRowAt(in tableView: UITableView, row: Int = 0) -> UITableViewCell? {
        return tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(row: row,
                                                                                  section: 0))
    }
}
