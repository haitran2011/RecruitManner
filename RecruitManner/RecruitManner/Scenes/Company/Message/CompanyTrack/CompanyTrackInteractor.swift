//
//  CompanyTrackInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol CompanyTrackInteractorInput
{
    func doSomething(request: CompanyTrack.Request)
}

protocol CompanyTrackInteractorOutput
{
    func presentSomething(response: CompanyTrack.Response)
}



// ============================================================================= //
// MARK: - CompanyTrackInteractor Class Definition
// ============================================================================= //

class CompanyTrackInteractor: CompanyTrackInteractorInput
{
    var output: CompanyTrackInteractorOutput!
    var worker: CompanyTrackWorker!
    
    // MARK: Business logic
    
    func doSomething(request: CompanyTrack.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = CompanyTrackWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = CompanyTrack.Response()
        output.presentSomething(response: response)
    }
}
