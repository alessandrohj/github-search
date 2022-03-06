//
//  Extensions.swift
//  GitHub_Search
//
//  Created by Alessandro H de Jesus & Gyuyoung Lee on 2021-11-23.
//

import Foundation
// MARK: Extension method
extension String {
    // MARK: Method
    func stringByAddingPercentEncodingForRFC3986() -> String? {
        let unreserved = "-._~/?"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        return addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
    }
}
