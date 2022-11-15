//
//  File.swift
//  
//
//  Created by Dominik Butz on 10/11/2022.
//

import Foundation
import SwiftUI

internal struct DYNotificationViewSettings {

    //text settings
    var titleFont: Font
    var messageFont: Font
    var textColor: Color

    // image settings
    var imageMaxHeight: CGFloat?
    var imageMaxWidth: CGFloat?
    var imageContentMode: ContentMode
    var imageRenderingMode: Image.TemplateRenderingMode
    var imageColor: Color?
    
    // background settings
    var infoBannerBackgroundGradient: LinearGradient
    var successBannerBackgroundGradient: LinearGradient
    var warningBannerBackgroundGradient: LinearGradient
    var errorBannerBackgroundGradient: LinearGradient
    var dropShadow: Shadow?
    var cornerRadius: CGFloat
    

    
    init(titleFont: Font = .headline, messageFont: Font = .body, textColor:Color = Color.primary,  imageMaxHeight: CGFloat? = 40, imageMaxWidth: CGFloat? = 40, imageContentMode: ContentMode = .fit, imageRenderingMode: Image.TemplateRenderingMode = .template, imageColor: Color? = Color.primary, infoBannerBackgroundGradient: LinearGradient = LinearGradient(colors: [.blue], startPoint: .top, endPoint: .bottom), successBannerBackgroundGradient: LinearGradient =  LinearGradient(colors: [.green], startPoint: .top, endPoint: .bottom),  warningBannerBackgroundGradient: LinearGradient = LinearGradient(colors: [.yellow], startPoint: .top, endPoint: .bottom), errorBannerBackgroundGradient: LinearGradient = LinearGradient(colors: [.red], startPoint: .top, endPoint: .bottom),   dropShadow: Shadow? = nil, cornerRadius: CGFloat = 0) {
        self.messageFont = messageFont
        self.titleFont = titleFont
        self.textColor = textColor
        self.imageMaxHeight = imageMaxHeight
        self.imageMaxWidth = imageMaxWidth
        self.imageContentMode = imageContentMode
        self.imageRenderingMode = imageRenderingMode
        self.imageColor = imageColor
        self.infoBannerBackgroundGradient = infoBannerBackgroundGradient
        self.successBannerBackgroundGradient = successBannerBackgroundGradient
        self.warningBannerBackgroundGradient = warningBannerBackgroundGradient
        self.errorBannerBackgroundGradient = errorBannerBackgroundGradient
        self.dropShadow = dropShadow
        self.cornerRadius = cornerRadius
    }
    
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


