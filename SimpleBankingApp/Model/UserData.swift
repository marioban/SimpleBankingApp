import Foundation


struct Results: Codable {
    let userID: String
    let acounts: [Acount]

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case acounts
    }
}

// MARK: - Acount
struct Acount: Codable {
    let id, iban, amount, currency: String
    let transactions: [Transaction]

    enum CodingKeys: String, CodingKey {
        case id
        case iban = "IBAN"
        case amount, currency, transactions
    }
}

// MARK: - Transaction
struct Transaction: Codable {
    let id, date, description, amount: String
    let type: String?
}


