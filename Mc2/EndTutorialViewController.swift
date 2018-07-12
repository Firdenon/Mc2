//
//  EndTutorialViewController.swift
//  Mc2
//
//  Created by Ricky Adi Kuncoro on 25/06/18.
//  Copyright © 2018 est. All rights reserved.
//

import UIKit

class EndTutorialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "tutorToLoginSegue", sender: self)
    }
    
    @IBAction func signUpActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "tutorToSignUpSegue", sender: self)
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
