//
//  NewResumesModels.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/23.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import Foundation

// ================================================================================================== //
// MARK: - The Flow (input and output protocol conformance to the triad).  How the connect.
//
//		request -> INTERACTOR -> response -> PRESENTER -> viewModel -> VIEWCONTROLLER -> request
//         |                         |                        |                             |
//     doSomething()          presentSomething()       displaySomething()              doSomething()
//
// ================================================================================================== //


// ============================================================================= //
// MARK: - NewResumesModels Struct Definition
// ============================================================================= //

struct NewResumes
{
    // -> Interactor
    struct Request
    {
    }
    
    
    // -> Presenter
    struct Response
    {
    }
    
    // -> ViewController
    struct ViewModel {
        struct ResumeItem {
            var date: Date?
            var positionTitle: String?
            var imageUrl: String?
            var name: String?
            var mark: String?
        }
        
        var resumes: [ResumeItem]?
    }
    
    static func virtualViewModelMock() -> ViewModel {
        let resumes = [ViewModel.ResumeItem(date: Date(),
                                            positionTitle: "Title1",
                                            imageUrl: "https://img1.doubanio.com/img/celebrity/small/5837.jpg",
                                            name: "Name1", mark: "Mark1"),
                       ViewModel.ResumeItem(date: Date(),
                                            positionTitle: "Title2",
                                            imageUrl: "https://img3.doubanio.com/img/celebrity/small/230.jpg",
                                            name: "Name2", mark: "Mark2"),
                       ViewModel.ResumeItem(date: Date(),
                                            positionTitle: "Title3",
                                            imageUrl: "https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480747492.jpg",
                                            name: "Name3", mark: "Mark3")]
        return ViewModel(resumes: resumes)
    }
    
}
