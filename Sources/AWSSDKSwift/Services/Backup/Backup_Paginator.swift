//===----------------------------------------------------------------------===//
//
// This source file is part of the AWSSDKSwift open source project
//
// Copyright (c) 2017-2020 the AWSSDKSwift project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of AWSSDKSwift project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/swift-aws/aws-sdk-swift/blob/master/CodeGenerator/Sources/CodeGenerator/main.swift. DO NOT EDIT.

import NIO

//MARK: Paginators

extension Backup {

    ///  Returns metadata about your backup jobs.
    public func listBackupJobsPaginator(
        _ input: ListBackupJobsInput,
        on eventLoop: EventLoop? = nil,
        onPage: @escaping (ListBackupJobsOutput,
        EventLoop) -> EventLoopFuture<Bool>
    ) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listBackupJobs, tokenKey: \ListBackupJobsOutput.nextToken, on: eventLoop, onPage: onPage)
    }

    ///  Returns metadata of your saved backup plan templates, including the template ID, name, and the creation and deletion dates.
    public func listBackupPlanTemplatesPaginator(
        _ input: ListBackupPlanTemplatesInput,
        on eventLoop: EventLoop? = nil,
        onPage: @escaping (ListBackupPlanTemplatesOutput,
        EventLoop) -> EventLoopFuture<Bool>
    ) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listBackupPlanTemplates, tokenKey: \ListBackupPlanTemplatesOutput.nextToken, on: eventLoop, onPage: onPage)
    }

    ///  Returns version metadata of your backup plans, including Amazon Resource Names (ARNs), backup plan IDs, creation and deletion dates, plan names, and version IDs.
    public func listBackupPlanVersionsPaginator(
        _ input: ListBackupPlanVersionsInput,
        on eventLoop: EventLoop? = nil,
        onPage: @escaping (ListBackupPlanVersionsOutput,
        EventLoop) -> EventLoopFuture<Bool>
    ) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listBackupPlanVersions, tokenKey: \ListBackupPlanVersionsOutput.nextToken, on: eventLoop, onPage: onPage)
    }

    ///  Returns metadata of your saved backup plans, including Amazon Resource Names (ARNs), plan IDs, creation and deletion dates, version IDs, plan names, and creator request IDs.
    public func listBackupPlansPaginator(
        _ input: ListBackupPlansInput,
        on eventLoop: EventLoop? = nil,
        onPage: @escaping (ListBackupPlansOutput,
        EventLoop) -> EventLoopFuture<Bool>
    ) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listBackupPlans, tokenKey: \ListBackupPlansOutput.nextToken, on: eventLoop, onPage: onPage)
    }

    ///  Returns an array containing metadata of the resources associated with the target backup plan.
    public func listBackupSelectionsPaginator(
        _ input: ListBackupSelectionsInput,
        on eventLoop: EventLoop? = nil,
        onPage: @escaping (ListBackupSelectionsOutput,
        EventLoop) -> EventLoopFuture<Bool>
    ) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listBackupSelections, tokenKey: \ListBackupSelectionsOutput.nextToken, on: eventLoop, onPage: onPage)
    }

    ///  Returns a list of recovery point storage containers along with information about them.
    public func listBackupVaultsPaginator(
        _ input: ListBackupVaultsInput,
        on eventLoop: EventLoop? = nil,
        onPage: @escaping (ListBackupVaultsOutput,
        EventLoop) -> EventLoopFuture<Bool>
    ) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listBackupVaults, tokenKey: \ListBackupVaultsOutput.nextToken, on: eventLoop, onPage: onPage)
    }

    ///  Returns metadata about your copy jobs.
    public func listCopyJobsPaginator(
        _ input: ListCopyJobsInput,
        on eventLoop: EventLoop? = nil,
        onPage: @escaping (ListCopyJobsOutput,
        EventLoop) -> EventLoopFuture<Bool>
    ) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listCopyJobs, tokenKey: \ListCopyJobsOutput.nextToken, on: eventLoop, onPage: onPage)
    }

    ///  Returns an array of resources successfully backed up by AWS Backup, including the time the resource was saved, an Amazon Resource Name (ARN) of the resource, and a resource type.
    public func listProtectedResourcesPaginator(
        _ input: ListProtectedResourcesInput,
        on eventLoop: EventLoop? = nil,
        onPage: @escaping (ListProtectedResourcesOutput,
        EventLoop) -> EventLoopFuture<Bool>
    ) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listProtectedResources, tokenKey: \ListProtectedResourcesOutput.nextToken, on: eventLoop, onPage: onPage)
    }

    ///  Returns detailed information about the recovery points stored in a backup vault.
    public func listRecoveryPointsByBackupVaultPaginator(
        _ input: ListRecoveryPointsByBackupVaultInput,
        on eventLoop: EventLoop? = nil,
        onPage: @escaping (ListRecoveryPointsByBackupVaultOutput,
        EventLoop) -> EventLoopFuture<Bool>
    ) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listRecoveryPointsByBackupVault, tokenKey: \ListRecoveryPointsByBackupVaultOutput.nextToken, on: eventLoop, onPage: onPage)
    }

    ///  Returns detailed information about recovery points of the type specified by a resource Amazon Resource Name (ARN).
    public func listRecoveryPointsByResourcePaginator(
        _ input: ListRecoveryPointsByResourceInput,
        on eventLoop: EventLoop? = nil,
        onPage: @escaping (ListRecoveryPointsByResourceOutput,
        EventLoop) -> EventLoopFuture<Bool>
    ) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listRecoveryPointsByResource, tokenKey: \ListRecoveryPointsByResourceOutput.nextToken, on: eventLoop, onPage: onPage)
    }

    ///  Returns a list of jobs that AWS Backup initiated to restore a saved resource, including metadata about the recovery process.
    public func listRestoreJobsPaginator(
        _ input: ListRestoreJobsInput,
        on eventLoop: EventLoop? = nil,
        onPage: @escaping (ListRestoreJobsOutput,
        EventLoop) -> EventLoopFuture<Bool>
    ) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listRestoreJobs, tokenKey: \ListRestoreJobsOutput.nextToken, on: eventLoop, onPage: onPage)
    }

    ///  Returns a list of key-value pairs assigned to a target recovery point, backup plan, or backup vault.
    public func listTagsPaginator(
        _ input: ListTagsInput,
        on eventLoop: EventLoop? = nil,
        onPage: @escaping (ListTagsOutput,
        EventLoop) -> EventLoopFuture<Bool>
    ) -> EventLoopFuture<Void> {
        return client.paginate(input: input, command: listTags, tokenKey: \ListTagsOutput.nextToken, on: eventLoop, onPage: onPage)
    }

}

