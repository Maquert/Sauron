//
//  Sauron.swift
//  Sauron
//
//  Created by Miguel Hernández Jaso on 24/11/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

import Foundation
import UIKit



class Sauron {
    
    
    // MARK: Switch
    
    class func switchToStoryboard(name: String, identifier: String,
        completion:(nextController: UIViewController) -> UIViewController )
    {
        var nextVC:UIViewController? = retrieveNextViewController(fromStoryboard: name, identifier: identifier)
        
        if nextVC != nil
        {
            completion(nextController: nextVC!)
            setRootWithController(nextVC!)
        }
    }
    
    // MARK: Interrupt
    
    class func interruptWithStoryboard(name: String, identifier: String,
        completion:(nextController: UIViewController) -> UIViewController )
    {
        var nextVC:UIViewController? = retrieveNextViewController(fromStoryboard: name, identifier: identifier)
        
        if nextVC != nil
        {
            completion(nextController: nextVC!)
            appRootVC()?.presentViewController(nextVC!, animated: true, completion: nil)
        }
    }
    
    
    
    
    // MARK: Instances
    
    class func retrieveNextViewController(fromStoryboard name: String, identifier: String) -> UIViewController?
    {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        var nextVC = instantiateStoryboard(storyboard, anIdentifier: identifier)
        nextVC = pushableViewController(nextVC)!
        return nextVC
    }
    
    
    // MARK: Storyboards and ViewControllers
    
    class private func storyboardNamed(name: String) -> UIStoryboard
    {
        let storyboard =  UIStoryboard(name: name, bundle: nil)
        return storyboard
    }
    
    class private func instantiateStoryboard(storyboard: UIStoryboard, anIdentifier: String?) -> UIViewController
    {
        if let identifier = anIdentifier
        {
            return storyboard.instantiateViewControllerWithIdentifier(identifier) as UIViewController
        } else
        {
            return storyboard.instantiateInitialViewController() as UIViewController
        }
    }
    
    class private func pushableViewController(controller: UIViewController) -> UIViewController?
    {
        if controller.isNavigationController()
        {
            return controller
        }
        return controller
    }
    
    
    
    // MARK: Handy Methods
    
    class func isNavigationController(controller: UIViewController?) -> Bool
    {
        if controller?.isKindOfClass(UINavigationController) != nil
        {
            return true;
        }
        return false;
    }
    
    class private func navigationController(forViewController controller: UIViewController) -> UINavigationController
    {
        if let navVC = controller.navigationController {
            return navVC
        }
        else {
            return UINavigationController(rootViewController: controller)
        }
    }
    
    class func appRootVC() -> UIViewController?
    {
        let app = UIApplication.sharedApplication()
        if let rootVC = app.delegate?.window??.rootViewController
        {
            return rootVC
        }
        return nil
    }
    
    
    class private func setRootWithController(controller: UIViewController)
    {
        if let appWindow = UIApplication.sharedApplication().delegate?.window
        {
            appWindow?.rootViewController = controller
        }
    }
    
}



