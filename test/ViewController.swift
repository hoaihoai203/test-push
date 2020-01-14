//
//  ViewController.swift
//  test
//
//  Created by Ho Hoai on 1/10/20.
//  Copyright © 2020 Ho Hoai. All rights reserved.
//

import UIKit
import ZDCChat
import ZDCChatAPI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTabChatWithZendesk(_ sender: Any) {
        chatWithZendesk()
    }
    
    func chatWithZendesk() {
        ZDCChat.initialize(withAccountKey: "65HOiqr6wy3uprSP7044dd24nTOhZSyN")

        ZDCChat.updateVisitor { (visitor) in
            visitor?.phone = "0977910500"
            visitor?.name = "Hoai Ho"
            visitor?.email = "hoaiht.it@tripi.vn"
            visitor?.addNote("no comment")
        }
        
        ZDCChat.instance()?.hidesBottomBarWhenPushed = true
        ZDCChat.instance()?.chatModalPresentationStyle = .fullScreen
        
        ZDCChat.start(in: self.navigationController) { (config) in
            config?.preChatDataRequirements.name = ZDCPreChatDataRequirement.requiredEditable
            config?.preChatDataRequirements.email = ZDCPreChatDataRequirement.requiredEditable
            config?.preChatDataRequirements.phone = ZDCPreChatDataRequirement.requiredEditable
            config?.preChatDataRequirements.department = ZDCPreChatDataRequirement.notRequired
            config?.preChatDataRequirements.message = ZDCPreChatDataRequirement.requiredEditable

        }
    }
}

