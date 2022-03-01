//
//  allTeamsCollectionViewCell.swift
//  Sports App
//
//  Created by Ahmed Mostafa on 01/03/2022.
//

import UIKit

class allTeamsCollectionViewCell: UICollectionViewCell , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
