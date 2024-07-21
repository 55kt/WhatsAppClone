//
//  MessageListController.swift
//  WhatsAppClone
//
//  Created by Vlad on 20/7/24.
//

import Foundation
import UIKit
import SwiftUI

final class MessageListController: UIViewController {
    
    // MARK: - View`s LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Properties
    private let cellIdentifier = "MessageListControllerCells"
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    } ()
    
    // MARK: - Methods
    private func setUpViews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
}

extension MessageListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        let message = MessageItem.stubMessages[indexPath.row]
        
        cell.contentConfiguration = UIHostingConfiguration {
            switch message.type {
            case .text:
                BubbleTextView(item: message)
            case .video, .photo:
                BubbleImageView(item: message)
            case .audio:
                BubbleAudioView(item: message)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageItem.stubMessages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

// MARK: - Preview
#Preview {
    MessageListView()
}

