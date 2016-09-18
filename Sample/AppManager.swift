//
//  AppManager.swift
//
//  Created by daniel martinez gonzalez on 18/9/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import UIKit
import Foundation

class AppManager: NSObject
{

    var delegate:AppManagerDelegate? = nil
    
  private var _useClosures:Bool = false
  private var reachability: Reachability?
  private var _isReachability:Bool = false
  private var _reachabiltyNetworkType :String?

  var isReachability:Bool
  {
    get {return _isReachability}
  }
    
  var reachabiltyNetworkType:String
  {
    get {return _reachabiltyNetworkType! }
  }

    
  final  class var sharedInstance : AppManager
  {
    struct Static {
      static var instance : AppManager?
    }
    if !(Static.instance != nil) {
      Static.instance = AppManager()

    }
    return Static.instance!
  }

  
  func initRechabilityMonitor()
  {
    print("initialize Rechability.....")
    do {
      let reachability = try Reachability.reachabilityForInternetConnection()
      self.reachability = reachability
    }
    catch ReachabilityError.FailedToCreateWithAddress(let address)
    {
      print("Unable to create\nReachability with address:\n\(address)")
      return
    }
    catch {}
    
    if (_useClosures)
    {
      reachability?.whenReachable = { reachability in
        self.notifyReachability(reachability)
      }
      reachability?.whenUnreachable = { reachability in
        self.notifyReachability(reachability)
      }
    }
    else
    {
      self.notifyReachability(reachability!)
    }

    do
    {
      try reachability?.startNotifier()
    }
    catch
    {
      print("unable to start notifier")
      return
    }


  }

  private func notifyReachability(reachability:Reachability)
  {
    if reachability.isReachable()
    {
      self._isReachability = true

      //Determine Network Type
      if reachability.isReachableViaWiFi()
      {
        print("Conectados por  WIFI")
        
        self._reachabiltyNetworkType = CONNECTION_NETWORK_TYPE.WIFI_NETWORK.rawValue
      }
      else
      {
        self._reachabiltyNetworkType = CONNECTION_NETWORK_TYPE.WWAN_NETWORK.rawValue
      }

    }
    else
    {
      self._isReachability = false
      self._reachabiltyNetworkType = CONNECTION_NETWORK_TYPE.OTHER.rawValue
    }

    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppManager.reachabilityChanged(_:)), name: ReachabilityChangedNotification, object: reachability)
  }
    
  func reachabilityChanged(note: NSNotification)
  {
    let reachability = note.object as! Reachability
    dispatch_async(dispatch_get_main_queue())
    {
      self.delegate?.reachabilityStatusChangeHandler(reachability)
    }
  }
  deinit
  {
    reachability?.stopNotifier()
    
    if (!_useClosures)
    {
      NSNotificationCenter.defaultCenter().removeObserver(self, name: ReachabilityChangedNotification, object: nil)
    }
  }
    
}
