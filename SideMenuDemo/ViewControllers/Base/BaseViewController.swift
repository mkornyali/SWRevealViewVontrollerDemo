//
//  BaseViewController.swift
//  SideMenuDemo
//
//  Created by Mohamed Korany on 7/29/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit
import Localize_Swift

class BaseViewController: UIViewController {
    
        var menuButton:UIBarButtonItem = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //  setupLeftMenu()
        //addBarButtonBasedOnLanguage()
        menuButton.title = "Menu".localized()
        self.navigationItem.leftBarButtonItem = menuButton
    }
//    func setupLeftMenu() {
//
//        if Localize.currentLanguage() == "en" {
//            print("true")
//            menuButton = UIBarButtonItem(title: "Menu".localized() , style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
//            addBarButtonBasedOnLanguage()
//            self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
//            self.revealViewController()?.rearViewRevealWidth = 260
//        }
//        else {
//            menuButton = UIBarButtonItem(title: "Menu".localized() , style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)))
//            addBarButtonBasedOnLanguage()
//            self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
//            self.revealViewController()?.rightViewRevealWidth = 260
//        }
//
//    }
    
    
    private func addBarButtonBasedOnLanguage() {
        menuButton.title = "Menu".localized()
        if Localize.currentLanguage() == "ar" {
            print("addBarButtonBasedOnLanguage arabic ... ")
           // self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.rightBarButtonItem = menuButton
        }
        else {
            print("addBarButtonBasedOnLanguage arabic ... ")
            //self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.leftBarButtonItem = menuButton
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(updateUIOnchangeLanguage), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    
    // Remove the LCLLanguageChangeNotification on viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updateUIOnchangeLanguage() {
    //    addBarButtonBasedOnLanguage()
        if Localize.currentLanguage() == "ar" {
            // UIView.appearance().semanticContentAttribute = .forceRightToLeft
            handleSetupRearMenuVC()
        }
        else if  Localize.currentLanguage() == "en" {
            //UIView.appearance().semanticContentAttribute = .forceLeftToRight
            handleSetupRightMenuVC()
            
        }
        
    }
    
    
    private  func handleSetupRearMenuVC() {
        if let sidemenuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController{
            revealViewController()?.rearViewController = nil
            revealViewController().rightViewController = sidemenuViewController
            menuButton.target = self.revealViewController()
            self.revealViewController().rightViewRevealWidth = 260
            self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
            menuButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            
        }
    }
    
    private func handleSetupRightMenuVC() {
        if let sidemenuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController{
            revealViewController()?.rightViewController = nil
            revealViewController()?.rearViewController = sidemenuViewController
            menuButton.target = self.revealViewController()
            self.revealViewController()?.rearViewRevealWidth = 260
            self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
        }
    }
    
}
