import Foundation
struct TeamsKey : Codable {
    let teams : [Teams]?

    enum CodingKeys: String, CodingKey {

        case teams = "teams"
    }

}
