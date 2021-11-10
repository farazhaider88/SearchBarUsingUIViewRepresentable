//
//  ContentView.swift
//  SearchbarUsingUIViewRepresentable
//
//  Created by Faraz Haider on 10/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var teams = BundleDecoder.decodeIPLTeamsBundleJson()
    @State private var searchBarText : String = String()
    
    var body: some View {
        VStack{
            SearchBarView(searchBartText: $searchBarText)
            List{
                ForEach(teams.filter({searchBarText.isEmpty ? true : $0.name.contains(searchBarText)}),id:\.id){
                    teams in
                    TeamsRow(team: teams)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
