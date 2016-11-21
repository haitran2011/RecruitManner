//
//  JobByCompanyPresenter.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/18.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//
import Foundation
import UIKit

protocol JobByCompanyPresenterInput
{
    func presentSomething(response: JobByCompany.Response)
    
    func presentSelectItem(response: JobByCompany.Response)
}

protocol JobByCompanyPresenterOutput: class
{
    func displayCollection(viewModel: JobByCompany.ViewModel)
}



// ============================================================================= //
// MARK: - JobByCompanyPresenter Class Definition
// ============================================================================= //

class JobByCompanyPresenter: JobByCompanyPresenterInput
{
    weak var output: JobByCompanyPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: JobByCompany.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        var viewModel = JobByCompany.ViewModel()
        viewModel.companys = [
            sectionOne.map { JobByCompany.ViewModel.companyType(title: $0, isSelected: false) },
            sectionTwo.map { JobByCompany.ViewModel.companyType(title: $0, isSelected: false) } ]
        output.displayCollection(viewModel: viewModel)
    }
    
    func presentSelectItem(response: JobByCompany.Response) {
        
        guard let companys = response.companys else {
            return
        }
        
        var viewModel = JobByCompany.ViewModel()
        for i in 0 ..< companys.count {
            viewModel.companys.append(companys[i].map {
                JobByCompany.ViewModel.companyType(title: $0.title, isSelected: $0.title == response.companyTitle ? !$0.isSelected : $0.isSelected)
            })
        }
        
        output.displayCollection(viewModel: viewModel)
    }
}
