//
//  CatBreedListview.swift
//  CatCatalog
//
//  Created by Hakkı Yiğit Yener on 15.04.2022.
//

import SwiftUI


struct CatBreedList: View {
    @StateObject var catBreedFetcher = CatBreedFetcher()
    var body: some View {
        
        if catBreedFetcher.isLoading {
            CatBreedLoading()
        }
        else if catBreedFetcher.error != nil {
            
            CatBreedError(catBreedFetcher: catBreedFetcher)
        }
        else{
            CatBreedListview(catbreeds:catBreedFetcher.cat)
        }
    }
}





struct CatBreedListview: View {
    @ObservedObject var favorites=Favorites()
    @ObservedObject var catBreedFetcher = CatBreedFetcher()
    let catbreeds:[CatBreed]
 
    @State private var searchText: String = ""
    
    
    var searchTextFilter:[CatBreed]{
        if searchText.count==0 {
            return catbreeds
        }
        else {
            return catBreedFetcher.cat
        }
    }
 
    var body: some View {
        NavigationView{
            ZStack(){
                Color.primary_color.edgesIgnoringSafeArea(.all)
                List() {
         
            ForEach(searchTextFilter){ catbreeds in
             NavigationLink {
                
                 CatBreedDetail(catDetail: catbreeds)
                    
                }
            label: {
                    if searchText.count==0 {
                        
                            CatBreedListRow(catbreeds: catbreeds).listRowSeparator(.hidden, edges: .bottom)
                    
                    }
                    else {
                        CatBreedListRow(catbreeds: catbreeds)
                    }
                }
            .listRowBackground(Color.white)
            .navigationTitle("Cats").foregroundColor(.blue)
            
            }
          }
                .accentColor(.white)

        }
         .background(Color.primary_color.edgesIgnoringSafeArea(.all))
         .onAppear(perform: {
             if searchText.count==0 {
                 return catBreedFetcher.fetcCatsBreed()
             }
            
         })
         .listStyle(.sidebar)
        .searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: searchText) { newValue in
             catBreedFetcher.fetcAllCatBreddSearch(searchText:newValue)
            }
        }
        .environmentObject(favorites)
      }
    }

struct CatBreedListview_Previews: PreviewProvider {
    static var previews: some View {
        CatBreedListview(catbreeds:[CatBreed]())
        
    }
}
