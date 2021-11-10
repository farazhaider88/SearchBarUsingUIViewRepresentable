//
//  BundleDecoder.swift
//  SearchbarUsingUIViewRepresentable
//
//  Created by Faraz Haider on 10/11/2021.
//

import Foundation

struct BundleDecoder
{
    static func decodeIPLTeamsBundleJson() -> [Teams] {
        let iplTeamJson = Bundle.main.path(forResource: "IplTeams", ofType: "json")
        let teamsData = try! Data(contentsOf: URL(fileURLWithPath: iplTeamJson!), options: .alwaysMapped)
        return try! JSONDecoder().decode([Teams].self, from: teamsData)
    }
}
