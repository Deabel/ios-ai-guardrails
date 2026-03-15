
struct HTTPClient {

    func get(_ request:URLRequest) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
