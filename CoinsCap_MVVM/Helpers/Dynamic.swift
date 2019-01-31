//
//  Dynamic.swift
//  MR
//

import Foundation

class Dynamic<T> {
    
    typealias Listener = (T) -> ()
    
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        
        // Listner is assigned to local property. When the new value is assigned to the "value" property then the listner is called.
        
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        
        // Listner is assigned to local property and lunched immediately after that. When the new value is assigned to the "value" property then the listner is called.
        
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
