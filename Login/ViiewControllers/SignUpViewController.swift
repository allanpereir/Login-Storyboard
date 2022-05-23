//
//  SignUpViewController.swift
//  Login
//
//  Created by Alan Silva on 21/05/22.
//

import UIKit

class SignUpViewController: UIViewController {


    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        
        //hide the error label
        errorLabel.alpha = 0
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleButton(btnSignUp)
   
        
        
    }
    
    //Check the fields and validate the data is correct.
    func validateFields () -> String? {
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)  ==  "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)  == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)     == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)  == "" {
                                                       
            return "Preencha todos os campos!"
        }
        
        let safePasswordValid = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(safePasswordValid!) == false {
            return "Por favor, forneça uma senha que contenha no minimo 8 caracter, que contenha um caracter especial e numeros!"
            
        }
        return nil
    }
    
    @IBAction func btnSingUp(_ sender: UIButton) {
        
        //validate the fields
        
        //create the user
        
        //transation to the welcome screen
        
    }
    
    
}
