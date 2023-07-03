//
//  ContentView.swift
//  SwiftUI-ImagePicker
//
//  Created by Leung Yu Wing on 3/7/2023.
//

import SwiftUI

struct ContentView: View {

    @StateObject var imagePickerObs = TP1AppImagePickerViewController()
    @State var profileUIImageInput: UIImage? = nil
    
    func uploadImage() {
        //                            APISourcerAzureHKSTPMobileBackendUpload().uploadToAzureBlobs(
        //                                uploadTarget: .profilepic,
        //                                image: newValue) { success, urlString, error in
        //
        //                                APISourcerHKSTPMobileBackend.getInstance().UploadProfilePic(
        //                                    isSilent: false,
        //                                    pictureLink: urlString
        //                                ) { data, res, model in
        //                                    if let model = model {
        //                                        if model.isSuccess()
        //                                        {
        //                                            Toast.show(
        //                                                isPublic: true,
        //                                                title: "account_profile_edit_profile_pic_success".i18n(),
        //                                                state: .success)
        //                                        }
        //                                    }
        //
        //                                    userProfileObs.actionLoadProfile { success1, success2, error1, error2 in
        //                                        profileUIImageInput = nil
        //                                    }
        //                                    }
        //                                }

    }

    var body: some View {
        ZStack {
            NavigationView {
                VStack {

                    ZStack {
                        TP1CompositeInputFormAvatarImagePicker(
                            isEditBtn: true,
                            onClickEdit: {
                                //                            UIApplication.shared.endEditing()
//                                if let profileUIImageInput = profileUIImageInput {
//                                    return
//                                }
                                imagePickerObs.show()
                            },
                            size: 120,
                            imageUrl: nil,
                            imageUi: profileUIImageInput)
                        
                        //                    ZStack {
                        //                        if profileUIImageInput != nil {
                        //                            ActivityIndicator(isAnimating: .constant(true), style: .gray)
                        //                                .debugFrameSizeHighlighted()
                        //                        }
                        //                    }
                        
                        
                        TP1AppImagePickerView(
                            selectedImage: $profileUIImageInput,
                            obs: imagePickerObs)
                        .onChange(of: profileUIImageInput) { newValue in
                            if newValue != nil
                            {
                                uploadImage()
                            }
                        }
                    }
                    .padding()
                     

                }

            }
        }
    }
}














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
