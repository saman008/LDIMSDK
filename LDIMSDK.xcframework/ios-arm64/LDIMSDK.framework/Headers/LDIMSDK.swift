//
//  LDIMSDK.swift
//  LDIMSDK
//
//  Created by youliaobf on 2026/2/4.
//

import UIKit
import SVProgressHUD

open class LDIMSDK: NSObject {
    
    public static func getBundleImage(target: UIViewController) {
        let img = UIImage.bundledImage(named: "icon-20")
        let img1 = UIImage.bundledImage(named: "icon-20.png")
        let img2 = UIImage.bundledImage(named: "icon-30")
        let img3 = UIImage.bundledImage(named: "icon-30.png")
        let img4 = UIImage.bundledImage(named: "icon-40")
        let img5 = UIImage.bundledImage(named: "icon-40.png")
        print(img)
        print(img1)
        print(img2)
        print(img3)
        print(img4)
        print(img5)
        if let image = UIImage.bundledImage(fileName: "icon-40.png"){
            print("✅ \(image) 加载成功: \(image.size)")
        } else {
            print("❌ 加载失败")
        }
        if let image = UIImage.init(named: "icon-40"){
            print("✅ \(image) 加载成功: \(image.size)")
        } else {
            print("❌ 加载失败")
        }
        let imageview1 = UIImageView(image: img)
        imageview1.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        let imageview2 = UIImageView(image: img2)
        imageview2.frame = CGRect(x: 100, y: 200, width: 100, height: 100)

        let imageview3 = UIImageView(image: img4)
        imageview1.frame = CGRect(x: 100, y: 300, width: 100, height: 100)

        target.view.addSubview(imageview1)
        target.view.addSubview(imageview2)
        target.view.addSubview(imageview3)
        
    }
    public static func shopPick(target: UIViewController,choiceArray:[String], title: String = "请选择",finishedCallback : @escaping (_ index:Int,_ json : String) -> ()){
        
        let alert = UIAlertController(title: nil, message: title, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        for (id,i) in choiceArray.enumerated(){
            let okAction = UIAlertAction(title: i, style: .default, handler: { (action:UIAlertAction) -> Void in
                finishedCallback(id, i)
                
            })
            alert.addAction(okAction)
        }
        
        
        alert.addAction(cancelAction)
        target.present(alert, animated: true, completion: nil)
        
    }
    
    public static func getME() -> UIViewController{

        return LDAboutMeAndContactMeViewController()
    }
    public static func getAboutME() -> UIViewController{

        return LDMEAboutMeAndContactMeViewController()
    }
    public  static func stringToImage(named imageName: String) -> UIImage? {
        return UIImage.bundledImage(named: imageName)
    }
    
}


public class LDIM {
    
    /// SDK 内部使用的 Bundle，不对外暴露
    static var sdkBundle: Bundle {
        Bundle(for: LDIM.self)
    }
    
}
extension UIImage {
    /// 从 SDK 所在 Bundle 加载图片，便于以 Framework 形式集成时正确找到资源；找不到时回退到 main Bundle
    static func sdk(named name: String) -> UIImage? {
        UIImage(named: name, in: LDIM.sdkBundle, compatibleWith: nil)
        ?? UIImage(named: name)
    }
    
}
