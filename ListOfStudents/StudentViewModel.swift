//
//  StudentViewModel.swift
//  ListOfStudents
//
//  Created by Bob Witmer on 2023-09-02.
//

import Foundation

class StudentViewModel: ObservableObject {
    @Published var studentArray: [Student] = []
    
    init() {
        let students = ["Holt B.",
                        "Luke B.",
                        "Michael B.",
                        "Milan C.",
                        "Russell C.",
                        "Gabriela C.",
                        "Kevin C.",
                        "Charles C.",
                        "Matthew C.",
                        "Gleidson D.",
                        "Jack D.",
                        "John G.",
                        "Matthew Gr.",
                        "Matthew Gu.",
                        "William H.",
                        "Shane J.",
                        "Connor J.",
                        "Andy J.",
                        "Christopher K.",
                        "Dylan K.",
                        "Riya K.",
                        "Aakash K.",
                        "Benjamin L.",
                        "Dilan L.",
                        "Anthony M.",
                        "Tyler M.",
                        "Annie M.",
                        "Avery M.",
                        "Emily M.",
                        "Addison M.",
                        "Dylan M.",
                        "Owen O.",
                        "Zachary P.",
                        "Gabriella P.",
                        "William P.",
                        "Caitlin P.",
                        "Syed R.",
                        "William R.",
                        "Lauren S.",
                        "George S.",
                        "Astrid S.",
                        "Thomas S.",
                        "Hailey S.",
                        "Jasmine T.",
                        "Michael V.",
                        "Jonathan W.",
                        "Theodore W.",
                        "Andrew Y."
]
        for student in students {
            studentArray.append(Student(id: UUID().uuidString, name: student))
        }
    }
    
    func saveStudent(student: Student) {
        if student.id == nil {  // New student
            var newStudent = student
            newStudent.id = UUID().uuidString
            studentArray.append(newStudent)
        } else {    // Update existing student
            if let index = studentArray.firstIndex(where: {$0.id == student.id}) {
                studentArray[index] = student
            }
        }

    }
    
    func deleteStudent(indexSet: IndexSet) {
        studentArray.remove(atOffsets: indexSet)
    }
}
