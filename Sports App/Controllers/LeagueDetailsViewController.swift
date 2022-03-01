

import UIKit
import CloudKit

class LeagueDetailsViewController: UIViewController  {


    @IBOutlet weak var upComingCollectionView: UICollectionView!
    @IBOutlet weak var allTeamsCollectionView: UICollectionView!
    @IBOutlet weak var resultsCollectionView: UICollectionView!
    var league:Leagues?
    var resultOfLeague = [Events]()
    var upComingEvents = [Events]()
    var allTeams = [Teams]()
    var selectedTeam:Teams?
    
    
//    init?(coder: NSCoder ,leagues : Leagues)
//    {
//        self.league = leagues
//        super.init(coder: coder)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        upComingCollectionView.register(UINib(nibName: "UpcomingEventsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "upComingCell")
        allTeamsCollectionView.register(UINib(nibName: "allTeamsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "teamsCell")
        resultsCollectionView.register(UINib(nibName: "ResultsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "resultsCell")
        guard let league = league else {
            return
        }
        Network.shared.fetchUpComingMatches(LeagueId: (self.league?.idLeague)!) { [weak self]
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
        Network.shared.fetchResults(LeagueId: (self.league?.idLeague)!) { [weak self]
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
        Network.shared.fetchAllTeams(Leaguename: (self.league?.strLeague)!) { [weak self]
            (result) in
            switch result
            {
            case .success(let results):
                self?.allTeams = results
                print("Success Fetch All teams")
                for i in 0..<self!.allTeams.count
                {
                    print(self!.allTeams[i].strTeam!)
                }
                DispatchQueue.main.async {
                    self!.allTeamsCollectionView.reloadData()
                }
            case .failure(let error) :
                print("failed")
                print(error)
            }
        }
//        resultsCollectionView.register(UINib(nibName: "ResultsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "results")

        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
    
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
            return cell
        case upComingCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! UpcomingEventsCollectionViewCell
            let url = URL(string:self.upComingEvents[indexPath.row].strThumb!)
            cell.upComingImage!.kf.setImage(with: url)
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
    
}
