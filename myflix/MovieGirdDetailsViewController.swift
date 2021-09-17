//
//  MovieGirdDetailsViewController.swift
//  myflix
//
//  Created by Luu, Loc on 9/17/21.
//

import UIKit

class MovieGirdDetailsViewController: UIViewController {
    var movie : [String:Any]!
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sysnopsisLabel: UILabel!
    
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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
