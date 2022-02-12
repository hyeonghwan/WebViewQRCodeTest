//
//  ViewController.swift
//  WebViewQRCodeTest
//
//  Created by 박형환 on 2022/02/12.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var qrCodeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        qrCodeBtn.layer.cornerRadius = 3.0
        qrCodeBtn.layer.borderColor = UIColor.black.cgColor
        qrCodeBtn.layer.borderWidth = 3
        qrCodeBtn.addTarget(self, action: #selector(qrcodeRederLaunch), for: .touchUpInside)
        
        let url = URL(string: "https://naver.com")
        let request = URLRequest(url: url!)
        self.webView.load(request)
        
    }
    @objc fileprivate func qrcodeRederLaunch() {
        
    }


}

