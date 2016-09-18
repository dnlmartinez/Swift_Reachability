//
//  AppDelegate.swift
//
//  Created by daniel martinez gonzalez on 18/9/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

	var window: UIWindow?


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
		AppManager.sharedInstance.initRechabilityMonitor()
        return true
	}

	func applicationWillResignActive(application: UIApplication)
    {
	
	}

	func applicationDidEnterBackground(application: UIApplication)
    {
        
	}

	func applicationWillEnterForeground(application: UIApplication)
    {
	
    }

	func applicationDidBecomeActive(application: UIApplication)
    {
	
    }

	func applicationWillTerminate(application: UIApplication)
    {
	
    }


}

