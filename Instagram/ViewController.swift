//
//  ViewController.swift
//  Instagram
//
//  Created by 　若原　昌史 on 2018/03/04.
//  Copyright © 2018年 WakaharaMasashi. All rights reserved.
//

import UIKit
import ESTabBarController
import Firebase
import FirebaseAuth


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTab()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTab(){
        
        let tabBarController:ESTabBarController! = ESTabBarController(tabIconNames:["home","camera","setting"])
        tabBarController.selectedColor = UIColor(red:1.0,green:0.44,blue:0.11,alpha:1)
        tabBarController.buttonsBackgroundColor = UIColor(red:0.96,green:0.91,blue:0.87,alpha:1)
        tabBarController.selectionIndicatorHeight = 3
        
        addChildViewController(tabBarController)
        let tabBarView = tabBarController.view!
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabBarView)
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tabBarView.topAnchor.constraint(equalTo:safeArea.topAnchor),
            tabBarView.bottomAnchor.constraint(equalTo:safeArea.bottomAnchor),
            tabBarView.leadingAnchor.constraint(equalTo:safeArea.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo:safeArea.trailingAnchor)
            ])
        tabBarController.didMove(toParentViewController: self)
        
        // タブをタップした時に表示するViewControllerを設定する
        let homeViewController = storyboard?.instantiateViewController(withIdentifier:"Home")
        let settingViewController = storyboard?.instantiateViewController(withIdentifier:"Setting")
        
        tabBarController.setView(homeViewController,at:0)
        tabBarController.setView(settingViewController,at:2)
        
        // 真ん中のタブはボタンとして扱う
        tabBarController.highlightButton(at:1)
        tabBarController.setAction({
        // ボタンが押されたらImageViewControllerをモーダルで表示する
            let imageViewController = self.storyboard?.instantiateViewController(withIdentifier:"ImageSelect")
            self.present(imageViewController!,animated:true,completion:nil)
        }, at: 1)
    }
    
    override func viewDidAppear(_ animated:Bool){
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser == nil{
            let LoginViewController = self.storyboard?.instantiateViewController(withIdentifier:"Login")
            self.present(LoginViewController!,animated:true,completion:nil)
        }
    }


}

