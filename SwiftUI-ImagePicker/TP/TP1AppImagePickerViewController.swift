//
//  TP1AppImagePickerView.swift
//  hkstp oneapp testing
//
//  Created by van on 1/8/2022.
//

import Foundation
import SwiftUI
import AVFoundation
import Photos



class TP1AppImagePickerViewController: ObservableObject {
    @Published var isShow: Bool = false
    @Published var isShowTakeCamera: Bool = false
    @Published var isShowPhotoLibrary: Bool = false
    
    @Published var isShowTakeCameraDenied: Bool = false
    @Published var isShowTakeCameraRestricted: Bool = false

    @Published var isShowTakePhotoLibraryDenied: Bool = false
    @Published var isShowTakePhotoLibraryRestricted: Bool = false
    
    
    var permission_alert_camera_header: String = "Camera permission"
    var permission_alert_camera_desc: String = "Open settings to allow camera access permission"
    var permission_alert_photo_header: String = "Photo library permission"
    var permission_alert_photo_desc: String = "Open settings to allow photo library access permission"

    func show() {
        isShow = true
    }
    
    
    func openCamera()
    {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            self.isShowTakeCamera = true
            break
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async {
                        self.isShowTakeCamera = true
                    }
                }
            }
            break
        case .denied:
            self.isShowTakeCameraDenied = true
            break
        case .restricted:
            self.isShowTakeCameraRestricted = true
            break
        }
    }
    
    
    func openPhotoGallery()
    {
        switch PHPhotoLibrary.authorizationStatus(for: .addOnly) {
        case .authorized:
            self.isShowPhotoLibrary = true
            break
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(for: .addOnly) { granted in
                if granted == .authorized
                    || granted == .limited
                {
                    DispatchQueue.main.async {
                        self.isShowPhotoLibrary = true
                    }
                }
                else
                {
                    switch granted {
                    case .denied:
                        DispatchQueue.main.async {
                            self.isShowTakePhotoLibraryDenied = true
                        }
                        break
                    case .restricted:
                        DispatchQueue.main.async {
                            self.isShowTakePhotoLibraryRestricted = true
                        }
                        break
                    @unknown default:
                        break
                    }

                }
            }
            break
        case .denied:
            self.isShowTakePhotoLibraryDenied = true
            break
        case .restricted:
            self.isShowTakePhotoLibraryRestricted = true
            break
        case .limited:
            self.isShowPhotoLibrary = true
            break
        @unknown default:
            break
        }
    }
    
    
}


struct TP1AppImagePickerView: View {
    @Binding var selectedImage: UIImage?
    @StateObject var obs : TP1AppImagePickerViewController
    
    
    var body: some View {
        ZStack {
            
        }
        .actionSheet(isPresented: $obs.isShow) {
            ActionSheet(
                title: Text("Select source"),
                buttons: [
                    .default(Text("Camera")) {
                        obs.openCamera()
                    },

                    .default(Text("Photo library")) {
                        obs.openPhotoGallery()
                    },

                    .default(Text("Cancel")) {

                    },
                ]
            )
        }

        
        .alert(
            obs.permission_alert_camera_header,
            isPresented: $obs.isShowTakeCameraDenied,
            actions: {
                Button("Not now", role: .cancel) { }
                Button("Next", role: .destructive) {
                    if let BUNDLE_IDENTIFIER = Bundle.main.bundleIdentifier,
                        let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(BUNDLE_IDENTIFIER)") {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            },
            message: {
                Text(obs.permission_alert_camera_desc)
            }
        )
        .alert(
            obs.permission_alert_camera_header,
            isPresented: $obs.isShowTakeCameraRestricted,
            actions: {
                Button("Not now", role: .cancel) { }
                Button("Next", role: .destructive) {
                    if let BUNDLE_IDENTIFIER = Bundle.main.bundleIdentifier,
                        let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(BUNDLE_IDENTIFIER)") {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            },
            message: {
                Text(obs.permission_alert_camera_desc)
            }
        )
        
        .alert(
            obs.permission_alert_photo_header,
            isPresented: $obs.isShowTakePhotoLibraryDenied,
            actions: {
                Button("Not now", role: .cancel) { }
                Button("Next", role: .destructive) {
                    if let BUNDLE_IDENTIFIER = Bundle.main.bundleIdentifier,
                        let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(BUNDLE_IDENTIFIER)") {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            },
            message: {
                Text(obs.permission_alert_photo_desc)
            }
        )
        .alert(
            obs.permission_alert_photo_header,
            isPresented: $obs.isShowTakePhotoLibraryRestricted,
            actions: {
                Button("Not now", role: .cancel) { }
                Button("Next", role: .destructive) {
                    if let BUNDLE_IDENTIFIER = Bundle.main.bundleIdentifier,
                        let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(BUNDLE_IDENTIFIER)") {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            },
            message: {
                Text(obs.permission_alert_photo_desc)
            }
        )
        
        .sheet(isPresented: $obs.isShowTakeCamera) {
            ImagePicker(selectedImage: $selectedImage, sourceType: .camera)
        }
        
        .sheet(isPresented: $obs.isShowPhotoLibrary) {
            ImagePicker(selectedImage: $selectedImage, sourceType: .photoLibrary)
        }
    }
    
    
    


}



