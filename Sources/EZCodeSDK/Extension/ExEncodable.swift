//
//  ExEncodable.swift
//  iPokemon
//
//  Created by Edu on 30/07/22.
//

import Foundation

extension Encodable {

    public var asDic: [String: Any]? {
        guard let data = try? JSONEncoder()
            .encode(self) else { return nil }
        return (try? JSONSerialization
            .jsonObject(with: data,
                        options: .allowFragments)
        ).flatMap { $0 as? [String: Any]}
    }
}
