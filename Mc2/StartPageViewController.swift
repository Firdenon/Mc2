//
//  ViewController.swift
//  Mc2
//
//  Created by Ricky Adi Kuncoro on 21/06/18.
//  Copyright © 2018 est. All rights reserved.
//

import UIKit

class StarPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "startToLoginSegue", sender: self)
    }
    
    @IBAction func tutorialActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "tutorSegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
