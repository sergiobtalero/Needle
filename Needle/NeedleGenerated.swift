

import Data
import Domain
import NeedleFoundation
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->PkmListComponent->PkmDetailComponent") { component in
        return PkmDetailDependency8532e147c84800412061Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->PkmListComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    
}

// MARK: - Providers

private class PkmDetailDependency8532e147c84800412061BaseProvider: PkmDetailDependency {
    var pokemon: PkmEntry {
        return pkmListComponent.pokemon
    }
    private let pkmListComponent: PkmListComponent
    init(pkmListComponent: PkmListComponent) {
        self.pkmListComponent = pkmListComponent
    }
}
/// ^->PkmListComponent->PkmDetailComponent
private class PkmDetailDependency8532e147c84800412061Provider: PkmDetailDependency8532e147c84800412061BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(pkmListComponent: component.parent as! PkmListComponent)
    }
}
