//
//  MessageListInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/12/9.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol MessageListInteractorInput
{
    func doSomething(request: MessageList.Request)
}

protocol MessageListInteractorOutput
{
    func presentNewResumesInfo(response: MessageList.Response)
    
    func presentCompanyTrackInfo(response: MessageList.Response)
    
    func presentConcernInfo(response: MessageList.Response)
    
    func presentWhoSeeMyInfo(response: MessageList.Response)
    
    func presentSystemInfo(response: MessageList.Response)
}



// ============================================================================= //
// MARK: - MessageListInteractor Class Definition
// ============================================================================= //

class MessageListInteractor: MessageListInteractorInput
{
    var output: MessageListInteractorOutput!
    var worker: MessageListWorker!
    
    // MARK: Business logic
    
    func doSomething(request: MessageList.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = MessageListWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = MessageList.Response()
        output.presentNewResumesInfo(response: response)
        output.presentCompanyTrackInfo(response: response)
        output.presentConcernInfo(response: response)
        output.presentWhoSeeMyInfo(response: response)
        output.presentSystemInfo(response: response)
    }
}
