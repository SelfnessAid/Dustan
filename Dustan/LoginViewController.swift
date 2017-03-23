//
//  LoginViewController.swift
//  Dustan
//
//  Created by Mobile Star on 24/02/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.authenticateUser()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func authenticateUser() {
        let context : LAContext = LAContext()
        var error : NSError?
        let myLocalizedReasonString : NSString = "Authentication is required"
        
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString as String, reply: { (success : Bool, evalutionError : Error?) in
                if success {
                    
                } else {
                    // Authentification failed
                    print((evalutionError?.localizedDescription)!)
                    let alertVC = UIAlertController(title: "Notice", message: "Authentication was Failed. \n Want to use Password ?", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        
                    })
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
//                        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                    })
                    
                    alertVC.addAction(okAction)
                    alertVC.addAction(cancelAction)
                    
                    self.present(alertVC, animated: true, completion: nil)
                    
                }
            } )
        } else {
            let alertVC : UIAlertController = UIAlertController(title: "Notice", message: "Authentication is not available. \n Want to use Password ?", preferredStyle: .alert)
            let okAction : UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                
            })
            
            let cancelAction : UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            })
            
            alertVC.addAction(okAction)
            alertVC.addAction(cancelAction)
            
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}
