//
//  JobApplicationRecordInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol JobApplicationRecordInteractorInput
{
    func doSomething(request: JobApplicationRecord.Request)
}

protocol JobApplicationRecordInteractorOutput
{
    func presentSomething(response: JobApplicationRecord.Response)
}



// ============================================================================= //
// MARK: - JobApplicationRecordInteractor Class Definition
// ============================================================================= //

class JobApplicationRecordInteractor: JobApplicationRecordInteractorInput
{
    var output: JobApplicationRecordInteractorOutput!
    var worker: JobApplicationRecordWorker!
    
    // MARK: Business logic
    
    func doSomething(request: JobApplicationRecord.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = JobApplicationRecordWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = JobApplicationRecord.Response()
        output.presentSomething(response: response)
    }
}
