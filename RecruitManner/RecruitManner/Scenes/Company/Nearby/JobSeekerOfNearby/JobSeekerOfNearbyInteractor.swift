//
//  JobSeekerOfNearbyInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/25.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol JobSeekerOfNearbyInteractorInput
{
    func doSomething(request: JobSeekerOfNearby.Request)
}

protocol JobSeekerOfNearbyInteractorOutput
{
    func presentSomething(response: JobSeekerOfNearby.Response)
}



// ============================================================================= //
// MARK: - JobSeekerOfNearbyInteractor Class Definition
// ============================================================================= //

class JobSeekerOfNearbyInteractor: JobSeekerOfNearbyInteractorInput
{
    var output: JobSeekerOfNearbyInteractorOutput!
    var worker: JobSeekerOfNearbyWorker!
    
    // MARK: Business logic
    
    func doSomething(request: JobSeekerOfNearby.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = JobSeekerOfNearbyWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = JobSeekerOfNearby.Response()
        output.presentSomething(response: response)
    }
}