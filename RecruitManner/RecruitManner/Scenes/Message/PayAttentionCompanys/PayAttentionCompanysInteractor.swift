//
//  PayAttentionCompanysInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol PayAttentionCompanysInteractorInput
{
    func doSomething(request: PayAttentionCompanys.Request)
}

protocol PayAttentionCompanysInteractorOutput
{
    func presentSomething(response: PayAttentionCompanys.Response)
}



// ============================================================================= //
// MARK: - PayAttentionCompanysInteractor Class Definition
// ============================================================================= //

class PayAttentionCompanysInteractor: PayAttentionCompanysInteractorInput
{
    var output: PayAttentionCompanysInteractorOutput!
    var worker: PayAttentionCompanysWorker!
    
    // MARK: Business logic
    
    func doSomething(request: PayAttentionCompanys.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = PayAttentionCompanysWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = PayAttentionCompanys.Response()
        output.presentSomething(response: response)
    }
}
