//
//  AppCategory.swift
//  AppStore
//
//  Created by sangita singh on 11/3/17.
//  Copyright © 2017 hulu. All rights reserved.
//

import UIKit

class AppCategory: NSObject {

    var name : String?
    var apps : [App]?
    var type : String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if(key == "apps"){
            apps = [App]()
            for dict in value as! [[String : Any]]{
                let app = App()
//                app.setValuesForKeys(dict)
                apps?.append(app)
            }
        }else{
            super.setValue(value, forKey: key)
        }
    }

    static func fetchAppCategories(){
        let url : String = "https://api.letsbuildthatapp.com/appstore/featured"
        let request = URLRequest(url: NSURL(string: url)! as URL)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if(error != nil){
                print(error!)
                return
            }
            do {
                var appCategories : [AppCategory]?
                let json = try (JSONSerialization.jsonObject(with: data!, options: .mutableContainers)) as! [String : AnyObject]
                for dict in json["categories"] as! [[String : AnyObject]]{
                    let appCategory = AppCategory()
//                    appCategory.setValuesForKeys(dict)
                    appCategories?.append(appCategory)
                }
//                print(appCategories!)
            } catch let error {
                print(error)
            }
            }.resume()

    }
}
