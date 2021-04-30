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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == designCollectionView {
            return 20
        }
        if collectionView == domainExpertCollectionView {
            return 10
        }
        return 70
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let techCell = techCollectionView.dequeueReusableCell(withReuseIdentifier: "techCell", for: indexPath) as! TechCollectionViewCell
        techCell.techText.text = "Tech \(indexPath.item)"
        
        if(collectionView == designCollectionView) {
            let designCell = designCollectionView.dequeueReusableCell(withReuseIdentifier: "designCell", for: indexPath) as! DesignCollectionViewCell
            designCell.designText.text = "Design \(indexPath.item)"
            
            return designCell
        }
        if(collectionView == domainExpertCollectionView) {
            let domainCell = domainExpertCollectionView.dequeueReusableCell(withReuseIdentifier: "domainCell", for: indexPath) as! DomainExpertCollectionViewCell
            domainCell.domainText.text = "Domain \(indexPath.item)"
            
            return domainCell
        }
        
        return techCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
