//
//  MVPProtocols.swift
//  MVP_LoginDemo
//
//  Created by qxu on 2017/8/31.
//  Copyright © 2017年 qxu. All rights reserved.
//

import UIKit

enum LoginError: Error {
    case usernameInvalid
    case usernameShortThan6
    case passwordShortThan6
    case usernamePasswordNotMatch
    
    // 超时
    case timeout
    
    func msg() -> String {
        switch self {
        case .usernameInvalid:
            return "Invalid Username"
        case .usernameShortThan6:
            return "用户名必须大于6个字符"
        case .passwordShortThan6:
            return "密码必须大于6个字符"
        case .usernamePasswordNotMatch:
            return "用户名或密码错误"
        case .timeout:
            return "登录超时"
        }
    }
}

protocol LoginViewPtl: class {
    
    func set(username:String)
    
    func set(password:String)
    
    func fail(error:LoginError)
    
    func success(User:User)
}

protocol LoginViewPresenterPtl {
    
    init(view:LoginViewPtl, user:User)

    func update(username:String)
    
    func update(password:String)
    
    func login()
}
