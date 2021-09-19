//
//  WebViewController.swift
//  myflix
//
//  Created by Luu, Loc on 9/17/21.
//

import UIKit
import WebKit
class WebViewController: UIViewController , WKUIDelegate{
    var webView: WKWebView!
    var videos = [[String:Any]]()

    override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            view = webView
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      print("Hi")
        print(videos.count)
        for i in videos{
            let type = i["type"]!
            if type as! String == "Trailer"{
               // let key = i["key"]!
                let myURL = URL(string:"https://www.youtube.com/watch?v=\(i["key"]!)")
                let myRequest = URLRequest(url: myURL!)
                webView.load(myRequest)
                break
            }
            else{
                let myURL = URL(string:"https://www.youtube.com/")
                let myRequest = URLRequest(url: myURL!)
                webView.load(myRequest)
            }
        }
       // let key = videos[0]["type"] as! String
       // let tupleArray: [(String, Any)] = videos.flatMap { $0 }
      //  let dictonary = Dictionary(tupleArray, uniquingKeysWith: { (first, last) in last })
        //print(dictonary)
        
        //print(key)
       // let myURL = URL(string:"https://www.youtube.com/watch?v=\(dictonary["key"]!)")
            //    let myRequest = URLRequest(url: myURL!)
             //   webView.load(myRequest)
        /*
        goback.addTarget(self, action: #selector(self.onClick(sender:)), for: .touchUpInside)
         */
        // Do any additional setup after loading the view.
    }
    
    
    /*
    @objc func onClick(sender: UIButton!){
        dismiss(animated: true, completion: nil)
    }
           
*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
