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
    
    var delegate: UICollectionViewLongPressDelegate!
    var indexPath: IndexPath!
    
    override func awakeFromNib() {
      super.awakeFromNib()
      nomAulari.sizeToFit()
      containerView.layer.cornerRadius = 6
      containerView.layer.masksToBounds = true
        
    }
    
    func create(_ labo:Laboratori, _ index: IndexPath) {
        nomAulari.text = labo.id
        self.indexPath = index
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(onLongPress(press: )))
        self.addGestureRecognizer(longTap)
    }
    
    @objc func onLongPress(press: UILongPressGestureRecognizer){
        print("taped")
        if press.state == .ended {
            self.delegate!.onLongPress(indexPath: self.indexPath) //ell mateix és el delegat de long press
        }
    }
    
    override func prepareForReuse() {
        for gesture in self.gestureRecognizers!{
            self.removeGestureRecognizer(gesture)
        }
    }
}
