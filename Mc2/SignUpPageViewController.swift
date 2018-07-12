//
//  SignUpPageViewController.swift
//  Mc2
//
//  Created by Ricky Adi Kuncoro on 25/06/18.
//  Copyright © 2018 est. All rights reserved.
//

import UIKit

class SignUpPageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var confirmOutlet: UITextField!
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOutlet.delegate = self
        emailOutlet.delegate = self
        passwordOutlet.delegate = self
        confirmOutlet.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        // Try to find next responder
        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder!
        
        if nextResponder != nil {
            // Found next responder, so set it
            nextResponder?.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard
            textField.resignFirstResponder()
        }
        return false
    }
    
    @IBAction func loginActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "signUpToLoginSegue", sender: self)
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        if nameOutlet.text == "" || emailOutlet.text == "" || passwordOutlet.text == "" || confirmOutlet.text == "" {
            popUp(title: "Please fill all field",segueIdentifier: "")
        }else if emailOutlet.text?.range(of: "@") == nil{
            popUp(title: "PLease input correct email",segueIdentifier: "")

        }else if passwordOutlet.text != confirmOutlet.text {
            popUp(title: "Password don't match",segueIdentifier: "")
        }else{
            popUp(title: "Success",segueIdentifier: "signUpToLoginSegue")
            let user = User(context: PersistenService.contex)
            let name = nameOutlet.text
            let email = emailOutlet.text
            let password = passwordOutlet.text
            user.name = name
            user.email = email
            user.password = password
            PersistenService.saveContext()
            self.users.append(user)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func popUp(title : String, segueIdentifier : String) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                if segueIdentifier != ""{
                    self.performSegue(withIdentifier: segueIdentifier, sender: self)
                }
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
