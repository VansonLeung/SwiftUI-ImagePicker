//
//  String+i18n.swift
//
//
//  Created by mac on 5/12/2018.
//  Copyright © 2018年 .mallsapp. All rights reserved.
//

import UIKit


extension String {
    
    
    func asTelUrl() -> String {
        let tel = self
        return "tel://\(tel.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: " ", with: ""))"
    }
    
    
    
    func asEmailUrl() -> String {
        let email = self
        return "mailto://\(email)"
    }
    
    
    func asPercentEncoded() -> String {
        return (self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)?.replacingOccurrences(of: "%23", with: "#")) ?? self
    }
    
    func asUrlEncoded(
        stripHtmlTags: Bool = true,
        escapeUrl: Bool = true
    ) -> String {
        
        var input = self
        
        if stripHtmlTags {
            input = input.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        }
        
        if escapeUrl {
            input = input.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? input
        }
        
        input = input.replacingOccurrences(of: "%20", with: " ")
        
        return input
    }
    
}


