//
//  SportsCollectionViewController.swift
//  Sports App
//
//  Created by Ahmed Mostafa on 22/02/2022.
//

import UIKit
import Alamofire
import Kingfisher


class SportsCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    var sportsDict : [Dictionary<String,Any>]?
    var allSpostrs = [Sports]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    override func viewDidLoad() {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        
        let manger = Network()
        manger.fetchAllSports{
            (result) in
            switch result
            {
            case .success(let sports):
                self.allSpostrs = sports
                print(self.allSpostrs.count)
                DispatchQueue.main.async {
                self.collectionView.reloadData()
                    indicator.stopAnimating()
                }
                print("Success")
//              x  print(result)
            case .failure(let error) :
                print("failed")
                print(error)
            }
        }

//        manger.getDataUsingURLSession(countryName: "France")
      
        super.viewDidLoad()
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allSpostrs.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SportsCollectionViewCell
                cell.contentView.layer.cornerRadius = 40
                cell.contentView.layer.borderWidth = 0.50
        
                cell.contentView.layer.borderColor = UIColor.clear.cgColor
                cell.contentView.layer.masksToBounds = true
        
                cell.layer.shadowColor = UIColor.gray.cgColor
                cell.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
                cell.layer.shadowRadius = 1.0
                cell.layer.shadowOpacity = 1.0
                cell.layer.masksToBounds = false
        //        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        cell.sportLabel.text = self.allSpostrs[indexPath.row].strSport
        let url = URL(string: self.allSpostrs[indexPath.row].strSportThumb!)
            cell.sportImage.kf.setImage(with: url)

        return cell
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: (UIScreen.main.bounds.width)/2.5222, height: (UIScreen.main.bounds.height)/4.9)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize (width: 150 , height: 300)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 10 , left: 30, bottom: 10, right: 25)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 20
        }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "AllLeaguesTableViewController") as! AllLeaguesTableViewController
        obj.filteredSports = self.allSpostrs[indexPath.row].strSport
        self.navigationController?.pushViewController(obj, animated: true)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
