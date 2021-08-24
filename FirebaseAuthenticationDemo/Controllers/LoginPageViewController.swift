//
//  LoginPageViewController.swift
//  FirebaseAuthenticationDemo
//
//  Created by Abhi’s iPhone on 04/05/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginPageViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

    }
    
    func setUpElements(){
        //Hide the error label
        errorLabel.alpha = 0
   
        //Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleHollowButton(loginButton)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [self] result, error in
            if error == nil {
                let vc = storyboard?.instantiateViewController(identifier: "HomePageViewController") as! HomePageViewController
                    navigationController?.pushViewController(vc, animated: true)
            }
            else{
                errorLabel.text = error?.localizedDescription
                errorLabel.alpha = 1
            }
        }
    }
}
