//
//  ListOfStudentsApp.swift
//  ListOfStudents
//
//  Created by Bob Witmer on 2023-09-02.
//

import SwiftUI

@main
struct ListOfStudentsApp: App {
    @StateObject var studentVM = StudentViewModel()
    var body: some Scene {
        WindowGroup {
            StudentListView()
                .environmentObject(studentVM)
        }
    }
}
