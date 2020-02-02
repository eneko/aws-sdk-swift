// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/swift-aws/aws-sdk-swift/blob/master/CodeGenerator/Sources/CodeGenerator/main.swift. DO NOT EDIT.

import NIO

//MARK: Paginators

extension MediaStoreData {

    ///  Provides a list of metadata entries about folders and objects in the specified folder.
    public func listItemsPaginator(_ input: ListItemsRequest, onPage: @escaping (ListItemsResponse, EventLoop)->EventLoopFuture<Bool>) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listItems, tokenKey: \ListItemsResponse.nextToken, onPage: onPage)
    }

}

extension MediaStoreData.ListItemsRequest: AWSPaginateStringToken {
    public func usingPaginationToken(_ token: String) -> MediaStoreData.ListItemsRequest {
        return .init(
            maxResults: self.maxResults, 
            nextToken: token, 
            path: self.path
        )

    }
}

