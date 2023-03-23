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
                    NavigationLink(destination: PercentageSliderView(stock: $stockList.stocks[stockList.stocks.firstIndex(of: stock)!])) {
                        StockInfoCell(stock: stock)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle(Text("Watchlist"))
            .navigationBarItems(trailing: addButton)
        }
    }
    
    var addButton: some View {
        Button(action: {
            stockList.stocks.append(Stock(symbol: "AAPL34", description: "Apple Company", price: 2.0, quantity: 3.0, percentage: 4.0))
        }) {
            Image(systemName: "plus")
        }
    }
}

struct EditView: View {
    @Binding var stock: Stock
    
    var body: some View {
        Form {
            Section(header: Text(stock.symbol)) {
                TextField("Enter task", text: $stock.description)
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

struct StockInfoCell: View {
    let stock: Stock
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(stock.symbol)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("\(String(format: "%.2f", stock.percentage))%")
                .font(.title2)
                .foregroundColor(stock.price > 0 ? .green : .red)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
