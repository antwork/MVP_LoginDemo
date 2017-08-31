//
//  LoginPresenterTests.swift
//  MVP_LoginDemo
//
//  Created by qxu on 2017/8/31.
//  Copyright © 2017年 qxu. All rights reserved.
//

import XCTest

class LoginPresenterTests: XCTestCase {

    func testUsernameInvalid() {
        let loginView = LoginViewController()
        let user = User(username: "", password: "")
        let presenter = LoginPresenter(view: loginView, user: user)
        
        XCTAssertTrue(presenter.checkParams() == LoginError.usernameInvalid)
    }
    
    func testUsernameTooShort() {
        let loginView = LoginViewController()
        let user = User(username: "111@1", password: "")
        let presenter = LoginPresenter(view: loginView, user: user)
        
        XCTAssertTrue(presenter.checkParams() == LoginError.usernameShortThan6)
    }
    
    func testPasswordTooShort() {
        let loginView = LoginViewController()
        let user = User(username: "111@111", password: "")
        let presenter = LoginPresenter(view: loginView, user: user)
        
        XCTAssertTrue(presenter.checkParams() == LoginError.passwordShortThan6)
    }
    
    func testLoginSuccess() {
        let loginView = LoginViewController()
        let user = User(username: "a@b.com", password: "123456")
        let presenter = LoginPresenter(view: loginView, user: user)
        
        
        let expectation = self.expectation(description: "test login success")
        
        presenter.doLogin(success: { (user) in
            expectation.fulfill()
        }) { (error) in
            
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if error != nil {
                XCTFail("失败\(error!)")
            }
        }
    }
    
    func testLoginFailure() {
        let loginView = LoginViewController()
        let user = User(username: "a@b.com", password: "111111")
        let presenter = LoginPresenter(view: loginView, user: user)
        
        
        let expectation = self.expectation(description: "test login success")
        
        presenter.doLogin(success: { (user) in

        }) { (error) in
            if error == .usernamePasswordNotMatch {
                expectation.fulfill()
                return
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if error != nil {
                XCTFail("失败\(String(describing: error!))")
            }
        }
    }
    
    func testLoginTimeout() {
        let loginView = LoginViewController()
        let user = User(username: "a@b.com", password: "654321")
        let presenter = LoginPresenter(view: loginView, user: user)
        
        
        let expectation = self.expectation(description: "test login success")
        
        presenter.doLogin(success: { (user) in
            
        }) { (error) in
            if error == .timeout {
                expectation.fulfill()
                return
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if error != nil {
                XCTFail("失败\(String(describing: error!))")
            }
        }
    }
}
