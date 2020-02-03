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
    let callbackHandler = "callbackHandler"
    
    //MARK: override ---------------------------------------------
    override func loadView() {
        super.loadView()
        interectionWithJS()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlRequest()
    }


    //MARK: function ---------------------------------------------
    func interectionWithJS() {
        let contentController = WKUserContentController()
        let config = WKWebViewConfiguration()
        
        let userScript = WKUserScript(source: "redHeader()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(userScript)
        
        contentController.add(self, name: callbackHandler)
        
        config.userContentController = contentController
        
        webView = WKWebView(frame: self.view.frame, configuration: config)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        // 뷰 만들어주기
        self.view = self.webView
    }
    
    func urlRequest() {
        guard let url = Bundle.main.url(forResource: "webViewTest", withExtension: "html") else { return }
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        print(request)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let othertAction = UIAlertAction(title: "OK", style: .default, handler: {action in completionHandler()})
        alert.addAction(othertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == callbackHandler {
            print(message.body)
            abc()
        }
    }
    
    func abc() {
        print("abc call")
    }
    
}

