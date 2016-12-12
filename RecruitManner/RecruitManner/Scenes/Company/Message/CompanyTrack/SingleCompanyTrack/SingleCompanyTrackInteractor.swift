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
    var selectedCompany: String? { get set }
    
    var selectedJob: Int { get set }
    var allJobs: [String]? { get }
}

protocol SingleCompanyTrackInteractorOutput {

    func presentSlideTabedBar(response: SingleCompanyTrack.Response)
    
    func presentCompanyName(response: SingleCompanyTrack.Response)
    
    func presentResumeTable(response: SingleCompanyTrack.Response)
}



// ============================================================================= //
// MARK: - SingleCompanyTrackInteractor Class Definition
// ============================================================================= //

class SingleCompanyTrackInteractor: SingleCompanyTrackInteractorInput {

    var output: SingleCompanyTrackInteractorOutput!
    var worker: SingleCompanyTrackWorker!
    
    var selectedCompany: String?
    
    var selectedJob: Int = 0 {
        didSet {
            var response = SingleCompanyTrack.Response()
            response.index = selectedJob
            output.presentResumeTable(response: response)
        }
    }
    
    var allJobs: [String]?
    
    // MARK: Business logic
    
    func doSomething(request: SingleCompanyTrack.Request) {
        // NOTE: Create some Worker to do the work
        
        worker = SingleCompanyTrackWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = SingleCompanyTrack.Response()
        output.presentSlideTabedBar(response: response)
        
        var res = SingleCompanyTrack.Response()
        res.companyName = selectedCompany
        output.presentCompanyName(response: res)
        
        selectedJob = 0
    }
    
    
}
