//
//  ViewController+alertController.swift
//  WeatherApp
//
//  Created by ruslan on 14.05.2021.
//

import UIKit

extension ViewController {
    
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["New York", "London", "Moscow", "Tokyo", "Prague"]
            tf.placeholder = cities.randomElement()
        }
        
        let searchAction = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        ac.addAction(searchAction)
        ac.addAction(cancelAction)
        
        present(ac, animated: true, completion: nil)
    }
    
}
