//
//  UserPreferencesViewModels.swift
//  ThreedCopy
//
//  Created by Hibah Abdullah Alatawi on 11/02/1445 AH.
//

import Foundation
import SwiftUI

class UserPreferencesViewModels : ObservableObject {
    @AppStorage("userSessionToken") var token: String = ""
}
