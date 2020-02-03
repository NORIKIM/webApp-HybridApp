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
    
    @IBOutlet weak var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        webView = WKWebView(frame: self.view.frame)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = Bundle.main.url(forResource: "webViewTest", withExtension: "html") else { return }
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        print(request)
        webView.load(request)
    }


    //MARK: function
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //
    }
}

