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

        ShareSDK.registerApp("18cfd02513161",
                             activePlatforms: [
                                SSDKPlatformType.typeSMS.rawValue,
                                SSDKPlatformType.typeMail.rawValue,
                                SSDKPlatformType.typeSinaWeibo.rawValue,
                                SSDKPlatformType.typeTencentWeibo.rawValue,
                                SSDKPlatformType.typeWechat.rawValue,
                                SSDKPlatformType.typeQQ.rawValue ],
                             onImport: { platformType in
                                switch (platformType) {
                                case .typeSinaWeibo:
                                    ShareSDKConnector.connectWeibo(WeiboSDK.classForCoder())
                                case .typeWechat:
                                    ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                                case .typeQQ:
                                    ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
                                default: break
                                }
            },
                             onConfiguration: { (platformType, appInfo) in
                                switch (platformType) {
                                case SSDKPlatformType.typeSinaWeibo:
                                    //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                                    appInfo?.ssdkSetupSinaWeibo(byAppKey: "568898243",
                                                                appSecret : "38a4f8204cc784f81f9f0daaf31e02e3",
                                                                redirectUri : "http://www.sharesdk.cn",
                                                                authType : SSDKAuthTypeBoth)
                                    
                                case SSDKPlatformType.typeWechat:
                                    //设置微信应用信息
                                    appInfo?.ssdkSetupWeChat(byAppId: "wx4868b35061f87885", appSecret: "64020361b8ec4c99936c0e3999a9f249")
                                    
                                case SSDKPlatformType.typeTencentWeibo:
                                    //设置腾讯微博应用信息，其中authType设置为只用Web形式授权
                                    appInfo?.ssdkSetupTencentWeibo(byAppKey: "801307650",
                                                                   appSecret : "ae36f4ee3946e1cbb98d6965b0b2ff5c",
                                                                   redirectUri : "http://www.sharesdk.cn")
                                case SSDKPlatformType.typeQQ:
                                    //设置QQ应用信息
                                    appInfo?.ssdkSetupQQ(byAppId: "100371282",
                                                         appKey : "aed9b0303e3ed1e27bae87c33761161d",
                                                         authType : SSDKAuthTypeWeb)
                                default:
                                    break
                                }
        })
    }
    
    func testShare (at viewController: UIViewController) {
        
//        // 1.创建分享参数
//        let shareParames = NSMutableDictionary()
//        shareParames.ssdkSetupShareParams(byText: "分享内容",
//                                          images : UIImage(named: "mob"),
//                                          url : NSURL(string:"http://mob.com") as URL!,
//                                          title : "分享标题",
//                                          type : SSDKContentType.image)
//        
//        //2.进行分享
//        ShareSDK.share(SSDKPlatformType.typeSinaWeibo, parameters: shareParames) { (state : SSDKResponseState, nil, entity : SSDKContentEntity?, error :Error?) in
//            
//            switch state{
//                
//            case SSDKResponseState.success: print("分享成功")
//            case SSDKResponseState.fail:    print("授权失败,错误描述:\(error)")
//            case SSDKResponseState.cancel:  print("操作取消")
//                
//            default:
//                break
//            }
//            
//        }
        
        let shareParames = NSMutableDictionary()
        shareParames.ssdkSetupShareParams(byText: "分享内容",
                                          images : UIImage(named: "mob"),
                                          url : NSURL(string:"http://mob.com") as URL!,
                                          title : "分享标题",
                                          type : SSDKContentType.image)
        
        ShareSDK.showShareActionSheet(nil,
                                      items: nil,
                                      shareParams: shareParames,
                                      onShareStateChanged: { (state, platformType, userData, contentEntity, error, end) in
                                        switch (state) {
                                        case .success:
                                            let alertView = UIAlertView(title: "分享成功",
                                                                        message: nil,
                                                                        delegate: nil,
                                                                        cancelButtonTitle: "确定")
                                            alertView.show()
                                        case .fail:
                                            let alertView = UIAlertView(title: "分享失败",
                                                                        message: nil,
                                                                        delegate: nil,
                                                                        cancelButtonTitle: "确定")
                                            alertView.show()
                                        default: break
                                        }
        })
    }
    
}
