//
//  File.swift
//  Sauron
//
//  Created by Miguel Hernández Jaso on 20/01/15.
//  Copyright (c) 2015 Miguel Hernández Jaso. All rights reserved.
//

import UIKit

extension UIViewController
{
    func destinationViewControllerIs(segue: UIStoryboardSegue?,
        nextVC: AnyClass) -> Bool
    {
        if let aSegue = segue {
            var destinationVC: UIViewController = aSegue.destinationViewController as UIViewController
            
            if let navVC = destinationVC as? UINavigationController {
                
                if let firstViewController = navVC.viewControllers.first as? UIViewController {
                    destinationVC = firstViewController
                }
            }
            
            
            if destinationVC.isKindOfClass(nextVC)
            {
                return true
            }
        }
        
        
        
        return false
    }
    
    
}

