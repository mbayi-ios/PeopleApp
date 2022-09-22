//
//  JSONMapperTests.swift
//  PeopleTests
//
//  Created by Amby on 22/09/2022.
//

import Foundation
import XCTest
@testable import People

class JSONMapperTests: XCTestCase {
    func test_with_valid_json_successfully_decodes() {

        XCTAssertNoThrow(try StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self), "Mapper shouldn't throw an error")

        let userResponse  = try? StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
        XCTAssertNotNil(userResponse, "User response shouldn't be nil")

        XCTAssertEqual(userResponse?.page, 1, "Page number should be 1")
        XCTAssertEqual(userResponse?.perPage, 6, "Page number should be 6")
        XCTAssertEqual(userResponse?.total, 12, "Total should be 12")
        XCTAssertEqual(userResponse?.totalPages, 2, "total pages should be 2")

        XCTAssertEqual(userResponse?.data.count, 6, "the total number of users should be 6")

        XCTAssertEqual(userResponse?.data[0].id, 1, "the id should be 1")
        XCTAssertEqual(userResponse?.data[0].email, "george.bluth@reqres.in", "The email should be george.blueth@reqres.in")
        XCTAssertEqual(userResponse?.data[0].firstName, "George", "The first name should be George")
        XCTAssertEqual(userResponse?.data[0].lastName, "Bluth", "The last name should be Bluth")
        XCTAssertEqual(userResponse?.data[0].avatar,  "https://reqres.in/img/faces/1-image.jpg" ,  "https://reqres.in/img/faces/1-image.jpg")

        XCTAssertEqual(userResponse?.support.url, "https://reqres.in/#support-heading", "https://reqres.in/#support-heading")
        XCTAssertEqual(userResponse?.support.text, "To keep ReqRes free, contributions towards server costs are appreciated!", "the support text should be -> To keep ReqRes free, contributions towards server costs are appreciated!")


    }

    func test_with_missing_file_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "", type: UsersResponse.self), "An error should be thrown")

        do {
            _ = try StaticJSONMapper.decode(file: "", type: UsersResponse.self)
        } catch {
            guard let mappingError = error as? StaticJSONMapper.MappingError else {
                XCTFail("This is the wrong type of error for missing files")
                return
            }
            XCTAssertEqual(mappingError, StaticJSONMapper.MappingError.failedToGetContents, "This should be a failed to get contents error")
        }
    }

    func test_with_invalid_file_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "hskdj", type: UsersResponse.self), "An error should be thrown")

        do {
            _ = try StaticJSONMapper.decode(file: "", type: UsersResponse.self)
        } catch {
            guard let mappingError = error as? StaticJSONMapper.MappingError else {
                XCTFail("This is the wrong type of error for missing files")
                return
            }
            XCTAssertEqual(mappingError, StaticJSONMapper.MappingError.failedToGetContents, "This should be a failed to get contents error")
        }
    }

    func test_with_invalid_json_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "UsersStaticData", type: UserDetailResponse.self), "An error should be thrown")

        do {
            _ = try StaticJSONMapper.decode(file: "UsersStaticData", type: UserDetailResponse.self)
        } catch {
            if error is StaticJSONMapper.MappingError {
                XCTFail("Got the wrong type of error, expecting a system decoding error")
            }
        }
    }
}
