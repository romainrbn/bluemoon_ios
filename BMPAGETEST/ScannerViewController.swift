//
//  ScannerViewController.swift
//  BMPAGETEST
//
//  Created by Romain Rabouan on 10/11/2019.
//  Copyright © 2019 Romain Rabouan. All rights reserved.
//

import AVFoundation
import UIKit
import SwiftUI

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var delegate: QRCodeScannerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)

        captureSession.startRunning()
    }

    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            
            // Vibrate
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            if CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: stringValue)) {
                // Only contains numbers
                
                // Save data
                UserDefaults.standard.set(stringValue, forKey: "QRCODENUMBER")
                found(code: stringValue)
                dismiss(animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Erreur", message: "Utilise un QR code valide...", preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(actionOK)
                present(alertController, animated: true, completion: nil)
            }
            
          //  found(code: stringValue)
        }

      //  dismiss(animated: true)
    }

    func found(code: String) {
        self.delegate?.codeDidFind(code)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

protocol QRCodeScannerDelegate {
    func codeDidFind(_ code: String)
}


struct QRCodeScan: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> ScannerViewController {
        let vc = ScannerViewController()
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ vc: ScannerViewController, context: Context) {
    }

    class Coordinator: NSObject, QRCodeScannerDelegate {
        
        func codeDidFind(_ code: String) {
            print("code: \(code)")
            // 1. Check if the qr only contains numbers
            
        }
        
        var parent: QRCodeScan
        
        init(_ parent: QRCodeScan) {
            self.parent = parent
        }
    }
}
