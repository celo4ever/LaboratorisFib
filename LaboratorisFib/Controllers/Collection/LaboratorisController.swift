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

class LaboratorisController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var targeta: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var labsCollection: UICollectionView!
    fileprivate var lV: LaboratoriViewModel!

    let cellScale: CGFloat = 0.6
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        lV = LaboratoriViewModel(controller: self)
        
        targeta.layer.cornerRadius = 20
        targeta.clipsToBounds = true
        targeta.layer.masksToBounds = false
        targeta.layer.shadowRadius = 10
        targeta.layer.shadowOpacity = 1.0
        targeta.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
        scrollView.layer.cornerRadius = 15
        scrollView.clipsToBounds = true
        scrollView.layer.masksToBounds = false
        scrollView.layer.shadowRadius = 10
        scrollView.layer.shadowOpacity = 1.0
        scrollView.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.masksToBounds = false
        let cellWidth : CGFloat = 122
        let cellHeight : CGFloat = 128
        
        let insetX = (cellWidth) / 3
        let insetY = (labsCollection.bounds.height - cellHeight) / 4
        
          
        labsCollection.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
          
        labsCollection.delegate = self
        labsCollection.dataSource = self
        
    }
    
    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                lV.selectedType = .top
            case 1:
                lV.selectedType = .fav
            default:
                print("default")
        }
    }
}

extension LaboratorisController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lV.labs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath as IndexPath) as! CustomCollectionViewCell
        cell.create(self.lV.labs[indexPath.row], indexPath)
        cell.delegate = self
        return cell
    }

    //Calcules com vols veure els
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 122, height: 128)
    }
}

extension LaboratorisController: UICollectionViewLongPressDelegate{
    func onLongPress(indexPath: IndexPath) {
        DataSingleton.sharedInstance.addFav(lab: self.lV.labs[indexPath.item])
    }
}

