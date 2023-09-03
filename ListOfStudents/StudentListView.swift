//
//  StudentListView.swift
//  ListOfStudents
//
//  Created by Bob Witmer on 2023-09-02.
//

import SwiftUI

struct StudentListView: View {
    
    @EnvironmentObject var studentVM: StudentViewModel
    @State private var isSheetPresented = false
    
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
                .onDelete(perform: studentVM.deleteStudent)
                .onMove(perform: studentVM.moveStudent)
                
            }
            .listStyle(.plain)
            .navigationTitle("Swifters!")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .sheet(isPresented: $isSheetPresented) {
                DetailView(student: Student())
            }
        }
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListView()
            .environmentObject(StudentViewModel())
    }
}
