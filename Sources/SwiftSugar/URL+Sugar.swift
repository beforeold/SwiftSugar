//
//  URL+Sugar.swift
//  
//
//  Created by beforeold on 2022/10/7.
//

import Foundation

extension URL: SugarCompatible { }

extension Sugar where Base == URL {
    /// The working directory of the current process.
    /// Calling this property will issue a `getcwd` syscall.
    public static func currentDirectory() -> URL {
        return URL(string: FileManager.default.currentDirectoryPath)!
    }
    
    /// The home directory for the current user (~/).
    /// Complexity: O(1)
    public static var homeDirectory: URL {
        return URL(string: NSHomeDirectory())!
        // return FileManager.default.homeDirectoryForCurrentUser
    }
    
    /// The temporary directory for the current user.
    /// Complexity: O(1)
    public static var temporaryDirectory: URL {
        return FileManager.default.temporaryDirectory
    }
    
    /// Discardable cache files directory for the
    /// current user. (~/Library/Caches).
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    public static var cachesDirectory: URL {
        return getUserUrl(for: .cachesDirectory)
    }
    
    /// Supported applications (/Applications).
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    public static var applicationDirectory: URL {
        return getUserUrl(for: .applicationDirectory)
    }
    
    /// Various user-visible documentation, support, and configuration
    /// files for the current user (~/Library).
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    public static var libraryDirectory: URL {
        return getUserUrl(for: .libraryDirectory)
    }
    
    /// User home directories (/Users).
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    public static var userDirectory: URL {
        return getUserUrl(for: .userDirectory)
    }
    
    /// Documents directory for the current user (~/Documents)
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    public static var documentsDirectory: URL {
        return getUserUrl(for: .documentDirectory)
    }
    
    /// Desktop directory for the current user (~/Desktop)
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    public static var desktopDirectory: URL {
        return getUserUrl(for: .desktopDirectory)
    }
    
    /// Application support files for the current
    /// user (~/Library/Application Support)
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    public static var applicationSupportDirectory: URL {
        return getUserUrl(for: .applicationSupportDirectory)
    }
    
    /// Downloads directory for the current user (~/Downloads)
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    public static var downloadsDirectory: URL {
        return getUserUrl(for: .downloadsDirectory)
    }
    
    /// Movies directory for the current user (~/Movies)
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    public static var moviesDirectory: URL {
        return getUserUrl(for: .moviesDirectory)
    }
    
    /// Music directory for the current user (~/Music)
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    public static var musicDirectory: URL {
        return getUserUrl(for: .musicDirectory)
    }
    
    /// Pictures directory for the current user (~/Pictures)
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    public static var picturesDirectory: URL {
        return getUserUrl(for: .picturesDirectory)
    }
    
    /// The user’s Public sharing directory (~/Public)
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    public static var sharedPublicDirectory: URL {
        return getUserUrl(for: .sharedPublicDirectory)
    }
    
    /// Trash directory for the current user (~/.Trash)
    /// Complexity: O(n) where n is the number of significant directories
    /// specified by `FileManager.SearchPathDirectory`
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var trashDirectory: URL {
        return getUserUrl(for: .trashDirectory)
    }
    
    /// Returns the home directory for the specified user.
    public static func homeDirectory(forUser user: String) -> URL? {
        guard let path = NSHomeDirectoryForUser(user) else {
            return nil
        }
        return URL(string: path)
        // return FileManager.default.homeDirectory(forUser: user)
    }
    
    /// -URLForDirectory:inDomain:appropriateForURL:create:error: is a URL-based replacement for FSFindFolder(). It allows for the specification and (optional) creation of a specific directory for a particular purpose (e.g. the replacement of a particular item on disk, or a particular Library directory.
    /// You may pass only one of the values from the NSSearchPathDomainMask enumeration, and you may not pass NSAllDomainsMask.
    public static func getUrl(for directory: FileManager.SearchPathDirectory,
                              in domain: FileManager.SearchPathDomainMask = .userDomainMask,
                              appropriateFor url: URL? = nil,
                              create shouldCreate: Bool = false) throws -> URL {
        do {
            return try FileManager.default.url(for: directory, in: domain, appropriateFor: url, create: shouldCreate)
        } catch {
            throw error
        }
    }
    
    /// -URLsForDirectory:inDomains: is analogous to NSSearchPathForDirectoriesInDomains(), but returns an array of NSURL instances for use with URL-taking APIs. This API is suitable when you need to search for a file or files which may live in one of a variety of locations in the domains specified.
    private static func getUserUrl(for directory: FileManager.SearchPathDirectory,
                                   in domain: FileManager.SearchPathDomainMask = .userDomainMask) -> URL {
        return FileManager.default.urls(for: directory, in: domain)[0]
    }
}
