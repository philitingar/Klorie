//
//  BarcodeOverlay.swift
//  Klorie
//
//  Created by Timea Bartha on 8/8/23.
//
import AVFoundation
import SwiftUI

struct BarcodeOverlay: View {
    @Binding var captureSession: AVCaptureSession?
    var body: some View {
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 300, height: 200)
                    .overlay(
                        Text("Scan Barcode Here")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                )
                .background(Color.black.opacity(0.5))
                .cornerRadius(20)
                .onTapGesture {
                    DispatchQueue.global(qos: .background).async {self.captureSession?.startRunning()}
                }
                .onAppear {
                    self.captureSession?.stopRunning()
                }
            }
        }
}

