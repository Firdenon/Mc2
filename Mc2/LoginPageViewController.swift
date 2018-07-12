//
//  LoginPageViewController.swift
//  Mc2
//
//  Created by Ricky Adi Kuncoro on 25/06/18.
//  Copyright © 2018 est. All rights reserved.
//

import UIKit
import CoreData

class LoginPageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextfield.delegate = self
        emailTextField.delegate = self
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let users = try PersistenService.contex.fetch(fetchRequest)
            self.users = users
        }catch {
            
        }
        
        for user in self.users{
            print(user.email!)
            print(user.password!)
        }
        
        // Do any additional setup after loading the view.
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

    @IBAction func loginBtn(_ sender: Any) {
        
        for user in users{
            if emailTextField.text == user.email && passwordTextfield.text == user.password{
                popUp(title: "Success", message: "Welcome back \(user.name!)", segueIdentifier: "loginToListSegue")
            }
        }
         popUp(title: "Error", message: "Wrong email or password", segueIdentifier: "")
    }
    
    @IBAction func forgotBtn(_ sender: Any) {
        performSegue(withIdentifier: "loginToForgotSegue", sender: self)
    }
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        performSegue(withIdentifier: "loginToSignUpSegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidDisappear(_ animated: Bool) {
         UIApplication.shared.statusBarStyle = .default
    }
    
    func popUp(title : String, message:String, segueIdentifier : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
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
