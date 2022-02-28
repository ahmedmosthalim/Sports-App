//
//  Network.swift
//  Sports App
//
//  Created by Ahmed Mostafa on 28/02/2022.
//

import Foundation

class Network{
    
    
static let shared = Network()
    
    func  fetchAllSports( completion: @escaping (Result<[Sports],Error>)->Void)
    {
        let baseSportsUrl = URL(string:"https://www.thesportsdb.com/api/v1/json/2/all_sports.php")!
        var components = URLComponents(url:baseSportsUrl,resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "sports", value: "sports")]
        let sportsUrl = components.url!
        let task = URLSession.shared.dataTask(with: sportsUrl){
            (data, response,error)in
            if let data = data {
            do{
            
                let jsonDecoder = JSONDecoder()
                let sportsResponse = try jsonDecoder.decode(SportKey.self, from: data)
                completion(.success(sportsResponse.sports!))
            }catch
            {
                completion(.failure(error))
            }
            }else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
        

    func fetchLeagueDetails(leagueIds leagueId : String ,eventsRound eventRound :String ,completion: @escaping (Result<[Events],Error>)->Void)
    {
//        let baseMenusUrl = URL(string:"https://www.thesportsdb.com/api/v1/json/2/eventsround.php?id=\(leagueId)&r=\(eventRound)&s=2021-2022")!
        let baseMenusUrl = URL(string:"https://www.thesportsdb.com/api/v1/json/2/eventsround.php?id=4328&r=27&s=2021-2022")!

        print(baseMenusUrl)
        var components = URLComponents(url:baseMenusUrl,resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "events", value: leagueId)]
        let leagueUrl = components.url!
        let task = URLSession.shared.dataTask(with: leagueUrl){
            (data, response,error)in
            if let data = data {
            do{
            
                let jsonDecoder = JSONDecoder()
                let eventsResponse = try jsonDecoder.decode(EventsKey.self, from: data)
                completion(.success(eventsResponse.events!))
            }catch
            {
                print("here in catch")
                completion(.failure(error))
                print(error)
            }
            }else if let error = error {
                print("here in else if")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
//    func fetchAllLeague(countryName CountryNames : String ,completion: @escaping (Result<[Leagues],Error>)->Void)
//    {
//        let baseSportsUrl = URL(string:"https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?c=England&s=Soccer")!
//        print(baseSportsUrl)
//        var components = URLComponents(url:baseSportsUrl,resolvingAgainstBaseURL: true)!
//        components.queryItems = [URLQueryItem(name: "countrys", value: "England")]
//        let leaguesUrl = components.url!
//        let task = URLSession.shared.dataTask(with: leaguesUrl){
//            (data, response,error)in
//            if let data = data {
//            do{
//
//                let jsonDecoder = JSONDecoder()
//                let eventsResponse = try jsonDecoder.decode(Country.self, from: data)
//                completion(.success(eventsResponse.countrys!))
//            }catch
//            {
//                print("here in catch")
//                completion(.failure(error))
//                print(error)
//            }
//            }else if let error = error {
//                print("here in else if")
//                completion(.failure(error))
//            }
//        }
//        task.resume()
////    }
//    func fetchAllLeague(countryName CountryNames : String ,completion: @escaping (Result<[Leagues],Error>)->Void)
//    {
        func fetchAllLeagues(countryName CountryNames : String,oneSport sport : String,completion: @escaping (Result<[Leagues],Error>)->Void)
        {
//            let countriesLeague = ["","","","","","","","",""]
        guard let url   = URL(string: "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?c=\(CountryNames)&s=\(sport)") else { return }
                let request     = URLRequest(url: url)
                let session     = URLSession(configuration: URLSessionConfiguration.default)
                let task        = session.dataTask(with: request) { data, response, error in
                    do{
                        guard let safeData = data else { return }
                        let countrys = try! JSONDecoder().decode(Country.self, from: safeData)
                        completion(.success(countrys.countrys ?? []))
//                        print(country)
                    }catch{
                        print("Error : \(error.localizedDescription)")
                    }
                }
                task.resume()
        }
    
}
