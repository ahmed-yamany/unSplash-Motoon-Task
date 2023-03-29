//
//  ViewController.swift
//  Starter Project
//
//  Created by Ahmed M. Hassan on 26/03/2023.
//

import UIKit
import Combine
import SwiftUI


class AlbumListViewController: UIViewController {
    // MARK: - Views
    //
    let tableView = UITableView()
    lazy var indicatorView = UIActivityIndicatorView.activityIndicator(style: .large, center: self.view.center)
    
    
    // MARK: - Properties
    //
    var viewModel = AlbumListViewModel()
    var cancelableSet: Set<AnyCancellable> = []
    
    var images: [UnSplashImage] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Album List"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.updateTableView()
        self.makeNetworkRequest()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cancelableSet.forEach { $0.cancel() }
        self.cancelableSet.removeAll()
    }
    
    // MARK: - Update UI
    //
    private func updateTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableView.register(AlbumListCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Helper Methods
    //
    private func makeNetworkRequest() {
        
        self.startIndicatorView()
        
        viewModel.request()
            .sink { [ unowned self ] response in
                
                self.stopIndicatorView()

                if let error = response.error {
                    self.showAlert(with: error.localizedDescription)
                } else if let value = response.value {
                    self.images = value
                    self.tableView.reloadData()
                }
            }
            .store(in: &cancelableSet)
        
    }
    
    private func showAlert(with message: String) {
        let alert = UIAlertController(title: "NetWork Error",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel))
        
        alert.addAction(UIAlertAction(title: "Reload", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
            self.makeNetworkRequest()
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func startIndicatorView() {
        view.addSubview(indicatorView)
        indicatorView.startAnimating()
    }
    
    private func stopIndicatorView() {
        self.indicatorView.removeFromSuperview()
        self.indicatorView.stopAnimating()
        
    }

}


// MARK: - UITableViewDataSource
//
extension AlbumListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(AlbumListCell.self, for: indexPath)
        cell.setup(with: images[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
//
extension AlbumListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fullScreenImageVC = UIHostingController(rootView: FullScreenImageView(unSplashImage: self.images[indexPath.row]))
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(fullScreenImageVC, animated: true)
    }

}


