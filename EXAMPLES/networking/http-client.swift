import Foundation

struct HTTPClient: APIClient {

    func request(_ request: URLRequest) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw APIError.server(statusCode: httpResponse.statusCode)
        }

        return data
    }
}

enum APIError: Error {
    case invalidResponse
    case server(statusCode: Int)
    case decoding
    case transport
}
