//
//  ViewController.swift
//  city
//
//  Created by 刘海宝 on 15/1/2.
//  Copyright (c) 2015年 刘海宝. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    
    //var webViews: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var frame = view.bounds
        frame.origin.y = UIApplication.sharedApplication().statusBarFrame.height
        frame.size.height -= frame.origin.y
        
        let webView = UIWebView(frame: frame)
        webView.delegate = self
        webView.scalesPageToFit = true
        view.addSubview(webView)
        
        let url = NSURL(string:"http://www.yuxian.me")
        let request = NSURLRequest(URL:url!)
        
        webView.loadRequest(request)
        
        view.addSubview(webView)
        /***
        self.webViews = UIWebView()
    
        webViews.frame = view.bounds
        
        let url = NSURL(string: "http://www.yuxian.me")
        let request = NSURLRequest(URL: url!)
        webViews.loadRequest(request)
        view.addSubview(webViews)**/

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    //UI web view delegate
    func webViewDidStartLoad(webView: UIWebView!){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(webView: UIWebView!){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    func webView(webView: UIWebView!, didFailLoadWithError error: NSError!){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
}

