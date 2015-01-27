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
    
    func pushToStoryboard(named: String, identifier: String?,
        completion:( (nextController: UIViewController) -> Void)? )
    {
        if let nextController = retrieveNextViewController(fromStoryboard: named, identifier: identifier)
        {
            if let aCompletionClasure = completion {
                aCompletionClasure(nextController: nextController)
            }
            
            if let currentNavigationController = self.navigationController {
                currentNavigationController.pushViewController(nextController, animated: true)
            }
            else {
                println("[Sauron] ERROR: No navigation controller found.")
            }
            
        }
        
        
    }
    
    
    
    // MARK: Present
    
    func presentStoryboard(named: String, identifier: String,
        completion:( (nextController: UIViewController) -> Void)? )
    {
        if let nextController = retrieveNextViewController(fromStoryboard: named, identifier: identifier)
        {
            if let aCompletionClasure = completion {
                aCompletionClasure(nextController: nextController)
            }
            
            presentViewController(nextController, animated: true, completion: nil)
        }
        
    }
    
    
    // MARK: Hook
    
    func hookStoryboard(named: String, identifier: String,
        completion:( (nextController: UIViewController) -> Void)? )
    {
        if let nextController = retrieveNextViewController(fromStoryboard: named, identifier: identifier)
        {
            if let aCompletionClasure = completion {
                aCompletionClasure(nextController: nextController)
            }
            
            let navigationController = UINavigationController(rootViewController: nextController)
            presentViewController(navigationController, animated: true, completion: nil)
        }
        
    }
    
    
    
    // MARK: Instances
    
    private func retrieveNextViewController(fromStoryboard name: String, identifier: String?) -> UIViewController?
    {
        var storyboard: UIStoryboard? = nil
        TryBlock.try( { () -> Void in
            storyboard = UIStoryboard(name: name, bundle: nil)
            }, catch: { (exception) -> Void in
                storyboard = nil
                println("[Sauron] ERROR: '\(name)' is not a valid storyboard.")
            }, finally: nil)
        
        if let aValidStoryboard = storyboard {
            var optionalController = instantiateStoryboard(aValidStoryboard, identifier: identifier)
            if let nextViewController = optionalController {
                return pushableVC(nextViewController)
            }
        }
        return nil
    }
    
    private func instantiateStoryboard(storyboard: UIStoryboard, identifier: String?) -> UIViewController?
    {
        if let anIdentifier = identifier
        {
            return storyboard.instantiateViewControllerWithIdentifier(anIdentifier) as? UIViewController
        }
        else {
            return storyboard.instantiateInitialViewController() as? UIViewController
        }
    }
    
    
    private func pushableVC(controller: UIViewController) -> UIViewController?
    {
        if let navigationController = controller as? UINavigationController
        {
            return navigationController.viewControllers.first as? UIViewController
        }
        
        return controller
        
    }
    
    
    
    
}

