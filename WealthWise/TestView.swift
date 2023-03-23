//
//  TestView.swift
//  WealthWise
//
//  Created by Joao Gripp on 23/03/23.
//

import SwiftUI

final class StockList: ObservableObject {
    @Published var stocks = [Stock]()
}

struct TestView: View {
    
    @EnvironmentObject var stockList: StockList
    
    var body: some View {
        NavigationView {
            List {
                ForEach(stockList.stocks) { stock in
                    NavigationLink(destination: EditView(stock: $stockList.stocks[stockList.stocks.firstIndex(of: stock)!])) {
                        HStack {
                            
                            Image(systemName: "checkmark.circle.fill")
                            Text(stock.symbol)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Watchlist"))
            .navigationBarItems(trailing: addButton)
        }
    }
    
    var addButton: some View {
        Button(action: {
            stockList.stocks.append(Stock(symbol: "Test", description: "dsdsd", price: 2.0, quantity: 3.0, porcentage: 4.0))
        }) {
            Image(systemName: "plus")
        }
    }
}

struct EditView: View {
    @Binding var stock: Stock
    
    var body: some View {
        Form {
            Section(header: Text("Task")) {
                TextField("Enter task", text: $stock.symbol)
            }
            Section(header: Text("Status")) {
                TextField("Enter task", text: $stock.description)
            }
        }
        .navigationBarTitle(Text("Edit Task"))
    }
}


struct TestView_Previews: PreviewProvider {
    
    static let stockList = StockList()
    
    static var previews: some View {
        TestView()
            .environmentObject(stockList)
    }
}
