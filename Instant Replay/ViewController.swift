//
//  ViewController.swift
//  Instant Replay
//
//  Created by Bruno Valente on 27/01/20.
//  Copyright © 2020 ValenteBruno. All rights reserved.
//

import UIKit
import ReplayKit

class ViewController: UIViewController {

    let recorder = RPScreenRecorder.shared()
    
    
    @IBAction func onRecordTapped(_ sender: Any) {
        
        recorder.startRecording { (error) in
            if let error = error {
                print(error)
            }
        }
    }
    
    
    @IBAction func onStopTapped(_ sender: Any) {
        recorder.stopRecording { (previewVC, error) in
            if let previewVC = previewVC {
                previewVC.previewControllerDelegate = self
                self.present(previewVC, animated: true, completion: nil)
            }
            
            if let error = error {
                print(error)
            }
        }
    }
}

extension ViewController: RPPreviewViewControllerDelegate {
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        dismiss(animated: true, completion: nil)
    }
}




