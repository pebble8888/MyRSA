//
//  ViewController.swift
//  MyRSA
//
//  Created by pebble8888 on 2017/05/27.
//  Copyright © 2017年 pebble8888. All rights reserved.
//
// @note MyRSAプロジェクトは動作確認用プロジェクトである
//

import UIKit
import SwiftyRSA

/*
extension Data {
    var hexDescription:String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            //let publickey:PublicKey = try PublicKey(pemNamed: "public-key")
            let privatekey:PrivateKey = try PrivateKey(pemNamed: "private-key")
            //let message:ClearMessage = try ClearMessage(string: "HogeFuga", using: .utf8) 
            // let encrypted:EncryptedMessage = try message.encrypted(with: publickey, padding: .PKCS1)
            
            let url:URL = Bundle.main.url(forResource: "encrypted_msg", withExtension: "bin")!
            let data:Data = try Data(contentsOf: url)
            let encrypted:EncryptedMessage = EncryptedMessage(data: data)
            
            //print("\(encrypted.data.hexDescription)")
            let decrypted:ClearMessage = try encrypted.decrypted(with: privatekey, padding: .PKCS1)
            print("\(try decrypted.string(encoding: .utf8))")
        } catch {
            fatalError()
        }
        
    }

}

