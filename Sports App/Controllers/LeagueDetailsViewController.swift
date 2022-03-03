

import UIKit
import CloudKit
import CoreData

class LeagueDetailsViewController: UIViewController  {


    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fetchedLeagues = [FavouriteLeague]()
    var allLeagues = [Leagues]()
    
    @IBOutlet weak var favImage: UIImageView!
    @IBOutlet weak var leagueId: UIImageView!
    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var upComingCollectionView: UICollectionView!
    @IBOutlet weak var allTeamsCollectionView: UICollectionView!
    @IBOutlet weak var resultsCollectionView: UICollectionView!
    
    
    @IBAction func addToFavLeagues(_ sender: Any) {
        favImage.image = UIImage(named: "AGoldStar")
        saveToCoredata(savedLeague: league!)
    }
    
    
    var leagueFromCoredata : FavouriteLeague?
    var league:Leagues?
    var resultOfLeague = [Events]()
    var upComingEvents = [Events]()
    var allTeams = [Teams]()
    var selectedTeam:Teams?
    
    override func viewWillAppear(_ animated: Bool) {
        fetchLeaguesFromCoredata()
        
        for i in 0..<self.fetchedLeagues.count
        {
            if fetchedLeagues[i].strLeague == league?.strLeague
            {
                self.favImage.image = UIImage(named: "AGoldStar")
                
            }
           
        }
       
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       
        upComingCollectionView.register(UINib(nibName: "UpcomingEventsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "upComingCell")
        
        allTeamsCollectionView.register(UINib(nibName: "allTeamsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "teamsCell")
        
        resultsCollectionView.register(UINib(nibName: "ResultsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "resultsCell")
        
        if league != nil
        {
        
        leagueLabel.text = league?.strLeagueAlternate
                    let url = URL(string:(league?.strBadge!)!)
                    leagueId!.kf.setImage(with: url)
       
        Network.shared.fetchUpComingMatches(LeagueId: (self.league?.idLeague!)!) { [weak self]
          (result) in
          switch result
          {
          case .success(let results):
              self?.upComingEvents = results
              print("Success Fetch Up Coming ")
              DispatchQueue.main.async {
                  self?.upComingCollectionView.reloadData()
              }
          case .failure(let error) :
              print("failed")
              print(error)
          }
      }
    Network.shared.fetchResults(LeagueId: (self.league?.idLeague!)! ) { [weak self]
          (result) in
          switch result
          {
          case .success(let results):
              self?.resultOfLeague = results
              print("Success Fetch Results")
              DispatchQueue.main.async {
                  self?.resultsCollectionView.reloadData()
              }
          case .failure(let error) :
              print("failed")
              print(error)
          }
      }
    Network.shared.fetchAllTeams(Leaguename: (self.league?.strLeague!)!) { [weak self]
          (result) in
          switch result
          {
          case .success(let results):
              self?.allTeams = results
              print("Success Fetch All teams")
              DispatchQueue.main.async {
                  self!.allTeamsCollectionView.reloadData()
              }
          case .failure(let error) :
              print("failed")
              print(error)
          }
      }
//        guard league != nil else {
        }
        else
        {
            
            guard let sport = leagueFromCoredata?.strSport else{return}
            guard let country = leagueFromCoredata?.strCountry else{return}
            guard let id = leagueFromCoredata?.idLeague else{return}
            guard let name = leagueFromCoredata?.strLeague else{return}
            guard let badge = leagueFromCoredata?.strLeague else{return}
            guard let alternate = leagueFromCoredata?.strLeagueAlternate else{return}
            print(id)
            leagueLabel.text = alternate
            let url = URL(string:badge)
            leagueId!.kf.setImage(with: url)
            

            
            upComingCollectionView.register(UINib(nibName: "UpcomingEventsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "upComingCell")
            
            allTeamsCollectionView.register(UINib(nibName: "allTeamsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "teamsCell")
            
            resultsCollectionView.register(UINib(nibName: "ResultsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "resultsCell")
            
          
            Network.shared.fetchUpComingMatches(LeagueId: self.league?.idLeague ?? id) { [weak self]
                (result) in
                switch result
                {
                case .success(let results):
                    self?.upComingEvents = results
                    print("Success Fetch Up Coming ")
                    DispatchQueue.main.async {
                        self?.upComingCollectionView.reloadData()
                    }
                case .failure(let error) :
                    print("failed")
                    print(error)
                }
            }
                Network.shared.fetchResults(LeagueId: self.league?.idLeague ?? id) { [weak self]
                (result) in
                switch result
                {
                case .success(let results):
                    self?.resultOfLeague = results
                    print("Success Fetch Results")
                    DispatchQueue.main.async {
                        self?.resultsCollectionView.reloadData()
                    }
                case .failure(let error) :
                    print("failed")
                    print(error)
                }
            }
            Network.shared.fetchAllTeams(Leaguename: self.league?.strLeague ?? name) { [weak self]
                (result) in
                switch result
                {
                case .success(let results):
                    self?.allTeams = results
                    print("Success Fetch All teams")
                    DispatchQueue.main.async {
                        self!.allTeamsCollectionView.reloadData()
                    }
                case .failure(let error) :
                    print("failed")
                    print(error)
                }
            }
            
             }
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LeagueDetailsViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch (collectionView)
        {
        case upComingCollectionView:
         return 1
        case resultsCollectionView:
         return 1
        case allTeamsCollectionView:
         return 1
        default :
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (collectionView)
        {
        case resultsCollectionView:
            return resultOfLeague.count
        case upComingCollectionView:
            return upComingEvents.count
        case allTeamsCollectionView:
            return allTeams.count
        default :
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch (collectionView)
        {
        
        case resultsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultsCell", for: indexPath) as! ResultsCollectionViewCell
            let url = URL(string:self.resultOfLeague[indexPath.row].strThumb!)
            cell.resultsImage!.kf.setImage(with: url)
            cell.strEvent.text = self.resultOfLeague[indexPath.row].strEvent
            cell.strHomeTeam.text = self.resultOfLeague[indexPath.row].strHomeTeam
            cell.strAwayTeam.text = self.resultOfLeague[indexPath.row].strAwayTeam
            cell.intHomeScore.text = self.resultOfLeague[indexPath.row].intHomeScore
            cell.intAwayScore.text = self.resultOfLeague[indexPath.row].intAwayScore
            cell.strVenue.text = self.resultOfLeague[indexPath.row].strVenue
            return cell
        case upComingCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! UpcomingEventsCollectionViewCell
            let url = URL(string:self.upComingEvents[indexPath.row].strThumb!)
            cell.upComingImage!.kf.setImage(with: url)
            cell.strHomeTeam.text = self.upComingEvents[indexPath.row].strHomeTeam
            cell.strAwayTeam.text = self.upComingEvents[indexPath.row].strAwayTeam
            return cell
        case allTeamsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! allTeamsCollectionViewCell
            let url = URL(string:self.allTeams[indexPath.row].strTeamBadge!)
            cell.teamImage!.kf.setImage(with: url)
            return cell
        default :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! UpcomingEventsCollectionViewCell
            return cell
        }
        
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch (collectionView)
        {
        case resultsCollectionView:
            return  CGSize (width: 200, height: 200)
        case upComingCollectionView:
            return  CGSize (width: 200, height: 200)
        case allTeamsCollectionView:
        return  CGSize (width: 150, height: 100)
        default :
            return  CGSize (width: 150, height: 100)
    }
    
}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch (collectionView)
        {
        case allTeamsCollectionView :
        selectedTeam =  allTeams[indexPath.row]
        performSegue(withIdentifier: "showTeamDetails", sender:selectedTeam)
        
        default:
            break
    }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showTeamDetails"
    {
        let obj = segue.destination as! TeamDetailsViewController
        obj.team = selectedTeam
    }
    }
    func saveToCoredata(savedLeague selectedLeague : Leagues)
    {
        
        let favLeagues = FavouriteLeague(context: context)
        fetchLeaguesFromCoredata()
        for i in 0..<self.fetchedLeagues.count
        {
            if fetchedLeagues[i].strLeague == selectedLeague.strLeague
            {
                let alert = UIAlertController(title: "League is already Favoritued", message: "check Your fav List", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        context.delete(fetchedLeagues[i])
                        
            }else{
                favLeagues.idLeague = selectedLeague.idLeague
                favLeagues.strLeague = selectedLeague.strLeague
                favLeagues.strBadge = selectedLeague.strBadge
                favLeagues.strSport = selectedLeague.strSport
                favLeagues.strCountry = selectedLeague.strCountry
                favLeagues.strLeagueAlternate = selectedLeague.strLeagueAlternate
                favLeagues.strYoutube = selectedLeague.strYoutube
                try! context.save()
            }
        }
      
    }
    
    func fetchLeaguesFromCoredata()
    {
        do{
          fetchedLeagues  = try context.fetch(FavouriteLeague.fetchRequest())
        }
        catch
        {print(error)}
    }
}
