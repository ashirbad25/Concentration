//
//  ConcentrationThemeSelectorViewController.swift
//  Concentration
//
//  Created by Aashirwad Sinha on 10/30/19.
//  Copyright © 2019 Credit Suisse. All rights reserved.
//

import UIKit

class ConcentrationThemeSelectorViewController: UIViewController, UISplitViewControllerDelegate {


    let themes = [
        "Sports" : "🥎🏎🏈🏸🏐🏓🎳🏌️‍♂️🥊🏹🏑⚽️",
        "Faces" : "😀😂😎🤓🤪😛😍😇😫😡",
        "Animals" : "😿🐒🐓🦖🐻🦁🐿🐅🏇🏻🐿🐺",
        "Transports" : "🚗🚓🚚🏍✈️🚜🚎🚲🚂🛴",
        "Fruits" : "🍏🥑🍇🍒🍑🥝🍐🍎🍉🍌"
    ]
    
    override func awakeFromNib() {
        splitViewController? .delegate = self
    }
    
    // If theme is null, prevent from collapsing
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController)
        -> Bool {
        
            if let cvc = secondaryViewController as? ConcentrationViewController {
                if cvc.theme == nil {
                    return true
                }
            }
            return false // I didnt do it, so please you do the collapsing
    }
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
        } else if let cvc = lastSeguedToConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
            
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    // String pointer, will remain in heap
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "Choose Theme" {
            if let button = sender as? UIButton {
                if let themeName = button.currentTitle {
                    if let theme = themes[themeName] {
                        if let cvc = segue.destination as? ConcentrationViewController {
                            cvc.theme = theme
                            lastSeguedToConcentrationViewController = cvc
                        }
                    }
                }
            }
        }
    }

}
