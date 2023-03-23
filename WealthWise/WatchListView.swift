//
//  WatchListView.swift
//  WealthWise
//
//  Created by Joao Gripp on 23/03/23.
//

import SwiftUI

struct WatchListView: View {
    
    @State private var value = 0
    
    var body: some View {
        List(MockData.sampleStocks) { stock in
            WatchListCell(title: stock.symbol, description: stock.description, value: $value)
        }
        
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}

struct WatchListCell: View {
    
    let title: String
    let description: String
    @Binding var value: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineLimit(0)
            }
            .frame(width: 120)
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(value)%")
                    .font(.title3)
                
                Stepper("", value: $value, in: 0...100)
            }
        }
    }
}
