//
//  INewsViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 28.12.25.
//

import Foundation

protocol INewsViewModel: AnyObject  {
    
    var onNewsLoaded: (([Article]) -> Void)? { get set }
    
    func viewDidLoad()
}
