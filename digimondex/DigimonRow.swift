import Foundation
import SwiftUI

struct DigimonRow: View {
    
    let digimon: Digimon
    
    var body: some View {
        HStack {
            AsyncImage(url: digimon.img) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 100, height: 100)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                @unknown default:
                    EmptyView()
                }
            }
            VStack(alignment: .leading) {
                Text(digimon.name)
                    .font(.title)
                    .foregroundColor(.blue)
                Text(digimon.level)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
