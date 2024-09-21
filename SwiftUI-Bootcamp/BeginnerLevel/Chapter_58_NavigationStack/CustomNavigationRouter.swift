//
//  CustomNavigationRouter.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 21/09/24.
//

import Foundation
import SwiftUI

class CustomNavigationRouter: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()

    func resetPath() {
        path = NavigationPath()
    }
}
