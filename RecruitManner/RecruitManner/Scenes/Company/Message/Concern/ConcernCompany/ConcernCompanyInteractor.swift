//
//  ConcernCompanyInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol ConcernCompanyInteractorInput
{
    func doSomething(request: ConcernCompany.Request)
}

protocol ConcernCompanyInteractorOutput
{
    func presentSomething(response: ConcernCompany.Response)
}



// ============================================================================= //
// MARK: - ConcernCompanyInteractor Class Definition
// ============================================================================= //

class ConcernCompanyInteractor: ConcernCompanyInteractorInput
{
    var output: ConcernCompanyInteractorOutput!
    var worker: ConcernCompanyWorker!
    
    // MARK: Business logic
    
    func doSomething(request: ConcernCompany.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = ConcernCompanyWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = ConcernCompany.Response()
        output.presentSomething(response: response)
    }
}
