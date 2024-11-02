//
//  HelperFunctions.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import Foundation

func getImageUrl(path: String) -> URL {
  let baseURL = "https://image.tmdb.org/t/p/w500"
  let fullPath = baseURL + path
  return URL(string: fullPath)!
}
