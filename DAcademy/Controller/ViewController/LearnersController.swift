//
//  LearnersController.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 29/04/21.
//

import UIKit

class LearnersController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var techCollectionView: UICollectionView!
    @IBOutlet weak var designCollectionView: UICollectionView!
    @IBOutlet weak var domainExpertCollectionView: UICollectionView!
    
    var learnerDatabase = [Learner]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == designCollectionView {
            return 27
        }
        if collectionView == domainExpertCollectionView {
            return 12
        }
        return 72
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let techCell = techCollectionView.dequeueReusableCell(withReuseIdentifier: "techCell", for: indexPath) as! TechCollectionViewCell
        techCell.techLabel.text = "Tech \(indexPath.item)"
        
        if(collectionView == designCollectionView) {
            let designCell = designCollectionView.dequeueReusableCell(withReuseIdentifier: "designCell", for: indexPath) as! DesignCollectionViewCell
            designCell.designLabel.text = "Design \(indexPath.item)"
            
            return designCell
        }
        if(collectionView == domainExpertCollectionView) {
            let domainCell = domainExpertCollectionView.dequeueReusableCell(withReuseIdentifier: "domainCell", for: indexPath) as! DomainExpertCollectionViewCell
            domainCell.domainLabel.text = "Domain \(indexPath.item)"
            
            return domainCell
        }
        
        return techCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        APICall()
    }
    
    func APICall() {
        let contactURL = "http://kevinjonathan.dx.am/AppleAcademy/learnerDatabase.json"
        let request = NSMutableURLRequest(url: NSURL(string: contactURL)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
                            request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: handle(data: response: error:))
                task.resume()
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error ?? "")
        }
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse ?? "")
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString ?? "")
            self.parseJSON(learnersData: safeData)
        }
    }
    
    func parseJSON(learnersData: Data)  {
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(LearnerData.self, from: learnersData)
                DispatchQueue.main.async {
                    for i in 0...110 {
                        let learner = Learner(name: String(decodeData.results[i].Name), photo: String(decodeData.results[i].Photo), expertise: String(decodeData.results[i].Expertise), team: String(decodeData.results[i].Team), shift: String(decodeData.results[i].Shift))
                        self.learnerDatabase.append(learner)
                    }
                    /*self.techCollectionView.reloadData()
                    self.designCollectionView.reloadData()
                    self.domainExpertCollectionView.reloadData()*/
                }
            } catch {
                print(error)
                let alert = UIAlertController(title: "Error", message: "App failed to load the data", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
            }
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
