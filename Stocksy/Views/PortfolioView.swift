//
//  PortfolioView.swift
//  Stocksy
//
//  Created by Muhammet Furkan Saygıcı on 23.11.2024.
//

import SwiftUI

struct PortfolioView: View {
    struct Stock: Identifiable {
        var id = UUID()
        var logo: String // Logo ismi (Assets'ten alacak)
        var symbol: String // Hissenin sembol ismi
        var companyName: String // Şirketin tam adı
        var price: String // Hissenin son fiyatı
        var priceChange: String // Günlük değişim
    }
    
    let stocks = [
        Stock(logo: "appleLogo", symbol: "AAPL", companyName: "Apple Inc.", price: "$175.43", priceChange: "+1.2%"),
        Stock(logo: "googleLogo", symbol: "GOOGL", companyName: "Alphabet Inc.", price: "$2903.52", priceChange: "-0.3%"),
        Stock(logo: "microsoftLogo", symbol: "MSFT", companyName: "Microsoft Corporation", price: "$310.77", priceChange: "+0.8%")
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Hisse Listesi
                List(stocks) { stock in
                    HStack(spacing: 0) {
                        // Hissenin logo kısmı
                        Image(stock.logo) // Logo simgesi (Assets'ten alınacak)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        // Hissenin sembolü ve şirket adı
                        VStack(alignment: .leading, spacing: 4) { // spacing'i 4 olarak ayarladık
                            Text(stock.symbol)
                                .font(.headline)
                            Text(stock.companyName)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading)
                        
                        Spacer()
                        
                        // Fiyat ve günlük değişim
                        VStack(alignment: .trailing) {
                            Text(stock.price)
                                .font(.headline)
                            Text(stock.priceChange)
                                .font(.subheadline)
                                .foregroundColor(stock.priceChange.hasPrefix("+") ? .green : .red)
                        }
                    }
                    .padding(.vertical, 2)
                }
                .listStyle(PlainListStyle()) // Listede başlık yok, sadece hisse bilgileri
            }
            .navigationBarTitle("My Portfolio", displayMode: .large) // Başlık ekleyelim
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}

#Preview {
    PortfolioView()
}
