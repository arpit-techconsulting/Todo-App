//
//  CustomTableViewCell.swift
//  Todo-app
//
//  Created by Arpit Mallick on 9/10/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

     let taskLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            contentView.addSubview(taskLabel)
            
            NSLayoutConstraint.activate([
                taskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                taskLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                taskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}
