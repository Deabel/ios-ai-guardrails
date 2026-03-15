import Foundation

@MainActor
final class UserViewModel: ObservableObject {

    enum State {
        case idle
        case loading
        case loaded([User])
        case failed(String)
    }

    @Published private(set) var state: State = .idle

    private let service: UserService

    init(service: UserService) {
        self.service = service
    }

    func loadUsers() async {
        state = .loading

        do {
            let users = try await service.fetchUsers()
            state = .loaded(users)
        } catch {
            state = .failed(error.localizedDescription)
        }
    }
}

struct User: Decodable, Identifiable {
    let id: Int
    let name: String
}

protocol UserService {
    func fetchUsers() async throws -> [User]
}