extension Backup.ListBackupJobsInput: AWSPaginateToken {
    public func usingPaginationToken(_ token: String) -> Backup.ListBackupJobsInput {
        return .init(
            byBackupVaultName: self.byBackupVaultName,
            byCreatedAfter: self.byCreatedAfter,
            byCreatedBefore: self.byCreatedBefore,
            byResourceArn: self.byResourceArn,
            byResourceType: self.byResourceType,
            byState: self.byState,
            maxResults: self.maxResults,
            nextToken: token
        )

    }
}

extension Backup.ListBackupPlanTemplatesInput: AWSPaginateToken {
    public func usingPaginationToken(_ token: String) -> Backup.ListBackupPlanTemplatesInput {
        return .init(
            maxResults: self.maxResults,
            nextToken: token
        )

    }
}

extension Backup.ListBackupPlanVersionsInput: AWSPaginateToken {
    public func usingPaginationToken(_ token: String) -> Backup.ListBackupPlanVersionsInput {
        return .init(
            backupPlanId: self.backupPlanId,
            maxResults: self.maxResults,
            nextToken: token
        )

    }
}

extension Backup.ListBackupPlansInput: AWSPaginateToken {
    public func usingPaginationToken(_ token: String) -> Backup.ListBackupPlansInput {
        return .init(
            includeDeleted: self.includeDeleted,
            maxResults: self.maxResults,
            nextToken: token
        )

    }
}

extension Backup.ListBackupSelectionsInput: AWSPaginateToken {
    public func usingPaginationToken(_ token: String) -> Backup.ListBackupSelectionsInput {
        return .init(
            backupPlanId: self.backupPlanId,
            maxResults: self.maxResults,
            nextToken: token
        )

    }
}

extension Backup.ListBackupVaultsInput: AWSPaginateToken {
    public func usingPaginationToken(_ token: String) -> Backup.ListBackupVaultsInput {
        return .init(
            maxResults: self.maxResults,
            nextToken: token
        )

    }
}

extension Backup.ListCopyJobsInput: AWSPaginateToken {
    public func usingPaginationToken(_ token: String) -> Backup.ListCopyJobsInput {
        return .init(
            byCreatedAfter: self.byCreatedAfter,
            byCreatedBefore: self.byCreatedBefore,
            byDestinationVaultArn: self.byDestinationVaultArn,
            byResourceArn: self.byResourceArn,
            byResourceType: self.byResourceType,
            byState: self.byState,
            maxResults: self.maxResults,
            nextToken: token
        )

    }
}

extension Backup.ListProtectedResourcesInput: AWSPaginateToken {
    public func usingPaginationToken(_ token: String) -> Backup.ListProtectedResourcesInput {
        return .init(
            maxResults: self.maxResults,
            nextToken: token
        )

    }
}

extension Backup.ListRecoveryPointsByBackupVaultInput: AWSPaginateToken {
    public func usingPaginationToken(_ token: String) -> Backup.ListRecoveryPointsByBackupVaultInput {
        return .init(
            backupVaultName: self.backupVaultName,
            byBackupPlanId: self.byBackupPlanId,
            byCreatedAfter: self.byCreatedAfter,
            byCreatedBefore: self.byCreatedBefore,
            byResourceArn: self.byResourceArn,
            byResourceType: self.byResourceType,
            maxResults: self.maxResults,
            nextToken: token
        )

    }
}

extension Backup.ListRecoveryPointsByResourceInput: AWSPaginateToken {
    public func usingPaginationToken(_ token: String) -> Backup.ListRecoveryPointsByResourceInput {
        return .init(
            maxResults: self.maxResults,
            nextToken: token,
            resourceArn: self.resourceArn
        )

    }
}

extension Backup.ListRestoreJobsInput: AWSPaginateToken {
    public func usingPaginationToken(_ token: String) -> Backup.ListRestoreJobsInput {
        return .init(
            maxResults: self.maxResults,
            nextToken: token
        )

    }
}

extension Backup.ListTagsInput: AWSPaginateToken {
    public func usingPaginationToken(_ token: String) -> Backup.ListTagsInput {
        return .init(
            maxResults: self.maxResults,
            nextToken: token,
            resourceArn: self.resourceArn
        )

    }
}

