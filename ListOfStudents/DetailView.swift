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
                Text("Major:")
                    .bold()
                TextField("major:", text: $student.major)
                    .textFieldStyle(.roundedBorder)
                Text("Hometown:")
                    .bold()
                TextField("hometown:", text: $student.homeTown)
                    .textFieldStyle(.roundedBorder)
                HStack {
                    Text("Year:")
                        .bold()
                    Spacer()
                    Picker("Year:", selection: $student.year) {
                        ForEach(Year.allCases, id:\.self) { year in
                            Text(year.rawValue.capitalized)
                        }
                    }
                }
                
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
            DetailView(student: Student(name: "Prof. Gallagher", major: "Computer Science (MCAS)", homeTown: "Wayne, NJ", year: .senior))
                .environmentObject(StudentViewModel())
        }
    }
}
