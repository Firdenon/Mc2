//
//  ForgotPasswordPageViewController.swift
//  Mc2
//
//  Created by Ricky Adi Kuncoro on 25/06/18.
//  Copyright © 2018 est. All rights reserved.
//

import UIKit

class ForgotPasswordPageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var forgotEmailTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgotEmailTextfield.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        forgotEmailTextfield.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitActionBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Success", message: "Please check your email inbox", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                self.dismiss(animated: true, completion: nil)
                
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
