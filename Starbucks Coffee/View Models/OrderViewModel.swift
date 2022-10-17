//
//  OrderViewModel.swift
//  Starbucks Coffee
//
//  Created by Michal Fereniec on 17/10/2022.
//

import Foundation

class OrderListViewModel {
    var ordersViewModel: [OrderViewModel] = []
}

extension OrderListViewModel {
    
    func orderViewModel(at index: Int) -> OrderViewModel {
        return ordersViewModel[index]
    }
    
}

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    
    var name: String {
        order.name
    }
    
    var email: String {
        order.email
    }
    
    var type: String {
        order.type.rawValue.capitalized
    }
    
    var size: String {
        order.size.rawValue.capitalized
    }
}

