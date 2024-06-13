//
//  IncomingTextMessageTableViewCell.swift
//  appRunClub
//
//  Created by Nathalia Neves on 04/06/24.
//

import UIKit

class IncomingTextMessageTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: IncomingTextMessageTableViewCell.self)
    
    lazy var contactMessageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    lazy var messageLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        transform = CGAffineTransform(scaleX: 1, y: -1)
//        selectionStyle = .none
        backgroundColor = UIColor.white
        addElements()
        configConstrants()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
       addSubview(contactMessageView)
        contactMessageView.addSubview(messageLabel)
    }
    
    private func configConstrants() {
        NSLayoutConstraint.activate([
            contactMessageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contactMessageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            contactMessageView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            messageLabel.leadingAnchor.constraint(equalTo: contactMessageView.leadingAnchor, constant: 15),
            messageLabel.topAnchor.constraint(equalTo: contactMessageView.topAnchor, constant: 15),
            messageLabel.bottomAnchor.constraint(equalTo: contactMessageView.bottomAnchor, constant: -15),
            messageLabel.trailingAnchor.constraint(equalTo: contactMessageView.trailingAnchor, constant: -15),
        ])
    }
    
    public func setupCell(data: Message) {
        messageLabel.text = data.message
    }
}



