//
//  LoginViewController.swift
//  DonationTrackeriOS
//
//  Created by Abhay Tangella on 12/2/18.
//  Copyright © 2018 Abhay Tangella. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {

   
    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var usernameTextF: UITextField!
    @IBOutlet weak var passwordTextF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: usernameTextF.text!, password: passwordTextF.text!) { (user, error) in
            if error == nil{
                self.performSegue(withIdentifier: "loginToHome", sender: self)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
    func textFieldShouldReturn( _textField: UITextField) -> Bool
    {
        _textField.resignFirstResponder()
        return true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
