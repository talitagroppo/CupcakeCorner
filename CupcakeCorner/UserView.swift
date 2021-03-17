//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Talita Groppo on 28/02/2021.
//

//import SwiftUI
//
//class User: ObservableObject, Codable{
//    enum CodingKeys: CodingKey {
//        case name
//    }
//   @Published var name = "Talita e Tiago"
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        name = try container.decode(String.self, forKey: .name)
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//    }
//}
//struct UserView: View {
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
//    }
//}
//
//struct UserView_Preview: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}
