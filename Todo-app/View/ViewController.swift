//
//  ViewController.swift
//  Todo-app
//
//  Created by Arpit Mallick on 9/10/24.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate {
    
    private let textField = UITextField()
    private let saveButton = UIButton()
    private let tableView = UITableView()

    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
        
    }
    
    func setupUI() {
        
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter task"
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.addTarget(self, action: #selector(saveBtnClicked), for: .touchUpInside)
        saveButton.backgroundColor = .gray
        
        let hStack = UIStackView(arrangedSubviews: [textField, saveButton])
        hStack.axis = .horizontal
        hStack.spacing = 10
        hStack.distribution = .fillProportionally
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(hStack)
        view.addSubview(tableView)
        
        
        hStack.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            hStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            hStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func saveBtnClicked() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let txt = Mdata(context: context)
        txt.data = textField.text
        CoreDataManager.shared.saveContext()
        textField.text = ""
        
        if let fetchedTasks = ViewModel.getTaskData(moc: CoreDataManager.shared.persistentContainer.viewContext) {
            tasks = fetchedTasks
        }
        
        self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        cell?.taskLabel.textColor = .black
        cell?.taskLabel.text = tasks[indexPath.row]
        return cell ?? UITableViewCell()
    }
}

