//
//  StorageManager.swift
//  Horoscope
//
//  Created by Roman on 14.01.2021.
//

import RealmSwift

let realm = try! Realm()


// тут мы либо сохранияем либо удаляем из базы объекты
class StorageManager {
    
    // необходимо лишь вызвать этот метод
    static func saveObject(_ storage: Storage){
        
        try! realm.write{
            realm.add(storage)
        }
    }
    
    static func deleteObject(_ storage: Storage) {
        try! realm.write {
            realm.delete(storage)
        }
    }

}
