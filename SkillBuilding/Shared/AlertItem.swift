//
//  AlertItem.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 9/19/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let button: Alert.Button

    init(cameraError: CameraError) {
        switch cameraError {
        case .invalidDeviceInput:
            self.title = "Invalid Device Input"
            self.message = "Something is wrong with the camera. We are unable to capture the input."
        case .invalidScannedValue:
            self.title = "Invalid Scanned Value"
            self.message = "The value scanned i not valid. This app scans EAN-8 and EAN-13."
        }
        self.button = .default(Text("OK"))
    }

    init(apError: APError) {
        self.title = "Server Error"
        switch apError {
        case .invalidURL:
            self.message = "There was an issue connecting to the server. If this persist, please contact support."
        case .invalidResponse:
            self.message = "Invalid response from the server. Please try again later or contact support."
        case .invalidData:
            self.message = "The data received from the server was invalid. Please contact support."
        case .unableToComplete:
            self.message = "Unable to complete your request at this time. Please check your internet connection."
        }
        self.button = .default(Text("OK"))
    }
}

extension Alert {
    init(_ alertItem: AlertItem) {
        self.init(title: Text(alertItem.title),
                  message: Text(alertItem.message),
                  dismissButton: alertItem.button)
    }
}
