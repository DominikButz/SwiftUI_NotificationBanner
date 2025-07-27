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
    
    public init() {}
    
    public var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center, spacing: 10) {
                Spacer()
                
                Button(action: {

                    notificationHandler.show(notification: self.infoNotification)
                }, label: {
                    Text("Info Banner")
                }).foregroundColor(.blue)
                
                Button(action: {
             
                    notificationHandler.show(notification: self.warningNotification)
                }, label: {
                    Text("Warning Status Banner")
                }).foregroundColor(.yellow)
                
                Button(action: {
                    notificationHandler.show(notification: self.errorNotification)
                }, label: {
                    Text("Error Status Banner")
                }).foregroundColor(.red)
                
                Spacer()
                
                #if os(iOS)
                Button {
                    self.sheetPresented = true
                } label: {
                    Text("Launch Sheet").padding(5).overlay(RoundedRectangle(cornerRadius: 10).stroke(.blue, lineWidth: 2))
                }
                .sheet(isPresented: $sheetPresented) {
                    SheetView().environmentObject(notificationHandler)
                }.padding()
                #endif
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
        
    }
    
    var infoNotification: DYNotification {
        
        let title = "Warm reminder"
        let message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        let image = Image(systemName: "checkmark.seal.fill")
        let type: DYNotificationType = .info
        let displayDuration: TimeInterval = 10
        let dismissOnTap = true
        let displayEdge: Edge = .leading
        
        #if os(iOS)
       return DYNotification(title: title, message: message, image: image, type: type, displayDuration: displayDuration, dismissOnTap: dismissOnTap, displayEdge: displayEdge, hapticFeedbackType: .success, tapHandler: {
            print("info banner tapped")
        })
        
        #else
        return DYNotification(title: title, message: message, image: image, type: type, displayDuration: displayDuration, dismissOnTap: dismissOnTap, displayEdge: displayEdge, tapHandler: {
             print("info banner tapped")
         })
        #endif
        
    }
    
    var warningNotification: DYNotification {
        let message = "Running out of time!"
        let image = Image(systemName: "checkmark.seal.fill")
        let type: DYNotificationType = .warning
        let displayDuration: TimeInterval = 5
        let dismissOnTap = true
        let displayEdge: Edge = .top
        
        #if os(iOS)
        return DYNotification(message: message, image: image, type: type, displayDuration: displayDuration, dismissOnTap: dismissOnTap, displayEdge: displayEdge, hapticFeedbackType: .warning, tapHandler: {
            print("warning banner tapped")
        })

        #else
        return DYNotification(message: message, image: image, type: type, displayDuration: displayDuration, dismissOnTap: dismissOnTap, displayEdge: displayEdge, tapHandler: {
             print("warning banner tapped")
         })
        #endif
        
    }
    
    var errorNotification: DYNotification {
        let title = "Error"
        let message = "Danger Zone! An unknown error occurred."
        let image = Image(systemName: "exclamationmark.triangle.fill")
        let type: DYNotificationType = .error
        let displayDuration: TimeInterval = 2
        let dismissOnTap = true
        let displayEdge: Edge = .bottom
        
        #if os(iOS)
        return DYNotification(title: title, message: message, image: image, type: type, displayDuration: displayDuration, dismissOnTap: dismissOnTap, displayEdge: displayEdge, hapticFeedbackType: .error, tapHandler: {
            print("error banner tapped")
        })

        #else
        return DYNotification(title: title, message: message, image: image, type: type, displayDuration: displayDuration, dismissOnTap: dismissOnTap, displayEdge: displayEdge, tapHandler: {
             print("error banner tapped")
         })
        #endif
        
    }


}

struct SheetView: View {
    @EnvironmentObject var notificationHandler: DYNotificationHandler
    var body: some View {
        
        VStack {
            Text("Sheet Header").font(.title).padding()
            Spacer()
            Button(action: {
                notificationHandler.show(notification: self.successNotification)
            }, label: {
                Text("Launch success banner above sheet!")
            }).foregroundColor(.green)
            Spacer()
        }
    }
    
    var successNotification: DYNotification {
        let title = "Success"
        let message = "Notification banner successfully presented above sheet!"
        let image = Image(systemName: "checkmark.circle")
        let type: DYNotificationType = .success
        let displayDuration: TimeInterval = 3
        let dismissOnTap = true
        let displayEdge: Edge = .top
        
        #if os(iOS)
        return DYNotification(title: title, message: message, image: image, type: type, displayDuration: displayDuration, dismissOnTap: dismissOnTap, displayEdge: displayEdge, hapticFeedbackType: .success, tapHandler: {
            print("success banner tapped")
        })

        #else
        return DYNotification(title: title, message: message, image: image, type: type, displayDuration: displayDuration, dismissOnTap: dismissOnTap, displayEdge: displayEdge, tapHandler: {
             print("success banner tapped")
         })
        #endif
        
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
