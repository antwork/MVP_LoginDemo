//
//  LoginViewController.swift
//  MVP_LoginDemo
//
//  Created by qxu on 2017/8/31.
//  Copyright © 2017年 qxu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewPtl {
    
    var presenter:LoginPresenter!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        self.presenter.login()
    }
    
    @IBAction func usernameValueChanged(_ sender: Any) {
        guard let field = sender as? UITextField else { return }
        
        self.presenter.update(username: field.text ?? "")
    }
    
    @IBAction func passwordValueChanged(_ sender: Any) {
        guard let field = sender as? UITextField else { return }
        
        self.presenter.update(password: field.text ?? "")
    }
    
    // MARK: - Protocol LoginView
    
    func set(username:String) {
        usernameField.text = username
    }
    
    func set(password:String) {
        passwordField.text = password
    }
    
    func fail(error:LoginError) {
        print("fail \(error.msg)")
    }
    
    func success(User:User) {
        print("success")
        self.dismiss(animated: true, completion: nil)
    }
}
