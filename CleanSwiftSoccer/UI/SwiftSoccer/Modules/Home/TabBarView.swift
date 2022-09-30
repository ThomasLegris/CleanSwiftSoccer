//
//  TabBarView.swift
//  SwiftSoccer
//
//  Created by Consultant on 22/09/2022.
//

import SwiftUI
import Presentation

struct TabBarView: View {
    @Binding var selectedPage: HomePageType
    
    var body: some View {
        HStack(alignment: .center) {
            ForEach(HomePageType.allCases,
                    id: \.self) { tab in
                TabBarItem(selectedTab: $selectedPage,
                           tab: tab)
            }
        }
        .padding(8.0)
        .background(Color("red50"))
    }
}

//
//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
