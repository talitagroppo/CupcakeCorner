//
//  OrderView.swift
//  CupcakeCorner
//
//  Created by Talita Groppo on 28/02/2021.
//

import SwiftUI

struct OrderView: View {
    
    @ObservedObject var order = Order()
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper(value: $order.quantity, in: 1...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }

                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }

                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                Section {
                    NavigationLink(destination: AdressView(order: order, NetworkReachability: NetworkReachability())) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
