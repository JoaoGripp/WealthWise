//
//  WealthWiseTabView.swift
//  WealthWise
//
//  Created by Joao Gripp on 23/03/23.
//

import SwiftUI

struct WealthWiseTabView: View {
    var body: some View {
        TabView {
            MyStockListView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("MyStocks")
                }
            WatchListView()
                .tabItem {
                    Image(systemName: "chart.bar.doc.horizontal")
                    Text("WatchList")
                }
        }
    }
}

struct WealthWiseTabView_Previews: PreviewProvider {
    static var previews: some View {
        WealthWiseTabView()
    }
}
