//
//  Student.swift
//  ListOfStudents
//
//  Created by Bob Witmer on 2023-09-02.
//

import Foundation

enum Year: CaseIterable, Codable {
    case freshman, sophmore, junior, senior
}

    
struct Student: Codable, Identifiable {
    var id: String?
    var name: String = ""
    var major: String = ""
    var homeTown: String = ""
    var year: Year = .freshman
}
