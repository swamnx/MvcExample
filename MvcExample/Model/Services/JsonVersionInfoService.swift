//
//  JsonVersionInfoService.swift
//  MvcExample
//
//  Created by swamnx on 6.05.21.
//

import Foundation
import UIKit

class JsonVersionInfoService: VersionInfoService {
    
    func loadVersionInfos() -> [VersionInfo]? {
        if let url = Bundle.main.url(forResource: CommonUtils.HistoryFileProperties.name.rawValue, withExtension: CommonUtils.HistoryFileProperties.format.rawValue) {
            do {
                let jsonReadData = try Data(contentsOf: url)
                    do {
                        let versionHistory = try CommonUtils.jsonDecoder.decode(VersionHistoryApi.self, from: jsonReadData)
                        return versionHistory.systems.map(convertToVersionInfo)
                    } catch {
                        assertionFailure(CommonUtils.ErrorTexts.decodingErrorTextWith(modelName: String(describing: VersionHistoryApi.self)))
                    }
            } catch {
                assertionFailure(
                    CommonUtils.ErrorTexts.readingErrorTextWith(
                        fileName: CommonUtils.HistoryFileProperties.name.rawValue,
                        fileFormat: CommonUtils.HistoryFileProperties.format.rawValue
                    )
                )
            }
        }
        return nil
    }

    private func convertToVersionInfo(_ value: VersionInfoApi) -> VersionInfo {
        let extractedImage = UIImage(named: value.logoImageName, in: Bundle.main, compatibleWith: nil)
        return VersionInfo(codeName: value.codeName, version: value.version, logoImage: extractedImage)
    }
}
