//
//  StudentListView.swift
//  ListOfStudents
//
//  Created by Bob Witmer on 2023-09-02.
//

import SwiftUI

struct StudentListView: View {
    
    @EnvironmentObject var studentVM: StudentViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(studentVM.studentArray) { student in
                    NavigationLink {
                        DetailView(student: student)
                    } label: {
                        Image(systemName: "swift")
                            .foregroundColor(.orange)
                        Text(student.name)
                    }
                    .font(.title2)
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Swifters!")
        }
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListView()
            .environmentObject(StudentViewModel())
    }
}
