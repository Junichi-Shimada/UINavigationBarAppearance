//
//  ViewController.swift
//  UINavigationBarAppearance
//
//  Created by shimada.junichi on 2021/09/15.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.setup()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let path: String = Bundle.main.path(forResource: "index", ofType: "html") else {
            fatalError()
        }
        let myURL = URL(fileURLWithPath: path, isDirectory: false)
        self.webView.loadFileURL(myURL, allowingReadAccessTo: myURL)
    }

    func setup() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
}

extension ViewController: WKUIDelegate {
}

extension ViewController: WKNavigationDelegate {
}
