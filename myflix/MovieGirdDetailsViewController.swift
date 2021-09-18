//
//  MovieGirdDetailsViewController.swift
//  myflix
//
//  Created by Luu, Loc on 9/17/21.
//

import UIKit

class MovieGirdDetailsViewController: UIViewController {
    var movie : [String:Any]!
    var videos = [[String:Any]]()
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sysnopsisLabel:
        UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print(movie["title"])
        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        sysnopsisLabel.text = movie["overview"] as? String
        sysnopsisLabel.sizeToFit()
        dateLabel.text = movie["release_date"] as? String
        dateLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185/"
        guard let postePpath = movie["poster_path"] as? String else {
            print("problem getting path/URL")
            return }
        let posterUrl = URL(string: baseUrl + postePpath)

        posterView.af.setImage(withURL: posterUrl!)
        //use guard to handle the nil
        guard let backdropPpath = movie["backdrop_path"] as? String else { return }
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780/" + backdropPpath)
                
        backdropView.af.setImage(withURL: backdropUrl!)
        
        
    // click to uiimageviwe
        let singleTap = UITapGestureRecognizer(target: self,action:Selector("imageTapped"))
        
        var id = movie["id"] as! Int
        print("this is movie id")
        print(id)
        let idString = "\(id)"
        let url = URL(string: "https://api.themoviedb.org/3/movie/" + idString + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.videos = dataDictionary["results"] as! [[String:Any]]
                //let key = videos["key"] as! String
               // print(self.videos)
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                
               
             }
        }
        task.resume()
        posterView.isUserInteractionEnabled = true
        posterView.addGestureRecognizer(singleTap)
        
  
    }
    //for show imageTapp
    @objc func imageTapped() {
        performSegue(withIdentifier: "firstSegue", sender: nil)
        
    }
//pass data to the webview contonller

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //find the selected movie
        var WebViewController = segue.destination as! WebViewController
        WebViewController.videos = self.videos
        print("hihi")
       
        //let indexPath = UIImageView.
        //let movie = movies[indexPath.row]

            
            // pass the selected movie to the details view controller

    }


}
