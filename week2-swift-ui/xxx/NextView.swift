//
//  NextView.swift
//  xxx
//
//  Created by AntMan6 on 23/11/2562 BE.
//  Copyright © 2562 xxx. All rights reserved.
//

import SwiftUI

struct NextView: View {
    var body: some View {
        ZStack {
            Color.gray
            Text("Hello, world")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
        }
        .navigationBarTitle("Detail page")
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
    }
}
