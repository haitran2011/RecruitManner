//
//  JobDetailInteractor.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/15.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol JobDetailInteractorInput
{
    func doSomething(request: JobDetail.Request)
}

protocol JobDetailInteractorOutput
{
    func presentSomething(response: JobDetail.Response)
}



// ============================================================================= //
// MARK: - JobDetailInteractor Class Definition
// ============================================================================= //

class JobDetailInteractor: JobDetailInteractorInput
{
    var output: JobDetailInteractorOutput!
    var worker: JobDetailWorker!
    
    // MARK: Business logic
    
    func doSomething(request: JobDetail.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = JobDetailWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = JobDetail.Response()
        output.presentSomething(response: response)
    }
}
