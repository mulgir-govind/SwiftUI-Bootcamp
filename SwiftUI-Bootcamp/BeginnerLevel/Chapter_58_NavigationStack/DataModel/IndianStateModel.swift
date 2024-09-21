//
//  City.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 21/09/24.
//

import Foundation

// City data model
struct City: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let genderData: GenderData
    
    struct GenderData: Identifiable, Hashable {
        let id: UUID = UUID()
        let male: Int
        let female: Int
        let other: Int
    }
}

// District data model

struct District: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let cities: [City]
}

// State data model
struct IndianState: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let popularDistricts: [District]
}

extension IndianState {
    static func sampleData() -> [IndianState] {
        return [
            IndianState(
                name: "Maharashtra",
                description: "Maharashtra is known for its diverse culture, rich history, and is home to Mumbai, the financial capital of India.",
                popularDistricts: [
                    District(
                        name: "Mumbai",
                        description: "Mumbai is the capital city of Maharashtra, known for its bustling metropolitan life and Bollywood industry.",
                        cities: [
                            City(name: "Mumbai City", description: "The heart of India’s financial and entertainment industries.", genderData: .init(male: 3000000, female: 2800000, other: 50000)),
                            City(name: "Navi Mumbai", description: "A planned city on the west coast of Maharashtra.", genderData: .init(male: 1500000, female: 1400000, other: 10000)),
                            City(name: "Thane", description: "A suburb of Mumbai known for its lakes and cosmopolitan population.", genderData: .init(male: 2000000, female: 1900000, other: 15000))
                        ]
                    ),
                    District(
                        name: "Pune",
                        description: "Known as the 'Oxford of the East', Pune is Maharashtra's second-largest city.",
                        cities: [
                            City(name: "Pune City", description: "An educational and IT hub, known for its pleasant climate.", genderData: .init(male: 2500000, female: 2400000, other: 30000)),
                            City(name: "Pimpri-Chinchwad", description: "A rapidly growing industrial township.", genderData: .init(male: 1000000, female: 950000, other: 8000)),
                            City(name: "Talegaon", description: "A town known for its historic significance and pleasant climate.", genderData: .init(male: 500000, female: 450000, other: 3000))
                        ]
                    ),
                    District(
                        name: "Nagpur",
                        description: "Known for its oranges, Nagpur is a major commercial and political center.",
                        cities: [
                            City(name: "Nagpur City", description: "The winter capital of Maharashtra.", genderData: .init(male: 1200000, female: 1100000, other: 7000)),
                            City(name: "Wardha", description: "Known for its association with Mahatma Gandhi.", genderData: .init(male: 600000, female: 550000, other: 2000)),
                            City(name: "Chandrapur", description: "An industrial hub known for coal mining.", genderData: .init(male: 300000, female: 290000, other: 1000))
                        ]
                    )
                ]
            ),
            IndianState(
                name: "Karnataka",
                description: "Karnataka is known for its technology hub, rich cultural heritage, and historical sites.",
                popularDistricts: [
                    District(
                        name: "Bangalore",
                        description: "The capital city, known as the 'Silicon Valley of India'.",
                        cities: [
                            City(name: "Bangalore City", description: "The technology hub of India.", genderData: .init(male: 6000000, female: 5700000, other: 40000)),
                            City(name: "Yelahanka", description: "A suburb in northern Bangalore.", genderData: .init(male: 200000, female: 190000, other: 500)),
                            City(name: "Whitefield", description: "Known for its tech parks and residential areas.", genderData: .init(male: 500000, female: 450000, other: 3000))
                        ]
                    ),
                    District(
                        name: "Mysore",
                        description: "Known for its royal heritage and palaces.",
                        cities: [
                            City(name: "Mysore City", description: "A historical city known for its palaces and silk.", genderData: .init(male: 700000, female: 650000, other: 2000)),
                            City(name: "Nanjangud", description: "An industrial town known for its religious significance.", genderData: .init(male: 150000, female: 140000, other: 1000)),
                            City(name: "Mandya", description: "Known for sugarcane cultivation and agriculture.", genderData: .init(male: 250000, female: 240000, other: 1500))
                        ]
                    ),
                    District(
                        name: "Mangalore",
                        description: "A port city known for its beaches and seafood.",
                        cities: [
                            City(name: "Mangalore City", description: "A major port city in Karnataka.", genderData: .init(male: 300000, female: 280000, other: 2000)),
                            City(name: "Udupi", description: "Known for its temples and cuisine.", genderData: .init(male: 150000, female: 140000, other: 1000)),
                            City(name: "Kundapur", description: "A coastal town known for its beaches and seafood.", genderData: .init(male: 100000, female: 95000, other: 500))
                        ]
                    )
                ]
            )
        ]
    }
}
