//
//  PercentageSliderView.swift
//  WealthWise
//
//  Created by Joao Gripp on 23/03/23.
//

import SwiftUI

struct PercentageSliderView: View {
    @Binding var stock: Stock
    var percentageMissing: Double
    
    var body: some View {
        VStack {
            Text(stock.symbol)
                .font(.title)
            
            Text("Adjust Percentage")
                .font(.title3)
            
            
            HStack(spacing: 30) {
                Text("\(String(format: "%.1f", stock.percentage))%")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(10)
                
                Text("\(String(format: "%.1f", percentageMissing))%")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(10)
            }
            
            
            Slider(value: $stock.percentage, in: 0...(stock.percentage + percentageMissing) + 0.01, step: 0.1)
                .padding(.horizontal)
            
            HStack {
                Text("0%")
                Spacer()
                Text("50%")
                Spacer()
                Text("100%")
            }
            .padding(10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct PercentageSliderView_Previews: PreviewProvider {
    
    @State static var stock = MockData.sampleStock01
    
    static var previews: some View {
        PercentageSliderView(stock: $stock, percentageMissing: 10.0)
    }
}

