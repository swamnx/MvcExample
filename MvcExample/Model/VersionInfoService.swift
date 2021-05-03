//
//  VersionInfoService.swift
//  MvcExample
//
//  Created by swamnx on 29.04.21.
//

import Foundation
import UIKit

class VersionInfoService {

    static var shared = VersionInfoService()

    private init () {

    }

    func loadVersionInfos() -> [VersionInfo]? {
        if let url = Bundle.main.url(forResource: CommonUtils.historyFileName, withExtension: CommonUtils.historyFileFormat) {
            do {
                let jsonReadData = try Data(contentsOf: url)
                    do {
                        let versionHistory = try CommonUtils.jsonDecoder.decode(VersionHistoryApi.self, from: jsonReadData)
                        return versionHistory.systems.map(convertToVersionInfo)
                    } catch {
                        print("Something went wrong with decoding info to VersionHistoryApi")
                    }
            } catch {
                print("Something went wrong reading \(CommonUtils.historyFileName) in \(CommonUtils.historyFileFormat) format")
            }
        }
        return nil
    }

    private func convertToVersionInfo(_ value: VersionInfoApi) -> VersionInfo {
        let extractedImage = UIImage(named: value.logoImageName, in: Bundle.main, compatibleWith: nil)
        return VersionInfo(codeName: value.codeName, version: value.version, logoImage: extractedImage)
    }

}
