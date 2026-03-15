import SwiftUI

struct ProfileScreen: View {

    @StateObject private var viewModel: ProfileViewModel

    init(viewModel: @autoclosure @escaping () -> ProfileViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        Group {
            switch viewModel.state {
            case .idle, .loading:
                ProgressView()
            case .loaded(let profile):
                VStack(alignment: .leading, spacing: 12) {
                    Text(profile.name)
                        .font(.title2)
                    Text(profile.email)
                        .foregroundStyle(.secondary)
                }
            case .failed(let message):
                Text(message)
            }
        }
        .task {
            await viewModel.load()
        }
    }
}

@MainActor
final class ProfileViewModel: ObservableObject {

    enum State {
        case idle
        case loading
        case loaded(Profile)
        case failed(String)
    }

    @Published private(set) var state: State = .idle

    private let service: ProfileService

    init(service: ProfileService) {
        self.service = service
    }

    func load() async {
        state = .loading

        do {
            let profile = try await service.fetchProfile()
            state = .loaded(profile)
        } catch {
            state = .failed(error.localizedDescription)
        }
    }
}

struct Profile {
    let name: String
    let email: String
}

protocol ProfileService {
    func fetchProfile() async throws -> Profile
}
