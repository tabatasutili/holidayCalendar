//
//  HolidayDetailViewController.swift
//  holidayCalendar
//
//  Created by Sabrina on 12/08/23.
//

import Foundation
import UIKit

class HolidayDetailViewController: UIViewController {
    
    let detailView:HolidayDetailsView
    let viewModel:HolidayDetailsViewModel
    
    init(viewModel: HolidayDetailsViewModel) {
        self.viewModel = viewModel
        detailView = HolidayDetailsView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override func viewDidLoad() {
        setupView()
        
    }
}

extension HolidayDetailViewController: ViewCode {
    func buildViewHierarchy() {
        self.view.addSubview(detailView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.detailView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.detailView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.detailView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.detailView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        ])
        
    }
    
    func setupAditionalConfiguration() {
        self.view.backgroundColor = .white

    }
    
    
}
