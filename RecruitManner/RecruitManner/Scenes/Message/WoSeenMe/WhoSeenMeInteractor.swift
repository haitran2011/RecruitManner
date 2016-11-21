//
//  WhoSeenMeInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/17.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol WhoSeenMeInteractorInput
{
    func doSomething(request: WhoSeenMe.Request)
}

protocol WhoSeenMeInteractorOutput
{
    func presentSomething(response: WhoSeenMe.Response)
}



// ============================================================================= //
// MARK: - WhoSeenMeInteractor Class Definition
// ============================================================================= //

class WhoSeenMeInteractor: WhoSeenMeInteractorInput
{
    var output: WhoSeenMeInteractorOutput!
    var worker: WhoSeenMeWorker!
    
    // MARK: Business logic
    
    func doSomething(request: WhoSeenMe.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = WhoSeenMeWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = WhoSeenMe.Response()
        output.presentSomething(response: response)
    }
}
