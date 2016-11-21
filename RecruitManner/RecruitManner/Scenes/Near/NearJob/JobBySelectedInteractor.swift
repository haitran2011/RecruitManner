//
//  JobBySelectedInteractor.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/19.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol JobBySelectedInteractorInput {

    func doSomething(request: JobBySelected.Request)
}

protocol JobBySelectedInteractorOutput {

    func presentSomething(response: JobBySelected.Response)
}



// ============================================================================= //
// MARK: - JobBySelectedInteractor Class Definition
// ============================================================================= //

class JobBySelectedInteractor: JobBySelectedInteractorInput {
    var output: JobBySelectedInteractorOutput!
    var worker: JobBySelectedWorker!
    
    // MARK: Business logic
    
    func doSomething(request: JobBySelected.Request) {
        // NOTE: Create some Worker to do the work
        
        worker = JobBySelectedWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = JobBySelected.Response()
        output.presentSomething(response: response)
    }
}
