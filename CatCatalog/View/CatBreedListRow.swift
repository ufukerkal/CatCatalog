//
//  CatBreedListRow.swift
//  CatCatalog
//
//

import SwiftUI
import SDWebImageSwiftUI

struct CatBreedListRow: View {
    @ObservedObject var favorites=Favorites()
    let catbreeds: CatBreed
    var body: some View {
        HStack(spacing: 12) {
            
            CatBreedRowsImage(imageURL: catbreeds.image?.url ?? "\(ConstantsApiUrl.baseİmageUrl)\(catbreeds.imageId ?? ""  )\(ConstantsApiUrl.imageType)")

            CatBreedRowsText(catbreeds: catbreeds)
            Spacer()
            

            if favorites.contains(catbreeds){
                Button(action: {
                  print("button pressed")

                }) {
                    Image(systemName: "heart.fill").accessibilityLabel("This is a favorite resort")
                        .foregroundColor(.red)
                }
            }
        }
        .padding(1)
        .cornerRadius(16)
        .environmentObject(favorites)

    }

}

struct CatBreedListRowFavorite: View {
    @ObservedObject var favorites=Favorites()
    let catbreeds: CatBreed
    var body: some View {
        HStack() {
           
            CatBreedRowsText(catbreeds: catbreeds)
            Spacer()
            CatBreedRowsImage(imageURL: catbreeds.image?.url ?? "\(ConstantsApiUrl.baseİmageUrl)\(catbreeds.imageId ?? ""  )\(ConstantsApiUrl.imageType)")
        }
        .environmentObject(favorites)

    }
}

struct CatBreedListRowSearch: View {
    let catbreeds: CatBreed
    var body: some View {
        HStack() {
            CatBreedRowsText(catbreeds: catbreeds)
            Spacer()
            CatBreedRowsImage(imageURL: catbreeds.image?.url ?? "\(ConstantsApiUrl.baseİmageUrl)\(catbreeds.imageId ?? ""  )\(ConstantsApiUrl.imageType)")

        }
    }
}

struct CatBreedRowsText:View{
    let catbreeds: CatBreed

    var body: some View{
        VStack(alignment:.leading){
            Text(catbreeds.name ?? "").modifier(SailecFont(.medium,size: 16.5))                            .foregroundColor(Color.text_primary_color).padding(.top, 16)

            Text(catbreeds.temperament ?? "").lineLimit(1).modifier(SailecFont(.regular, size: 14)).foregroundColor(Color.text_primary_color)

        }
    }
}



struct CatBreedRowsImage:View{
    let imageURL:String?
    
    var body: some View{
        ZStack{
    if imageURL != nil {
                  
        WebImage(url: URL(string: imageURL!)).resizable()
            .placeholder {
                ProgressView()
                     .frame(width: 100, height: 100)
            }
            .renderingMode(.original)
            .aspectRatio(contentMode: ContentMode.fill).frame(width: 100, height: 100).cornerRadius(16)
        }
    }
  }
}
    
    
struct CatBreedListRow_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedListRow(catbreeds: CatBreed(id: "abys", name: "Abyssinian", temperament: "Active, Energetic, Independent, Intelligent", description: "he Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", origin: "Egypt", lifeSpan: "14 - 15",imageId: "0XYvRd7oD", image: CatBreedImage(id: "i", width: 100, height:100,url:"https://cdn2.thecatapi.com/images/unX21IBVB.jpg")))
    }
  }

