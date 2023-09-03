//
//  DetailView.swift
//  ListOfStudents
//
//  Created by Bob Witmer on 2023-09-02.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var studentVM: StudentViewModel
    @Environment(\.dismiss) private var dismiss
    @State var student: Student
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                Text("Developer's Name:")
                    .bold()
                TextField("Student Name:", text: $student.name)
                    .textFieldStyle(.roundedBorder)
                Spacer()
            }
            .font(.title)
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        studentVM.saveStudent(student: student)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(student: Student(name: "Swifty McSwiftFace"))
                .environmentObject(StudentViewModel())
        }
    }
}
