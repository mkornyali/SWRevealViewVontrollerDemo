//
//  LanguageViewController.swift
//  SideMenuDemo
//
//  Created by Mohamed Korany on 7/29/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit
import Localize_Swift

class LanguageViewController: BaseViewController {
    @IBOutlet weak var helloLabel: UILabel!
    var actionSheet: UIAlertController!
       
    @IBOutlet weak var changeLangBtn: UIButton!
    let availableLanguages = Localize.availableLanguages()
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setText()
        // Do any additional setup after loading the view.
    }
    
//    @objc override func setText() {
//
//
//         helloLabel.text = "Hello".localized();
//        changeLangBtn.setTitle("Change Language".localized(), for: UIControl.State.normal)
////     resetButton.setTitle("Reset".localized(using: "ButtonTitles"), for: UIControl.State.normal)
//     }
    
//    override func viewWillAppear(_ animated: Bool) {
//           super.viewWillAppear(animated)
//           NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
//       }
//
//       // Remove the LCLLanguageChangeNotification on viewWillDisappear
//       override func viewWillDisappear(_ animated: Bool) {
//           super.viewWillDisappear(animated)
//           NotificationCenter.default.removeObserver(self)
//       }
    

    @IBAction func changeLanguageDidPressed(_ sender: Any) {
        actionSheet = UIAlertController(title: nil, message: "Switch Language", preferredStyle: UIAlertController.Style.actionSheet)
            for language in availableLanguages {
                let displayName = Localize.displayNameForLanguage(language)
                let languageAction = UIAlertAction(title: displayName, style: .default, handler: {
                    (alert: UIAlertAction!) -> Void in
                        Localize.setCurrentLanguage(language)
                })
                actionSheet.addAction(languageAction)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {
                (alert: UIAlertAction) -> Void in
            })
            actionSheet.addAction(cancelAction)
            self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func resetDidPressed(_ sender: Any) {
        Localize.resetCurrentLanguageToDefault()
    }
    
}
