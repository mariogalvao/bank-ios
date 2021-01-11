//
//  ProfileHomeViewController.swift
//  Bank
//
//  Created by Mário Galvao on 25/12/20.
//

import UIKit
import OpenAPIClient

class ProfileHomeViewController: ViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cpfLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var bankLabel: UILabel!
    @IBOutlet weak var agencyLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    
    var viewModelDelegate: ProfileHomeViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Perfil"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModelDelegate?.getMyInfo()
    }
    
    @IBAction func needHelp(_ sender: UIButton) {
        viewModelDelegate?.needHelp()
    }
    
    @IBAction func logout(_ sender: UIButton) {
        viewModelDelegate?.logout()
    }
    
}

protocol ProfileHomeViewControllerProtocol: ViewControllerProtocol {
    
    func setMyInfo(_ myInfo: MyInfo)
    
}

extension ProfileHomeViewController: ProfileHomeViewControllerProtocol {
    
    func setMyInfo(_ myInfo: MyInfo) {
        nameLabel.text = "Nome: \(myInfo.name)"
        emailLabel.text = "E-mail: \(myInfo.email)"
        cpfLabel.text = "CPF: \(myInfo.cpf)"
        phoneLabel.text = "Celular: \(myInfo.phone)"
        bankLabel.text = "Banco: \(myInfo.bank)"
        agencyLabel.text = "Agência: \(myInfo.agency)"
        accountLabel.text = "Conta: \(myInfo.account)"
    }
    
}
