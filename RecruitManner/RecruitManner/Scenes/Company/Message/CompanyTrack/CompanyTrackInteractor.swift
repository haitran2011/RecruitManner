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
    func doFetchCompanyTracks(request: CompanyTrack.Request)
    var selectedCompany: String? { get set }
}

protocol CompanyTrackInteractorOutput
{
    func presentTable(response: CompanyTrack.Response)
}



// ============================================================================= //
// MARK: - CompanyTrackInteractor Class Definition
// ============================================================================= //

class CompanyTrackInteractor: CompanyTrackInteractorInput
{
    var output: CompanyTrackInteractorOutput!
    var worker: CompanyTrackWorker!
    
    var selectedCompany: String?
    
    // MARK: Business logic
    
    func doFetchCompanyTracks(request: CompanyTrack.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = CompanyTrackWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = CompanyTrack.Response()
        output.presentTable(response: response)
    }
}
