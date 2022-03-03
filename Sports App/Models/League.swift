
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

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        idLeague = try values.decodeIfPresent(String.self, forKey: .idLeague)
//        idSoccerXML = try values.decodeIfPresent(String.self, forKey: .idSoccerXML)
//        idAPIfootball = try values.decodeIfPresent(String.self, forKey: .idAPIfootball)
//        strSport = try values.decodeIfPresent(String.self, forKey: .strSport)
//        strLeague = try values.decodeIfPresent(String.self, forKey: .strLeague)
//        strLeagueAlternate = try values.decodeIfPresent(String.self, forKey: .strLeagueAlternate)
//        intDivision = try values.decodeIfPresent(String.self, forKey: .intDivision)
//        idCup = try values.decodeIfPresent(String.self, forKey: .idCup)
//        strCurrentSeason = try values.decodeIfPresent(String.self, forKey: .strCurrentSeason)
//        intFormedYear = try values.decodeIfPresent(String.self, forKey: .intFormedYear)
//        dateFirstEvent = try values.decodeIfPresent(String.self, forKey: .dateFirstEvent)
//        strGender = try values.decodeIfPresent(String.self, forKey: .strGender)
//        strCountry = try values.decodeIfPresent(String.self, forKey: .strCountry)
//        strWebsite = try values.decodeIfPresent(String.self, forKey: .strWebsite)
//        strFacebook = try values.decodeIfPresent(String.self, forKey: .strFacebook)
//        strInstagram = try values.decodeIfPresent(String.self, forKey: .strInstagram)
//        strTwitter = try values.decodeIfPresent(String.self, forKey: .strTwitter)
//        strYoutube = try values.decodeIfPresent(String.self, forKey: .strYoutube)
//        strRSS = try values.decodeIfPresent(String.self, forKey: .strRSS)
//        strDescriptionEN = try values.decodeIfPresent(String.self, forKey: .strDescriptionEN)
//        strDescriptionDE = try values.decodeIfPresent(String.self, forKey: .strDescriptionDE)
//        strDescriptionFR = try values.decodeIfPresent(String.self, forKey: .strDescriptionFR)
//        strDescriptionIT = try values.decodeIfPresent(String.self, forKey: .strDescriptionIT)
//        strDescriptionCN = try values.decodeIfPresent(String.self, forKey: .strDescriptionCN)
//        strDescriptionJP = try values.decodeIfPresent(String.self, forKey: .strDescriptionJP)
//        strDescriptionRU = try values.decodeIfPresent(String.self, forKey: .strDescriptionRU)
//        strDescriptionES = try values.decodeIfPresent(String.self, forKey: .strDescriptionES)
//        strDescriptionPT = try values.decodeIfPresent(String.self, forKey: .strDescriptionPT)
//        strDescriptionSE = try values.decodeIfPresent(String.self, forKey: .strDescriptionSE)
//        strDescriptionNL = try values.decodeIfPresent(String.self, forKey: .strDescriptionNL)
//        strDescriptionHU = try values.decodeIfPresent(String.self, forKey: .strDescriptionHU)
//        strDescriptionNO = try values.decodeIfPresent(String.self, forKey: .strDescriptionNO)
//        strDescriptionPL = try values.decodeIfPresent(String.self, forKey: .strDescriptionPL)
//        strDescriptionIL = try values.decodeIfPresent(String.self, forKey: .strDescriptionIL)
//        strTvRights = try values.decodeIfPresent(String.self, forKey: .strTvRights)
//        strFanart1 = try values.decodeIfPresent(String.self, forKey: .strFanart1)
//        strFanart2 = try values.decodeIfPresent(String.self, forKey: .strFanart2)
//        strFanart3 = try values.decodeIfPresent(String.self, forKey: .strFanart3)
//        strFanart4 = try values.decodeIfPresent(String.self, forKey: .strFanart4)
//        strBanner = try values.decodeIfPresent(String.self, forKey: .strBanner)
//        strBadge = try values.decodeIfPresent(String.self, forKey: .strBadge)
//        strLogo = try values.decodeIfPresent(String.self, forKey: .strLogo)
//        strPoster = try values.decodeIfPresent(String.self, forKey: .strPoster)
//        strTrophy = try values.decodeIfPresent(String.self, forKey: .strTrophy)
//        strNaming = try values.decodeIfPresent(String.self, forKey: .strNaming)
//        strComplete = try values.decodeIfPresent(String.self, forKey: .strComplete)
//        strLocked = try values.decodeIfPresent(String.self, forKey: .strLocked)
//    }

}
