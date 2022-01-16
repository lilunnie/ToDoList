//
//  ViewController.swift
//  TableView
//
//  Created by Imane Fadel on 22/11/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var toDo = [ToDo]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellContent", for: indexPath) as! TableViewCell
        cell.Title.text = toDo[indexPath.row].name
        if toDo[indexPath.row].status == "À faire" {
            cell.SwitchStatus.isOn = false
        }
        else {
            cell.SwitchStatus.isOn = true
        }
        cell.SwitchStatus.tag = indexPath.row
        return cell
    }
    
    
    @IBAction func changeStatus(_ sender: UISwitch) {
        if sender.isOn {
            toDo[sender.tag].status = "Fait"
        }
        else{
            toDo[sender.tag].status = "À faire"
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let row = indexPath.row
            toDo.remove(at: row)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? DetailsViewController
        {
            let row = tableView.indexPathForSelectedRow!.row
            vc.toDo = toDo[row]
        }
    }
    @IBAction func unwindToMainView(_ unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "stop" {
            let addViewController = unwindSegue.source as! AddViewController
            addViewController.dismiss(animated: true, completion: nil)
        }
        if unwindSegue.identifier == "save" {
            let addViewController = unwindSegue.source as! AddViewController
            if let textTitle = addViewController.textTitle.text, let textDesc = addViewController.textDesc.text {
                let new_task = ToDo(name: textTitle,
                                    description: textDesc, date: addViewController.textDate.date)
                toDo.append(new_task)
                toDo.sort {
                    (t1: ToDo, t2: ToDo) -> Bool in
                    return t1.date < t2.date
                }
                tableView.reloadData()
            }
        }
        if unwindSegue.identifier == "back"{
            let detailsViewController = unwindSegue.source as! DetailsViewController
            detailsViewController.dismiss(animated: true, completion: nil)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    @IBOutlet weak var tableView: UITableView!
    
}


