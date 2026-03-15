import XCTest

final class ExampleViewModelTests: XCTestCase {

    func test_load_updatesStateToLoaded() async {
        let service = MockExampleService(result: .success(["A", "B"]))
        let viewModel = await ExampleViewModel(service: service)

        await viewModel.load()

        let state = await viewModel.state
        XCTAssertEqual(state, .loaded(["A", "B"]))
    }
}

private struct MockExampleService: ExampleService {
    let result: Result<[String], Error>

    func fetch() async throws -> [String] {
        try result.get()
    }
}
