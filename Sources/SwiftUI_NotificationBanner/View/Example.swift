//
//  SwiftUIView.swift
//  
//
//  Created by Dominik Butz on 10/11/2022.
//

import SwiftUI

public struct Example: View {

    @EnvironmentObject var notificationHandler: DYNotificationHandler 
    @State private var sheetPresented: Bool = false
    
    public init() {
   
    }
    
    public var body: some View {
     
        VStack(alignment: .center, spacing: 10) {
                Spacer()

                Button(action: {
                    notificationHandler.show(notification: DYNotification(title: "Warm reminder", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", image: Image(systemName: "checkmark.seal.fill"), type: .info, displayDuration: 3, dismissOnTap: true, displayEdge: .leading, hapticFeedbackType: .success, tapHandler: {
                        print("info banner tapped")
                    }))
                }, label: {
                    Text("Info Banner")
                }).foregroundColor(.blue)
                
                Button(action: {
                    notificationHandler.show(notification: DYNotification(message: "Running out of time!", type: .warning, displayDuration: 3, dismissOnTap: true, displayEdge: .top, hapticFeedbackType: .warning, tapHandler: {
                        print("warning banner tapped")
                    }))
                }, label: {
                    Text("Warning Status Banner")
                }).foregroundColor(.yellow)

            
                Button(action: {
                    notificationHandler.show(notification: DYNotification(title: "Error", message: "Danger Zone! An unknown error occurred.", image: Image(systemName: "exclamationmark.triangle.fill"), type: .error, displayDuration: 2, dismissOnTap: true, displayEdge: .bottom, hapticFeedbackType: .error, tapHandler: {
                        print("error banner tapped")
                    }))
                }, label: {
                    Text("Error Status Banner")
                }).foregroundColor(.red)
            
            
            
                Spacer()
            
                Button {
                    self.sheetPresented = true
                } label: {
                    Text("Launch Sheet").padding(5).overlay(RoundedRectangle(cornerRadius: 10).stroke(.blue, lineWidth: 2))
                }
                .sheet(isPresented: $sheetPresented) {
                    SheetView().environmentObject(notificationHandler)
                }.padding()

            }
            .frame(width: UIScreen.main.bounds.size.width)

            
        }

}

struct SheetView: View {
    @EnvironmentObject var notificationHandler: DYNotificationHandler
    var body: some View {
        
        VStack {
            Text("Sheet Header").font(.title).padding()
            Spacer()
            Button(action: {
                notificationHandler.show(notification: DYNotification(title: "Success", message: "Notification banner successfully presented above sheet!", image: Image(systemName: "checkmark.circle"), type: .success, displayDuration: 3, dismissOnTap: true, hapticFeedbackType: .success, tapHandler: {
                    print("success banner tapped")
                }))
            }, label: {
                Text("Launch success banner above sheet!")
            }).foregroundColor(.green)
            Spacer()
        }
    }
}



//#if DEBUG
//struct Example_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        Example()
//    }
//}
//#endif
