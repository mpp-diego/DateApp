//
//  ContentView.swift
//  DateApp
//
//  Created by MYPINPAD on 27/04/2020.
//  Copyright © 2020 MYPINPAD. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var contentFile = ""
    private let fileName = "date_log.txt"
    var body: some View
    {
        VStack
        {
            Button(action: write) { Text("Write") }.padding(10)
            Button(action: readFile) { Text("Read") }.padding(10)
            Text(self.contentFile).padding(10).padding(10)
        }
    }
    
    func readFile() 
    {
        do
        {
            self.contentFile = try String(contentsOf: getDocumentsDirectory().appendingPathComponent(fileName), encoding: .utf8)
        }
        catch
        {
            print("Error read")
        }
    }
    
    func write()
    {
        let str = "\(Date())"
        let filename = getDocumentsDirectory().appendingPathComponent(fileName)

        do {
            try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error write")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
