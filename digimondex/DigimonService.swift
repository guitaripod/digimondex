import Foundation

class DigimonService {
    private let baseURL = "https://digimon-api.vercel.app/api/digimon"
    
    func fetchAllDigimon() async throws -> [Digimon] {
        guard let url = URL(string: baseURL) else { throw URLError(.badURL) }
        return try await fetchData(url: url)
    }
    
    func fetchDigimonByName(_ name: String) async throws -> [Digimon] {
        guard let url = URL(string: "\(baseURL)/name/\(name)") else { throw URLError(.badURL) }
        return try await fetchData(url: url)
    }
    
    func fetchDigimonByLevel(_ level: String) async throws -> [Digimon] {
        guard let url = URL(string: "\(baseURL)/level/\(level)") else { throw URLError(.badURL) }
        return try await fetchData(url: url)
    }
    
    private func fetchData(url: URL) async throws -> [Digimon] {
        let (data, _) = try await URLSession.shared.data(from: url)
        let digimonResponse = DigimonResponse(digimon: try JSONDecoder().decode([Digimon].self, from: data))
        return digimonResponse.digimon
    }
}
