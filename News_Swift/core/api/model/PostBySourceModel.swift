//
//  PostBySourceModel.swift
//  News_Swift
//
//  Created by admin on 6/22/21.
//

import Foundation

class PostBySourceModel {
    var success : Bool?
    var items : [PostBySourceItemModel]?
}

class DetailNewsResModel {
    var success : Bool?
    var data : PostBySourceItemModel?
}

class PostBySourceItemModel {
    var id : Int?
    var title : String?
    var html : String?
    var featureImage : String?
    var excerpt : String?
    var slug : String?
    var sourceId : String?
    var publishedTime : String?
    var type : String?
    var sourceLink : String?
    var source : SourceData?
    var category : CategoryData?
}
class SourceData {
    var id : Int?
    var name : String?
    var logoUrl : String?
    var publishedAt : String?
    var createdBy : String?
    var updatedBy : String?
    var createdAt : String?
    var updatedAt : String?
    var domain : String?
}

class CategoryData {
    var id: Int?
    var name: String?
    var categoryDescription: String?
    var slug: String?
    var parent , avatarURL: String?
    var publishedAt: String?
    var createdBy: String?
    var updatedBy: Int?
    var createdAt, updatedAt: String?
    var author: String?
    var sourceID: String?
    var featured, orderFeatured: String?
}



