# SwiftUI-ImagePicker
An implementation of SwiftUI ImagePicker to support iOS Camera and Photo Gallery

Usage:

```swift

    // variables

    @StateObject var imagePickerObs = TP1AppImagePickerViewController()
    @State var profileUIImageInput: UIImage? = nil

```


```swift

    var body: some View {

      ...

      Image(uiImage: profileUIImageInput)

      Button {
          imagePickerObs.show()
      } label: {
          Text("Edit image")
      }
      
      ...
      
      
      TP1AppImagePickerView(
          selectedImage: $profileUIImageInput,
          obs: imagePickerObs)
      .onChange(of: profileUIImageInput) { newValue in
          if newValue != nil
          {
              // do anything here e.g. upload image here
          }
      }

      ...

  }

```


1. Permission acceptance case

https://github.com/VansonLeung/SwiftUI-ImagePicker/assets/1129695/7afdbff8-199f-43d4-a4b3-d92fd840a261


2. Permission denial case

https://github.com/VansonLeung/SwiftUI-ImagePicker/assets/1129695/2f8f692c-edd3-462e-8f88-fd8f763e5763

