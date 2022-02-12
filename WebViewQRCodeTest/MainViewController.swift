//
//  MainViewController.swift
//  WebViewTest
//
//  Created by 박형환 on 2022/02/12.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.button.addTarget(self, action: #selector(webViewBtnClicked), for: .touchUpInside)
        
    }
    @objc fileprivate func webViewBtnClicked() {
        let vcID = String(describing: ViewController.self)
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: vcID) else {return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
