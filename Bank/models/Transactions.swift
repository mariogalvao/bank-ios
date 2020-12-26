//
//  Transactions.swift
//  Bank
//
//  Created by Mário Galvao on 26/12/20.
//

import UIKit

class Transaction {
    
    var type: TransactionType
    var icon: UIImage?
    var title: String
    var details: String
    
    init(type: TransactionType, icon: UIImage?, title: String, details: String) {
        self.type = type
        self.icon = icon
        self.title = title
        self.details = details
    }
    
    static func getTransactions() -> [Transaction] {
        var transactions: [Transaction] = []
        transactions.append(Transaction(type: .extract,
                                        icon: UIImage(systemName: "list.bullet.rectangle"),
                                        title: "Extrato",
                                        details: "Veja todos os seus lançamentos."))
        transactions.append(Transaction(type: .pix,
                                        icon: UIImage(systemName: "arrow.uturn.right.square"),
                                        title: "Pix",
                                        details: "Transferência 24h por dia, 7 dias por semana."))
        transactions.append(Transaction(type: .payment,
                                        icon: UIImage(systemName: "barcode.viewfinder"),
                                        title: "Pagamento",
                                        details: "Pague seu boleto pelo número ou código de barras."))
        transactions.append(Transaction(type: .scheduling,
                                        icon: UIImage(systemName: "calendar"),
                                        title: "Agendamentos",
                                        details: "Consulte, edite e cancele agendamentos."))
        transactions.append(Transaction(type: .bankBill,
                                        icon: UIImage(systemName: "barcode"),
                                        title: "Depósito por boleto",
                                        details: "Gere um boleto e pegue em dinheiro em qualquer banco."))
        transactions.append(Transaction(type: .automaticPayment,
                                        icon: UIImage(systemName: "arrow.2.squarepath"),
                                        title: "Débito automático",
                                        details: "Consulte, cadastre e cancele contas em débito automático."))
        return transactions
    }

}

enum TransactionType: String {
    case extract
    case pix
    case payment
    case scheduling
    case bankBill
    case automaticPayment
}
