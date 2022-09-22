//
//  CreateValidator.swift
//  People
//
//  Created by Amby on 22/09/2022.
//

import Foundation

struct CreateValidator {
    func validate(_ person: NewPerson) throws {
        if person.firstName.isEmpty {
            throw CreateValidatorError.invalidFirstName
        }

        if person.lastName.isEmpty {
            throw CreateValidatorError.invalidLastName
        }

        if person.job.isEmpty {
            throw CreateValidatorError.invalidJob
        }
    }
}

extension CreateValidator {
    enum CreateValidatorError: LocalizedError {
        case invalidFirstName
        case invalidLastName
        case invalidJob
    }
}

extension CreateValidator.CreateValidatorError {
    var errorDescription: String? {
        switch self {
        case .invalidFirstName:
            return "First Name can't be empty"
        case .invalidLastName:
            return "last name can't be empty"
        case .invalidJob:
            return "Job can't be empty"
        }
    }
}
