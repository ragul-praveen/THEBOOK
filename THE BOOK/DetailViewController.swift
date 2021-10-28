//
//  DetailViewController.swift
//  THE BOOK
//
//  Created by Srikanth Vemana on 28/10/21.
//

import UIKit

@available(iOS 13.0, *)
class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier:"Cell", for: indexPath) as! DetailsTableViewCell
        cell.namelabel.text = bookArray[indexPath.row].name
        cell.authorlabel.text = bookArray[indexPath.row].author
        cell.idlabel.text = bookArray[indexPath.row].id
        cell.finelabel.text = bookArray[indexPath.row].lfine
        cell.isslabel.text = bookArray[indexPath.row].to
        cell.returnonlabel.text = bookArray[indexPath.row].on
        cell.issuenolabel.text = bookArray[indexPath.row].returns
        cell.finedetail.text = bookArray[indexPath.row].dfine
        cell.editbtn.tag = indexPath.row
        cell.editbtn.addTarget(self, action:#selector(editActionTapped(_:)), for: UIControl.Event.touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            if #available(iOS 13.0, *) {
                bookArray = SaveCoreData.share_instance.deleteDataFromCoreData(index:indexPath.row, user:bookArray)
            } else {
                // Fallback on earlier versions
            }
            tableview.reloadData()
            
            
        }
    }

    @IBOutlet weak var tableview: UITableView!
    var selectedBook = String()
    var bookArray = [Books]()
    var selectedTag = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchTheJewelData()
    }
    
    func fetchTheJewelData(){
        if selectedTag == 100{
            if #available(iOS 13.0, *) {
                bookArray =   SaveCoreData.share_instance.getAllTheData()
            } else {
                // Fallback on earlier versions
            }
        }else{
            if #available(iOS 13.0, *) {
                bookArray =   SaveCoreData.share_instance.getTheFilteredBookData(selectedCategory:selectedBook)
            } else {
                // Fallback on earlier versions
            }
        }
        tableview.reloadData()
    }
    @IBAction func addbtn(_ sender: Any) {
        let nextvc = self.storyboard?.instantiateViewController(withIdentifier: "ADDdetailsViewController")as! ADDdetailsViewController
        nextvc.selectedBook = selectedBook
        self.navigationController?.pushViewController(nextvc, animated: true)
    }
    
    @IBAction func editActionTapped(_ sender: Any) {
        let nextvc = self.storyboard?.instantiateViewController(withIdentifier: "UpdateviewViewController")as! UpdateviewViewController
        nextvc.currentBookSelection = bookArray[(sender as AnyObject).tag]

        self.navigationController?.pushViewController(nextvc, animated: true)
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homebtn(_ sender: Any) {
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
