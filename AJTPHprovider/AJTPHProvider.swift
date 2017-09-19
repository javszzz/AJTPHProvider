//
//  AJTPhProvider.swift
//  AJTPHprovider
//
//  Created by Alvin John Garcia Tandoc on 19/09/2017.
//  Copyright © 2017 Stackoo. All rights reserved.
//

import UIKit
import libPhoneNumber_iOS

enum Provider {
    case globe
    case smart
    case sun
    case notPh
}

class AJTPHProvider: NSObject {
    
    let phoneUtil = NBPhoneNumberUtil()
    
    func provider(contactNumber: String) -> Provider {
        
        do {
            let phoneNumber: NBPhoneNumber = try self.phoneUtil.parse(contactNumber, defaultRegion: Locale.current.regionCode)
            let formattedString: String = try self.phoneUtil.format(phoneNumber, numberFormat: .E164)
            
            let numberString = formattedString
            
            if self.isGlobe(number: numberString) {
                return .globe
            } else if self.isSmart(number: numberString) {
                return .smart
            } else if self.isSun(number: numberString) {
                return .sun
            } else {
                return .notPh
            }
            
        } catch {
            
            return .notPh
        }
        
    }
    
    private func isGlobe(number: String) -> Bool {
        
        let regex = "(\\+63917\\w|\\+63915\\w|\\+63945\\w|\\+63955\\w|\\+63994\\w|\\+63927\\w|\\+63935\\w|\\+63936\\w|\\+63976\\w|\\+63997\\w|\\+63975\\w|\\+63995\\w|\\+63817\\w|\\+63905\\w|\\+63906\\w|\\+63916\\w|\\+63926\\w|\\+63977\\w|\\+63978\\w|\\+63979\\w)"
        
        let regexEx = try! NSRegularExpression(pattern: regex, options: .caseInsensitive)
        return regexEx.firstMatch(in: number, options: [], range: NSRange(location: 0, length: number.characters.count)) != nil
    }
    
    private func isSmart(number: String) -> Bool {
        
        let regex = "(\\+63938\\w|\\+63939\\w|\\+63940\\w|\\+63946\\w|\\+63948\\w|\\+63950\\w|\\+63992\\w|\\+63919\\w|\\+63921\\w|\\+63929\\w|\\+63989\\w|\\+63920\\w|\\+63930\\w|\\+63813\\w|\\+63907\\w|\\+63908\\w|\\+63909\\w|\\+63910\\w|\\+63911\\w|\\+63913\\w|\\+63909\\w|\\+63914\\w|\\+63918\\w|\\+63928\\w|\\+63947\\w|\\+63949\\w|\\+63981\\w|\\+63998\\w|\\+63999\\w|\\+63951\\w|\\+63912\\w|\\+63970\\w|\\+63996\\w)"
        
        let regexEx = try! NSRegularExpression(pattern: regex, options: .caseInsensitive)
        return regexEx.firstMatch(in: number, options: [], range: NSRange(location: 0, length: number.characters.count)) != nil
        
    }
    
    private func isSun(number: String) -> Bool {
        
        let regex = "(\\+63934\\w|\\+63941\\w|\\+63942\\w|\\+63943\\w|\\+63944\\w|\\+63925\\w|\\+63922\\w|\\+63923\\w|\\+63924\\w|\\+63931\\w|\\+63932\\w|\\+63933\\w|\\+63973\\w|\\+63974\\w)"
        
        let regexEx = try! NSRegularExpression(pattern: regex, options: .caseInsensitive)
        return regexEx.firstMatch(in: number, options: [], range: NSRange(location: 0, length: number.characters.count)) != nil
    }
}
