//
//  index.swift
//  News_Swift
//
//  Created by admin on 6/22/21.
//

import Foundation

class DataModel {
    class func source(response : [String : Any],callBack : @escaping (_ res : SourceRes) -> Void ) {
        let dataRes = SourceRes()
        dataRes.success = response["success"] as? Bool
        var dataItem : [SourceResItem] = []
        if let arr = response["items"] as? Array<[String : Any]> {
            for obj in arr {
                let item = SourceResItem()
                item.domain = obj["domain"] as? String
                item.id = obj["id"] as? Int
                item.logoUrl = obj["logoUrl"] as? String
                item.name = obj["name"] as? String
                dataItem.append(item)
            }
            dataRes.items = dataItem
        }
        callBack(dataRes)
    }
    
    class func DetailNews(response : [String : Any],callBack : @escaping (_ res : DetailNewsResModel) -> Void ) {
        let dataRes = DetailNewsResModel()
        dataRes.success = response["success"] as? Bool
        if let obj = response["data"] as? [String : Any] {
            let item = PostBySourceItemModel()
            item.excerpt = obj["excerpt"] as? String
            item.featureImage = obj["featureImage"] as? String
            item.html = obj["html"] as? String
            item.id = obj["id"] as? Int
            item.publishedTime = obj["publishedTime"] as? String
            item.slug = obj["slug"] as? String
            item.sourceId = obj["sourceId"] as? String
            item.sourceLink = obj["sourceLink"] as? String
            item.title = obj["title"] as? String
            item.type = obj["type"] as? String
            if let source = obj["source"] as? [String : Any] {
                let sourceItem = SourceData()
                sourceItem.id = source["id"] as? Int
                sourceItem.createdAt = source["createdAt"] as? String
                sourceItem.domain = source["domain"] as? String
                sourceItem.logoUrl = source["logoUrl"] as? String
                sourceItem.name = source["name"] as? String
                sourceItem.publishedAt = source["publishedAt"] as? String
                sourceItem.updatedAt = source["updatedAt"] as? String
                sourceItem.updatedBy = source["updatedBy"] as? String
                item.source = sourceItem
            }
            if let category = obj["category"] as? [String : Any] {
                let categoryItem = CategoryData()
                categoryItem.id = category["id"] as? Int
                categoryItem.createdAt = category["createdAt"] as? String
                categoryItem.author = category["author"] as? String
                categoryItem.avatarURL = category["avatarURL"] as? String
                categoryItem.publishedAt = category["publishedAt"] as? String
                categoryItem.updatedAt = category["updatedAt"] as? String
                categoryItem.categoryDescription = category["categoryDescription"] as? String
                categoryItem.createdBy = category["createdBy"] as? String
                categoryItem.featured = category["featured"] as? String
                categoryItem.name = category["name"] as? String
                categoryItem.orderFeatured = category["orderFeatured"] as? String
                categoryItem.parent = category["parent"] as? String
                categoryItem.publishedAt = category["publishedAt"] as? String
                categoryItem.slug = category["slug"] as? String
                categoryItem.sourceID = category["sourceID"] as? String
                item.category = categoryItem
            }
            dataRes.data = item
        }
        callBack(dataRes)
        
    }
    
    class func postBySource(response : [String : Any],callBack : @escaping (_ res : PostBySourceModel) -> Void ) {
        let dataRes = PostBySourceModel()
        dataRes.success = response["success"] as? Bool
        
        var dataItem : [PostBySourceItemModel] = []
        if let arr = response["items"] as? Array<[String : Any]> {
            for obj in arr {
                let item = PostBySourceItemModel()
                item.excerpt = obj["excerpt"] as? String
                item.featureImage = obj["featureImage"] as? String
                item.html = obj["html"] as? String
                item.id = obj["id"] as? Int
                item.publishedTime = obj["publishedTime"] as? String
                item.slug = obj["slug"] as? String
                item.sourceId = obj["sourceId"] as? String
                item.sourceLink = obj["sourceLink"] as? String
                item.title = obj["title"] as? String
                item.type = obj["type"] as? String
                if let source = obj["source"] as? [String : Any] {
                    let sourceItem = SourceData()
                    sourceItem.id = source["id"] as? Int
                    sourceItem.createdAt = source["createdAt"] as? String
                    sourceItem.domain = source["domain"] as? String
                    sourceItem.logoUrl = source["logoUrl"] as? String
                    sourceItem.name = source["name"] as? String
                    sourceItem.publishedAt = source["publishedAt"] as? String
                    sourceItem.updatedAt = source["updatedAt"] as? String
                    sourceItem.updatedBy = source["updatedBy"] as? String
                    item.source = sourceItem
                }
                if let category = obj["category"] as? [String : Any] {
                    let categoryItem = CategoryData()
                    categoryItem.id = category["id"] as? Int
                    categoryItem.createdAt = category["createdAt"] as? String
                    categoryItem.author = category["author"] as? String
                    categoryItem.avatarURL = category["avatarURL"] as? String
                    categoryItem.publishedAt = category["publishedAt"] as? String
                    categoryItem.updatedAt = category["updatedAt"] as? String
                    categoryItem.categoryDescription = category["categoryDescription"] as? String
                    categoryItem.createdBy = category["createdBy"] as? String
                    categoryItem.featured = category["featured"] as? String
                    categoryItem.name = category["name"] as? String
                    categoryItem.orderFeatured = category["orderFeatured"] as? String
                    categoryItem.parent = category["parent"] as? String
                    categoryItem.publishedAt = category["publishedAt"] as? String
                    categoryItem.slug = category["slug"] as? String
                    categoryItem.sourceID = category["sourceID"] as? String
                    item.category = categoryItem
                }
                dataItem.append(item)
            }
            dataRes.items = dataItem
        }
        callBack(dataRes)
    }
    
    
    
    
}
