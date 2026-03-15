import SwiftUI

struct ExampleScreen: View {

    @StateObject private var viewModel: ExampleViewModel

    init(viewModel: @autoclosure @escaping () -> ExampleViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        content
            .task {
                await viewModel.load()
            }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView()
        case .loaded(let items):
            List(items, id: \.self) { item in
                Text(item)
            }
        case .failed(let message):
            Text(message)
        }
    }
}
