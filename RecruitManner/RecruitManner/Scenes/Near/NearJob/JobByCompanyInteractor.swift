//
//  JobByCompanyInteractor.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/18.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol JobByCompanyInteractorInput {

    func doSomething(request: JobByCompany.Request)
}

protocol JobByCompanyInteractorOutput {

    func presentSomething(response: JobByCompany.Response)
    
    func presentSelectItem(response: JobByCompany.Response)
}



// ============================================================================= //
// MARK: - JobByCompanyInteractor Class Definition
// ============================================================================= //

class JobByCompanyInteractor: JobByCompanyInteractorInput {
    var output: JobByCompanyInteractorOutput!
    var worker: JobByCompanyWorker!
    
    // MARK: Business logic
    
    func doSomething(request: JobByCompany.Request) {
        // NOTE: Create some Worker to do the work
        
        worker = JobByCompanyWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = JobByCompany.Response()
        output.presentSomething(response: response)
    }
    
    func doSelectItem(request: JobByCompany.Request) {
    
        let response = request
        output.presentSelectItem(response: response)
    }
}
