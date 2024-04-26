import XCTest
@testable import TestMercadoLibre

class LoadSearchUseCaseTests: XCTestCase {
    var useCase: LoadSearchUseCaseImp!
    var repository: MockSearchRepository!
    
    override func setUp() {
        super.setUp()
        repository = MockSearchRepository()
        useCase = LoadSearchUseCaseImp(repository: repository)
    }
    
    override func tearDown() {
        repository = nil
        useCase = nil
        super.tearDown()
    }
    
    func testExecute_Success() async throws {
        // Arrange
        let expectedItems = [
            SearchItem(id: "1", title: "iPhone", price: 999.99, thumbnail: "https://example.com/image1.jpg"),
            SearchItem(id: "2", title: "MacBook", price: 1999.99, thumbnail: "https://example.com/image2.jpg")
        ]
        repository.fetchSearchDataResult = .success(expectedItems)
        
        // Act
        let result = try await useCase.execute(searchUrl: "https://example.com/search").get()
        
        // Assert
        XCTAssertEqual(result, expectedItems)
    }
    
    func testExecute_Failure() async throws {
        // Arrange
        let expectedError = NSError(domain: "TestErrorDomain", code: 123, userInfo: nil)
        repository.fetchSearchDataResult = .failure(expectedError)
        
        // Act
        do {
            _ = try await useCase.execute(searchUrl: "https://example.com/search").get()
            XCTFail("Expected an error to be thrown")
        } catch {
            // Assert
            XCTAssertEqual(error as NSError, expectedError)
        }
    }
}

class MockSearchRepository: SearchRepository {
    var fetchSearchDataResult: Result<[SearchItem], Error>!
    
    func fetchSearchData(searchUrl: String) async throws -> [SearchItem] {
        switch fetchSearchDataResult {
        case .success(let items):
            return items
        case .failure(let error):
            throw error
        case .none:
            fatalError("fetchSearchDataResult not set")
        }
    }
}

extension SearchItem: Equatable {
    public static func == (lhs: SearchItem, rhs: SearchItem) -> Bool {
        return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.price == rhs.price &&
        lhs.thumbnail == rhs.thumbnail
    }
}
