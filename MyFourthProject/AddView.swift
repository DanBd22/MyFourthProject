//
//  AddView.swift
//  MyFourthProject
//
//  Created by Badarau Dan on 05.03.2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var price = ""
    
    let types = ["Bussines", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Denumire", text: $name)
                Picker("Tip", selection: $type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Preț", text: $price)
                    .keyboardType(.numberPad)
                
            }
            .navigationBarTitle("Adaugă")
            .navigationBarItems(trailing: Button("Salvează") {
                if let actualPrice = Int(self.price){
                    let item = ExpenseItem(name: self.name, type: self.type, price: actualPrice)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
