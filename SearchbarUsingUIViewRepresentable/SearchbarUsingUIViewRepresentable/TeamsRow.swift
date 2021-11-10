//
//  TeamsRow.swift
//  SearchbarUsingUIViewRepresentable
//
//  Created by Faraz Haider on 10/11/2021.
//

import SwiftUI

struct TeamsRow: View {
    var team: Teams

    var body: some View {
        HStack(spacing:20)
            {
                Image(team.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60, alignment: .center)

                VStack(alignment: .leading)
                    {
                        Text(team.name).font(.title).fontWeight(.regular).lineLimit(1)
                        if(team.winners.isEmpty == false)
                        {
                            HStack(alignment:.top)
                            {
                                Image("trophy")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)

                                Text(team.winners).foregroundColor(Color.yellow)
                                    .font(.subheadline).fontWeight(.bold).lineLimit(1)

                                }.padding()
                                .background(Capsule().fill(Color.black)).opacity(0.7)
                                .overlay(Capsule().stroke(Color.black, lineWidth:1))
                        }
                }
                Spacer()
        }.padding()
    }
}

struct TeamsRow_Previews: PreviewProvider {
    static var previews: some View {
        TeamsRow(team: Teams(id: 1, name: "new", winners: "wi", icon: "dc"))
    }
}
