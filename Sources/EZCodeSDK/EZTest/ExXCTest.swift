//
//  ExXCTest.swift
//  
//
//  Created by Edu on 12/10/22.
//

#if canImport(XCTest)
import XCTest
#endif

public enum EZTestError: Error {
    case fileNotFound
}

extension XCTest {

    public func getData(fileName: String) throws -> Data {

        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName,
                                   withExtension: "json") else {
            XCTFail("Missing file: \(fileName).json")
            throw EZTestError.fileNotFound
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            XCTFail("Failed to load data object from file: \(fileName) with error: \(error.localizedDescription)")
            throw error
        }
    }

    public func assertHasPropertyWithValue(json: String,
                                           property: String,
                                           value: String,
                                           file: StaticString = #file,
                                           line: UInt = #line) {
        XCTAssertTrue(json.hasJSONPropertyWithValue(property: property,
                                                    value: value),
                      "The JSON String doesn't contains a property with name '\(property)' and value '\(value)'",
                      file: file,
                      line: line)
    }

    public func assertHasPropertyWithValue(json: String,
                                           property: String,
                                           value: Int,
                                           file: StaticString = #file,
                                           line: UInt = #line) {
        XCTAssertTrue(json.hasJSONPropertyWithValue(property: property,
                                                    value: value),
                      "The JSON String doesn't contains a property with name '\(property)' and value '\(value)'",
                      file: file,
                      line: line)
    }

    public func assertHasPropertyWithValue(json: String,
                                           property: String,
                                           value: Bool,
                                           file: StaticString = #file,
                                           line: UInt = #line) {
        XCTAssertTrue(json.hasJSONPropertyWithValue(property: property,
                                                    value: value),
                      "The JSON String doesn't contains a property with name '\(property)' and value '\(value)'",
                      file: file,
                      line: line)
    }

    public func assertContainsJSONProperty(json: String,
                                           propertyName: String,
                                           file: StaticString = #file,
                                           line: UInt = #line) {
        XCTAssertTrue(json.containsJSONProperty(propertyName: propertyName),
                      "The JSON String doesn't contains a property with name '\(propertyName)'",
                      file: file,
                      line: line)
    }

    public func asserMatches(value: String,
                             patter: String,
                             file: StaticString = #file,
                             line: UInt = #line) {
        let regex = try! NSRegularExpression(pattern: patter)
        let range = NSRange(location: 0,
                            length: value.utf8.count)

        XCTAssertNotNil(regex.firstMatch(in: value,
                                         options: [],
                                         range: range),
                        "The object doesn't match the required pattern.",
                        file: file,
                        line: line)
    }
    
}

extension XCTestCase {

    public func trackForMemoryLeak(object: AnyObject,
                                   file: StaticString = #file,
                                   line: UInt = #line) {
        addTeardownBlock { [weak object] in
            XCTAssertNil(object,
                         "Instance should have been deallocated. potential memory leak.",
                         file: file,
                         line: line)
        }
    }
}
