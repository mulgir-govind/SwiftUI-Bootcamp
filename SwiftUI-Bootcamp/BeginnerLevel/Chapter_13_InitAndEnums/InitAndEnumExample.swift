//
//  InitAndEnumExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 30/08/24.
//

import SwiftUI

struct InitAndEnumExample: View {

    enum OrderStatus {
        case pending
        case completed
    }

    let orderStatus: OrderStatus
    let orderCount: Int
    private let orderText: String
    private let backgroundColor: Color

    init(orderStatus: OrderStatus, orderCount: Int) {
        self.orderStatus = orderStatus
        self.orderCount = orderCount

        switch orderStatus {
            case .pending:
                orderText = "Pending orders"
                backgroundColor = .red
            case .completed:
                orderText = "Completed orders"
                backgroundColor = .green
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("\(orderCount)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .underline()
            Text(orderText)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
        }
        .frame(width: 180, height: 180)
        .background(backgroundColor)
        .clipShape(
            RoundedRectangle(cornerRadius: 15.0)
        )
    }
}

#Preview {
    HStack {
        InitAndEnumExample(orderStatus: .pending, orderCount: 5)
        InitAndEnumExample(orderStatus: .completed, orderCount: 2)
    }
}
