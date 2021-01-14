//
//  HoroscopeViewController.swift
//  Horoscope
//
//  Created by Roman on 14.01.2021.
//

import UIKit

class HoroscopeViewController: UIViewController {
    var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()

        presentTutorial()
        
        
    }
    

    func presentTutorial(){
        let VC = TutorialViewController()
        VC.modalPresentationStyle = .overCurrentContext
        VC.view.backgroundColor = .red
        self.present(VC, animated: true, completion: nil)
    }
}
