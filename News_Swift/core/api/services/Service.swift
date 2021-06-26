//
//  SourceService.swift
//  News_Swift
//
//  Created by admin on 6/22/21.
//

import Foundation

class Service {
    class func source(
        page : Int,
        result : @escaping (_ res : SourceRes) -> Void
    ) {
        let parameters : [String : Any]? = ["page" : page,"limit" : 24]
        let service = Connect()
        service.fetchGet(parram: parameters, endUrl: ENV().source)
        service.completionHandler {
            [self] res in
            DataModel.source(response: res!, callBack: {
                [self] dateRes in
                result(dateRes)
            })
//            result(res)
            
        }
    }
    
    class func detailHeadNews(
        page : Int,
        source : Int,
        result : @escaping (_ res : PostBySourceModel) -> Void
    ) {
        let parameters : [String : Any]? = ["page" : page,"source" : source,"limit" : 20]
        let service = Connect()
        service.fetchGet(parram: parameters, endUrl: ENV().postBySource)
        service.completionHandler {
            [self] res in
            DataModel.postBySource(response: res!, callBack: {
                [self] dateRes in
                result(dateRes)
            })
//            result(res)
            
        }
    }
    
    class func hot (
        page : Int,
        result : @escaping (_ res : PostBySourceModel) -> Void
    ) {
        let parameters : [String : Any]? = ["page" : page,"limit" : 20]
        let service = Connect()
        service.fetchGet(parram: parameters, endUrl: ENV().postBySource)
        service.completionHandler {
            [self] res in
            DataModel.postBySource(response: res!, callBack: {
                [self] dateRes in
                result(dateRes)
            })
//            result(res)
            
        }
    }
    
    class func entertainment (
        page : Int,
        result : @escaping (_ res : PostBySourceModel) -> Void
    ) {
        let parameters : [String : Any]? = ["page" : page,"limit" : 20]
        let service = Connect()
        service.fetchGet(parram: parameters, endUrl: ENV().noibat)
        service.completionHandler {
            [self] res in
            DataModel.postBySource(response: res!, callBack: {
                [self] dateRes in
                result(dateRes)
            })
//            result(res)
            
        }
    }
    
    class func sameSource (
        page : Int,
        slug : String,
        result : @escaping (_ res : PostBySourceModel) -> Void
    ) {
        let parameters : [String : Any]? = ["page" : page,"limit" : 5]
        let service = Connect()
        service.fetchGet(parram: parameters, endUrl: "\(ENV().sameSource)/\(slug)")
        service.completionHandler {
            [self] res in
            DataModel.postBySource(response: res!, callBack: {
                [self] dateRes in
                result(dateRes)
            })
//            result(res)
            
        }
    }
    
    class func tinlienquan (
        page : Int,
        slug : String,
        result : @escaping (_ res : PostBySourceModel) -> Void
    ) {
        let parameters : [String : Any]? = ["page" : page,"limit" : 5]
        let service = Connect()
        service.fetchGet(parram: parameters, endUrl: "\(ENV().tinlienquan)/\(slug)")
        service.completionHandler {
            [self] res in
            DataModel.postBySource(response: res!, callBack: {
                [self] dateRes in
                result(dateRes)
            })
//            result(res)
            
        }
    }
    
    
    
    class func detailNews (
        slug : String,
        result : @escaping (_ res : DetailNewsResModel) -> Void
    ) {
//        let parameters : [String : Any]? = ["slug" : slug]
        let service = Connect()
        service.fetchGet(parram: nil, endUrl: "\(ENV().detail)/\(slug)")
        service.completionHandler {
            [self] res in
            DataModel.DetailNews(response: res!, callBack: {
                [self] dateRes in
                result(dateRes)
            })
//            result(res)
            
        }
    }
}
