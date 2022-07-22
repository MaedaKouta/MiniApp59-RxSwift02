//
//  ViewController.swift
//  MiniApp59-RxSwift02
//
//  Created by 前田航汰 on 2022/07/22.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textLabel: UILabel!
    private let minCharacterSize = 400
    let disposeBag = DisposeBag()

    let limitText: (Int) -> String = {
        return "残り\($0)文字"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.rx.text.orEmpty
            .map{ [weak self] text -> String? in
                let limitCount = self!.minCharacterSize - text.count
                return self?.limitText(limitCount)
            }
            .bind(to: textLabel.rx.text)
            .disposed(by: disposeBag)
    }


}

