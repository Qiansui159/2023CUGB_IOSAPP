//
//  UserData.swift
//  PVZ Game
//
//  Created by Qiansui on 2024/1/10.
//

import Foundation
import UIKit

class UserManager {
    static let shared = UserManager() // 共享一个对象实例
    private let userData = UserDefaults.standard // 全局管理用户数据

    var userName: String = "Qiansui", age: Int = 18, birthday: Date = Date()
    var gamePictureToSentenceCount: Int = 0
}
