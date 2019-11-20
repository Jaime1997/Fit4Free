//
//  NSAttributedStringExtension.swift
//  Fit4Free
//
//  Created by Angel Figueroa Rivera on 11/19/19.
//  Copyright © 2019 Jaime Garza. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    static func makeHyperlink(for path: String, in string: String, as substring: String) -> NSAttributedString {
        let nsString = NSString(string: string)
        let substringRange = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path, range: substringRange)
        return attributedString
    }
    
}
