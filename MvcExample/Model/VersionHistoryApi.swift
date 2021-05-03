//
//  VersionHistory.swift
//  MvcExample
//
//  Created by swamnx on 30.04.21.
//

import Foundation

struct VersionHistoryApi: Decodable, Encodable {
    
    var systems: [VersionInfoApi]
}
