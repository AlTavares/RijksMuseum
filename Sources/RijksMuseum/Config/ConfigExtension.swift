//
//  ConfigExtension.swift
//  RijksMuseumApp
//
//  Created by Alexandre Mantovani Tavares on 17/05/20.
//

import Foundation

extension Config {
    func fromBundle() -> Self {
        guard let path = Bundle.main.path(forResource: "config", ofType: "json") else {
            fatalError("config.json file not found")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode(Config.self, from: data)
        } catch {
            fatalError("\(error)")
        }
    }

    var localizedHost: String {
        let currentLanguage = Locale.current.languageCode
            .flatMap { language in
                availableLanguages.contains(language) ? language : nil
            }
        return host + "/\(currentLanguage ?? defaultLanguage)"
    }
}
