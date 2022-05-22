//
//  LoginViewController.swift
//  Login
//
//  Created by Alan Silva on 21/05/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var firstNameTextFiedl: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var errorTextLabel: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        //hide the error label
        errorTextLabel.alpha = 0
        Utilities.styleTextField(firstNameTextFiedl)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleButton(btnLogin)
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
    }
    

}
