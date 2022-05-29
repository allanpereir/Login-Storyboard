//
//  ViewController.swift
//  Login
//
//  Created by Alan Silva on 21/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        
        Utilities.styleButton(signUpButton)
        Utilities.styleHollowButton(loginButtom)

    }

}

