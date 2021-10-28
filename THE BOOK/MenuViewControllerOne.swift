//
//  MenuViewControllerOne.swift
//  DriveIn
//
//  Created by Srikanth Vemana on 01/04/20.
//  Copyright © 2020 Adaptteq. All rights reserved.
//

import UIKit
//import FBSDKLoginKit
//import GoogleSignIn
protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}


class MenuViewControllerOne: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var closeoverlay: UIButton!
    
    var btnmenu : UIButton!
    var delegate : SlideMenuDelegate?
    
    let animals: [String] = ["Start", "Check ALL","About us", "Share APP", "Rate Us"]
    //var items: [String] = ["ic_profile","ic_home","ic_addressbook","ic_history","ic_signout"]
  //  let devCousesImages = [UIImage(named: "ic_profile"), UIImage(named: "ic_home"), UIImage(named: "ic_password"), UIImage(named: "ic_history"), UIImage(named: "ic_signout")]
    override func viewDidLoad() {
        super.viewDidLoad()
      addSlideMenuButton()
         tableview.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    // number of rows in table view
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.animals.count
       }

       // create a cell for each table view row
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuSideTableViewCell
           cell.lblname?.text = self.animals[indexPath.row]
        //cell.newimage?.image = UIImage(named:self.items[indexPath.row])

           return cell
       }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Your Code Here...
        self.navigationController?.isNavigationBarHidden = false
    }
    @IBAction func closeoverlaybtn(_ button:UIButton!) {
        btnmenu.tag = 0
               
               if (self.delegate != nil) {
                   var index = Int32(button.tag)
                   if(button == self.closeoverlay){
                       index = -1
                   }
                   delegate?.slideMenuItemSelectedAtIndex(index)
               }
               
               UIView.animate(withDuration: 0.3, animations: { () -> Void in
                   self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                   self.view.layoutIfNeeded()
                   self.view.backgroundColor = UIColor.clear
                   }, completion: { (finished) -> Void in
                       self.view.removeFromSuperview()
                    self.removeFromParent()
               })
    }
    
    
    
       // method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              tableView.deselectRow(at: indexPath, animated: true)
              switch indexPath.row {
              case 0:
                  let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                         let VC: categoryViewController = storyboard.instantiateViewController(withIdentifier: "categoryViewController") as! categoryViewController
                                         self.navigationController?.pushViewController(VC, animated: true)
              
              default:
                  break
              }
          }
//   func logoutTapped()
//       {
//        let loginManager = LoginManager()
//           loginManager.logOut()
//           print("facebook loggedout")
//           
//           GIDSignIn.sharedInstance().signOut()
//           
//           UserDefaults.standard.set(nil, forKey: "login")
//           UserDefaults.standard.set(nil, forKey: "user-id")
//           UserDefaults.standard.set(nil, forKey: "bill_no")
//           
//         let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let VC: NewloginViewController = storyboard.instantiateViewController(withIdentifier: "NewloginViewController") as! NewloginViewController
//        navigationController?.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(VC, animated: true)
//
//           UserDefaults.standard.set("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.MQ.2B3oIX_GG4LkqLXeEkD4_Sy1wpJDOmKgGpQy2Gtue7U", forKey: "user-id")
//           UserDefaults.standard.set("CommingFromSkip", forKey: "Skip")
//           
//       }

}
