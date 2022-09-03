//
//  NetworkClient.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 3/3/22.
//

import Alamofire
import Foundation
import Combine

public protocol AuthTokenProvider: AnyObject {
    var accessToken: String? { get }
}

public protocol NetworkClientDelegate: AnyObject {
    func sessionExpired()
}

public class NetworkClient {
    
    private let session: Session
    public weak var authTokenProvider: AuthTokenProvider?
    public weak var delegate: NetworkClientDelegate?
        
    init() {
        self.session = Alamofire.Session.default
    }
    
    func rawRequest<T: Decodable>(requestBuilder: URLRequestBuilder, responseType: T.Type) -> AnyPublisher<T, APIError> {
        session.request(requestBuilder)
            .publishDecodable(type: responseType, queue: .global())
            .value()
            .mapError { APIError(error: $0) }
            .eraseToAnyPublisher()
    }
    
    func request<T: Decodable>(requestBuilder: URLRequestBuilder) -> AnyPublisher<T, APIError> {
        session.request(requestBuilder, interceptor: self)
            .publishDecodable(type: T.self, queue: .global(qos: .background))
            .value()
            .mapError { APIError(error: $0) }
            .eraseToAnyPublisher()
    }

    func request<T: Decodable>(requestBuilder: URLRequestBuilder, responseType: T.Type) async throws -> T {
        try await session.request(requestBuilder, interceptor: self)
            .serializingDecodable(responseType).value
    }
    
}

// MARK: - RequestInterceptor

extension NetworkClient: RequestInterceptor {
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard let accessToken = authTokenProvider?.accessToken else {
            completion(.failure(APIError.unauthorized))
            return
        }

        var request = urlRequest
        request.headers.add(.authorization(bearerToken: accessToken))
        completion(.success(request))
    }
    
}
