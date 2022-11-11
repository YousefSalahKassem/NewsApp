//
//  ResultStates.swift
//  newsApp
//
//  Created by kortobaa on 11/11/2022.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
