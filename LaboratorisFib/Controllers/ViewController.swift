//
//  ViewController.swift
//  LaboratorisFib
//
//  Created by Marcel Costa i Amezquita on 27/03/2020.
//  Copyright © 2020 Marcel Costa i Amezquita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var labManager = LaboratoriManagement()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labManager.performRequest()
    }


}

