import Foundation

struct DigimonResponse: Codable {
    
    let digimon: [Digimon]
    
    var babyTypes: [Digimon] {
        digimon.filter { $0.level == "Fresh" }
    }
    
    var championTypes: [Digimon] {
        digimon.filter { $0.level == "Champion" }
    }
    
    var ultimateTypes: [Digimon] {
        digimon.filter { $0.level == "Ultimate" }
    }
    
    var megaTypes: [Digimon] {
        digimon.filter { $0.level == "Mega" }
    }
    
    var inTrainingTypes: [Digimon] {
        digimon.filter { $0.level == "In Training" }
    }
    
    var rookieTypes: [Digimon] {
        digimon.filter { $0.level == "Rookie" }
    }
    
    var armorTypes: [Digimon] {
        digimon.filter { $0.level == "Armor" }
    }
}

struct Digimon: Codable, Identifiable {
    var id = UUID()
    /// The name of the digimon
    let name: String
    /// The image of the digimon
    let img: URL
    /// The evolution level of the digimon
    let level: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case img = "img"
        case level = "level"
    }
}
