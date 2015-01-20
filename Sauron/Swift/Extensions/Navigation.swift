//
//  UIViewControllerExtension.swift
//  Sauron
//
//  Created by Miguel Hernández Jaso on 24/11/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    
    // MARK: Push
    
    func pushToStoryboard(named: String, identifier: String,
        completion:(nextController: UIViewController) -> UIViewController)
    {
        var nextVC = retrieveNextViewController(fromStoryboard: named, identifier: identifier)
        
        if nextVC != nil
        {
            completion(nextController: nextVC!)
            if self.navigationController != nil {
                self.navigationController?.pushViewController(nextVC!, animated: true)
            }
            else {
                println("[\(self)] No navigation controller found.")
            }
        }
        
    }
    
    
    
    // MARK: Present
    
    func presentStoryboard(named: String, identifier: String,
        completion:(nextController: UIViewController) -> UIViewController)
    {
        var nextVC = retrieveNextViewController(fromStoryboard: named, identifier: identifier)
        
        if nextVC != nil
        {
            completion(nextController: nextVC!)
            self.presentViewController(nextVC!, animated: true, completion: nil)
        }
    
    }
    
    
    // MARK: Hook
    
    func hookStoryboard(named: String, identifier: String,
        completion:(nextController: UIViewController) -> UIViewController)
    {
        var nextVC = retrieveNextViewController(fromStoryboard: named, identifier: identifier)
        
        if nextVC != nil
        {
            completion(nextController: nextVC!)
            let navVC = UINavigationController(rootViewController: nextVC!)
            self.presentViewController(navVC, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    // MARK: Instances
    
    private func retrieveNextViewController(fromStoryboard name: String, identifier: String) -> UIViewController?
    {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        var nextVC = instantiateStoryboard(storyboard, anIdentifier: identifier)
        nextVC = pushableVC(nextVC)
        return nextVC
    }
    
    private func instantiateStoryboard(storyboard: UIStoryboard, anIdentifier: String?) -> UIViewController?
    {
        var controller: AnyObject?
        if let identifier = anIdentifier
        {
            controller = storyboard.instantiateViewControllerWithIdentifier(identifier)
        } else
        {
            controller = storyboard.instantiateInitialViewController()
        }
        
        if controller != nil
        {
            return controller as UIViewController!
        } else
        {
            return nil
        }
    }
    
    
    private func pushableVC(controller: UIViewController?) -> UIViewController?
    {
        if (controller?.isKindOfClass(UIViewController) != nil)
        {
            if let optionalVC = controller as? UINavigationController
            {
                let navVC = controller as UINavigationController
                var nextVC = navVC.viewControllers.first as UIViewController
                return nextVC;
            }
            return controller
        }
        
        return nil
    }
    
    
    
    
}

