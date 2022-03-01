//
//  TeamDetailsViewController.swift
//  Sports App
//
//  Created by Ahmed Mostafa on 02/03/2022.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    

    @IBAction func webSiteMethod(_ sender: Any) {
        
        let url :String = (self.team?.strWebsite)!
        let webSiteUrl = "https://\(url)"
        UIApplication.shared.openURL(NSURL(string: webSiteUrl)! as URL)
    }
    
    @IBAction func facebookMethod(_ sender: Any) {
        let url :String = (self.team?.strFacebook)!
        let webSiteUrl = "https://\(url)"
        UIApplication.shared.openURL(NSURL(string: webSiteUrl)! as URL)
    }
    
    @IBAction func twitterMethod(_ sender: Any) {
        let url :String = (self.team?.strTwitter)!
        let webSiteUrl = "https://\(url)"
        UIApplication.shared.openURL(NSURL(string: webSiteUrl)! as URL)
    }
    
    @IBAction func intsagramMethod(_ sender: Any) {
        let url :String = (self.team?.strInstagram)!
        let webSiteUrl = "https://\(url)"
        UIApplication.shared.openURL(NSURL(string: webSiteUrl)! as URL)
    }
    
    
    @IBOutlet weak var strTeamJersey: UIImageView!
    @IBOutlet weak var teamHeader: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var strDescriptionEN: UITextView!
    
    
    @IBOutlet weak var teamShortName: UILabel!
    @IBOutlet weak var teamBadge: UIImageView!
    
    @IBOutlet weak var strStadium: UILabel!
    @IBOutlet weak var strStadiumThumb: UIImageView!
    @IBOutlet weak var strStadiumLocation: UILabel!
    @IBOutlet weak var intStadiumCapacity: UILabel!
    
    var team :Teams?
    override func viewDidLoad() {
        guard let team = team else {return}
        super.viewDidLoad()
        print(team.strTeam!)
        let url = URL(string:(self.team?.strTeamBadge!)!)
        teamBadge!.kf.setImage(with: url)
        teamName.text = team.strTeam
        let headerUrl = URL(string:(self.team?.strTeamBanner!)!)
        teamHeader!.kf.setImage(with:headerUrl)
        teamShortName.text = team.strTeamShort
        strStadiumLocation.text = team.strStadiumLocation
        intStadiumCapacity.text = team.intStadiumCapacity
        strStadium.text = team.strStadium
        let stadiumUrl = URL(string:(self.team?.strStadiumThumb!)!)
        strStadiumThumb.kf.setImage(with :stadiumUrl)
        strDescriptionEN.text = team.strDescriptionEN
        let strTeamJerseyUrl = URL(string:(self.team?.strTeamJersey!)!)
        strTeamJersey.kf.setImage(with:strTeamJerseyUrl)
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
