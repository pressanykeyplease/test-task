//
//  TableViewController.swift
//  TestWork
//
//  Created by Елизавета Котлова on 12.02.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var information: [DataElement] = []
    var order: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInformation { information in
            self.information = information?.data ?? []
            self.order = information?.view ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = order[indexPath.row]
        cell.detailTextLabel?.text = nil
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let index = information.firstIndex(where: { $0.name == order[indexPath.row] }) else {
            return
        }
        let selectedObject = information[index]
        showAlert(type: selectedObject.name, text: selectedObject.data.text ?? "", url: selectedObject.data.url ?? "", selectedID: selectedObject.data.selectedID ?? 0)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func showAlert(type: String, text: String, url: String, selectedID: Int) {
        let alert = UIAlertController(title: type, message: "text: \(text)\nurl: \(url)\nselectedID: \(selectedID)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        parent?.present(alert, animated: true, completion: nil)
    }


}
