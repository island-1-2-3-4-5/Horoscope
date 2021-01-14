//
//  HoroscopeViewController.swift
//  Horoscope
//
//  Created by Roman on 14.01.2021.
//

import UIKit

class HoroscopeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.presentTutorial()
        
        view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        button.addTarget(self, action: #selector(push), for: .touchUpInside)
    }
    let button: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PUSH", for: .normal)
        button.setTitleColor(.black, for: .normal)

        return button
    }()
    
    @objc func push() {
        guard let navigator = self.navigationController else {return}
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.exitViewController = navigator
        navigator.pushViewController(HoroscopeTabBar(), animated: false)
    }

    func presentTutorial(){
        let VC = TutorialViewController()
        VC.modalPresentationStyle = .overCurrentContext
        VC.view.backgroundColor = .red
        self.present(VC, animated: true, completion: nil)
    }
}
