//
//  Cell.swift
//  HW2.5
//
//  Created by Alexey Manokhin on 22.11.2023.
//

import UIKit

final class Cell: UITableViewCell {
    
    static let id = "cell"
    
    lazy var photoImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    lazy var cellTextLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var secondCellTextLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [photoImageView, cellTextLabel, secondCellTextLabel].forEach{ addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
        photoImageView.clipsToBounds = true
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: 41),
            photoImageView.heightAnchor.constraint(equalToConstant: 41),
            
            cellTextLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 16),
            cellTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            secondCellTextLabel.leadingAnchor.constraint(equalTo: cellTextLabel.trailingAnchor, constant: 16),
            secondCellTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            secondCellTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
