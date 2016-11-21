//
//  NearJobInteractor.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/15.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol NearJobInteractorInput {

    func doSomething(request: NearJob.Request)
}

protocol NearJobInteractorOutput {

    func presentSomething(response: NearJob.Response)
}



// ============================================================================= //
// MARK: - NearJobInteractor Class Definition
// ============================================================================= //

class NearJobInteractor: NearJobInteractorInput {

    var output: NearJobInteractorOutput!
    var worker: NearJobWorker!
    
    // MARK: Business logic
    
    func doSomething(request: NearJob.Request) {
        // NOTE: Create some Worker to do the work
        
        worker = NearJobWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = NearJob.Response()
        output.presentSomething(response: response)
    }
}
