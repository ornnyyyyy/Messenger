//
//  ViewController.swift
//  Messenger
//
//  Created by orn on 24/6/2564 BE.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    // check if the user is signed in based on some user defaults and if they are we'll stay on the screen and if they're not will show the login screen

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // get the value of some user defaults and user default if you're not familiar are used to you save some data about anything you want to really save to disk and the key we're gonna use is logged_in
        // ypu can use any key this is otally up to you
        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
        
        // we're gonna say if the user is not logged in, we want to present the LoginViewController
        // and we're gonna create a navigation controller and navigation controller can have a route to view controller
        // we wanna say model presentation style and we wanna assign it to be fullscreen because in iOS13 if you don't specify it, this way the controller by default pops up as a card and user can dismiss it by swiping down and we don't want the user to be able to submit rather dismiss the register login page unless they're actually truly logged in.
        // and we're gonna present this navigation controller with an animation and the other thing you want to do is on this nav object which is a nav controller
        if !isLoggedIn {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
        
    }
    
}

