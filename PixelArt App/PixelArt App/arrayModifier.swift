//
//  arrayModifier.swift
//  PocNavegacao3
//
//  Created by Lucas Claro on 10/11/20.
//

import Foundation

extension Collection where Element: Identifiable {
    func firstIndex(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
    // note that contains(matching:) is different than contains()
    // this version uses the Identifiable-ness of its elements
    // to see whether a member of the Collection has the same identity
    func contains(matching element: Element) -> Bool {
        self.contains(where: { $0.id == element.id })
    }
}
