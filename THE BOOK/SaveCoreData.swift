import Foundation
import CoreData
import UIKit

var saveTheCommonUser = String()
var saveTheCommonEmail = String()
@available(iOS 13.0, *)
@available(iOS 13.0, *)
class SaveCoreData:NSObject{
    
static var share_instance = SaveCoreData()
let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    
func saveDataInCoreData(object:[String:AnyObject])-> Bool{
    let books = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context!) as! Books
    
    books.name = object["name"] as? String
    books.author = object["author"] as? String
    books.id = object["id"] as? String
    books.lfine = object["lfine"] as? String
    books.to = object["to"] as? String
    books.on = object["on"] as? String
    books.returns = object["returns"] as? String
    books.dfine = object["dfine"] as? String
    books.maincategory = object["maincategory"] as? String
    do{
        try context?.save()
        print("data is  save")
        return true
    }catch{
        print("data is not save")
        return false
    }
}


//    func getTheFilteredLaundryData(email:String,laundryStatus:String)-> [Laundry]{
//        var laundry = [Laundry]()
//        let fetchrequest = NSFetchRequest<NSManagedObject>(entityName: "Laundry")
//
////        fetchrequest.predicate = NSPredicate(format: "maincategory == %@",selectedCategory)
//
//        let converstationKeyPredicate = NSPredicate(format: "email = %@",email)
//        let messageKeyPredicate = NSPredicate(format:"laundryStatus = %@", laundryStatus)
//        let andPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [converstationKeyPredicate, messageKeyPredicate])
//        fetchrequest.predicate = andPredicate
//
//
//        do{
//            laundry = try context?.fetch(fetchrequest)as![Laundry]
//        }catch{
//            print("cannot get data")
//        }
//        return laundry
//    }

    func getTheFilteredBookData(selectedCategory:String)-> [Books]{
        var books = [Books]()
        let fetchrequest = NSFetchRequest<NSManagedObject>(entityName: "Books")
        fetchrequest.predicate = NSPredicate(format: "maincategory == %@",selectedCategory)
        do{
            books = try context?.fetch(fetchrequest)as![Books]
        }catch{
            print("cannot get data")
        }
        return books
    }


    func getAllTheData()-> [Books]{
        var books = [Books]()
        let fetchrequest = NSFetchRequest<NSManagedObject>(entityName: "Books")
        do{
            books = try context?.fetch(fetchrequest)as![Books]
        }catch{
            print("cannot get data")
        }
        return books
    }

    func deleteDataFromCoreData(index: NSInteger,user:[Books]) -> [Books]{
        var newuser = user
        context?.delete(newuser[index])
        newuser.remove(at: index)
        do{
            try context?.save()
        }
        catch{
            print("cannot delete data")
        }
        return newuser
    }
    
    
    
    func toastMessage(_ message: String){
        guard let window = UIApplication.shared.keyWindow else {return}
        let messageLbl = UILabel()
        messageLbl.text = message
        messageLbl.textAlignment = .center
        messageLbl.font = UIFont.systemFont(ofSize: 12)
        messageLbl.textColor = .white
        messageLbl.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let textSize:CGSize = messageLbl.intrinsicContentSize
        let labelWidth = min(textSize.width, window.frame.width - 40)
        
        messageLbl.frame = CGRect(x: 20, y: window.frame.height - 90, width: labelWidth + 30, height: textSize.height + 20)
        messageLbl.center.x = window.center.x
        messageLbl.layer.cornerRadius = messageLbl.frame.height/2
        messageLbl.layer.masksToBounds = true
        window.addSubview(messageLbl)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            UIView.animate(withDuration: 2, animations: {
                messageLbl.alpha = 0
            }) { (_) in
                messageLbl.removeFromSuperview()
            }
        }
    }
    
    
    
    func updateTheBookValues(object:[String:AnyObject], predicate: String,subpredicate:String)-> Bool{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }

        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext


        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Books")
        //fetchRequest.predicate = NSPredicate(format: "category = %@", predicate)
        let converstationKeyPredicate = NSPredicate(format: "maincategory = %@",predicate)
        let messageKeyPredicate = NSPredicate(format:"name = %@", subpredicate)
        let andPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [converstationKeyPredicate, messageKeyPredicate])
        fetchRequest.predicate = andPredicate


        let updatename = object["name"]
        let updateid = object["id"]
        let updateauthor = object["author"]
        let updatelfine = object["lfine"]
        let updateto = object["to"]
        
        let updateon = object["on"]
        let updatereturn = object["returns"]
        let updatedfine = object["dfine"]
        

        do
        {
            let test = try managedContext.fetch(fetchRequest)
           let objectUpdate = test[0] as! NSManagedObject

            objectUpdate.setValue(updatename, forKey: "name")
            objectUpdate.setValue(updateid, forKey: "id")
            objectUpdate.setValue(updateauthor, forKey: "author")
            objectUpdate.setValue(updatelfine, forKey: "lfine")
            objectUpdate.setValue(updateto, forKey: "to")

            objectUpdate.setValue(updateon, forKey: "on")
            objectUpdate.setValue(updatereturn, forKey: "returns")
            objectUpdate.setValue(updatedfine, forKey: "dfine")
            
            do{
                try context!.save()
                return true
            }
            catch
            {
                print(error)
                return false
            }
        }
        catch
        {
            print(error)
            return false
        }
    }
}
