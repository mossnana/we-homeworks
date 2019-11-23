//
//  ContentView.swift
//  xxx
//
//  Created by AntMan6 on 23/11/2562 BE.
//  Copyright © 2562 xxx. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var email = ""
    @State var displayEmail = "xxx"
    var body: some View {
        NavigationView {
            VStack {
                MyCircleImage()
                .padding(
                    .init(top: 0, leading: 0, bottom: 30, trailing: 0)
                )
                if self.displayEmail != "" {
                    MyAvatar()
                } else {
                    Text("")
                }
                TextField("Email", text: $email)
                    .padding(.all, 10.0)
                VStack {
                    NavigationLink(destination: NextView()) {
                        Text("Login")
                            .fontWeight(.bold)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
                            .background(Color.green)
                            .foregroundColor(Color.white)
                    }
                    .border(Color.white, width: 1)
                    .padding(
                        .init(top: 5, leading: 1, bottom: 5, trailing: 1)
                    )
                    Button(action: {
                        self.displayEmail = ""
                        self.email = ""
                    }) {
                        Text("Reset")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                    }
                    .border(Color.white, width: 1)
                    .padding(
                        .init(top: 5, leading: 1, bottom: 5, trailing: 1)
                    )
                }
                .padding(.all, 5.0)
                Spacer()
            }
            .padding(.all, 20.0)
        }.navigationBarTitle("Almacom", displayMode: .large)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
