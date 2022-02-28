//
//  AllLeaguesTableViewCell.swift
//  Sports App
//
//  Created by Ahmed Mostafa on 23/02/2022.
//

import UIKit

class AllLeaguesTableViewCell: UITableViewCell {
    var sectionNumber : Int?
    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
    @IBAction func leagueYoutubeMethod(_ sender: Any) {
//        let row = tag
        
//        switch (sectionNumber)
//        {
//
//        case 0:
//            switch(row) {
//                case 0:
//                    let url :String = leagueLabel.text!
//                    let formattedString = url.replacingOccurrences(of:" ", with: "")
//                    let youtubeUrl = "https://www.youtube.com/results?search_query=" + formattedString
//                    UIApplication.shared.openURL(NSURL(string: youtubeUrl)! as URL)
//                case 1:
//                    let url :String = leagueLabel.text!
//                    let formattedString = url.replacingOccurrences(of:" ", with: "")
//                    let youtubeUrl = "https://www.youtube.com/results?search_query=" + formattedString
//                    UIApplication.shared.openURL(NSURL(string: youtubeUrl)! as URL)
//                case 2:
//                    let url :String = leagueLabel.text!
//                    let formattedString = url.replacingOccurrences(of:" ", with: "")
//                    let youtubeUrl = "https://www.youtube.com/results?search_query=" + formattedString
//                    UIApplication.shared.openURL(NSURL(string: youtubeUrl)! as URL)
//                case 3:
//                    let url :String = leagueLabel.text!
//                    let formattedString = url.replacingOccurrences(of:" ", with: "")
//                    let youtubeUrl = "https://www.youtube.com/results?search_query=" + formattedString
//                    UIApplication.shared.openURL(NSURL(string: youtubeUrl)! as URL)
//            }
//
//        case 1:
//            switch(row) {
//                case 0:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//                case 1:
//                UIApplication.shared.openURL(URL(string: "http://www.google.com")!)
//                case 2:
//                UIApplication.shared.openURL(URL(string: "http://www.facebook.com")!)
//                default:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//            }
//        case 2 :
//            switch(row) {
//                case 0:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//                case 1:
//                UIApplication.shared.openURL(URL(string: "http://www.google.com")!)
//                case 2:
//                UIApplication.shared.openURL(URL(string: "http://www.facebook.com")!)
//                default:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//            }
//        case 3 :
//            switch(row) {
//                case 0:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//                case 1:
//                UIApplication.shared.openURL(URL(string: "http://www.google.com")!)
//                case 2:
//                UIApplication.shared.openURL(URL(string: "http://www.facebook.com")!)
//                default:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//            }
//        case 4 :
//            switch(row) {
//                case 0:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//                case 1:
//                UIApplication.shared.openURL(URL(string: "http://www.google.com")!)
//                case 2:
//                UIApplication.shared.openURL(URL(string: "http://www.facebook.com")!)
//                default:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//            }
//        case 5 :
//            switch(row) {
//                case 0:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//                case 1:
//                UIApplication.shared.openURL(URL(string: "http://www.google.com")!)
//                case 2:
//                UIApplication.shared.openURL(URL(string: "http://www.facebook.com")!)
//                default:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//            }
//        case 6 :
//            switch(row) {
//                case 0:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//                case 1:
//                UIApplication.shared.openURL(URL(string: "http://www.google.com")!)
//                case 2:
//                UIApplication.shared.openURL(URL(string: "http://www.facebook.com")!)
//                default:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//            }
//        case 7 :
//            switch(row)  {
//                case 0:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//                case 1:
//                UIApplication.shared.openURL(URL(string: "http://www.google.com")!)
//                case 2:
//                UIApplication.shared.openURL(URL(string: "http://www.facebook.com")!)
//                default:
//                UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
//            }
//        default:
//            break
//
//    }
        let url :String = self.leagueLabel.text!
        let formattedString = url.replacingOccurrences(of:" ", with: "")
        let youtubeUrl = "https://www.youtube.com/results?search_query=" + formattedString
        UIApplication.shared.openURL(NSURL(string: youtubeUrl)! as URL)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
