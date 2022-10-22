//
//  TestUtil.swift
//  
//
//  Created by Edu on 12/10/22.
//

#if canImport(XCTest)
import XCTest
#endif

public enum JSONValueType: String {
    case string = "\"(\\w+)\":\\s?\"(\\w+)\""
    case int = "\"(\\w+)\":\\s?(\\d+)"
    case bool = "\"(\\w+)\":\\s?(true|false)"
}

public class TestUtil {

    public static func decodeJSON<T: Decodable>(jsonPath: String) -> T? {

        let bundle = Bundle(for: self)
        guard let url = bundle
            .url(forResource: jsonPath,
                 withExtension: "json"),
                let data = try? Data(contentsOf: url,
                                           options: .mappedIfSafe) else {
            return nil
        }

        return try? JSONDecoder().decode(T.self, from: data)
    }

    public static func getDataFromJSON(jsonPath: String) -> Data? {

        guard let pathConfig = Bundle(for: self)
            .url(forResource: jsonPath,
                 withExtension: "json") else {
            return nil
        }

        return try? Data(contentsOf: pathConfig,
                         options: .mappedIfSafe)
    }

    public static func hasPropertyInJSON(value: String,
                                         type: JSONValueType,
                                         matchWith: (String, String) -> Bool) -> Bool {

        let regex = try! NSRegularExpression(pattern: type.rawValue)
        let range = NSRange(location: 0, length: value.utf8.count)

        for match in regex.matches(in: value,
                                   options: [],
                                   range: range) {
            guard let propertyNameRange = Range(match.range(at: 1),
                                                in: value),
                    let propertyValueRange = Range(match.range(at: 2),
                                                   in: value) else {
                continue
            }

            let propertyName = String(value[propertyNameRange])
            let propertyValue = String(value[propertyValueRange])
            if matchWith(propertyName, propertyValue) {
                return true
            }
        }

        return false
    }

    public static func hasJSONProperty(value: String, forName: String) -> Bool {

        let regexPatter = "\"(\(forName))\":.*"
        let regex = try! NSRegularExpression(pattern: regexPatter)
        let range = NSRange(location: 0,
                            length: value.utf8.count)

        if let _ = regex.firstMatch(in: value,
                                    options: [],
                                    range: range) {
            return true
        }

        return false
    }
}

extension String {

    public func hasJSONPropertyWithValue(property: String,
                                         value: String) -> Bool {
        TestUtil.hasPropertyInJSON(value: self,
                                   type: .string) {
            $0 == property && $1 == value
        }
    }

    public func hasJSONPropertyWithValue(property: String,
                                         value: Int) -> Bool {
        TestUtil.hasPropertyInJSON(value: self,
                                   type: .int) {
            if let intValue = Int($1) {
                return $0 == property && intValue == value
            }
            return false
        }
    }

    public func hasJSONPropertyWithValue(property: String,
                                         value: Bool) -> Bool {
        TestUtil.hasPropertyInJSON(value: self,
                                   type: .bool) {
            if let boolValue = Bool($1) {
                return $0 == property && boolValue == value
            }
            return false
        }
    }

    public func containsJSONProperty(propertyName: String) -> Bool {
        TestUtil.hasJSONProperty(value: self, forName: propertyName)
    }
}
