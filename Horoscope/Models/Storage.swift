//
//  Storage.swift
//  Horoscope
//
//  Created by Roman on 14.01.2021.
//

import RealmSwift
// делаем модель хранения данных как класс, с типом данных Object


class Storage: Object {
    
    // данные которые мы храним
    @objc dynamic var name: String = ""
 

    
    // вспомогательный инициализатор (не является обязательным), с помощью него вносим новые значения в базу
    convenience init(name: String){
        self.init() //  сначала инициализируется обычный инициализатор а после присваиваем новые значения
        self.name = name

    }
    
    
}


