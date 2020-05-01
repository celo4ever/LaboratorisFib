
//
//  File.swift
//  LaboratorisFib
//
//  Created by Marcel Costa i Amezquita on 30/04/2020.
//  Copyright © 2020 Marcel Costa i Amezquita. All rights reserved.
//

import UIKit

protocol UICollectionViewLongPressDelegate {
    func onLongPress(indexPath: IndexPath)
}

protocol UIViewModel: AnyObject{
    func reload()
}
