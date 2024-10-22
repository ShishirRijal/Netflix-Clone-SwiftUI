//
//  NetflixApp.swift
//  Netflix
//
//  Created by Shishir Rijal on 13/10/2024.
//

import SwiftUI

@main
struct NetflixApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

  init() {
    print("Font families:")
      for family in UIFont.familyNames {
          print("Family: \(family)")
          for name in UIFont.fontNames(forFamilyName: family) {
              print("   - \(name)")
          }
      }
  }

}
