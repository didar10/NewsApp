//
//  ResultState.swift
//  NewsApp
//
//  Created by Didar Bakhitzhanov on 12.07.2022.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
