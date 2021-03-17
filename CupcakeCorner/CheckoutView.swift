//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Talita Groppo on 28/02/2021.
//

import SwiftUI


struct CheckoutView: View {
    @ObservedObject var order: Order
    @ObservedObject var NetworkReachability: NetworkReachability
    @State private var unsatisfied = true
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)

                    Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)

                    Button("Place Order") {
                        self.placeOrder()
                    }
                    .padding()
                .accessibilityElement(children: .ignore)
                    .accessibility(label: Text("\(order.cost), \(confirmationMessage) total"))
                }
            }
                    }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text("Thank you!"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
                .alert(isPresented: $unsatisfied) {
                    Alert(title: Text("Lost connect"), message: Text(confirmationMessage), dismissButton: .default(Text("RECONECT")))
    }
    }
    func placeOrder(){
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else{
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
                self.showingConfirmation = true
            } else {
                self.unsatisfied.toggle()
                print("Invalid response from server")
                return
        }
        }.resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order(), NetworkReachability: NetworkReachability())
    }
}
