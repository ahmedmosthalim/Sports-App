//
//  LeagueDetailsViewController.swift
//  Sports App
//
//  Created by Ahmed Mostafa on 28/02/2022.
//

import UIKit
import CloudKit

class LeagueDetailsViewController: UIViewController  {

    var leagueID:String?
    
    @IBOutlet weak var allClubsTableView: UICollectionView!
    @IBOutlet weak var upComingTableView: UITableView!
    @IBOutlet weak var lastRoundCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
//extension LeagueDetailsViewController : UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "upComing", for: indexPath)
//        return cell
//    }
//    
//}
//extension LeagueDetailsViewController : UICollectionViewDelegate , UICollectionViewDataSource
//{
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//         return 1
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "lastRound", for: indexPath) as! lastRoundCollectionViewCell
//        return cell
//    }
//    
//    
//}
