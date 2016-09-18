//
//  ViewController.swift
//  Reachability
//
//  Created by daniel martinez gonzalez on 18/9/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIappViewController
{

  
    @IBOutlet weak var LInfo: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        manager.delegate = self
        if(AppManager.sharedInstance.isReachability)
        {
            if(AppManager.sharedInstance.reachabiltyNetworkType == "Wifi")
            {
                self.LInfo.text = "Conectados por -Wifi-"
            }
            else if (AppManager.sharedInstance.reachabiltyNetworkType == "Cellular")
            {
                self.LInfo.text = "Conectados por -2G/3G/4G-"
            }
            
        }
        else
        {
            self.LInfo.text = "Sin Ninguna Conexion"
        }
    }
    
    //MARK: DELEGATE REACHIBILITY
    
    override func reachabilityStatusChangeHandler(reachability: Reachability)
    {
        if reachability.isReachable()
        {
            if(AppManager.sharedInstance.reachabiltyNetworkType == "Wifi")
            {
                self.LInfo.text = "Conectados por -Wifi-"
            }
            else if (AppManager.sharedInstance.reachabiltyNetworkType == "Cellular")
            {
                self.LInfo.text = "Conectados por -2G/3G/4G-"
            }
        }
        else
        {
            self.LInfo.text = "Sin Ninguna Conexion"
        }
    }
    
}

