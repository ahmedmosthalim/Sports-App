
import Foundation
struct SportKey : Codable {
    let sports : [Sports]?

    enum CodingKeys: String, CodingKey {

        case sports = "sports"
    }
}
