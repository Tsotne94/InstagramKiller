//
//  ReuseIdentifingProtocol.swift
//  InstsagramKiller
//
//  Created by Cotne Chubinidze on 22.11.24.
//
protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
