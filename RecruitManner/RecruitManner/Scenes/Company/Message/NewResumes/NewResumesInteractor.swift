//
//  NewResumesInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol NewResumesInteractorInput
{
    func doSomething(request: NewResumes.Request)
}

protocol NewResumesInteractorOutput
{
    func presentSomething(response: NewResumes.Response)
}



// ============================================================================= //
// MARK: - NewResumesInteractor Class Definition
// ============================================================================= //

class NewResumesInteractor: NewResumesInteractorInput
{
    var output: NewResumesInteractorOutput!
    var worker: NewResumesWorker!
    
    // MARK: Business logic
    
    func doSomething(request: NewResumes.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = NewResumesWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = NewResumes.Response()
        output.presentSomething(response: response)
    }
}
