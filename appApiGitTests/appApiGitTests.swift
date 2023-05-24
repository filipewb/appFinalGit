//
//  appApiGitTests.swift
//  appApiGitTests
//
//  Created by ti on 18/05/23.
//

import XCTest
@testable import appApiGit

final class appApiGitTests: XCTestCase {
    var sut: UserViewModel!
    var userListViewControllerMock: UserListViewController!
    var gitHubAPIMock: GitHubAPI!
    
    override func setUpWithError() throws {
        gitHubAPIMock = GitHubAPI()
        sut = UserViewModel(api: gitHubAPIMock as! Requestable)
        userListViewControllerMock = UserListViewController()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        userListViewControllerMock = nil
        gitHubAPIMock = nil
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

class gitHubAPIMock: GitHubAPI {
    
}
