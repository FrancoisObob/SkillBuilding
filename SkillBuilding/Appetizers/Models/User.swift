//
//  User.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 11/15/23.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthday        = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
