
import Foundation
import UIKit
import CoreData


class DataController {
    
    class func jsonAsUSDAIdAndNameSearchResults (json : NSDictionary) -> [ (name:String, idValue:String) ] {
        
        var usdaItemsSearchResults : [(name:String, idValue:String)] = []
        var searchResult : (name:String, idValue:String)
        
        if json["hits"] != nil {
            
            let results:[AnyObject] = json["hits"]! as! [AnyObject]
            
            for itemDictionary in results {

                if itemDictionary["_id"] != nil {
                    if itemDictionary["fields"] != nil {
                        let fieldsDictionary = itemDictionary["fields"] as! NSDictionary
                        
                        if itemDictionary["item_name"] != nil {
                            let idValue:String = itemDictionary["_id"] as! String
                            let name:String = fieldsDictionary["item_name"] as! String
                            
                            searchResult = (name: name, idValue: idValue)
                            
                            usdaItemsSearchResults += [searchResult]
                        }
                    }
                }
                
            }
        
        }
        
        return usdaItemsSearchResults

    }
    
    
    func saveUSDAItemForId(idValue:String, json:NSDictionary) {
        
        if json["hits"] != nil {
            let results:[AnyObject] = json["hits"]! as! [AnyObject]
            
            for itemDictionary in results {
                if itemDictionary["_id"] != nil && itemDictionary["_id"] as! String == idValue {
                    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
                    
                    var requestForUSDAItem = NSFetchRequest(entityName: "USDAItem")
                    
                    let itemDictionaryId = itemDictionary["_id"]! as! String
                    let predicate = NSPredicate(format: "idValue == %@", itemDictionaryId)
                    requestForUSDAItem.predicate = predicate
                    
                    var error: NSError?
                    var items = managedObjectContext?.executeFetchRequest(requestForUSDAItem, error: &error)
//                    var count = managedObjectContext?.countForFetchRequest(requestForUSDAItem, error: &error)
                   
                    if items?.count != 0 {
//                        item is already saved
                        return
                    }
                    else {
                        print("Lets save this to CoreData!")
                    }
                    
                }
            }
        }
        
    }
    
    
    
}