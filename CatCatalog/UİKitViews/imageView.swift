//
//  imageView.swift
//  CatCatalog
//
//  Created by Hakkı Yiğit Yener on 20.04.2022.
//

import SwiftUI

struct CatBreedDetailsImage:View{
    let imageURL:String?
    
    var body: some View{
        ZStack{
    if imageURL != nil {
                AsyncImage(url: URL(string: imageURL!)) { imageFetc in
                        if let image = imageFetc.image {
                                image.resizable()
                                    .scaledToFill()
                                    .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
                                  .edgesIgnoringSafeArea(.top)
                                        
                                     } else if imageFetc.error != nil {
                                         
                                         Text(imageFetc.error?.localizedDescription ?? "error")
                                             .foregroundColor(Color.pink)
                                             .frame(width: 100, height: 100)
                                     } else {
                                        ProgressView()
                                             .frame(width: 100, height: 100)
                                     }
                                    
                                }
                            }else {
                                Color.gray.frame(width: 100, height: 100)
                }
            
        }
    }
}
