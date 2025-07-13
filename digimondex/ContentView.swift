import SwiftUI

struct ContentView: View {
    
    @State var digimonResponse: DigimonResponse = DigimonResponse(digimon: [])
    
    var body: some View {
        List(digimonResponse.digimon) { d in
            DigimonRow(digimon: d)
        }
        .task {
            await digimon()
        }
    }
    
    let service = DigimonService()
    
    @MainActor func digimon() async {
        do {
            let digimonList = try await service.fetchAllDigimon()
            digimonResponse = DigimonResponse(digimon: digimonList)
        } catch {
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
