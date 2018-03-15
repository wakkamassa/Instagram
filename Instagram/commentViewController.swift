//
//  commentViewController.swift
//  Instagram
//
//  Created by 　若原　昌史 on 2018/03/14.
//  Copyright © 2018年 WakaharaMasashi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class commentViewController: UIViewController {
    var postArray: [PostData] = []
    
    @IBOutlet weak var postComments: UIButton!
    @IBOutlet weak var textMessage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func postMessage(_ sender: Any) {
        postComments.addTarget(self, action:#selector(handleButton(_:forEvent:)),for: .touchUpInside)
    }
    
    
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func handleButton(_ sender:UIButton,forEvent event:UIEvent){
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "Home" ) as! HomeViewController
        // タップされたセルのインデックスを求める
        
        let touch = event.allTouches?.first
        let point = touch!.location(in: homeViewController.tableView)
        let indexPath = homeViewController.tableView.indexPathForRow(at: point)
        
        // 配列からタップされたインデックスのデータを取り出す
        let postData = postArray[indexPath!.row]
        
        let name = Auth.auth().currentUser?.displayName
        let data = name! + ":" + textMessage.text!
        
        postData.comments.append(data)
        
        let postRef = Database.database().reference().child(Const.PostPath)
        let comments = ["comments":postData.comments]
        postRef.updateChildValues(comments)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
