//
//  ViewController.swift
//  MVP_LoginDemo
//
//  Created by qxu on 2017/8/31.
//  Copyright © 2017年 qxu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login" {
            guard let login = segue.destination as? LoginViewController else { return }
            
            let user = User(username: "", password: "")
            let presenter = LoginPresenter(view: login, user: user)
            login.presenter = presenter
        }
    }
}

