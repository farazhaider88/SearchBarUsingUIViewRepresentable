//
//  SearchBarView.swift
//  SearchbarUsingUIViewRepresentable
//
//  Created by Faraz Haider on 10/11/2021.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
    
    typealias UIViewType = UISearchBar
    @Binding var searchBartText:String
    
    
    class Coordinator: NSObject,UISearchBarDelegate
    {
        @Binding var searchBarValue :String
        
        init(text:Binding<String>)
        {
            _searchBarValue = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchBarValue = searchText
        }
    }
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $searchBartText)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = searchBartText
    }

}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchBartText: .constant("Test"))
    }
}
