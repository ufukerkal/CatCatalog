//
//  CatBreedLoading.swift
//  CatCatalog
//
//  Created by Hakkı Yiğit Yener on 14.04.2022.
//

import SwiftUI

struct CatBreedLoading: View {
    var body: some View {
        VStack(spacing:-5){
            LottieView(animationName: "9046-cat-search",
                       loopMode: .loop,
                       contentMode: .scaleAspectFit).frame(width:145,height: 145, alignment: Alignment.center)
            Text("Loading...").modifier(SailecFont(.bold, size: 15)).lineLimit(1)
                .foregroundColor(Color.text_primary_color)
        }
        .frame(alignment: Alignment.center)
    }
}

struct CatBreedLoading_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedLoading()
    }
}
