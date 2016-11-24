//
//  WhoSeeMyPositionInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol WhoSeeMyPositionInteractorInput
{
    func doSomething(request: WhoSeeMyPosition.Request)
}

protocol WhoSeeMyPositionInteractorOutput
{
    func presentSomething(response: WhoSeeMyPosition.Response)
}



// ============================================================================= //
// MARK: - WhoSeeMyPositionInteractor Class Definition
// ============================================================================= //

class WhoSeeMyPositionInteractor: WhoSeeMyPositionInteractorInput
{
    var output: WhoSeeMyPositionInteractorOutput!
    var worker: WhoSeeMyPositionWorker!
    
    // MARK: Business logic
    
    func doSomething(request: WhoSeeMyPosition.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = WhoSeeMyPositionWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = WhoSeeMyPosition.Response()
        output.presentSomething(response: response)
    }
}
