//
//  ClothingViewController.swift
//  The Quicky Mart
//
//  Created by Shawn Yang on 12/9/24.
//

import UIKit

// used to create audio video players and play
import AVFoundation

// used for create AV Player View -- acceleration audio, forward...
import AVKit

class ClothingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let file_vid_url = Bundle.main.url(forResource: "FallOutfitsForMen", withExtension: "mov")
    
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
    
    
    @IBAction func playClothingVideo(_ sender: UIButton) {
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

 }


extension ClothingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clothings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClothingCollectionViewCell", for: indexPath) as! ClothingCollectionViewCell
        cell.setup(with: clothings[indexPath.row])
        return cell
    }
}

extension ClothingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 300)
    }
}

extension ClothingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(clothings[indexPath.row].title)
    }
}
