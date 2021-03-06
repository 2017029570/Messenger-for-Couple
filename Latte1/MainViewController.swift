//
//  MainViewController.swift
//  Latte1
//
//  Created by 남혜빈 on 2019. 6. 14..
//  Copyright © 2019년 남혜빈. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UITabBarController {
    let myEmail = FirebaseDataService.instance.currentUserEmail?.replacingOccurrences(of: ".", with: "-")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var photo : [String] = []
        var year : [Int] = []
        var month : [Int] = []
        var day : [Int] = []
        
        /*var myUid = FirebaseDataService.instance.currentUserEmail!.replacingOccurrences(of: ".", with: "-")
         let nowUserRef = FirebaseDataService.instance.userRef.child(myUid)
         nowUserRef.observeSingleEvent(of: .value, with: {(snapshot) in
         let values = snapshot.value
         let dic = values as! Dictionary<String, Any>
         
         for index in dic{
         if index.key == "birthday" {
         myBirthDate = index.value
         print(myBirthDate)
         }
         if index.key == "loveday" {
         ourLoveDate = index.value
         print(ourLoveDate)
         }
         }
         })*/
        
        let groupname = FirebaseDataService.instance.userRef.child(myEmail!).child("groups").child("groupname").observeSingleEvent(of: .value, with: {(snapshot) in
            //print(snapshot)
            if let dic = snapshot.value as? String {
                //print(dic)
                let ralbums = FirebaseDataService.instance.groupRef.child(dic).child("albums")
                ralbums.observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    if let dict = snapshot.value as? Dictionary<String, AnyObject> {
                        
                        for (key, _) in dict {
                            ralbums.child(key).observeSingleEvent(of: .value, with:{ (snapshot) in
                                if let dic = snapshot.value as? Dictionary<String, Any> {
                                    
                                    
                                    for(dkey, _) in dic {
                                        if dkey  == "photo" {
                                            ralbums.child(key).child(dkey).observeSingleEvent(of: .value, with: {(snapshot) in
                                                
                                                if let p = snapshot.value as? Array<String> {
                                                    photo = p
                                                    //print(p)
                                                    let nalbum = Album(year: year[0], month: month[0], day: day[0], photo: photo)
                                                    year.remove(at: 0)
                                                    month.remove(at: 0)
                                                    day.remove(at: 0)
                                                    //print(photo[0] as! String)
                                                    albums.append(nalbum)
                                                    //print(albums[albums.count-1])
                                                    //print(photo)*/
                                                }
                                            })
                                            
                                        }
                                        if dkey == "year" {
                                            year.append(dic[dkey] as! Int)
                                        }
                                        if dkey == "month" {
                                            month.append(dic[dkey] as! Int)
                                        }
                                        if dkey == "day" {
                                            day.append(dic[dkey] as! Int)
                                        }
                                    }
                                    
                                }
                                
                            })
                            
                        }
                    }
                    
                })
                
                
                
            }
        })
        
        
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
