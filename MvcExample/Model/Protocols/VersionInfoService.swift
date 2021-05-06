//
//  VersionInfoServiceProtocol.swift
//  MvcExample
//
//  Created by swamnx on 6.05.21.
//

import Foundation

protocol VersionInfoService {
    
    func loadVersionInfos() -> [VersionInfo]?
}
