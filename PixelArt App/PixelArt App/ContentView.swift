//
//  ContentView.swift
//  PocNavegacao3
//
//  Created by Lucas Claro on 03/11/20.
//

//
//  ContentView.swift
//  PocNavegacao
//
//  Created by Lucas Claro on 03/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var pixelArtViewModel : PixelArtViewModel
    @State var test: Bool = false
    
    var body: some View {
        if test{
//            CustomController(estouaparecendo: $test)
        }else{
            NavigationView {
                TabView (selection: $pixelArtViewModel.nav.tabSelecionada){
                    
                    Home()
                        .tabItem{
                            VStack{
                                Image(pixelArtViewModel.nav.tabSelecionada == .home ? ("homeRoxo") : ("home"))
                                Text("Home").foregroundColor(pixelArtViewModel.nav.tabSelecionada == .home ? Color.purple : Color.gray)
                            }
                        }
                        .tag(Tab.home)
                    Galeria()
                        .tabItem{
                            VStack{
                                Image(pixelArtViewModel.nav.tabSelecionada == .album ? ("albunsRoxo") : ("albunsCinza"))
                                Text("Albuns").foregroundColor(pixelArtViewModel.nav.tabSelecionada == .album ? .purple : .gray)
                            }
                        }
                        .tag(Tab.album)
                    
                }
                    .if(pixelArtViewModel.nav.AlbumAberto != nil) {
                        $0
                            .navigationBarTitle(pixelArtViewModel.nav.AlbumAberto!.name)
                            .navigationBarTitleDisplayMode(.inline)
                            
                            .navigationBarItems(
                                leading:
                                    Button(action:  {
                                    pixelArtViewModel.exitAlbum()
                                }) {
                                    Image(systemName: "chevron.left")
                                        .font(.title)
                                },
                                trailing:
                                    AddButton(destination: CustomController().onDisappear(perform: {
                                        pixelArtViewModel.nav.fetch()
                                    }))
                            )
                    }
                    .if(pixelArtViewModel.nav.AlbumAberto == nil) {
                        $0
                            .navigationBarTitle(pixelArtViewModel.nav.tabSelecionada == .home ? "My Drawings" : "Albuns")
                            .navigationBarTitleDisplayMode(.automatic)
                            .navigationBarItems(trailing:
//                                                    Button(action:  {
//                                                        test = true
//                                                    }) {
//                                                        Image(systemName: "plus")
//                                                            .font(.title)
//                                                    }
                                                    AddButton(destination: CustomController().onDisappear(perform: {
                                                        pixelArtViewModel.nav.fetch()
                                                    }))
                            )
                    }
            }
            .accentColor(Color(UIColor(red: 98/255, green: 26/255, blue: 238/255, alpha: 1 )))
        }
        
        
    
    }

    
    struct AddButton<Destination : View>: View {
        var destination : Destination
        
        var body: some View {
            NavigationLink(destination: self.destination) {
                Image("mais").font(.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Galeria()
    }
}

