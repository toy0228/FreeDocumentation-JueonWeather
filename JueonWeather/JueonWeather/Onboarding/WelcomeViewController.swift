//
//  WelcomeViewController.swift
//  Onboarding
//
//  Created by William Robersone on 9/29/20.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var holderView: UIView!
    
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    
    private func configure() {
        // setting up scrollview
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        
        let titles = ["See the weather", "Search citys", "Get Started"]
        for x in 0..<3 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            // Include title, image and button
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width - 20, height: 120))
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10+120+10, width: pageView.frame.size.width - 20, height: pageView.frame.size.height - 60 - 130 - 15))
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height - 60, width: pageView.frame.size.width - 20, height: 50))
            
            label.textAlignment = .center
            label.font = UIFont(name: "Optima", size: 32)
            pageView.addSubview(label)
            label.text = titles[x]
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "welcome_\(x+1)")
            pageView.addSubview(imageView)
            
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.setTitle("Continue", for: .normal)
            
            if x == 2 {
                button.setTitle("Get Started", for: .normal)
            }
            button.addTarget(self, action: #selector(didPressButton(_:)), for: .touchUpInside)
            button.tag = x+1
            pageView.addSubview(button)
        }
        
        scrollView.contentSize = CGSize(width: holderView.frame.size.width * 3, height: 0)
        scrollView.isPagingEnabled = true
    }
    
    @objc func didPressButton(_ button: UIButton) {
        guard button.tag < 3 else {
            // dismiss the button
            Core.shared.setIsNotNewUser()
            
            
            let vc = storyboard?.instantiateViewController(identifier: "weatherView") as! WeatherViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)

            return
        }
        // scroll to the next page
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }

}
