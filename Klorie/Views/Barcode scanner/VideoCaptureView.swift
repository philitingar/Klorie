//
//  VideoCaptureView.swift
//  Klorie
//
//  Created by Timea Bartha on 8/8/23.
//
import AVFoundation
import SwiftUI

struct VideoCaptureView: UIViewRepresentable {
    @Binding var captureSession: AVCaptureSession?
    @Binding var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        videoPreviewLayer?.removeFromSuperlayer()
        if let videoPreviewLayer = videoPreviewLayer {
            uiView.layer.addSublayer(videoPreviewLayer)
        }
    }
}


