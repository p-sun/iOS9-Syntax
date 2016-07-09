// Delegates

// A delegate is like a boss. If you conform to a delegate, you are able to do that boss' tasks.

// MARK: Background to the story

// A protocol is like a list of rules that need to be followed.
protocol OlderSiblingDelegate: class {
    // The following command (ie, method) must be obeyed by any
    // underling (ie, delegate) of the older sibling.
    func getYourNiceOlderSiblingAGlassOfWater()
}

// MARK: Characters in the story

class BossyBigBrother {
    
    // I can make whichever little sibling is around at
    // the time be my delegate (ie, slave)
    weak var delegate: OlderSiblingDelegate?
    
    func tellSomebodyToGetMeSomeWater() {
        // The delegate is optional because even though
        // I'm thirsty, there might not be anyone nearby
        // that I can boss around.
        delegate?.getYourNiceOlderSiblingAGlassOfWater()
    }
}

// Poor little sisters have to follow (or at least acknowledge)
// their older sibling's rules (ie, protocol)
class PoorLittleSister: OlderSiblingDelegate {
    
    func getYourNiceOlderSiblingAGlassOfWater() {
        // Little sis follows the letter of the law (ie, protocol),
        // but no one said exactly how she had to respond.
        print("Go get it yourself!")
    }
}

// MARK: The Story

// Big bro is laying on the couch watching basketball on TV.
let bigBro = BossyBigBrother()

// He has a little sister named Sally.
let sally = PoorLittleSister()

// Sally walks into the room. How convenient! Now big bro
// has someone there to boss around.
bigBro.delegate = sally

// So he tells her to get him some water.
bigBro.tellSomebodyToGetMeSomeWater()

// Unfortunately no one lived happily ever after...

// The end.

// -------------------------------------------------------------------------------------------

// Using delegates to pass around data

import UIKit
import Foundation

//To pass data from    PrevVC -----> NextVC:
//let storyboard = UIStoryboard(name: "storyboard", bundle: nil)
//let vc = storyboard.instantiateViewControllerWithIdentifier("storyboardID") as? UIViewController
//vc.data = insertDataHere
//navigationController?.pushViewController(vc, animated: true)


//To pass data from   PrevVC <----- NextVC:

protocol InfoDelegate: class {
    func receiveInfo(data: String)
}

class PrevViewController: UIViewController, InfoDelegate {
    func receiveInfo(data: String) {
        print(data)
    }
    
    // Naviagation
    //let storyboard = UIStoryboard(name: "storyboard", bundle: nil)
    //let vc = storyboard.instantiateViewControllerWithIdentifier("storyboardID") as? UIViewController
    //vc.delegate = self <-------------
    //navigationController?.pushViewController(vc, animated: true)
}

class NextViewController: UIViewController {
    weak var delegate: InfoDelegate?

    func passDataToPrevVC() {
        delegate?.receiveInfo("Here's some data")
    }
}
