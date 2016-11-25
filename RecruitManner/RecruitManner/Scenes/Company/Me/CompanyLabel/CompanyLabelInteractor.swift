//
//  CompanyLabelInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/25.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol CompanyLabelInteractorInput {

    func doSomething(request: CompanyLabel.Request)
}

protocol CompanyLabelInteractorOutput {

    func presentSomething(response: CompanyLabel.Response)
}



// ============================================================================= //
// MARK: - CompanyLabelInteractor Class Definition
// ============================================================================= //

class CompanyLabelInteractor: CompanyLabelInteractorInput {

    var output: CompanyLabelInteractorOutput!
    var worker: CompanyLabelWorker!
    
    // MARK: Business logic
    
    func doSomething(request: CompanyLabel.Request) {
        // NOTE: Create some Worker to do the work
        
        worker = CompanyLabelWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = CompanyLabel.Response()
        output.presentSomething(response: response)
    }
}
