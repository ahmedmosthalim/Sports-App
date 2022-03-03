//
//  FavLeaguesTableViewController.swift
//  Sports App
//
//  Created by Ahmed Mostafa on 02/03/2022.
//

import UIKit
import CoreData
import Reachability


class FavLeaguesTableViewController: UITableViewController {
    var reachability = try! Reachability()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var favoLeagues=[FavouriteLeague]()
        var leagueForSegue:FavouriteLeague?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchLeaguesFromCoredata()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func fetchLeaguesFromCoredata()
    {
        do{
            
            favoLeagues = try context.fetch(FavouriteLeague.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        catch
        {
            print(error)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favoLeagues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavLeaguesTableViewCell

        cell.legLabel?.text = favoLeagues[indexPath.row].strLeague
        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        leagueForSegue = favoLeagues[indexPath.row]
        self.connectedOrNot()
        performSegue(withIdentifier: "showLeagueDetailsFromFav", sender: leagueForSegue)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showLeagueDetailsFromFav") {
            
            let vc = segue.destination as! LeagueDetailsViewController
            vc.leagueFromCoredata = leagueForSegue
        }
    }
    func connectedOrNot()
    {
        reachability.whenReachable = { [self] reachability in
            if reachability.connection == .wifi {
                performSegue(withIdentifier: "showLeagueDetailsFromFav", sender: leagueForSegue)
                fetchLeaguesFromCoredata()
                print("Reachable via WiFi")
            } else {
                
                print("Reachable via Cellular")
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            let alert = UIAlertController(title: "No Internet Connection", message: "check Your Connection", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
           
        }

        do {
            try reachability.startNotifier()
            
        } catch {
            print("Unable to start notifier")
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
