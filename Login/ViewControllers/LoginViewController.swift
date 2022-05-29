//
//  LoginViewController.swift
//  Login
//
//  Created by Alan Silva on 21/05/22.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {


    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorTextLabel: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        //hide the error label
        Utilities.styleTextField(userTextField)
        Utilities.styleTextField(passwordTextField)
        errorTextLabel.alpha = 0
        Utilities.styleButton(btnLogin)
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        if let user = userTextField.text, let password = passwordTextField.text{
            
            Auth.auth().signIn(withEmail: user, password: password) { result, error in
                if let e = error {
                    Alert.basicAlert(on: self, with: "Erro no Login", message: e.localizedDescription)
                }else{

                    self.userTextField.text = ""
                    self.passwordTextField.text = ""
                    
                }
            }
            
        }
         
        
    }
    

}
