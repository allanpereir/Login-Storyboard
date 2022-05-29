//
//  SignUpViewController.swift
//  Login
//
//  Created by Alan Silva on 21/05/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

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
        
        let safePasswordValid = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(safePasswordValid) == false {
            return "Por favor, forneça uma senha que contenha no minimo 8 caracter, que contenha um caracter especial e numeros!"
            
        }
        return nil
    }
    
    @IBAction func btnSingUp(_ sender: UIButton) {
        
        let error = validateFields()
        
        if error != nil {
            self.errorLabel.text = error!
            self.errorLabel.alpha = 1
        }else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { result, erro in
                if erro != nil {
                    Alert.basicAlert(on: self, with: "Erro no Cadastro de Usuario", message: "Houve um erro no cadastro do Usuario!")
                }
                else {
                   let db = Firestore.firestore()
                    
                    if let fName = self.firstNameTextField.text, let lName = self.lastNameTextField.text, let userEmail = self.emailTextField.text {
                       
                        
                        db.collection("users").addDocument(data: [
                            "firstname": fName,
                            "lastname": lName,
                            "email": userEmail
                        ])
                         
                    }
                 
                    Alert.basicAlert(on: self, with: "Cadastro de Usuario", message: "Usuario cadastrado com sucesso!")
                    self.firstNameTextField.text = ""
                    self.lastNameTextField.text = ""
                    self.passwordTextField.text = ""
                    self.errorLabel.text = ""
                    self.emailTextField.text = ""
                }
            }
            
        }
    }
    
    
}
