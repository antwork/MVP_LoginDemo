//
//  LoginPresenter.swift
//  MVP_LoginDemo
//
//  Created by qxu on 2017/8/31.
//  Copyright © 2017年 qxu. All rights reserved.
//

import Foundation

class LoginPresenter: LoginViewPresenterPtl {
    
    unowned let view:LoginViewPtl
    
    var user:User
    
    // MARK: - LoginViewPresenter
    
    required init(view:LoginViewPtl, user:User) {
        self.view = view
        self.user = user
    }
    
    func update(username:String) {
        self.user.username = username;
    }
    
    func update(password:String){
        self.user.password = password;
    }
    
    func login() {
        if let error = checkParams() {
            self.view.fail(error: error)
            return
        }
        
        doLogin(success: { (user) in
            self.view.success(User: user)
        }) { (error) in
            self.view.fail(error: error)
        }
    }
    
    // MARK: - Utils
    
    func checkParams() -> LoginError? {
        if !self.user.username.contains("@") {
            return LoginError.usernameInvalid
        }
        
        if self.user.username.characters.count < 6 {
            return LoginError.usernameShortThan6
        }
        
        if self.user.password.characters.count < 6 {
            return LoginError.passwordShortThan6
        }
        
        return nil
    }
    
    func doLogin(success:((User)->Void)?, failure:((LoginError)->Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            // 测试登录成功
            if self.user.username == "a@b.com" && self.user.password == "123456" {
                success?(self.user);
                return
            }
            
            // 测试超时
            if self.user.username == "a@b.com" && self.user.password == "654321" {
                failure?(LoginError.timeout)
                return
            }
            
            // 测试登录失败
            failure?(LoginError.usernamePasswordNotMatch)
        }
    }
    
}
