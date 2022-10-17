//
//  Order.swift
//  Starbucks Coffee
//
//  Created by Michal Fereniec on 17/10/2022.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappucino
    case latte
    case espresso
    case americano
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders")
            else {
                fatalError("OMG! URL is incorrect! How could u allow that?!?!?")
        }
        
    return Resource<[Order]>(url: url)
    }()


    static func create(viewModel: AddCoffeeOrderViewModel) -> Resource<Order?> {
        
        let order = Order(viewModel)
        
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else { fatalError("OMG! URL is incorrect! How could u allow that?!?!?")}
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error while encoding order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HTTPMethod.post
        resource.body = data
        
        return resource
    }
}

extension Order {
    init?(_ viewModel: AddCoffeeOrderViewModel) {
        guard let name = viewModel.name,
              let email = viewModel.email,
              let selectedType = CoffeeType(rawValue: viewModel.selectedType!.lowercased()),
              let selectedSize = CoffeeSize(rawValue: viewModel.selectedSize!.lowercased())
        else { return nil }
        
        self.email = email
        self.name = name
        self.type = selectedType
        self.size = selectedSize
              
    }
}

