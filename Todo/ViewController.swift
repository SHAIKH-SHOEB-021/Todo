//
//  ViewController.swift
//  Todo
//
//  Created by shoeb on 23/01/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var countryTF : UITextField!
    var cData = [CountryData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dh = DatabaseHandler()
        cData = dh.fetchData()
        tableView.reloadData()
    }
    
    @IBAction func addNewData(_ sender: Any) {
        let alertMessage = UIAlertController(title: "Add New Data", message: "Enter Country Name", preferredStyle: .alert)
        let okBTN = UIAlertAction(title: "OK", style: .default) { (action) in
            let newCountryName = self.countryTF.text!
            let dh = DatabaseHandler()
            dh.saveData(cName: newCountryName)
            self.cData = dh.fetchData()
            self.tableView.reloadData()
        }
        let cancelBTN = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel Operation")
        }
        alertMessage.addAction(okBTN)
        alertMessage.addAction(cancelBTN)
        alertMessage.addTextField{ (textField) in
            self.countryTF = textField
            self.countryTF.placeholder = "Enter Country Name"
        }
        self.present(alertMessage, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = cData[indexPath.row].countryname
        return cell
    }
}

