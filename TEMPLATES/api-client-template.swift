protocol APIClient {
    func request(_ endpoint: URLRequest) async throws -> Data
}