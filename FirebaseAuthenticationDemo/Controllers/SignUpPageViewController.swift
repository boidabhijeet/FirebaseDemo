//
//  SignUpPageViewController.swift
//  FirebaseAuthenticationDemo
//
//  Created by Abhi’s iPhone on 04/05/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpPageViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements(){
        
        //Hide the error label
        errorLabel.alpha = 0

        //Style the text fields
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        createData()
    }//signUpTapped
    
    //Create - setData
    func createData(){
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { [self]result, error in
            if error == nil{
                    let db = Firestore.firestore()
                    let employeeRef = db.collection("Employee").document()
                employeeRef.setData(["firstName" : firstNameTextField.text!, "lastName" : lastNameTextField.text!, "email" : emailTextField.text!, "password" : passwordTextField.text!, "id" : employeeRef.documentID])
                let vc = storyboard?.instantiateViewController(identifier: "LoginPageViewController") as! LoginPageViewController
                navigationController?.pushViewController(vc, animated: true)
            }else{
                errorLabel.text = error?.localizedDescription
                errorLabel.alpha = 1
            }
        }
    }//createData
}
