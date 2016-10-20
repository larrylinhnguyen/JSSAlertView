import Nimble

// MARK: - Nicer syntax using == operator

public struct Snapshot {
    let name: String?

    init(name: String?) {
        self.name = name
    }
}

public func snapshot(_ name: String? = nil) -> Snapshot {
    return Snapshot(name: name)
}

public func ==(lhs: Expectation<Snapshotable>, rhs: Snapshot) {
    if let name = rhs.name {
        lhs.to(haveValidSnapshot(named: name))
    } else {
        lhs.to(haveValidSnapshot())
    }
}

// MARK: - Nicer syntax using emoji

public func 📷(_ snapshottable: Snapshotable) {
    expect(snapshottable).to(recordSnapshot())
}

public func 📷(_ snapshottable: Snapshotable, named name: String) {
    expect(snapshottable).to(recordSnapshot(named: name))
}