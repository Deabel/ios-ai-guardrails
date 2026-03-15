import Foundation

protocol APIClient {
    func request(_ request: URLRequest) async throws -> Data
}
