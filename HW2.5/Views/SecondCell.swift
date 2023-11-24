//
//  SecondCell.swift
//  HW2.5
//
//  Created by Alexey Manokhin on 22.11.2023.
//


import UIKit

final class SecondCell: UITableViewCell {
    
    static let id = "secondCell"
    
    var buttonAction: (() -> Void)?
    
    lazy var photoImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    lazy var cellTextLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sendMessageButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Написать", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [photoImageView, 
         cellTextLabel,
         sendMessageButton].forEach{ addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = photoImageView.bounds.width / 2
    }
    
    func configure(movie: Movie, action: @escaping () -> Void) -> UITableViewCell {
        cellTextLabel.text = movie.name
        photoImageView.image = UIImage(named: movie.poster)
        buttonAction = action
        sendMessageButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return self
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: 77),
            photoImageView.heightAnchor.constraint(equalToConstant: 77),
            
            cellTextLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 16),
            cellTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            sendMessageButton.leadingAnchor.constraint(equalTo: cellTextLabel.trailingAnchor, constant: 16),
            sendMessageButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            sendMessageButton.widthAnchor.constraint(equalToConstant: 80),
            sendMessageButton.heightAnchor.constraint(equalToConstant: 30),
            sendMessageButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    @objc func buttonTapped() {
           buttonAction?()
       }
}
