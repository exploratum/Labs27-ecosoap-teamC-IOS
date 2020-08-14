//
//  Queries.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Queries {

    static let shared = Queries()

    enum Key {
        case userById
        case propertiesByUserId
        case propertyById
        case impactStatsByPropertyId
    }

    private let statsById:(String) -> String = {
        return "{propertyById(input: {propertyId: \($0)}) {property {id,name,rooms,phone,billingAddress,shippingAddress,coordinates,shippingNote,notes,users {id,firstName,lastName}}}}"
    }
    
    private let propertiesByUserId:(String) -> String = {
        return """
        {
        propertiesByUserId(input: { userId: \($0) }) {
            properties {
                id,
                name,
                rooms,
                phone,
                billingAddress,
                shippingAddress,
                coordinates,
                shippingNote,
                notes,
            users {
                id,
                firstName,
                lastName
              }
            }
          }
        }
        """
    }

    private let userById:(String) -> String = {
        return """
        {
          userById(input: { userId: \($0) }) {
            user {
              id,
              firstName,
              middleName,
              lastName,
              title,
              company,
              email,
              phone,
              skype,
              address,
              signupTime,
              properties {
                id,
                name,
                rooms,
                phone,
                billingAddress,
                shippingAddress,
                coordinates,
                shippingNote,
                notes
              }
            }
          }
        }
        """
    }

    private let propertyById:(String) -> String = {
        return """
        {
          propertyById(input: {
            propertyId: \($0)
          }) {
            property {
              id,
                name,
                rooms,
                phone,
                billingAddress,
                shippingAddress,
                coordinates,
                shippingNote,
                notes,
              users {
                id,
                firstName,
                lastName
              }
            }
          }
        }
        """
    }

    private let impactStatsByPropertyId:(String) -> String = {
        return """
        query {
          impactStatsByPropertyId(input: {
            propertyId: \($0)
          }) {
            impactStats {
              soapRecycled
              linensRecycled
              bottlesRecycled
              paperRecycled
              peopleServed
              womenEmployed
            }
          }
        }
        """
    }
}
