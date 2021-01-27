//
//  FetchViewController.swift
//  Navigation
//
//  Created by v.milchakova on 14.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class FetchViewController: UIViewController {
  
  @IBOutlet var updateLabel: UILabel!

  private var time: Date?
    
  private lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .long
    return formatter
  }()
  
  func fetch(_ completion: () -> Void) {
    time = Date()
    completion()
  }
  
  func updateUI() {
    guard updateLabel != nil  else {
      return
    }
    
    if let time = time {
      updateLabel.text = dateFormatter.string(from: time)
    } else {
      updateLabel.text = "Not yet updated"
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(updateLabel)
    updateUI()
  }
  
  @IBAction func didTapUpdate(_ sender: UIButton) {
    fetch { [weak self] in
      guard let self = self else { return }
      self.updateUI()
    }
  }
}

