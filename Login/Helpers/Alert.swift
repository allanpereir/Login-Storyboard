//
//  Alert.swift
//  Login
//
//  Created by Alan Silva on 28/05/22.
//

import Foundation
import UIKit

struct Alert {
    static func basicAlert (on viewController:UIViewController, with title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        viewController.present(alert, animated: true)
    }
}
