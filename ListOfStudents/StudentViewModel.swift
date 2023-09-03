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
        loadData()
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "studentArray")
        let data = try? JSONEncoder().encode(studentArray)  // try means if error is thrown, data = nil
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data --> \(error.localizedDescription)")
        }
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "studentArray")
        guard let data = try? Data(contentsOf: path) else {return}
        do {
            studentArray = try JSONDecoder().decode(Array<Student>.self, from: data)
        } catch {
            print("😡 ERROR: Could not load data --> \(error.localizedDescription)")
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
        saveData()
    }
    
    func deleteStudent(indexSet: IndexSet) {
        studentArray.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveStudent(fromOffset: IndexSet, toOffset: Int) {
        studentArray.move(fromOffsets: fromOffset, toOffset: toOffset)
        saveData()
    }
    
}
