//
//  OnlineResumeInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/13.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol OnlineResumeInteractorInput
{
    func doSomething(request: OnlineResume.Request)
}

protocol OnlineResumeInteractorOutput
{
    func presentSomething(response: OnlineResume.Response)
}



// ============================================================================= //
// MARK: - OnlineResumeInteractor Class Definition
// ============================================================================= //

class OnlineResumeInteractor: OnlineResumeInteractorInput
{
    var output: OnlineResumeInteractorOutput!
    var worker: OnlineResumeWorker!
    
    // MARK: Business logic
    
    func doSomething(request: OnlineResume.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = OnlineResumeWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = OnlineResume.Response()
        output.presentSomething(response: response)
    }
}
