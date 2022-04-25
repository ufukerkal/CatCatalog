//
//  SplashScreen.swift
//  CatCatalog
//
//

import SwiftUI



struct SplashScreen: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
                  ContentView()
              } else {
                  ZStack(alignment:.top) {
                      VStack() {
                          LottieView(animationName: "93293-cat-loader",
                                     loopMode: .playOnce,
                                     contentMode: .scaleAspectFit).frame(height: UIScreen.main.bounds.height/2, alignment: Alignment.top)
                          Text("Cat Breeds")
                              .modifier(SailecFont(.bold, size: 24)).lineLimit(1)
                              .foregroundColor(Color.text_primary_color)
                      }
                      .frame(maxWidth: .infinity, alignment: .top)
                      .scaleEffect(size)
                      .opacity(opacity)
                      .onAppear {
                          withAnimation(.easeIn(duration: 1.2)) {
                              self.size = 0.9
                              self.opacity = 1.00
                          }
                      }
                  }
                  .onAppear {
                      DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                          withAnimation {
                              self.isActive = true
                          }
                      }
                  }
              }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
