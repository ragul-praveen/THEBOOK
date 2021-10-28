//
//  categoryViewController.swift
//  THE BOOK
//
//  Created by Srikanth Vemana on 28/10/21.
//

import UIKit

class categoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! categoryTableViewCell
        cell.categoryname.text = data[indexPath.row]
        return cell
    }
    
    var data = ["NonFiction Books","Fiction Books","Food","History","Memoir","Politics","Self-Help","Young Adult","Others"]
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Category";
        self.navigationController?.isNavigationBarHidden = true
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func homebtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
                if (indexPath.row == 0 ){
                            nextVC.selectedBook = "1"
                        }else if(indexPath.row == 1){
                            nextVC.selectedBook = "2"
                        }else if(indexPath.row == 2){
                            nextVC.selectedBook = "3"
                        }else if(indexPath.row == 3){
                            nextVC.selectedBook = "4"
                        }else if(indexPath.row == 4){
                            nextVC.selectedBook = "5"
                        }else if(indexPath.row == 5){
                            nextVC.selectedBook = "6"
                        }else if(indexPath.row == 6){
                            nextVC.selectedBook = "7"
                        }else if(indexPath.row == 7){
                            nextVC.selectedBook = "8"
                        }else if(indexPath.row == 8){
                            nextVC.selectedBook = "9"
                        }else if(indexPath.row == 9){
                            nextVC.selectedBook = "10"
                        }else if(indexPath.row == 10){
                            nextVC.selectedBook = "11"
                        }else if(indexPath.row == 11){
                            nextVC.selectedBook = "12"
                        }
        
                        self.navigationController?.pushViewController(nextVC, animated:true)
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
