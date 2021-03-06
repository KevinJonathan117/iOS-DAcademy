//
//  LearnersController.swift
//  DAcademy
//
//  Created by Kevin Jonathan on 29/04/21.
//

import UIKit

class LearnersController: UIViewController {
    
    @IBOutlet weak var scrollViewLearners: UIScrollView!
    @IBOutlet weak var techCollectionView: UICollectionView!
    @IBOutlet weak var designCollectionView: UICollectionView!
    @IBOutlet weak var domainExpertCollectionView: UICollectionView!
    
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    var techLearnerDatabase = [Learner]()
    var designLearnerDatabase = [Learner]()
    var domainLearnerDatabase = [Learner]()
    
    var tempName : String = ""
    var tempPhoto : String = ""
    var tempExpertise : String = ""
    var tempTeam : String = ""
    var tempShift : String = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LearnerDetailController {
            vc.name = tempName
            vc.photo = tempPhoto
            vc.expertise = tempExpertise
            vc.team = tempTeam
            vc.shift = tempShift
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViewLearners.alpha = 0
        showActivityIndicatory()
        APICall()
    }
    
    func showActivityIndicatory() {
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
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

                        if learner.expertise == "Tech / IT / IS" {
                            self.techLearnerDatabase.append(learner)
                        } else if learner.expertise == "Design" {
                            self.designLearnerDatabase.append(learner)
                        } else if learner.expertise == "Domain Expert (Keahlian Khusus)" {
                            self.domainLearnerDatabase.append(learner)
                        }
                    }
                    self.techCollectionView.reloadData()
                    self.designCollectionView.reloadData()
                    self.domainExpertCollectionView.reloadData()
                    self.activityIndicator.stopAnimating()
                    UIView.animate(withDuration: 1) {
                        self.scrollViewLearners.alpha = 1
                    }
                }
            } catch {
                print(error)
                let alert = UIAlertController(title: "Error", message: "App failed to load the data", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
            }
    }
}

extension LearnersController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == techCollectionView {
            tempName = techLearnerDatabase[indexPath.item].name
            tempPhoto = techLearnerDatabase[indexPath.item].photo
            tempExpertise = techLearnerDatabase[indexPath.item].expertise
            tempTeam = techLearnerDatabase[indexPath.item].team
            tempShift = techLearnerDatabase[indexPath.item].shift
        } else if collectionView == designCollectionView {
            tempName = designLearnerDatabase[indexPath.item].name
            tempPhoto = designLearnerDatabase[indexPath.item].photo
            tempExpertise = designLearnerDatabase[indexPath.item].expertise
            tempTeam = designLearnerDatabase[indexPath.item].team
            tempShift = designLearnerDatabase[indexPath.item].shift
        } else if collectionView == domainExpertCollectionView {
            tempName = domainLearnerDatabase[indexPath.item].name
            tempPhoto = domainLearnerDatabase[indexPath.item].photo
            tempExpertise = domainLearnerDatabase[indexPath.item].expertise
            tempTeam = domainLearnerDatabase[indexPath.item].team
            tempShift = domainLearnerDatabase[indexPath.item].shift
        }
        performSegue(withIdentifier: "toLearnerDetail", sender: self)
    }
}

extension LearnersController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == designCollectionView {
            return designLearnerDatabase.count
        }
        if collectionView == domainExpertCollectionView {
            return domainLearnerDatabase.count
        }
        return techLearnerDatabase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let techCell = techCollectionView.dequeueReusableCell(withReuseIdentifier: "techCell", for: indexPath) as! TechCollectionViewCell
        if techLearnerDatabase.count == 0 && designLearnerDatabase.count == 0 && domainLearnerDatabase.count == 0 {
            return techCell
        } else {
            if(collectionView == techCollectionView) {
                let url = URL(string: techLearnerDatabase[indexPath.item].photo)
                techCell.techLabel.text = techLearnerDatabase[indexPath.item].name
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url!) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                techCell.techImage.layer.cornerRadius = 12
                                techCell.techImage.image = image
                            }
                        }
                    }
                }
            }
            
            if indexPath.item < designLearnerDatabase.count {
                if(collectionView == designCollectionView) {
                    let designCell = designCollectionView.dequeueReusableCell(withReuseIdentifier: "designCell", for: indexPath) as! DesignCollectionViewCell
                    
                    let url = URL(string: designLearnerDatabase[indexPath.item].photo)
                    designCell.designLabel.text = designLearnerDatabase[indexPath.item].name
                    DispatchQueue.global().async {
                        if let data = try? Data(contentsOf: url!) {
                            if let image = UIImage(data: data) {
                                DispatchQueue.main.async {
                                    designCell.designImage.image = image
                                    designCell.designImage.layer.cornerRadius = 12
                                }
                            }
                        }
                    }
                    
                    return designCell
                }
            }
            
            if indexPath.item < domainLearnerDatabase.count {
                if(collectionView == domainExpertCollectionView) {
                    let domainCell = domainExpertCollectionView.dequeueReusableCell(withReuseIdentifier: "domainCell", for: indexPath) as! DomainExpertCollectionViewCell
                    
                    let url = URL(string: domainLearnerDatabase[indexPath.item].photo)
                    domainCell.domainLabel.text = domainLearnerDatabase[indexPath.item].name
                    DispatchQueue.global().async {
                        if let data = try? Data(contentsOf: url!) {
                            if let image = UIImage(data: data) {
                                DispatchQueue.main.async {
                                    domainCell.domainImage.image = image
                                    domainCell.domainImage.layer.cornerRadius = 12
                                }
                            }
                        }
                    }
                    return domainCell
                }
            }
            return techCell
        }
    }
}
