//
//  SingleCompanyTrackInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol SingleCompanyTrackInteractorInput {

    func doSomething(request: SingleCompanyTrack.Request)
}

protocol SingleCompanyTrackInteractorOutput {

    func presentSomething(response: SingleCompanyTrack.Response)
}



// ============================================================================= //
// MARK: - SingleCompanyTrackInteractor Class Definition
// ============================================================================= //

class SingleCompanyTrackInteractor: SingleCompanyTrackInteractorInput {

    var output: SingleCompanyTrackInteractorOutput!
    var worker: SingleCompanyTrackWorker!
    
    // MARK: Business logic
    
    func doSomething(request: SingleCompanyTrack.Request) {
        // NOTE: Create some Worker to do the work
        
        worker = SingleCompanyTrackWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = SingleCompanyTrack.Response()
        output.presentSomething(response: response)
    }
}
