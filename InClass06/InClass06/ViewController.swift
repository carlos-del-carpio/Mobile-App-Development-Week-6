//
//  ViewController.swift
//  InClass06
//
//  Created by Carlos Del Carpio on 10/12/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var personTableView: UITableView!
    var tableData : [User] = DataInfo.users


    override func viewDidLoad() {
        super.viewDidLoad()
        let cell = UINib(nibName: "PersonTableViewCell", bundle: nil)
        personTableView.register(cell, forCellReuseIdentifier: "personCell")
    }


    @IBAction func sortButtonPressed(_ sender: Any) { sortAlert() }


    @IBAction func filterButtonPressed(_ sender: Any) { filterAlert() }
}


extension ViewController : UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection: Int) -> Int{
        return tableData.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = personTableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonTableViewCell
        let user = tableData[indexPath.row]

        cell.nameOutput.text = user.name
        cell.stateOutput.text = user.state
        cell.ageOutput.text = String(format: "%.0f", user.age!)
        cell.relationshipOutput.text = user.group
        cell.userImage.image = (user.gender == "Female") ? UIImage(named: "avatar_female") :
                                                           UIImage(named: "avatar_male")


        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


extension ViewController {
    func sortAlert() {
        let alert = UIAlertController(title: "Sort By", message: "Pick an option to sort users by", preferredStyle: .actionSheet)

        let nameSort = UIAlertAction(title: "Name", style: .default) {_ in
            self.tableData = self.tableData.sorted(by: {$0.name! < $1.name!})
            self.personTableView.reloadData()
        }

        let ageSort = UIAlertAction(title: "Age", style: .default) {_ in
            self.tableData = self.tableData.sorted(by: {$0.age! < $1.age!})
            self.personTableView.reloadData()
        }

        let stateSort = UIAlertAction(title: "State", style: .default) {_ in
            self.tableData = self.tableData.sorted(by: {$0.state! < $1.state!})
            self.personTableView.reloadData()
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel)


        alert.addAction(nameSort)
        alert.addAction(ageSort)
        alert.addAction(stateSort)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}


extension ViewController {
    func filterAlert() {
        let alert = UIAlertController(title: "Filter By", message: "Pick an option to filter users by", preferredStyle: .actionSheet)
        
        let genderFemaleFilter = UIAlertAction(title: "Gender : Female", style: .default) {_ in
            self.tableData = self.tableData.filter({ $0.gender == "Female"})
            self.personTableView.reloadData()
        }

        let genderMaleFilter = UIAlertAction(title: "Gender : Male", style: .default) {_ in
            self.tableData = self.tableData.filter({ $0.gender == "Male"})
            self.personTableView.reloadData()
        }

        let showAllFilter = UIAlertAction(title: "Show All", style: .default) {_ in
            self.tableData = DataInfo.users
            self.personTableView.reloadData()
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel)


        alert.addAction(genderFemaleFilter)
        alert.addAction(genderMaleFilter)
        alert.addAction(showAllFilter)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}
