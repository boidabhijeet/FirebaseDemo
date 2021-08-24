//
//  ViewController.swift
//  FirebaseAuthenticationDemo
//
//  Created by Abhi’s iPhone on 04/05/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController {

    let db = Firestore.firestore()

    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        
        //Create

        //Read
    
        //Update

        //Delete
        
    }

    func setUpElements(){
        Utilities.styleHollowButton(signUpButton)
        Utilities.styleFilledButton(loginButton)
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "SignUpPageViewController") as! SignUpPageViewController
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "LoginPageViewController") as! LoginPageViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func readData(){
        db.collection("Employee").getDocuments { snapshot, error in
            for snap in snapshot!.documents{
                self.db.collection("Employee").document(snap.documentID)
            }
        }
    }//readData
    
    func updateData(){
        
    }
    
    func deleteData(){
//      Delete the specific id
        db.collection("Employee").document("id").delete()
        
//      Delete All Documents
        db.collection("Employee").getDocuments { snapshot, error in
            for snap in snapshot!.documents{
                self.db.collection("Employee").document(snap.documentID).delete()
            }
        }
    }//deleteData
}//VC


