//
//  TestView.swift
//  WealthWise
//
//  Created by Joao Gripp on 23/03/23.
//

import SwiftUI

final class StockList: ObservableObject {
    @Published var stocks = [Stock]()
    
    var totalValue: Double {
        return stocks.reduce(0) { $0 + $1.price * $1.quantity }
    }
    
    var savingAccountPercentage: Double {
        return 100 - stocks.reduce(0) { $0 + $1.percentage }
    }
}

struct TestView: View {
    
    @EnvironmentObject var stockList: StockList
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Total Portifolio")
                            .font(.footnote)
                        Text("$\(stockList.totalValue, specifier: "%.2f")")
                            .bold()
                            .font(.title)
                            .foregroundColor(.primary)
                        
                    }
                    .padding()
                    Spacer()
                }
                
                
                Text("\(stockList.savingAccountPercentage, specifier: "%.2f")")
                
                List {
                    ForEach(stockList.stocks) { stock in
                        NavigationLink(destination: PercentageSliderView(stock: $stockList.stocks[stockList.stocks.firstIndex(of: stock)!], percentageMissing: stockList.savingAccountPercentage)) {
                            StockInfoCell(stock: stock, total: stockList.totalValue)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle(Text("Watchlist"))
            .navigationBarItems(trailing: addButton)
        }
    }
    
    var addButton: some View {
        Button(action: {
            stockList.stocks.append(Stock(symbol: "AAPL34", description: "Apple Company", price: 20.0, quantity: 3.0, percentage: 0.0))
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
    let total: Double
    
    var percentageActual: Double {
        return 100 * (stock.price * stock.quantity) / (total)
    }
    
    var body: some View {
        VStack {
            HStack {
                Image("AAPL_image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(stock.symbol)
                        .font(.title2)
                        .foregroundColor(.accentColor)
                    
                    Text(stock.description)
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .lineLimit(0)
                }
                Spacer()
                
                VStack {
                    Text("$\(String(format: "%.2f", stock.price))")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
            }
            
            HStack {
                Text("\(String(format: "%.2f", percentageActual))%")
                    .font(.title3)
                    .foregroundColor( percentageActual > stock.percentage ? .green : .red)
                
                Spacer()
                
                Text("\(String(format: "%.2f", stock.percentage))%")
                    .font(.title3)
                    .foregroundColor(.green)
            }
        }
        
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
