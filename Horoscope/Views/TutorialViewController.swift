//
//  TutorialViewController.swift
//  Horoscope
//
//  Created by Roman on 14.01.2021.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var slides:[Slide] = []
    let finalPage = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(scrollView)
        scrollView.fillSuperview()

        scrollView.delegate = self
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        setupPageControl()
        setupButtons()
    }
    
    let button = UIButton(frame: .zero)
//    let button1 = UIButton(frame: .zero)
    
    private var pageControl = UIPageControl(frame: .zero)
    private func setupButtons(){
        button.backgroundColor = .clear
        button.setTitle("Далее   ", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false


        let trailing = NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        view.addConstraints([trailing, bottom])
        
        
//        button1.backgroundColor = .clear
//        button1.setTitle("   Подробнее", for: .normal)
//        button1.addTarget(self, action: #selector(buttonAction1), for: .touchUpInside)
//        button1.isHidden = true
//        self.view.addSubview(button1)
//        button1.translatesAutoresizingMaskIntoConstraints = false
//
//
//        let leading1 = NSLayoutConstraint(item: button1, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
//        let bottom1 = NSLayoutConstraint(item: button1, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
//        view.addConstraints([leading1, bottom1])
    }
    func scrollToPage(page: Int, animated: Bool) {
        var frame: CGRect = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(page)
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: animated)
    }
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped1")
        let currentPage = pageControl.currentPage
        if currentPage == finalPage{
            dismiss(animated: true)
            {
                guard let navigator = self.navigationController else {return}
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let transition = CATransition()
                    transition.duration = 0.4
                    transition.type = CATransitionType.moveIn
                    transition.subtype = CATransitionSubtype.fromTop
                    transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.default)
                
                UIApplication.shared.windows.first?.rootViewController?.view.removeFromSuperview()
                      UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: false, completion: nil)
                      UIApplication.shared.windows.first?.layer.add(transition, forKey: kCATransition)
                      UIApplication.shared.windows.first?.rootViewController = HoroscopeTabBar()
                      UIApplication.shared.windows.first?.isHidden = false
                navigator.popToRootViewController(animated: true)
//                appDelegate.exitViewController = navigator
//                navigator.pushViewController(HoroscopeTabBar(), animated: false)
            }
//
        } else {
            scrollToPage(page: pageControl.currentPage + 1, animated: true)
        }
    }
//    @objc func buttonAction1(sender: UIButton!) {
//        print("Button tapped")
//        let VC = self.storyboard!.instantiateViewController(withIdentifier: "FullTutorialViewController") as! FullTutorialViewController
//        VC.modalPresentationStyle = .overCurrentContext
//        VC.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
//        self.present(VC, animated: true, completion: nil)
//    }
    
    
    private func setupPageControl() {
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(0.8)
        
        let leading = NSLayoutConstraint(item: pageControl, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let trailing = NSLayoutConstraint(item: pageControl, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: pageControl, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        
        view.insertSubview(pageControl, at: 0)
        view.bringSubviewToFront(pageControl)
        view.addConstraints([leading, trailing, bottom])
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupSlideScrollView(slides: slides)
    }
   
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Slide()
//        slide1.imageView.image = UIImage(named: "regist_image")
        slide1.set(text: "Проверка")
        slide1.labelDescription.textColor = .white
    
        let slide2:Slide = Slide()
//        slide2.imageView.image = UIImage(named: "Screenshot_2018_11_08_11_23_36_658_com")
        slide2.labelDescription.text = "Шаг 2 \n Получай заявки"
        slide2.labelDescription.textColor = .white
        
        let slide3:Slide = Slide()
//        slide3.imageView.image = UIImage(named: "report_image")
        slide3.labelDescription.text = "Шаг 3 \n Сдавай работу"
        slide3.labelDescription.textColor = .white
        
       
        
        let slides = [slide1, slide2, slide3]
        for i in slides {
            i.imageView.setRounded()
            i.imageView.contentMode = .scaleAspectFit
        }
        
        return slides
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        

        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x <= 0) {
            scrollView.contentOffset.x = -scrollView.contentInset.left
        }
        if(percentOffset.x >= 1) {
            scrollView.contentOffset.x = scrollView.contentSize.width - scrollView.bounds.width + scrollView.contentInset.right
        }
        
        if pageControl.currentPage == finalPage {
//            button1.isHidden = false
            button.setTitle("Приступить   ", for: .normal)
        }
    }
}


extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
}
