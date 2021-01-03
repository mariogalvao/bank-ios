//
//  Menus.swift
//  Bank
//
//  Created by Mário Galvao on 26/12/20.
//

import UIKit

class Menu {
    
    var type: MenuType
    var icon: UIImage?
    var title: String
    var details: String
    
    init(type: MenuType, icon: UIImage? = nil, title: String, details: String) {
        self.type = type
        self.icon = icon
        self.title = title
        self.details = details
    }
    
    static func getAccountMenus() -> [Menu] {
        var transactions: [Menu] = []
        transactions.append(Menu(type: .extract,
                                        icon: UIImage(systemName: "list.bullet.rectangle"),
                                        title: "Extrato",
                                        details: "Veja todos os seus lançamentos."))
        transactions.append(Menu(type: .pix,
                                        icon: UIImage(systemName: "arrow.uturn.right.square"),
                                        title: "Pix",
                                        details: "Transferência 24h por dia, 7 dias por semana."))
        transactions.append(Menu(type: .payment,
                                        icon: UIImage(systemName: "barcode.viewfinder"),
                                        title: "Pagamento",
                                        details: "Pague seu boleto pelo número ou código de barras."))
        transactions.append(Menu(type: .scheduling,
                                        icon: UIImage(systemName: "calendar"),
                                        title: "Agendamentos",
                                        details: "Consulte, edite e cancele agendamentos."))
        transactions.append(Menu(type: .bankBill,
                                        icon: UIImage(systemName: "barcode"),
                                        title: "Depósito por boleto",
                                        details: "Gere um boleto e pegue em dinheiro em qualquer banco."))
        transactions.append(Menu(type: .automaticPayment,
                                        icon: UIImage(systemName: "arrow.2.squarepath"),
                                        title: "Débito automático",
                                        details: "Consulte, cadastre e cancele contas em débito automático."))
        return transactions
    }
    
    static func getCardMenus() -> [Menu] {
        var transactions: [Menu] = []
        transactions.append(Menu(type: .invoice,
                                        icon: UIImage(systemName: "list.bullet.rectangle"),
                                        title: "Faturas",
                                        details: "Veja todos os seus lançamentos."))
        transactions.append(Menu(type: .limits,
                                        icon: UIImage(systemName: "arrow.left.arrow.right.square"),
                                        title: "Alterar limite",
                                        details: "Altere o limite do seu cartão."))
        transactions.append(Menu(type: .block,
                                        icon: UIImage(systemName: "lock.square"),
                                        title: "Bloquear",
                                        details: "Em caso de perda ou roubo, faça o bloqueio do seu cartão."))
        return transactions
    }
    
    static func getMyInvestMenus() -> [Menu] {
        var transactions: [Menu] = []
        transactions.append(Menu(type: .invest,
                                 icon: UIImage(systemName: "centsign.circle"),
                                 title: "Poupança",
                                 details: "RS 5.000,00"))
        transactions.append(Menu(type: .invest,
                                 icon: UIImage(systemName: "banknote"),
                                 title: "Renda fixa",
                                 details: "R$ 10.000,00"))
        transactions.append(Menu(type: .invest,
                                 icon: UIImage(systemName: "arrow.up.right.square"),
                                 title: "Ações",
                                 details: "R$ 15.000,00"))
        return transactions
    }
    
    static func getInvestMenus() -> [Menu] {
        var transactions: [Menu] = []
        transactions.append(Menu(type: .invest,
                                 icon: UIImage(systemName: "centsign.circle"),
                                 title: "Poupança",
                                 details: "O mais seguro de todos os investimentos."))
        transactions.append(Menu(type: .invest,
                                 icon: UIImage(systemName: "banknote"),
                                 title: "Renda fixa",
                                 details: "Veja as opções de renda fixa que mais se adequam ao seu perfil."))
        transactions.append(Menu(type: .invest,
                                 icon: UIImage(systemName: "arrow.up.right.square"),
                                 title: "Ações",
                                 details: "Home Broker completo, zero tarifas."))
        transactions.append(Menu(type: .invest,
                                 icon: UIImage(systemName: "building.2"),
                                 title: "Debêntures",
                                 details: "Faça empréstimos a boas taxas de juros a grandes empresas."))
        transactions.append(Menu(type: .invest,
                                 icon: UIImage(systemName: "house"),
                                 title: "Fundo imobiliário",
                                 details: "Cada fundo investe em um grupo de bens imobiliários para vender em um determinado prazo."))
        return transactions
    }

}

enum MenuType: String {
    case extract
    case pix
    case payment
    case scheduling
    case bankBill
    case automaticPayment
    case invoice
    case limits
    case block
    case invest
}
