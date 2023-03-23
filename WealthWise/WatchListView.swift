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
        List {
            WatchListCell(title: "AAPL34", description: "Apple Company", value: $value)
            WatchListCell(title: "ITSA4", description: "Itausa SA", value: $value)
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
            VStack(spacing: 10) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(description)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            
            VStack(alignment: .trailing) {
                Text("\(value)%")
                    .font(.title3)
                
                Stepper("", value: $value, in: 0...100)
            }
        }
    }
}
