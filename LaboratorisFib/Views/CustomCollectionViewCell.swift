//
//  CustomCollectionViewCell.swift
//  LaboratorisFib
//
//  Created by Marcel Costa i Amezquita on 27/03/2020.
//  Copyright © 2020 Marcel Costa i Amezquita. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nomAulari: UILabel!
    
    override func awakeFromNib() {
      super.awakeFromNib()
      containerView.layer.cornerRadius = 6
      containerView.layer.masksToBounds = true
    }
    
    var lab: Laboratori? {
      didSet {
        if let lab = lab {
            nomAulari.text = lab.id
        }
      }
    }
    
}
