//
//  ViewController.swift
//  SMSPhoneCallAndEmailExample
//
//  Created by moxDroid on 2018-03-05.
//  Copyright © 2018 moxDroid. All rights reserved.
//

import UIKit
import MessageUI

class PhoneCallAndSMSViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print( NSLocalizedString("STR_SUBJECT", comment: ""))
    }
    
    //Send SMS
    @IBAction func sendMessage(sender: UIButton) {
        
        if MFMessageComposeViewController.canSendText() {
            
        
            let messageVC = MFMessageComposeViewController()
        
        messageVC.body = NSLocalizedString("STR_SUBJECT", comment: "")
        messageVC.recipients = ["+11234567890"]
        messageVC.messageComposeDelegate = self
        
        self.present(messageVC, animated: false, completion: nil)
        }
        else{
            print("NO SIM available")
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult)
    {
        
        switch (result)
        {
            case .cancelled:
                print("Message was cancelled")
                self.dismiss(animated: true, completion: nil)
            //fallthrough
            case .failed:
                print("Message failed")
                self.dismiss(animated: true, completion: nil)
            case .sent:
                print("Message was sent")
                self.dismiss(animated: true, completion: nil)
        }
    }
    
    ///Make Phone Call - No delegates are used
    @IBAction func makePhoneCall(sender: UIButton)
    {
        if let url = URL(string: "tel://+16487591525)"), UIApplication.shared.canOpenURL(url)
        {
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url)
            }
            else
            {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
}

