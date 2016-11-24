//
//  JobCityInteractor.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/24.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol JobCityInteractorInput {

    func doSomething(request: JobCity.Request)
}

protocol JobCityInteractorOutput {

    func presentSomething(response: JobCity.Response)
}



// ============================================================================= //
// MARK: - JobCityInteractor Class Definition
// ============================================================================= //

class JobCityInteractor: JobCityInteractorInput {

    var output: JobCityInteractorOutput!
    var worker: JobCityWorker!
    
    // MARK: Business logic
    
    func doSomething(request: JobCity.Request) {
        // NOTE: Create some Worker to do the work
        
        worker = JobCityWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = JobCity.Response()
        output.presentSomething(response: response)
    }
}
