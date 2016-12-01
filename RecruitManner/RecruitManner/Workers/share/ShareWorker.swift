//
//  ShareWorker.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/12/1.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import Foundation

class ShareWorker {
    
    class func registerShardSDK() {
//        ShareSDK.registerApp("18cfd02513161")
//        
//        //添加新浪微博应用 注册网址 http://open.weibo.com
//        //ShareSDK.connectSinaWeibo(withAppKey: , appSecret: <#T##String!#>, redirectUri: "http://www.sharesdk.cn")
//        
//        //添加腾讯微博应用 注册网址 http://dev.t.qq.com
//        //ShareSDK.connectTencentWeibo(withAppKey: , appSecret: <#T##String!#>, redirectUri: "http://www.sharesdk.cn")
//        
//        //连接短信分享
//        ShareSDK.connectSMS()
//        //连接邮件
//        ShareSDK.connectMail()
    }
    
    func testShare (at viewController: UIViewController) {
        
//        let imagePath = Bundle.main.path(forResource: "mob", ofType: "png")
//        let publishContent = ShareSDK.content("分享内容",
//                                              defaultContent: "测试一下",
//                                              image: ShareSDK.image(withPath: imagePath),
//                                              title: "ShareSDK",
//                                              url: "http://www.mob.com",
//                                              description: "这是一条测试信息",
//                                              mediaType: SSPublishContentMediaTypeNews)
//        let container = ShareSDK.container()
//        container?.setIPhoneWith(viewController)
//        
//        ShareSDK.showShareActionSheet(container,
//                                      shareList: nil,
//                                      content: publishContent,
//                                      statusBarTips: true,
//                                      authOptions: nil,
//                                      shareOptions: nil,
//                                      result:  { (type, state, statusInfo, error, end) in
//                                        
//                                        if (state == SSResponseStateSuccess) {
//                                            print("分享成功")
//                                        } else if (state == SSResponseStateFail) {
//                                            print("分享失败,错误码:%ld,错误描述:%@", error?.errorCode(), error.debugDescription)
//                                        }
//        })
    }
    
}
