//
//  ViewController.swift
//  iosApp
//
//  Created by Skander Jabouzi on 2021-02-27.
//  Copyright © 2021 orgName. All rights reserved.
//

import UIKit
import shared

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let sdk = SpaceXSDK(databaseDriverFactory: DatabaseDriverFactory())
        label.text = "Loading"
        sdk.getLaunches(forceReload: false, completionHandler: { launches, error in
            if let launches = launches {
                print("launches \(launches)")
                self.label.text = "\(launches.count)"
            } else {
                print(error?.localizedDescription ?? "error")
                self.label.text = error?.localizedDescription
            }
        })
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
