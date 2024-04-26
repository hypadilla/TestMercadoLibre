import XCTest
@testable import TestMercadoLibre

class LoadProductDetailUseCaseTests: XCTestCase {
    var useCase: LoadProductDetailUseCaseImp!
    var repository: MockProductDetailRepository!
    
    override func setUp() {
        super.setUp()
        repository = MockProductDetailRepository()
        useCase = LoadProductDetailUseCaseImp(repository: repository)
    }
    
    override func tearDown() {
        repository = nil
        useCase = nil
        super.tearDown()
    }
    
    func testExecute_Success() async throws {
        // Given
        let productItemId = "123"
        let expectedProductDetail = ProductDetail(id: productItemId, title: "iPhone", price: 999.99, condition: "new", pictures: [])
        repository.fetchProductDetailDataStub = { itemId in
            XCTAssertEqual(itemId, productItemId)
            return expectedProductDetail
        }
        
        // When
        let result = try await useCase.execute(productItemId: productItemId)
        
        // Then
        switch result {
        case .success(let productDetail):
            XCTAssertEqual(productDetail, expectedProductDetail)
        case .failure:
            XCTFail("Expected success, but got failure")
        }
    }
    
    func testExecute_Failure() async throws {
        // Given
        let productItemId = "123"
        let expectedError = NSError(domain: "TestErrorDomain", code: 123, userInfo: nil)
        repository.fetchProductDetailDataStub = { _ in
            throw expectedError
        }
        
        // When
        let result = try await useCase.execute(productItemId: productItemId)
        
        // Then
        switch result {
        case .success:
            XCTFail("Expected failure, but got success")
        case .failure(let error):
            XCTAssertEqual(error as NSError, expectedError)
        }
    }
}

class MockProductDetailRepository: ProductDetailRepository {
    var fetchProductDetailDataStub: ((String) async throws -> ProductDetail)?
    
    func fetchProductDetailData(productItemId: String) async throws -> ProductDetail {
        guard let stub = fetchProductDetailDataStub else {
            fatalError("fetchProductDetailDataStub not implemented")
        }
        return try await stub(productItemId)
    }
}

extension ProductDetail: Equatable {
    public static func == (lhs: ProductDetail, rhs: ProductDetail) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.price == rhs.price &&
            lhs.condition == rhs.condition &&
            lhs.pictures == rhs.pictures
    }
}

extension Picture: Equatable  {
    public static func == (lhs: Picture, rhs: Picture) -> Bool {
        return lhs.secure_url == rhs.secure_url
    }
}
