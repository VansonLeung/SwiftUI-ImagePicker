//
//  TP1CompositeInputFormImagePicker.swift
//  hkstp oneapp testing
//
//  Created by van on 4/7/2022.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI


struct TP1CompositeInputFormImagePicker: View {
    
    var isAddBtn: Bool = false
    var onClickAdd: (() -> Void)?

    var size: CGFloat = 108
    var innerPadding: CGFloat = 8

    var imageLocal: String?
    var imageUrl: String?
    var imageUi: UIImage?

    var onClickImage: (() -> Void)?

    var showDeleteBtn: Bool = false
    var onDelete: (() -> Void)?
    
    var body: some View {
        ZStack {
            if isAddBtn
            {
                Button {
                    if let onClickAdd = onClickAdd {
                        onClickAdd()
                    }
                } label: {
                    ZStack(alignment: .center) {
                        Icon(icon: "ic_mg_general_add", iconSize: 24)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(
                                TP1ViewElementStyles.shared.activeColorTheme.color_content_notes,
                                style: StrokeStyle(
                                    lineWidth: 1,
                                    lineCap: .round,
                                    lineJoin: .round,
                                    miterLimit: 0,
                                    dash: [8],
                                    dashPhase: 1))
                            .frame(width: size - innerPadding, height: size - innerPadding)
                    )
                    .frame(width: size - innerPadding, height: size - innerPadding)
                    .contentShape(Rectangle())
                }
                .buttonStyle(NoTapEffectButtonStyle())
                .disabled(onClickAdd == nil)
                .transition(.fade(duration: 0.2))
            }
            else
            {
                Button {
                    
                    if let onClickImage = onClickImage {
                        onClickImage()
                    }
                    
                } label: {
                    ZStack(alignment: .center) {
                        if let imageUrl = imageUrl?.asPercentEncoded() {
                            WebImage(url: URL(string: imageUrl)!)
                                .onSuccess { image, data, cacheType in
                                }
                                .resizable()
                                .indicator(.activity)
                                .scaledToFill()
                                .frame(width: size - innerPadding, height: size - innerPadding)
                                .cornerRadius(8)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .strokeBorder(TP1ViewElementStyles.shared.activeColorTheme.color_page_background, lineWidth: 1)
                                )
                        }
                        else if let imageLocal = imageLocal {
                            Image(imageLocal)
                                .resizable()
                                .scaledToFill()
                                .frame(width: size - innerPadding, height: size - innerPadding)
                                .cornerRadius(8)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .strokeBorder(TP1ViewElementStyles.shared.activeColorTheme.color_page_background, lineWidth: 1)
                                )
                        }
                        else if let imageUi = imageUi {
                            Image(uiImage: imageUi)
                                .resizable()
                                .scaledToFill()
                                .frame(width: size - innerPadding, height: size - innerPadding)
                                .cornerRadius(8)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .strokeBorder(TP1ViewElementStyles.shared.activeColorTheme.color_page_background, lineWidth: 1)
                                )
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(
                                TP1ViewElementStyles.shared.activeColorTheme.color_page_background,
                                style: StrokeStyle(
                                    lineWidth: 1,
                                    lineCap: .round,
                                    lineJoin: .round,
                                    miterLimit: 0,
                                    dash: [0],
                                    dashPhase: 1))
                            .frame(width: size - innerPadding, height: size - innerPadding)
                    )
                }
                .buttonStyle(NoTapEffectButtonStyle())
                .contentShape(Rectangle())
                .disabled(onClickImage == nil)
                .transition(.fade(duration: 0.2))
                
                if showDeleteBtn
                {
                    HStack {
                        Spacer()
                        VStack {
                            Button {
                                if let onDelete = onDelete {
                                    onDelete()
                                }
                            } label: {
                                ZStack {
                                    Icon(icon: "ic_btn_minus", iconSize: 24)
                                }
                                .padding(.all, 12)
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(NoTapEffectButtonStyle())
                            .disabled(onDelete == nil)
                            .offset(x: 12, y: -12)
                            Spacer()
                        }
                    }
                    .transition(.fade(duration: 0.2))
                }
            }
        }
        .frame(width: size, height: size)
        .animation(.default, value: isAddBtn)
        .animation(.default, value: showDeleteBtn)
    }
}




