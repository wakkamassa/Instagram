//
//  messageViewController.swift
//  Instagram
//
//  Created by 　若原　昌史 on 2018/03/11.
//  Copyright © 2018年 WakaharaMasashi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class messageViewController: UIViewController {

    @IBOutlet weak var message: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func PostMessage(_ sender: Any) {
        
        
    }
    
    @IBAction func cancelMessage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
