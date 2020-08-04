//
//  MenuViewController.swift
//  SideMenuDemo
//
//  Created by Mohamed Korany on 7/29/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit
import Localize_Swift

class MenuViewController: UIViewController {
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var changeLangBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUIWhenChangeLanguage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(updateUIWhenChangeLanguage), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    
    // Remove the LCLLanguageChangeNotification on viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updateUIWhenChangeLanguage() {
        changeLangBtn.setTitle("Change Language".localized(), for: UIControl.State.normal)
        homeBtn.setTitle("home".localized(), for: .normal)
        profileBtn.setTitle("profile".localized(), for: .normal)
        
    }
    
    @IBAction func profileButtonDidPressed(_ sender: Any) {
        //        self.performSegue(withIdentifier: "profile", sender: self)
    }
    @IBAction func changeLanguageDidPressed(_ sender: Any) {
        let changeLangAlert = UIAlertController(title: "Change Language".localized() , message: "Are You sure to change language".localized(), preferredStyle: .alert)
        
        changeLangAlert.addAction(UIAlertAction(title: "Ok".localized(), style: .default, handler: {[unowned self] (action: UIAlertAction!) in
            
            if Localize.currentLanguage() == "ar" {
                print("language is arabic")
                self.setupEnglishLanguageSelection()
            }
            else if Localize.currentLanguage() == "en" {
                print("language is english")
                self.setupArabicLanguageSelection()
            }
        }))
        
        changeLangAlert.addAction(UIAlertAction(title: "Cancel".localized(), style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(changeLangAlert, animated: true, completion: nil)
    }
    
    private func setupEnglishLanguageSelection() {
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        self.performSegue(withIdentifier: "home", sender: self)
        Localize.setCurrentLanguage("en")
        self.revealViewController()?.rightViewController = nil
    }
    
    private func setupArabicLanguageSelection() {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        self.performSegue(withIdentifier: "home", sender: self)
        Localize.setCurrentLanguage("ar")
        print("Arabic..")
        self.revealViewController()?.rearViewController = nil
    }
    
    
    
}
