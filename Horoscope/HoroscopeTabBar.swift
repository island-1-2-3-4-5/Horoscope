//
//  HoroscopeTabBar.swift
//  Horoscope
//
//  Created by Роман on 21.12.2020.
//

import UIKit

class HoroscopeTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstViewController = UIViewController()
        firstViewController.title = "firstViewController"
        firstViewController.view.backgroundColor = UIColor.orange
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)

        let secondViewController = UIViewController()
        secondViewController.title = "secondViewController"
        secondViewController.view.backgroundColor = UIColor.blue
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        
        let thrirdViewController = UIViewController()
        thrirdViewController.title = "thrirdViewController"
        thrirdViewController.view.backgroundColor = UIColor.yellow
        thrirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        
        
        let tabBarList = [firstViewController, secondViewController, thrirdViewController]
 
        viewControllers = tabBarList
        
        self.selectedIndex = 1
    }
    


}
