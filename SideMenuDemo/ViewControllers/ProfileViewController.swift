//
//  ProfileViewController.swift
//  SideMenuDemo
//
//  Created by Mohamed Korany on 7/29/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit
import Localize_Swift

class ProfileViewController: BaseViewController {

    @IBOutlet weak var testLbl: UILabel!
    @IBOutlet weak var followingLbl: UILabel!
    @IBOutlet weak var followersLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUIOnchangeLanguage()
        // Do any additional setup after loading the view.
        print(Localize.currentLanguage())
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
    @objc override func updateUIOnchangeLanguage(){
        super.updateUIOnchangeLanguage()
        followingLbl.text = "follwing".localized()
        followersLbl.text = "follower".localized()
        usernameLbl.text = "username".localized()
        testLbl.text = "test".localized()
        
        }

}
