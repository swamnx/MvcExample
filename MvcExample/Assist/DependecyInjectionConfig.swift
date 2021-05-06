//
//  DIConfig.swift
//  MvcExample
//
//  Created by swamnx on 6.05.21.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    class func setup() {
        Container.loggingFunction = nil
        defaultContainer.register(VersionInfoService.self) { _ in JsonVersionInfoService()}.inObjectScope(.container)
        
        defaultContainer.storyboardInitCompleted(VersionHistoryController.self, initCompleted: { resolver, controller in
            controller.versionInfoService = resolver.resolve(VersionInfoService.self)
        })
    }
}
