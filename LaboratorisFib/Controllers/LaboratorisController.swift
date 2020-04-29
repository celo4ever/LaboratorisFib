//
//  ViewController.swift
//  LaboratorisFib
//
//  Created by Marcel Costa i Amezquita on 27/03/2020.
//  Copyright © 2020 Marcel Costa i Amezquita. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyJSON

class LaboratorisController: UICollectionViewController {
    
    var laboratoris =  [Laboratori]()
    fileprivate var lV: LaboratoriViewModel!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? LabLayout {
          layout.delegate = self
        }
        lV = LaboratoriViewModel(controller: self)
    
        view.backgroundColor = UIColor.blue
        collectionView?.backgroundColor = .clear
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
      }
}

extension LaboratorisController: UICollectionViewDelegateFlowLayout{
    
      override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataSingleton.sharedInstance.labs.count
      }
      
      override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath as IndexPath) as! CustomCollectionViewCell
        cell.lab = self.lV.labs[indexPath.item]
        return cell
      }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
      }
}

extension LaboratorisController: LaboratorisLayoutDelegate {
    func collectionView(
      _ collectionView: UICollectionView,
      heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
      return CGFloat(176)
    }
}
