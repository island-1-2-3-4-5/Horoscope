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
        
        
            self.setUpViews()

//        presentTutorial()

        
    }
    
    func setUpViews() {
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = UIColor.orange
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)

        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = UIColor.blue
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        
        let thrirdViewController = UIViewController()
        
        thrirdViewController.view.backgroundColor = UIColor.yellow
        thrirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        
        
        let fourViewController = UIViewController()
        fourViewController.view.backgroundColor = UIColor.yellow
        fourViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 3)
        
        
        let tabBarList = [firstViewController, secondViewController, thrirdViewController, fourViewController]
 
        viewControllers = tabBarList
    }
    
    func presentTutorial(){
        let VC = TutorialViewController()
        VC.modalPresentationStyle = .overCurrentContext
        VC.view.backgroundColor = .red
        self.present(VC, animated: true, completion: nil)
    }

}
