//
//  TableViewController.swift
//  MvcExample
//
//  Created by swamnx on 29.04.21.
//

import Foundation
import UIKit

class VersionHistoryController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var versionHistoryView: UITableView!

    var versionHistory: [VersionInfo]? {
        didSet {
          if isViewLoaded {
            versionHistoryView.reloadData()
          }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        versionHistoryView.delegate = self
        versionHistoryView.dataSource = self
        versionHistory = VersionInfoService.shared.loadVersionInfos()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return versionHistory?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommonUtils.versionInfoCellId, for: indexPath)
        let versionInfo = versionHistory?[indexPath.row]
        cell.textLabel?.text = versionInfo?.codeName
        cell.detailTextLabel?.text = versionInfo?.version
        if let versionImage = versionInfo?.logoImage {
            cell.imageView?.image = versionImage
        } else {
            cell.imageView?.image = UIImage.remove
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == CommonUtils.fullImageSegueId else { return }
        guard let destination = segue.destination as? ImageViewController else { return }
        guard let cellSender = sender! as? UITableViewCell else { return }
        destination.imageToShow = cellSender.imageView?.image
    }

}
