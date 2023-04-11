//
//  LocationApiClient.swift
//  iosSchool
//
//  Created by Savely on 30.03.2023.
//

import Foundation

protocol LocationApiClient {
  func location(onRequestComplited: @escaping (Result<Location, ApiError>) -> Void)
}

extension ApiClient: LocationApiClient {
  func location(onRequestComplited: @escaping (Result<Location, ApiError>) -> Void) {
    let url = NetworkConstants.URLStrings.locationURL
    performRequest(url: url, data: nil, method: .get, onRequestCompleted: onRequestComplited)
  }
}
