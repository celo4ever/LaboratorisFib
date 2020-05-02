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
    
    @IBOutlet weak var targetaTitol: UIView!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var nomAulari: UILabel!
    @IBOutlet weak var scrollView: UIView!
    @IBOutlet weak var targeta: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var labsCollection: UICollectionView!
    fileprivate var lV: LaboratoriViewModel!

    
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        lV = LaboratoriViewModel(controller: self)
        cellWidth = floor(self.targeta.bounds.width * 0.3)
        cellHeight = floor(self.targeta.bounds.height * 0.8)
        
        custom(view: targeta)
        custom(view: scrollView)
        initTargeta(targetaTitol)
    
        labsCollection.layer.cornerRadius = 5
          
        labsCollection.delegate = self
        labsCollection.dataSource = self
        
    }
    private func initTargeta(_ targetaTitol: UIView){
        targetaTitol.layer.cornerRadius = 9
        targetaTitol.clipsToBounds = true
        targetaTitol.layer.masksToBounds = false
        targetaTitol.layer.shadowOffset = CGSize(width: 0, height: -2)
        targetaTitol.layer.shadowOpacity = 0.6
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

extension LaboratorisController: CustomViews {
    
    func custom(view: UIView){
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.layer.masksToBounds = false
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.6
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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension LaboratorisController: UICollectionViewLongPressDelegate{
    func onLongPress(indexPath: IndexPath) {
        DataSingleton.sharedInstance.addFav(lab: self.lV.labs[indexPath.item])
    }
}

