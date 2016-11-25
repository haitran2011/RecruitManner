//
//  MyFullTimeJobInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/25.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol MyFullTimeJobInteractorInput
{
    func doSomething(request: MyFullTimeJob.Request)
}

protocol MyFullTimeJobInteractorOutput
{
    func presentSomething(response: MyFullTimeJob.Response)
}



// ============================================================================= //
// MARK: - MyFullTimeJobInteractor Class Definition
// ============================================================================= //

class MyFullTimeJobInteractor: MyFullTimeJobInteractorInput
{
    var output: MyFullTimeJobInteractorOutput!
    var worker: MyFullTimeJobWorker!
    
    // MARK: Business logic
    
    func doSomething(request: MyFullTimeJob.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = MyFullTimeJobWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = MyFullTimeJob.Response()
        output.presentSomething(response: response)
    }
}
