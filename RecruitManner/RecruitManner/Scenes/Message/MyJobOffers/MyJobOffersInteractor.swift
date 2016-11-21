//
//  MyJobOffersInteractor.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/21.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

protocol MyJobOffersInteractorInput
{
    func doSomething(request: MyJobOffers.Request)
}

protocol MyJobOffersInteractorOutput
{
    func presentSomething(response: MyJobOffers.Response)
}



// ============================================================================= //
// MARK: - MyJobOffersInteractor Class Definition
// ============================================================================= //

class MyJobOffersInteractor: MyJobOffersInteractorInput
{
    var output: MyJobOffersInteractorOutput!
    var worker: MyJobOffersWorker!
    
    // MARK: Business logic
    
    func doSomething(request: MyJobOffers.Request)
    {
        // NOTE: Create some Worker to do the work
        
        worker = MyJobOffersWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        
        let response = MyJobOffers.Response()
        output.presentSomething(response: response)
    }
}
