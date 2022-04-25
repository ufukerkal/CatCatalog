//
//  CatBreedFavoriteList.swift
//  CatCatalog
//
//

import SwiftUI

struct CatBreedFavoriteList: View {
    @ObservedObject var favorites = Favorites()

    var body: some View {
        NavigationView{
            ZStack(alignment:.top){
                Color.primary_color.edgesIgnoringSafeArea(.all)
                
                if favorites.catFavorite.isEmpty==true {
                   
                    VStack(spacing:-50) {
                        
                        LottieView(animationName: "82726-cute-cat",
                                   loopMode: .loop,
                                   contentMode: .scaleAspectFit).frame(height: UIScreen.main.bounds.height/2, alignment: Alignment.top)
                        Text("Looks Like you don't have any favorites yet!")
                            .modifier(SailecFont(.bold, size: 15))
                            .foregroundColor(Color.text_primary_color).scaledToFit()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .top)
                }
                else {
                    
                    List() {
             
                    ForEach(favorites.catFavorite){ catbreeds in
                 NavigationLink {
                    
                    CatBreedDetail(catDetail: catbreeds)
                        
                    } label: {
                        CatBreedListRow(catbreeds: catbreeds)

                    }
                    .listRowBackground(Color.white)

                    .navigationTitle("Favorites")

                }
              }
           .background(Color.primary_color.edgesIgnoringSafeArea(.all))
                    
                    
          }
              
        }
        
         .onAppear(perform: favorites.getData)
        }
        .environmentObject(favorites)
    }

}

struct CatBreedFavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedFavoriteList()
    }
}
