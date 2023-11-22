//
//  TableViewController.swift
//  HW2.5
//
//  Created by Alexey Manokhin on 22.11.2023.
//

import UIKit

final class TableViewController: UITableViewController {
    let movies = Movie.getUsers()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: tableView.frame, style: .insetGrouped)
        title = "Список фильмов"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.id)
        tableView.register(SecondCell.self, forCellReuseIdentifier: SecondCell.id)
        //tableView.separatorStyle = .none
        
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
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.id, for: indexPath)
            guard let cell = cell as? Cell else { return UITableViewCell() }
            let movie = movies[indexPath.row]
            cell.cellTextLabel.text = movie.name
            cell.photoImageView.image = UIImage(named: movie.poster)
            cell.secondCellTextLabel.text = movie.releaseDate
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: SecondCell.id, for: indexPath)
            guard let cell = cell as? SecondCell else { return UITableViewCell() }
            let movie = movies[indexPath.row]
            cell.cellTextLabel.text = movie.name
            cell.photoImageView.image = UIImage(named: movie.poster)
            cell.showDetailButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            cell.contentView.addSubview(cell.showDetailButton)
            return cell
        }
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func buttonAction() {
        let alert = UIAlertController(title: nil, message: "Письмо отправлено", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            self.present(alert, animated: true)
        }
        RunLoop.current.add(timer, forMode: .common)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ? 60 : 96
    }
}
