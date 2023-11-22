//
//  TableViewController.swift
//  HW2.5
//
//  Created by Alexey Manokhin on 22.11.2023.
//

import UIKit

final class TableViewController: UITableViewController {
    private let movies = Movie.getUsers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInsetGroupedStyle()
        setupNavigationController()
        registerCells()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: FirstCell.id, for: indexPath
            )
            guard let cell = cell as? FirstCell else { return UITableViewCell() }
            let movie = movies[indexPath.row]
            cell.cellTextLabel.text = movie.name
            cell.photoImageView.image = UIImage(named: movie.poster)
            cell.secondCellTextLabel.text = movie.releaseDate
            return cell
        default:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SecondCell.id, for: indexPath
            )
            guard let cell = cell as? SecondCell else { return UITableViewCell() }
            let movie = movies[indexPath.row]
            cell.cellTextLabel.text = movie.name
            cell.photoImageView.image = UIImage(named: movie.poster)
            cell.showDetailButton.addTarget(
                self, action: #selector(buttonAction),
                for: .touchUpInside
            )
            cell.contentView.addSubview(cell.showDetailButton)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ? 60 : 96
    }
    
    @objc func buttonAction() {
        let alert = getAlert(
            title: nil,
            message: "Письмо отправлено", 
            preferredStyle: .alert
        )
        
        let timer = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: false) { [weak self] timer in
                self?.present(alert, animated: true)
            }
        RunLoop.current.add(timer, forMode: .common)
    }
}

private extension TableViewController {
    func registerCells() {
        tableView.register(
            FirstCell.self, forCellReuseIdentifier: FirstCell.id)
        tableView.register(
            SecondCell.self, forCellReuseIdentifier: SecondCell.id)
    }
    
    func setupNavigationController() {
        navigationController?.title = "Список фильмов"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setInsetGroupedStyle() {
        tableView = UITableView(frame: tableView.frame, style: .insetGrouped)
    }
    
    func getAlert(title: String?, message: String, preferredStyle: UIAlertController.Style) -> UIAlertController {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: preferredStyle
        )
        let action = UIAlertAction(
            title: "OK",
            style: .default
        )
        alert.addAction(action)
        return alert
    }
}
