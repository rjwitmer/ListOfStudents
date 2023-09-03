//
//  DetailView.swift
//  ListOfStudents
//
//  Created by Bob Witmer on 2023-09-02.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var studentVM: StudentViewModel
    @State var student: Student
    var body: some View {
        VStack (alignment: .leading) {
            Text("Developer's Name")
                .bold()
            TextField("Student Name:", text: $student.name)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
        .font(.title)
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(student: Student(name: "Swifty McSwiftFace"))
            .environmentObject(StudentViewModel())
    }
}
