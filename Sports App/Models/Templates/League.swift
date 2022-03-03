
import Foundation
struct Leagues : Codable {
    var idLeague : String?
    var strSport : String?
    var strLeague : String?
    var strLeagueAlternate : String?
    var strCountry : String?
    var strYoutube : String?
    var strBadge : String?


    enum CodingKeys: String, CodingKey {

        case idLeague = "idLeague"
        case strSport = "strSport"
        case strLeague = "strLeague"
        case strLeagueAlternate = "strLeagueAlternate"
        case strCountry = "strCountry"
        case strYoutube = "strYoutube"
        case strBadge = "strBadge"
        }

}
