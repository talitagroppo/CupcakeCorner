//
//  AdressView.swift
//  CupcakeCorner
//
//  Created by Talita Groppo on 28/02/2021.
//

import SwiftUI

struct AdressView: View {
    @ObservedObject var order: Order
    @ObservedObject var NetworkReachability: NetworkReachability
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }

            Section {
                NavigationLink(destination: CheckoutView(order: order, NetworkReachability: CupcakeCorner.NetworkReachability())) {
                    Text("Check out")
                }
            }
            .disabled(order.hasValidAddress == false)
            .disabled(NetworkReachability.isNetworkAvailable() == true)
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

struct AdressView_Previews: PreviewProvider {
    static var previews: some View {
        AdressView(order: Order(), NetworkReachability: NetworkReachability())
    }
}
