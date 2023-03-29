//
//  UIActivityIndicatorView+activityIndicator.swift
//  Starter Project
//
//  Created by Ahmed Yamany on 27/03/2023.
//

import UIKit

extension UIActivityIndicatorView {
    /*
     This Function creates and returns an instance of UIActivityIndicatorView.
     style:  determines the visual style of the activity indicator view
     frame:  sets the frame of the activity indicator view
     center: sets the center point of the activity indicator view.
    */
    static func activityIndicator(style: UIActivityIndicatorView.Style = .medium,
                           frame: CGRect? = nil,
                           center: CGPoint? = nil) -> UIActivityIndicatorView {
        
        let activityIndicatorView = UIActivityIndicatorView(style: style)
        
        if let frame = frame {
            activityIndicatorView.frame = frame
        }
        
        if let center = center {
            activityIndicatorView.center = center
        }
        
        return activityIndicatorView
    }
    
}
