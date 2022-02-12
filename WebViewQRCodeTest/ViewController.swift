//
//  ViewController.swift
//  WebViewQRCodeTest
//
//  Created by 박형환 on 2022/02/12.
//

import UIKit
import WebKit
import AVFoundation
import QRCodeReader

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var qrCodeBtn: UIButton!
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = false
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
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
        // Retrieve the QRCode content
        // By using the delegate pattern
        readerVC.delegate = self

        // Or by using the closure pattern
        readerVC.completionBlock = {  (result: QRCodeReaderResult?) in
           
            guard let result = result else {return}
            guard let resultURL = URL(string: result.value) else {return}
            self.webView.load(URLRequest(url: resultURL))
        }

        // Presents the readerVC as modal form sheet
        readerVC.modalPresentationStyle = .formSheet
       
        present(readerVC, animated: true, completion: nil)
    }
}

//Mark: - QRCodeReaderViewControllerDelegate
extension ViewController: QRCodeReaderViewControllerDelegate{
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()

        dismiss(animated: true, completion: nil)
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()

        dismiss(animated: true, completion: nil)
    }
    
    
    
}
