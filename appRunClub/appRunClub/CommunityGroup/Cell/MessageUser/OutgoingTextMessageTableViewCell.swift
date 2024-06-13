//
//  OutgoingTextMessageTableViewCell.swift
//  appRunClub
//
//  Created by Nathalia Neves on 04/06/24.
//

import UIKit

class OutgoingTextMessageTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: OutgoingTextMessageTableViewCell.self)
    
    lazy var myMessageView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 82/255, green: 183/255, blue: 136/255, alpha: 0.9)
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
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
        addSubview(myMessageView)
        myMessageView.addSubview(messageLabel)
    }
    
    private func configConstrants() {
        NSLayoutConstraint.activate([
        
            myMessageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            myMessageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            myMessageView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            messageLabel.leadingAnchor.constraint(equalTo: myMessageView.leadingAnchor, constant: 15),
            messageLabel.topAnchor.constraint(equalTo: myMessageView.topAnchor, constant: 15),
            messageLabel.bottomAnchor.constraint(equalTo: myMessageView.bottomAnchor, constant: -15),
            messageLabel.trailingAnchor.constraint(equalTo: myMessageView.trailingAnchor, constant: -15)
        ])
    }
    
    public func setupCell(data: Message) {
        messageLabel.text = data.message
    }
}
