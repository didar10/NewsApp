//
//  NewsService.swift
//  NewsApp
//
//  Created by Didar Bakhitzhanov on 12.07.2022.
//

import Foundation
import Combine

protocol NewsService {
    func request(from endPoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError>
}

struct NewsServiceImpl: NewsService {
    func request(from endPoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endPoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<NewsResponse, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    return Just(data)
                        .decode(type: NewsResponse.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode))
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
        
    }
}
