

import Foundation
struct Country : Codable {
    let countrys : [Leagues]?

    enum CodingKeys: String, CodingKey {

        case countrys = "countrys"
    }
}
