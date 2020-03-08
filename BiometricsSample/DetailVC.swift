//
//  DetailVC.swift
//  BiometricsSample
//
//  Created by Sridatta Nallamilli on 07/03/20.
//  Copyright © 2020 Sridatta Nallamilli. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var backBtn: UIButton!

    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK:- Button Actions
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
 

}
