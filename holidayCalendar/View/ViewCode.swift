//
//  ViewCode.swift
//  holidayCalendar
//
//  Created by Sabrina on 12/08/23.
//

import Foundation

protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAditionalConfiguration()
    func setupView()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAditionalConfiguration()
    }
}