struct TP1CompositeInputFormAvatarImagePicker: View {
    
    var isEditBtn: Bool = false
    var onClickEdit: (() -> Void)?

    var size: CGFloat = 120
    var padding: CGFloat = 120 * 0.04

    var imageLocal: String?
    var imageUrl: String?
    var imageUi: UIImage?
    
    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: size * 0.5)
                    .stroke(
                        TP1ViewElementStyles.shared.activeColorTheme.color_primary,
                        lineWidth: 2)
                    .frame(width: size, height: size)
            }

            ZStack {
                RoundedRectangle(cornerRadius: (size - padding * 2) * 0.5)
                    .fill(
                        TP1ViewElementStyles.shared.activeColorTheme.color_page_background)
                    .frame(width: size - padding * 2, height: size - padding * 2)
                
                
                if let imageUrl = imageUrl?.asPercentEncoded(),
                   imageUrl != "",
                   let url = URL(string: imageUrl)
                {
                    WebImage(url: url)
                        .onSuccess { image, data, cacheType in
                        }
                        .resizable()
                        .indicator(.activity)
                        .scaledToFill()
                        .frame(width: size - padding * 2, height: size - padding * 2)
                        .cornerRadius((size - padding * 2) / 2)
                        .clipped()
                }
                else if let imageLocal = imageLocal {
                    Image(imageLocal)
                        .resizable()
                        .scaledToFill()
                        .frame(width: size - padding * 2, height: size - padding * 2)
                        .cornerRadius((size - padding * 2) / 2)
                        .clipped()
                }
                else if let imageUi = imageUi {
                    Image(uiImage: imageUi)
                        .resizable()
                        .scaledToFill()
                        .frame(width: size - padding * 2, height: size - padding * 2)
                        .cornerRadius((size - padding * 2) / 2)
                        .clipped()
                }
            
            }

            if isEditBtn
            {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Button {
                            if let onClickEdit = onClickEdit {
                                onClickEdit()
                            }
                        } label: {
                            RoundedIcon(
                                bgColor: TP1ViewElementStyles.shared.activeColorTheme.color_primary,
                                size: 32,
                                icon: "ic_mg_information_edit_white_24x24",
                                iconSize: 24)
                        }
                        .buttonStyle(NoTapEffectButtonStyle())
                        .padding(.bottom, 6.8)
                    }
                    .padding(.trailing, 6.8)
                }
            }
        }
        .frame(width: size, height: size)
    }
}






struct TP1CompositeInputFormImagePicker_Preview: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 0) {
            TP1CompositeInputFormImagePicker(
                isAddBtn: true, onClickAdd: {
                    
                })
            TP1CompositeInputFormImagePicker(
                imageUrl: "https://i.stack.imgur.com/fStxg.jpg"
            )
            TP1CompositeInputFormImagePicker(
                imageLocal: "t1_40x40_f1"
            )
            TP1CompositeInputFormImagePicker(
                imageUrl: "https://i.stack.imgur.com/fStxg.jpg",
                showDeleteBtn: true, onDelete: {
                    
                })
        }
        
        HStack(spacing: 5.5) {
            
            TP1CompositeInputFormImagePicker(
                imageUrl: "https://i.stack.imgur.com/fStxg.jpg",
                onClickImage: {
                    
                }
            )
            TP1CompositeInputFormImagePicker(
                imageUrl: "https://i.stack.imgur.com/fStxg.jpg",
                onClickImage: {
                    
                }
            )
            TP1CompositeInputFormImagePicker(
                imageUrl: "https://i.stack.imgur.com/fStxg.jpg",
                onClickImage: {
                    
                }
            )
            
        }
        .frame(width: 108*3 + 5.5*2, height: 108, alignment: .center)
        
        HStack(spacing: 5.5) {
            
            TP1CompositeInputFormAvatarImagePicker(isEditBtn: true, onClickEdit: {
                
            }, imageUrl: "https://i.stack.imgur.com/fStxg.jpg")
            
            TP1CompositeInputFormAvatarImagePicker(isEditBtn: true, onClickEdit: {
                
            })

        }
        .frame(width: 108*3 + 5.5*2, height: 108, alignment: .center)
        
    }
}
