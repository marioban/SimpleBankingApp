//
//  TransactionViewController.swift
//  SimpleBankingApp
//
//  Created by Mario Ban on 01.05.2024..
//

import UIKit

class TransactionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var bankData: Results?
    var selectedAccount: Acount?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSelectAccountButton()
        loadBankData()
    }

    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    private func setupSelectAccountButton() {
        let selectButton = UIButton(type: .system)
        selectButton.setTitle("Select Account", for: .normal)
        selectButton.addTarget(self, action: #selector(showAccountSelection), for: .touchUpInside)
        view.addSubview(selectButton)

        selectButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }

    
    @objc func showAccountSelection() {
        guard let accounts = bankData?.acounts, !accounts.isEmpty else {
                print("No accounts available or data not loaded")
                return
            }
            
        let alertController = UIAlertController(title: "Select Account", message: nil, preferredStyle: .actionSheet)
            
        
        bankData?.acounts.forEach { account in
            let action = UIAlertAction(title: "Account \(account.iban)", style: .default, handler: { _ in
                self.selectedAccount = account
                self.tableView.reloadData()
            })
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedAccount?.transactions.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let transaction = selectedAccount?.transactions[indexPath.row] {
            var detailsText = "Date: \(transaction.date)\n"
            detailsText += "Transaction: \(transaction.description)\n"
            detailsText += "Amount: \(transaction.amount)"
            
            if let type = transaction.type {
                detailsText += "\nType: \(type)"
            }
            
            cell.textLabel?.text = detailsText
            cell.textLabel?.numberOfLines = 0 
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        }
        cell.selectionStyle = .none
        
        return cell
    }


    private func loadBankData() {
        guard let url = Bundle.main.url(forResource: "Zadatak_1", withExtension: "json") else {
            print("JSON file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            bankData = try decoder.decode(Results.self, from: data)
            print("Data loaded successfully: \(bankData?.acounts.count ?? 0) accounts found")
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
