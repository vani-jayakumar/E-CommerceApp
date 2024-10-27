//
//  HomeViewModel.swift
//  ECommerceApp
//
//  Created by Vani on 10/27/24.
//

import Foundation



class HomeViewModel {

    private var sections: [Section] = []
    
    var numberOfSections: Int {
        return sections.count
    }

    var onDataUpdated: (() -> Void)?
    
    func fetchData() {
        let model = ECmodel()
        model.fetchData { [weak self] fetchedSections in
            guard let self = self, let fetchedSections = fetchedSections else { return }
            self.sections = fetchedSections
            self.onDataUpdated?()
        }
    }

    func section(for index: Int) -> Section? {
        guard index < sections.count else { return nil }
        return sections[index]
    }
}
