//
//  CatBreedError.swift
//  CatCatalog
//
//

import SwiftUI

struct CatBreedError: View {
    @ObservedObject var catBreedFetcher: CatBreedFetcher
    var body: some View {
        VStack(spacing:-5){
            
            Text("😿")
                         .font(.system(size: 80))
            
            Text(catBreedFetcher.error ?? "")
            
        }
        .frame(alignment: Alignment.center)
    }
}
	
struct CatBreedError_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedError(catBreedFetcher: CatBreedFetcher())
    }
}
	
