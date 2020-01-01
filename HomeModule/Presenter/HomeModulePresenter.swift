//
//  HomeModulePresenter.swift
//  HomeModule
//
//  Created by MacBook on 1/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import CoreMotion

final class HomeModulePresenter {
    private let motionManager = CMMotionManager()
    weak var view: HomeModulePresenterToView!
    
    func trackMotion() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 2.0 / 60.0
            let motionQueue = OperationQueue()
            motionManager.startDeviceMotionUpdates(
                to: motionQueue, withHandler: { [weak self] (data: CMDeviceMotion?, error: Error?) in
                    guard let `self` = self, let data = data else { return }
                    self.view.moveGradient(gravityX: data.gravity.x, gravityY: data.gravity.y)
            })
        }
    }

}

// MARK: - Home module view to presenter

extension HomeModulePresenter: HomeModuleViewToPresenter {
    func viewIsReady() {
        view.addNavigationBarImage()
        trackMotion()
    }
    
}
