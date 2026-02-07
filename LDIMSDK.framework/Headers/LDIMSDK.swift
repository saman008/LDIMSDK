//
//  LDIMSDK.swift
//  LDIMSDK
//
//  Created by youliaobf on 2026/2/4.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import RxDataSources
import SVProgressHUD
import SnapKit

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
    
}

open class LDAboutMeAndContactMeViewController: UIViewController {
    
    public var disposeBag: DisposeBag = DisposeBag()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        button.setTitle("你好世界点击", for: .normal)
        button.setTitleColor(.black, for: .normal)
       // button.addTarget(self, action: #selector(Action), for: .touchUpInside)
        self.view.addSubview(button)
      //  button.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
//        button.rx.tap.bind { [weak self] in
//            SVProgressHUD.show("666bucuo完成了")
//        }.disposed(by: disposeBag)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    @objc public func Action(){
        SVProgressHUD.show("666bucuo完成了")
    }
}
extension SVProgressHUD {
    static func show(_ message: String) {
        setImageViewSize(.zero)
        show(UIImage(), status: message)
        setDefaultStyle(.dark)
        dismiss(withDelay: 2)
    }
    static func showError(_ message: String) {
        showError(withStatus: message)
       // setDefaultStyle(.dark)
        dismiss(withDelay: 1.5)
    }
    static func showSuccess(_ message: String) {
        showSuccess(withStatus: message)
       // setDefaultStyle(.dark)
        dismiss(withDelay: 1.5)
    }

}
