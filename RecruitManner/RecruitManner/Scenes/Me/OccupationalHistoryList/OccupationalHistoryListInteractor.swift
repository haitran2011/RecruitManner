//
//  OccupationalHistoryListInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/14.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol OccupationalHistoryListInteractorInput
{
    func doSomething(request: OccupationalHistoryList.Request)
}

protocol OccupationalHistoryListInteractorOutput
{
    func presentSomething(response: OccupationalHistoryList.Response)
}



// ============================================================================= //
// MARK: - OccupationalHistoryListInteractor Class Definition
// ============================================================================= //

class OccupationalHistoryListInteractor: OccupationalHistoryListInteractorInput
{
    var output: OccupationalHistoryListInteractorOutput!
    var worker: OccupationalHistoryListWorker!
    
    // MARK: Business logic
    
    func doSomething(request: OccupationalHistoryList.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = OccupationalHistoryListWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = OccupationalHistoryList.Response()
        output.presentSomething(response: response)
    }
}
