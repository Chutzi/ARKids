import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
 
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}
 
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct ContentView: View {
    @State private var orientation = UIDeviceOrientation.unknown
    @State private var isTapped = false
    
    var body: some View {
        NavigationView{
            ZStack {
                if orientation.isLandscape {
                    Image("wallpaper")
                                    .onTapGesture {
                                        // Action to be performed when image is tapped
                                        self.isTapped.toggle()
                                    }.edgesIgnoringSafeArea(.all)
                } else {
                    Image("wallpaper").resizable().frame(width: 1750, height: 1200)
                }
                
                VStack() {
                    Spacer()
                    Text("ARKids")
                        .font(.system(size:66, weight: .medium, design: .rounded))
                        .padding(1)
                        .foregroundColor(Color.white)
                    Text("Draws is funny!")
                        .font(.system(size:33, weight: .medium, design: .rounded))
                        .foregroundColor(Color.white)
                        
                    Spacer()
                    Button(action: {}) {
                        NavigationLink {
                            UseView()
                        } label: {
                            Text("Start").font(.system(size:45, weight: .medium, design: .rounded))
                        }
                    }.padding(39)
                        .frame(width: 250, height: 80)
                        .foregroundColor(.white)
                        .background(Color("BRose"))
                        .cornerRadius(90)
                        .shadow(radius: 10)
                    Spacer()
                        
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onRotate { newOrientation in
                    orientation = newOrientation
                }
        }.navigationViewStyle(.stack)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
