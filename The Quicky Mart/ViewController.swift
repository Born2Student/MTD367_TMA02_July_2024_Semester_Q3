//
//  ViewController.swift
//  The Quicky Mart
//
//  Created by Shawn Yang on 11/9/24.
//

import UIKit

// used for create AV Player View -- acceleration audio, forward...
import AVKit

// Used for displaying web content
import WebKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    private let tableView: UITableView = {
        let table = UITableView()
        
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        
        return table
    }()
    
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        
        CollectionTableViewCellViewModel(
            
            viewModels: [
                
                TileCollectionViewCellViewModel(name: "Clothing", backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Artwork", backgroundColor: .systemRed),
                TileCollectionViewCellViewModel(name: "Electronics", backgroundColor: .systemPink)
            
            ]
        )
        
    ]

    @IBOutlet weak var homeVideo: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        getVideo(videoCode: "K2HS3_8cTx8")
        
        view.addSubview(tableView)
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
    }
    
    
    
    func getVideo(videoCode: String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        
        homeVideo.load(URLRequest(url: url!))
    }


    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
//        tableView.frame = view.bounds
        
        // Calculate the frame for the tableView at the bottom
        let tableViewHeight = view.frame.size.width / 1.3 // Assuming height is half the screen width
        let tableViewY = view.bounds.height - tableViewHeight
        tableView.frame = CGRect(x: 0, y: tableViewY, width: view.bounds.width, height: tableViewHeight)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return viewModels.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let viewModel = viewModels[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        
        cell.delegate = self
        
        cell.configure(with: viewModel)
        
//        cell.textLabel?.text = "Hello World"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return view.frame.size.width/2
    }
    
    
    
}


extension ViewController: CollectionTableViewCellDelegate {
    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        let alert = UIAlertController(title: viewModel.name, message: "You successfully got the selected item!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
}


