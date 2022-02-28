//
//  AllLeaguesTableViewController.swift
//  Sports App
//
//  Created by Ahmed Mostafa on 23/02/2022.
//

import UIKit
import Alamofire
import Kingfisher

class AllLeaguesTableViewController: UITableViewController {
    
    var allLeagues = [Leagues]()
    var lEAgueId :String?
    var filteredSports:String?

    var englishLeagues  = [Leagues]()
    var frenchLeagues =  [Leagues]()
    var spanishLeagues = [Leagues]()
    var germanLeagues = [Leagues]()
    var italianLeagues = [Leagues]()
    var europanLeagues =  [Leagues]()
    var worldWideLeagues = [Leagues]()
    
    let youtubeSearch : String = "https://www.youtube.com/results?search_query="
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = filteredSports
        Network.shared.fetchAllLeagues(countryName: "England",oneSport: filteredSports!){ [weak self]
            (result) in
            switch result
            {
            case .success(let allLigas):
                self?.englishLeagues = allLigas
                print("Success Country")
                DispatchQueue.main.async {
                self?.tableView.reloadData()
                }
            case .failure(let error) :
                print("failed")
                print(error)
            }
        }
        Network.shared.fetchAllLeagues(countryName: "France",oneSport: filteredSports!){ [weak self]
            (result) in
            switch result
            {
            case .success(let allLigas):
                self?.frenchLeagues = allLigas
                DispatchQueue.main.async {
                self?.tableView.reloadData()
                }
                print("Success Country")
            case .failure(let error) :
                print("failed")
                print(error)
            }
        }
        Network.shared.fetchAllLeagues(countryName: "Spain",oneSport: filteredSports!){ [weak self]
            (result) in
            switch result
            {
            case .success(let allLigas):
                self?.spanishLeagues = allLigas
                print("Success Country")
                DispatchQueue.main.async {
                self?.tableView.reloadData()
                }
            case .failure(let error) :
                print("failed")
                print(error)
            }
        }
        Network.shared.fetchAllLeagues(countryName: "Italy",oneSport: filteredSports!){ [weak self]
            (result) in
            switch result
            {
            case .success(let allLigas):
                self?.italianLeagues = allLigas
                print("Success Country")
                DispatchQueue.main.async {
                self?.tableView.reloadData()
                }
            case .failure(let error) :
                print("failed")
                print(error)
            }
        }
        Network.shared.fetchAllLeagues(countryName: "Worldwide",oneSport: filteredSports!){ [weak self]
            (result) in
            switch result
            {
            case .success(let allLigas):
                self?.worldWideLeagues = allLigas
                print("Success Country")
                DispatchQueue.main.async {
                self?.tableView.reloadData()
                }
            case .failure(let error) :
                print("failed")
                print(error)
            }
        }
        Network.shared.fetchAllLeagues(countryName: "Europe",oneSport: filteredSports!){ [weak self]
            (result) in
            switch result
            {
            case .success(let allLigas):
                self?.europanLeagues = allLigas
                print("Success Country")
                DispatchQueue.main.async {
                self?.tableView.reloadData()
                }
            case .failure(let error) :
                print("failed")
                print(error)
            }
        }
        Network.shared.fetchAllLeagues(countryName: "Germany",oneSport: filteredSports!){ [weak self]
            (result) in
            switch result
            {
            case .success(let allLigas):
                self?.germanLeagues = allLigas
                print("Success Country")
                DispatchQueue.main.async {
                self?.tableView.reloadData()
                }
            case .failure(let error) :
                print("failed")
                print(error)
            }
        }
        super.viewWillAppear(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 7
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch (section)
        {
        case 0 :
            return englishLeagues.count
        case 1:
            return frenchLeagues.count
        case 2:
            return spanishLeagues.count
        case 3:
            return italianLeagues.count
        case 4 :
            return germanLeagues.count
        case 5 :
            return europanLeagues.count
        case 6:
            return worldWideLeagues.count
        default:
            return 1
        }
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section)
        {
        case 0 :
//          if  englishLeagues!.count != 0
//            {return   "England"}else{return ""}
            return   "England"
        case 1 :
//            if frenchLeagues!.count != 0
//            {  return  "France"}else{return ""}
            return  "France"
        case 2 :
//            if spanishLeagues.count != 0
//            { return  "Spain"}else{return ""}
            return  "Spain"
        case 3 :
//            if italianLeagues.count != 0
//            { return "Italy"}else{return ""}
            return  "Italy"
        case 4 :
//            if germanLeagues.count != 0
//            { return  "Germany"}else{return ""}
            return  "Germany"
        case 5 :
//            if self.europanLeagues.count != 0
//            {return  "Europe"}else{return ""}
            return  "Europe"
        case 6 :
//            if self.worldWideLeagues.count != 0
//            {return "WorldWide"}
//            else{return ""}
            return "WorldWide"
        default:
            return  ""
        }
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AllLeaguesTableViewCell
        cell.leagueImage.layer.borderWidth = 1
        cell.leagueImage.layer.masksToBounds = false
        cell.leagueImage.layer.borderColor = UIColor.black.cgColor
        cell.leagueImage.layer.cornerRadius = cell.leagueImage.frame.height / 2
        cell.leagueImage.clipsToBounds = true
        switch (indexPath.section)
        {
        case 0 :
         
            cell.leagueLabel.text =  self.englishLeagues[indexPath.row].strLeague
                let url = URL(string:self.englishLeagues[indexPath.row].strBadge!)!
                cell.leagueImage!.kf.setImage(with: url)
                return cell
            
        case 1 :
           
                cell.leagueLabel.text =  self.frenchLeagues[indexPath.row].strLeague
                let url = URL(string:self.frenchLeagues[indexPath.row].strBadge!)!
                cell.leagueImage!.kf.setImage(with: url)
                return cell
        case 2 :

                cell.leagueLabel.text =  self.spanishLeagues[indexPath.row].strLeague
            let url = URL(string:self.spanishLeagues[indexPath.row].strBadge!)!
                cell.leagueImage!.kf.setImage(with: url)
                return cell
            
        case 3 :
           
                cell.leagueLabel.text =  self.italianLeagues[indexPath.row].strLeague
            let url = URL(string:self.italianLeagues[indexPath.row].strBadge!)!
                cell.leagueImage!.kf.setImage(with: url)
                return cell
        
        case 4 :
        
                cell.leagueLabel.text =  self.germanLeagues[indexPath.row].strLeague
                let url = URL(string:self.germanLeagues[indexPath.row].strBadge!)!
                cell.leagueImage!.kf.setImage(with: url)
                return cell

        case 5 :
         
                cell.leagueLabel.text =  self.europanLeagues[indexPath.row].strLeague
                let url = URL(string:self.europanLeagues[indexPath.row].strBadge!)!
                cell.leagueImage!.kf.setImage(with: url)
                return cell
        case 6 :

                cell.leagueLabel.text =  self.worldWideLeagues[indexPath.row].strLeague
                let url = URL(string:self.worldWideLeagues[indexPath.row].strBadge!)!
                cell.leagueImage!.kf.setImage(with: url)
                return cell
        default:
                cell.textLabel!.text = " "
                return cell
        }
     }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch (indexPath.section)
        {
        case 0 :
            lEAgueId = self.englishLeagues[indexPath.row].idLeague
            performSegue(withIdentifier: "showLeagueDetail", sender: lEAgueId)
        case 1 :
            lEAgueId = self.frenchLeagues[indexPath.row].idLeague
            performSegue(withIdentifier: "showLeagueDetail", sender: lEAgueId)
                
        case 2 :
            lEAgueId = self.spanishLeagues[indexPath.row].idLeague
            performSegue(withIdentifier: "showLeagueDetail", sender: lEAgueId)
        case 3 :
            lEAgueId = self.italianLeagues[indexPath.row].idLeague
            performSegue(withIdentifier: "showLeagueDetail", sender: lEAgueId)
        case 4 :
            lEAgueId = self.germanLeagues[indexPath.row].idLeague
            performSegue(withIdentifier: "showLeagueDetail", sender: lEAgueId)
        case 5 :
            lEAgueId = self.europanLeagues[indexPath.row].idLeague
            performSegue(withIdentifier: "showLeagueDetail", sender: lEAgueId)
        case 6 :
            lEAgueId = self.worldWideLeagues[indexPath.row].idLeague
            performSegue(withIdentifier: "showLeagueDetail", sender: lEAgueId)
        default:
            lEAgueId = self.englishLeagues[indexPath.row].idLeague
            performSegue(withIdentifier: "showLeagueDetail", sender: lEAgueId)
        }
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showLeagueDetail") {
            let vc = segue.destination as! LeagueDetailsViewController
            vc.leagueID = lEAgueId
        }
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
}
