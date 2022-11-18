//
//  SugarUIProvider.swift
//  SwiftSugar
//
//  Created by beforeold on 2022/11/12.
//

import SwiftUI

/// a generic UIKit wrapper for SwiftUI
///
///

public protocol SugarUITransformable {
}

extension UIViewController: SugarUITransformable {
  
}

extension UIView: SugarUITransformable {
  
}


@available(iOS 13.0, *)
public struct SugarUIProvider<Content: SugarUITransformable>: View {
  public let maker: () -> Content
  public init(maker: @escaping () -> Content) {
    self.maker = maker
  }
  
  public var body: some View {
    let obj = maker()
    if let vc = obj as? UIViewController {
      return AnyView(
        SguardUIWrapUIVC { vc }
      )
    }
    
    if let view = obj as? UIView {
      return AnyView(
        SguardUIWrapUIView { view }
      )
    }
    
    fatalError("unsupported Content type, use subclass of UIViewController or UIView")
  }
}

@available(iOS 13.0, *)
fileprivate struct SguardUIWrapUIVC<VC: UIViewController>: UIViewControllerRepresentable {
  public let maker: () -> VC
  
  public init(maker: @escaping () -> VC) {
    self.maker = maker
  }
  
  public func makeUIViewController(context: Context) -> VC {
    return maker()
  }
  
  public func updateUIViewController(_ uiViewController: VC, context: Context) {
    
  }
  
  public typealias UIViewControllerType = VC
}

@available(iOS 13.0, *)
fileprivate struct SguardUIWrapUIView<VC: UIView>: UIViewRepresentable {
  public typealias UIViewType = VC
  
  public let maker: () -> VC
  
  public init(maker: @escaping () -> VC) {
    self.maker = maker
  }
  
  public func makeUIView(context: Context) -> VC {
    return maker()
  }
  
  public func updateUIView(_ uiView: VC, context: Context) {
    
  }
}

#if DEBUG
@available(iOS 13.0, *)
fileprivate func foo() {
  do {
    let sugar = SugarUIProvider {
      let view = UIView()
      
      return view
    }
    print(sugar)
  }
  
  do {
    let sugar = SugarUIProvider {
      let view = UIViewController()
      
      return view
    }
    print(sugar)
  }
}
#endif
