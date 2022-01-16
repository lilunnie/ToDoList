//
//  DetailsViewController.swift
//  TableView
//
//  Created by Imane Fadel on 15/12/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var toDo : ToDo?

    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myDesc: UILabel!
    @IBOutlet weak var myDate: UILabel!
    @IBOutlet weak var myStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let task = toDo {
            myTitle.text = task.name
            myDesc.text = task.description
            myDate.text = task.date.description
            myStatus.text = task.status
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
