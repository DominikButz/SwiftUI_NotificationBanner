//
//  File.swift
//  
//
//  Created by Dominik Butz on 10/11/2022.
//

import Foundation
import SwiftUI

internal struct DYNotificationBannerSettings {

    //text settings
    var titleFont: Font = .headline
    var messageFont: Font = .body
    var textColor: Color = .primary

    // image settings
    var imageMaxHeight: CGFloat? = 40
    var imageMaxWidth: CGFloat? = 40
    var imageContentMode: ContentMode = .fit
    var imageRenderingMode: Image.TemplateRenderingMode = .template
    var imageColor: Color? = .primary
    
    // background settings
    var infoBannerBackgroundGradient: LinearGradient =  LinearGradient(colors: [.blue], startPoint: .top, endPoint: .bottom)
    var successBannerBackgroundGradient: LinearGradient =  LinearGradient(colors: [.green], startPoint: .top, endPoint: .bottom)
    var warningBannerBackgroundGradient: LinearGradient = LinearGradient(colors: [.yellow], startPoint: .top, endPoint: .bottom)
    var errorBannerBackgroundGradient: LinearGradient = LinearGradient(colors: [.red], startPoint: .top, endPoint: .bottom)
    var dropShadow: Shadow? = nil
    var cornerRadius: CGFloat = 0
    
//
//    
//    init(titleFont: Font = .headline, messageFont: Font = .body, textColor:Color = Color.primary,  imageMaxHeight: CGFloat? = 40, imageMaxWidth: CGFloat? = 40, imageContentMode: ContentMode = .fit, imageRenderingMode: Image.TemplateRenderingMode = .template, imageColor: Color? = Color.primary, infoBannerBackgroundGradient: LinearGradient = LinearGradient(colors: [.blue], startPoint: .top, endPoint: .bottom), successBannerBackgroundGradient: LinearGradient =  LinearGradient(colors: [.green], startPoint: .top, endPoint: .bottom),  warningBannerBackgroundGradient: LinearGradient = LinearGradient(colors: [.yellow], startPoint: .top, endPoint: .bottom), errorBannerBackgroundGradient: LinearGradient = LinearGradient(colors: [.red], startPoint: .top, endPoint: .bottom),   dropShadow: Shadow? = nil, cornerRadius: CGFloat = 0) {
//        self.messageFont = messageFont
//        self.titleFont = titleFont
//        self.textColor = textColor
//        self.imageMaxHeight = imageMaxHeight
//        self.imageMaxWidth = imageMaxWidth
//        self.imageContentMode = imageContentMode
//        self.imageRenderingMode = imageRenderingMode
//        self.imageColor = imageColor
//        self.infoBannerBackgroundGradient = infoBannerBackgroundGradient
//        self.successBannerBackgroundGradient = successBannerBackgroundGradient
//        self.warningBannerBackgroundGradient = warningBannerBackgroundGradient
//        self.errorBannerBackgroundGradient = errorBannerBackgroundGradient
//        self.dropShadow = dropShadow
//        self.cornerRadius = cornerRadius
//    }
    
    func gradientFor(notificationType:  DYNotificationType)->LinearGradient {
        switch notificationType {
            case .error:
                return self.errorBannerBackgroundGradient
            case .success:
                return self.successBannerBackgroundGradient
            case .warning:
                return self.warningBannerBackgroundGradient
            default:
                return self.infoBannerBackgroundGradient
        }
    }
    

}


