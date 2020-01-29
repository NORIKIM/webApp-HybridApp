//
//  ViewController.swift
//  WebView
//
//  Created by 김지나 on 2020/01/29.
//  Copyright © 2020 김지나. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    let url = "webViewTest.html"
    
    let contenController = WKUserContentController()
    let config = WKWebViewConfiguration()
    
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: self.view.frame, configuration: config)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }


    //MARK: function
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //
    }
}

