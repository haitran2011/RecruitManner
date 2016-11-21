//
//  PositionListOfHRInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol PositionListOfHRInteractorInput
{
    func doSomething(request: PositionListOfHR.Request)
}

protocol PositionListOfHRInteractorOutput
{
    func presentSomething(response: PositionListOfHR.Response)
}



// ============================================================================= //
// MARK: - PositionListOfHRInteractor Class Definition
// ============================================================================= //

class PositionListOfHRInteractor: PositionListOfHRInteractorInput
{
    var output: PositionListOfHRInteractorOutput!
    var worker: PositionListOfHRWorker!
    
    // MARK: Business logic
    
    func doSomething(request: PositionListOfHR.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = PositionListOfHRWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = PositionListOfHR.Response()
        output.presentSomething(response: response)
    }
}
