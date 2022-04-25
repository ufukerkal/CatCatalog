//
//  CatBreedDetail.swift
//  CatCatalog
//
//

import SwiftUI
import SDWebImageSwiftUI

struct CatBreedDetail: View {
    @EnvironmentObject var favorites:Favorites
    let catDetail: CatBreed
    var body: some View {
        ScrollView{
            
            ZStack{
                
                Color.primary_color.edgesIgnoringSafeArea(.all)

            VStack{
                
                CatBreedDetailImage(imageURL: catDetail.image?.url ?? "\(ConstantsApiUrl.baseİmageUrl)\(catDetail.imageId ?? ""  )\(ConstantsApiUrl.imageType)")
                
                CatBreedDetailsData(catDetail: catDetail)
            }
            }
            .onAppear(perform: {
                return favorites.getData()
            })
            .background(Color.primary_color.edgesIgnoringSafeArea(.all))
            .padding()
            .toolbar {Button(action: {
                if favorites.contains(catDetail){
                favorites.remove(catDetail)
            }else{
                favorites.add(catDetail)
            }
 }, label: {
                HStack {
                    Image(systemName: favorites.contains(catDetail) ? "heart.fill" : "heart")
                }
            })
            .foregroundColor(.red)
                           }
            .padding(.top)
            .offset(x: 0, y: -30.0)
            
            
        }
        .background(Color.primary_color.edgesIgnoringSafeArea(.all))
    }
}

struct CatBreedDetailsData:View{
    let catDetail:CatBreed
    var body: some View {
        VStack{
            
            
            VStack(spacing: 16) {
                HStack {
                    Text(self.catDetail.name ?? "")                                           .modifier(SailecFont(.bold, size: 24)).lineLimit(1)
                        .foregroundColor(Color.text_primary_color)
                    Spacer()
                    
                }
                
                VStack(spacing: 16) {
                                             HStack {
                                                 Text(self.catDetail.temperament ?? "").modifier(SailecFont(.medium, size: 15))
                                                     .foregroundColor(Color.text_primary_color)
                                                 Spacer()
                                             }
                                             
                                         }.padding(.vertical, 9)
                
                
                
                Text(self.catDetail.description ?? "")                                         .modifier(SailecFont(.regular, size: 16))
                    .foregroundColor(Color.text_primary_color)

                
                HStack(spacing: 5) {
                    DetailsInfoView(primary: "\(self.catDetail.origin ?? "")", secondary: "Origin")
                    DetailsInfoView(primary: "\(self.catDetail.lifeSpan ?? "")", secondary: "Life Span")
                }
                
            }.padding(.vertical, 16)
        }
    }
    
}

struct DetailsInfoView: View {
    var primary: String, secondary: String
    var body: some View {
        HStack {
            
            Spacer()
            VStack(spacing: 8) {
                Text(primary).modifier(SailecFont(.medium, size: 16))
                    .foregroundColor(Color.text_primary_color)
                Text(secondary).modifier(SailecFont(.regular, size: 12))
                    .foregroundColor(Color(hex: "828282"))
            }
            Spacer()
        }
        .padding(.vertical, 12)
        .background(Color.secondary_color)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "DDDDDD"), lineWidth: 0.25)
        )
    }
}


struct CatBreedDetailImage:View{
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
            .scaledToFill()
            .frame(width: 350, height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
          .edgesIgnoringSafeArea(.top)
        }
    }
  }
}

struct CatBreedDetail_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedDetail(catDetail: CatBreed(id: "abys", name: "Abyssinian", temperament: "Active, Energetic, Independent, Intelligent", description: "he Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", origin: "Egypt", lifeSpan: "14 - 15",imageId: "0XYvRd7oD", image: CatBreedImage(id: "i", width: 100, height:100,url:"https://cdn2.thecatapi.com/images/unX21IBVB.jpg"))).environmentObject(Favorites())
    }
}


