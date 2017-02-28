//
//  AppDelegate.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/9/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow.init(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = window!
        self.window?.backgroundColor = .white
        self.window?.rootViewController = CXCMainNavigationController()
        self.window?.makeKeyAndVisible()

        self.performSelector(inBackground: #selector(refreshCurrentCurrencies), with: nil)
        CXCNetworking.getAllCurrentCurrenciesData{
        CXCNetworking.firstLoaded = true
        }
        return true
    }
    
    func refreshCurrentCurrencies() {
        Timer.scheduledTimer(withTimeInterval: 3600.0, repeats: true) { _ in //(<#Timer#>) in
            CXCNetworking.getAllCurrentCurrenciesData{}
        }
        RunLoop.current.run()
        //此种方式创建的timer已经添加至runloop中
        //        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        //保持线程为活动状态，才能保证定时器执行
        //        [[NSRunLoop currentRunLoop] run];//已经将nstimer添加到NSRunloop中了
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

