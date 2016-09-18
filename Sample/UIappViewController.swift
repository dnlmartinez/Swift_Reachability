//
//  UIappViewController.swift
//
//  Created by daniel martinez gonzalez on 18/9/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import UIKit

class UIappViewController: UIViewController, AppManagerDelegate
{

    var manager:AppManager = AppManager.sharedInstance

	override func viewDidLoad()
    {
		super.viewDidLoad()
		manager.delegate = self
	}
    
	override func didReceiveMemoryWarning()
    {
		super.didReceiveMemoryWarning()
	}
    
	func reachabilityStatusChangeHandler(reachability: Reachability)
    {
		if reachability.isReachable()
        {
            if(AppManager.sharedInstance.reachabiltyNetworkType == "Wifi")
            {
                print("Conectados por -Wifi-")
            }
            else if (AppManager.sharedInstance.reachabiltyNetworkType == "Cellular")
            {
                print("Conectados por -2G/3G/4G-")
            }
		}
        else
        {
			print("Sin Ninguna Conexion")
		}
	}
}


