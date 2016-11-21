//
//  HomePageInteractor.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/15.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol HomePageInteractorInput
{
    func doSomething(request: HomePage.Request)
}

protocol HomePageInteractorOutput
{
    func presentSomething(response: HomePage.Response)
}



// ============================================================================= //
// MARK: - HomePageInteractor Class Definition
// ============================================================================= //

class HomePageInteractor: HomePageInteractorInput
{
    var output: HomePageInteractorOutput!
    var worker: HomePageWorker!
    
    // MARK: Business logic
    
    func doSomething(request: HomePage.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = HomePageWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = HomePage.Response()
        output.presentSomething(response: response)
    }
}
