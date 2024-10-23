//
//  Constants.swift
//  Netflix
//
//  Created by Shishir Rijal on 24/10/2024.
//

import Foundation

struct Constant {
  static let apiKey = Secrets.getAPIKey()
  static let baseUrl = "https://api.themoviedb.org/3"
  static let upcomingUrl = baseUrl + "/movie/upcoming"
  
}
