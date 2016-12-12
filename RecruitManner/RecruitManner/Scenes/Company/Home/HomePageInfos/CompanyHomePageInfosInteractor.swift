//
//  CompanyHomePageInfosInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/28.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol CompanyHomePageInfosInteractorInput
{
    func dofetchInfos(request: CompanyHomePageInfos.Request)
}

protocol CompanyHomePageInfosInteractorOutput
{
    func presentTable(response: CompanyHomePageInfos.Response)
}



// ============================================================================= //
// MARK: - CompanyHomePageInfosInteractor Class Definition
// ============================================================================= //

class CompanyHomePageInfosInteractor: CompanyHomePageInfosInteractorInput
{
    var output: CompanyHomePageInfosInteractorOutput!
    var worker: CompanyHomePageInfosWorker!
    
    // MARK: Business logic
    
    func dofetchInfos(request: CompanyHomePageInfos.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = CompanyHomePageInfosWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = CompanyHomePageInfos.Response()
        output.presentTable(response: response)
    }
}
