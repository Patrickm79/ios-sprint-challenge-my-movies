//
//  Movie+Convenience.swift
//  MyMovies
//
//  Created by Patrick Millet on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData

extension Movie {

    // MARK: - Properties
    
    var movieRepresentation: MovieRepresentation? {
        guard let title = title else { return nil }

        return MovieRepresentation(title: title, identifier: identifier, hasWatched: hasWatched)
    }

    // MARK: - Convenience inits
    
    convenience init(title: String,
                     identifier: UUID = UUID(),
                     hasWatched: Bool = false,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        self.init(context: context)
        self.title = title
        self.identifier = identifier
        self.hasWatched = hasWatched
    }

    @discardableResult convenience init?(movieRepresentation: MovieRepresentation,
                                         context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        guard let identifier = movieRepresentation.identifier,
            let hasWatched = movieRepresentation.hasWatched else { return nil }

        self.init(title: movieRepresentation.title,
                  identifier: identifier,
                  hasWatched: hasWatched)
    }
}
