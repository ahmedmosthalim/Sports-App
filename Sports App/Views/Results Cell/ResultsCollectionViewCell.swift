//
//  ResultsCollectionViewCell.swift
//  Sports App
//
//  Created by Ahmed Mostafa on 01/03/2022.
//

import UIKit

class ResultsCollectionViewCell: UICollectionViewCell  , UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var strEvent: UILabel!
    @IBOutlet weak var resultsImage: UIImageView!
    @IBOutlet weak var strHomeTeam: UILabel!
    @IBOutlet weak var intHomeScore: UILabel!
    @IBOutlet weak var strAwayTeam: UILabel!
    @IBOutlet weak var intAwayScore: UILabel!
    
    @IBOutlet weak var strVenue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
