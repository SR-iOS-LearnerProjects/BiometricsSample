//
//  ViewController.swift
//  BiometricsSample
//
//  Created by Sridatta Nallamilli on 07/03/20.
//  Copyright © 2020 Sridatta Nallamilli. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var authBtn: UIButton!
    
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK:- Button Actions
    @IBAction func authBtnAction(_ sender: UIButton) {
        
        let context = LAContext()
        
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please provide FaceID/TouchID authentication to make full use of this app.") { (success, error) in
                if success {
                    print("SUCCESS")
                    DispatchQueue.main.async { // Correct
                       let dvc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
                       self.navigationController?.pushViewController(dvc, animated: true)
                    }
                    
                }
                else {
                    print("FAILED")
                    DispatchQueue.main.async {
                        self.showAlert(title: "Invalid Biometric ID", message: "Please provide a valid FaceID/TouchID", vc: self)
                    }
                }
            }
        }
        else {
            self.showAlert(title: "Biometrics Not Configured", message: "Please goto settings and configure your FaceID/TouchID", vc: self)
        }
        
    }
    
    //MARK:- UserDefined Methods
    
    func showAlert(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true)
    }
    
}

