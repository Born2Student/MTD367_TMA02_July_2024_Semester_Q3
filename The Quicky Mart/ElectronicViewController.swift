//
//  ElectronicViewController.swift
//  The Quicky Mart
//
//  Created by Shawn Yang on 12/9/24.
//

import UIKit

// used to create audio video players and play
import AVFoundation

// used for create AV Player View -- acceleration audio, forward...
import AVKit

class ElectronicViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let file_vid_url = Bundle.main.url(forResource: "ShopeeAdvert2019", withExtension: "mov")
    
    // Video player object
    var Vidplayer: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Initialize the video player
        if let path = file_vid_url
        {
            // Try to create a video player with the provided URL
            Vidplayer = try! AVPlayer(url: path)
        }
        else
        {
            // Print an error message if the video file is not found
            print("Video file not found")
        }
        
        collectionView.dataSource = self
        
        collectionView.delegate = self
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    
    
    @IBAction func playElectronicVideo(_ sender: Any) {
        // Create an AVPlayerViewController to display the video
        let AVcontroller = AVPlayerViewController()
        
        // Set the video player for the AVPlayerViewController
        AVcontroller.player = Vidplayer
        
        // Present the AVPlayerViewController and start playing the video
        present(AVcontroller, animated: true)
        {
            AVcontroller.player!.play()
        }
    }
    

}


extension ElectronicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return electronics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ElectronicCollectionViewCell", for: indexPath) as! ElectronicCollectionViewCell
        cell.setup(with: electronics[indexPath.row])
        return cell
    }
}

extension ElectronicViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}

extension ElectronicViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(electronics[indexPath.row].title)
    }
}
