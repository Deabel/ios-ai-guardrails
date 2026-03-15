struct UserRepository {

    private let localStore: UserLocalStore
    private let remoteService: UserService

    init(localStore: UserLocalStore, remoteService: UserService) {
        self.localStore = localStore
        self.remoteService = remoteService
    }

    func loadUsers(forceRefresh: Bool) async throws -> [User] {
        if !forceRefresh, let cached = try await localStore.loadCachedUsers(), !cached.isEmpty {
            return cached
        }

        let remote = try await remoteService.fetchUsers()
        try await localStore.save(users: remote)
        return remote
    }
}

protocol UserLocalStore {
    func loadCachedUsers() async throws -> [User]?
    func save(users: [User]) async throws
}
