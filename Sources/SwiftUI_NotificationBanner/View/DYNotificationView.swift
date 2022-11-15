//
//  File.swift
//  
//
//  Created by Dominik Butz on 10/11/2022.
//

import Foundation
import SwiftUI

public struct DYNotificationView: View {
    
//    @Environment(\.colorScheme) var colorScheme
    var notification: DYNotification
    var settings: DYNotificationViewSettings = DYNotificationViewSettings()
    let frameWidth: CGFloat
    
    let topSafeArea: CGFloat = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    
    let bottomSafeArea: CGFloat = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
    
    /// intialiser of DYNotificationView
    /// - Parameters:
    ///   - notification: the current notification to be displayed as banner
    ///   - frameWidth: width of the banner frame
    public init(notification: DYNotification, frameWidth: CGFloat) {
  
        self.notification = notification
        self.frameWidth = frameWidth
    }
    
    public var body: some View {

                HStack(spacing: 5) {
                    
                    Spacer()
                    
                    if let image = notification.image {
                        image.renderingMode(settings.imageRenderingMode).resizable().aspectRatio(contentMode: settings.imageContentMode).frame(maxWidth: settings.imageMaxWidth, maxHeight: settings.imageMaxHeight).foregroundColor(settings.imageColor).padding(.horizontal, 10)

                    }
                    VStack(alignment: .leading, spacing:5) {
                        if let title = notification.title {
                            Text(title).font(settings.titleFont)
                        }
                        Text(notification.message).font(settings.messageFont).fixedSize(horizontal: false, vertical: true)
                    }.foregroundColor(settings.textColor)
                    

                    Spacer()
          
                    
                }.padding(.top, notification.displayEdge == .top ?  topSafeArea : 5)
                .padding(.bottom, notification.displayEdge == .bottom ?  bottomSafeArea : 5)
                    .padding(8)
                    .frame(width: frameWidth)
                    .background(settings.gradientFor(notificationType: notification.type))
                    .clipShape(backgroundShape)
                    .shadow(color: settings.dropShadow?.color ?? .clear, radius: settings.dropShadow?.radius ?? 0, x: settings.dropShadow?.x ?? 0, y: settings.dropShadow?.y ?? 0)

    }
    
    var backgroundShape: some Shape {
        
        let topCorner: CGFloat = notification.displayEdge == .top ? 0 : settings.cornerRadius
        let bottomCorner: CGFloat = notification.displayEdge == .top ? settings.cornerRadius : 0
        
        return RoundedCornerRectangle(tl: topCorner, tr: topCorner, bl: bottomCorner, br: bottomCorner)
    }
    

    
}

public extension View where Self == DYNotificationView {
    
    /// banner text modifier function
    /// - Parameters:
    ///   - titleFont: font of the title label
    ///   - messageFont: font of the message body label
    ///   - color: text color of title and message labels
    /// - Returns: modified DYNotificationView
    func text(titleFont: Font = .headline, messageFont: Font = .body, color: Color = .primary)->DYNotificationView {
        
        var modView = self
        modView.settings.titleFont = titleFont
        modView.settings.messageFont = messageFont
        modView.settings.textColor = color
        return modView
        
    }
    
    /// banner image modifier function
    /// - Parameters:
    ///   - maxHeight: max frame height of the image
    ///   - maxWidth: max frame width of the image
    ///   - contentMode: image content mode
    ///   - renderingMode: image rendering mode - original or template
    ///   - color: foreground color of the image (if rendering mode is template)
    /// - Returns: modified DYNotificationView
    func image(maxHeight: CGFloat? = 40, maxWidth: CGFloat? = 40, contentMode: ContentMode = .fit, renderingMode: Image.TemplateRenderingMode = .template, color: Color? = .primary)->DYNotificationView {
        var modView = self
        modView.settings.imageMaxWidth = maxWidth
        modView.settings.imageMaxHeight = maxHeight
        modView.settings.imageContentMode = contentMode
        modView.settings.imageRenderingMode = renderingMode
        modView.settings.imageColor = color
        return modView
    }
    
    /// banner background color gradient modifier function
    /// - Parameters:
    ///   - info: gradient of an info type banner
    ///   - success: gradient of a success type banner
    ///   - warning: gradient of ar warning type banner
    ///   - error: gradient of an error type banner
    /// - Returns: modified DYNotificationView
    func backgroundGradientForNotificationType(info: LinearGradient = LinearGradient(colors: [.blue], startPoint: .top, endPoint: .bottom), success: LinearGradient = LinearGradient(colors: [.green], startPoint: .top, endPoint: .bottom), warning: LinearGradient = LinearGradient(colors: [.yellow], startPoint: .top, endPoint: .bottom), error: LinearGradient = LinearGradient(colors: [.red], startPoint: .top, endPoint: .bottom))-> DYNotificationView {
        
        var modView = self
        modView.settings.infoBannerBackgroundGradient = info
        modView.settings.successBannerBackgroundGradient = success
        modView.settings.warningBannerBackgroundGradient = warning
        modView.settings.errorBannerBackgroundGradient = error
        return modView
        
    }
    
    /// corner radius of the banner background
    /// - Parameter radius: corner radius - applies to the bottom corners if displayEdge is top, otherwise radius is applied to the two top corners.
    /// - Returns: modified DYNotificationView
    func cornerRadius(_ radius: CGFloat = 0)->DYNotificationView {
        var modView = self
        modView.settings.cornerRadius = radius
        return modView
    }
    
    
    /// drop shadow of the banner background
    /// - Parameters:
    ///   - color: shadow color. Default is clear (= no shadow)
    ///   - radius: radius of the shadow
    ///   - x: x offset
    ///   - y: y offset
    /// - Returns: modified DYNotificationView
    func dropShadow(color: Color = .clear, radius: CGFloat = 5, x: CGFloat = 0, y: CGFloat = 5)->DYNotificationView {
        var shadow: Shadow?
        if color != .clear {
            shadow = Shadow(color: color, radius: radius, x: x, y: y)
        }
        var modView = self
        modView.settings.dropShadow = shadow
        return modView
    }
    

    
}

struct DYNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            VStack {
                
                DYNotificationView(notification: DYNotification(title: "Cool Lorem Ipsum", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", image: Image(systemName: "checkmark.circle"), displayEdge: .top), frameWidth: min(450, proxy.size.width))
                    
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}





