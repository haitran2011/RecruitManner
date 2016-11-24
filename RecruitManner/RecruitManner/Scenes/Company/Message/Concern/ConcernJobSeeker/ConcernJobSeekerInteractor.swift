//
//  ConcernJobSeekerInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol ConcernJobSeekerInteractorInput
{
    func doSomething(request: ConcernJobSeeker.Request)
}

protocol ConcernJobSeekerInteractorOutput
{
    func presentSomething(response: ConcernJobSeeker.Response)
}



// ============================================================================= //
// MARK: - ConcernJobSeekerInteractor Class Definition
// ============================================================================= //

class ConcernJobSeekerInteractor: ConcernJobSeekerInteractorInput
{
    var output: ConcernJobSeekerInteractorOutput!
    var worker: ConcernJobSeekerWorker!
    
    // MARK: Business logic
    
    func doSomething(request: ConcernJobSeeker.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = ConcernJobSeekerWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = ConcernJobSeeker.Response()
        output.presentSomething(response: response)
    }
}
