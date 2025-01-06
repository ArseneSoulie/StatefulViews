import Foundation

public struct Service {
    private let baseURL = "https://jsonplaceholder.typicode.com"

    func getTodos() async throws -> GetTodosResponse {
        guard let url = URL(string: "\(baseURL)/todos") else {
            throw ServiceError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        try await Task.sleep(for: .seconds(2))

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ServiceError.requestFailed
        }

        do {
            return try JSONDecoder().decode(GetTodosResponse.self, from: data)
        } catch {
            throw ServiceError.decodingFailed
        }
    }
}
