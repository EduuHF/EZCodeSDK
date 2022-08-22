//
//  BaseAlertVC.swift
//  BAApp
//
//  Created by Edu on 26/05/22.
//

import UIKit

private let icTag: Int = 101
private let titleTag: Int = 102
private let msgTag: Int = 103

public enum AlertKind {
    case success, failed, error, attention
}

public class BaseAlertVC: BaseVC {

    public struct Action {
        let title: String
        let backgroundColor: UIColor?
        let action: (() -> Void)?
    }

    fileprivate var mainView: UIView!
    fileprivate var alertView: UIView!
    fileprivate var alertViewHC = NSLayoutConstraint()
    public var primaryAct: Action?
    public var secondaryAct: Action?

    // MARK: - Lifecycle Methods
    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Private Methods
    private func setupUI() {

        self.alertViewHC.constant = 40
        self.mainView = UIView(frame: UIScreen.main.bounds)
        self.mainView.backgroundColor = .colorBlackAlpha

        self.alertView = UIView()
        self.alertView.backgroundColor = .white
        self.alertView.cornerRadius = 20
        self.alertView
            .translatesAutoresizingMaskIntoConstraints = false

        self.mainView?.addSubview(self.alertView ?? UIView())
        self.view = self.mainView

        NSLayoutConstraint.activate([
            self.alertView
                .centerXAnchor
                .constraint(equalTo: self.mainView.centerXAnchor),
            self.alertView
                .centerYAnchor
                .constraint(equalTo: self.mainView
                    .centerYAnchor),
            self.alertView
                .widthAnchor
                .constraint(equalTo: self.mainView
                    .widthAnchor,
                            constant: -80)
        ])
    }

    private func buildIC(kind: AlertKind) {

        let alertIC = UIImageView()
        switch kind {
        case .success:
            alertIC.image = UIImage(named: "AlertSuccess_IC")
        case .failed:
            alertIC.image = UIImage(named: "AlertSuccess_IC")
        case .error:
            alertIC.image = UIImage(named: "AlertSuccess_IC")
        case .attention:
            alertIC.image = UIImage(named: "AlertSuccess_IC")
        }

        alertIC.translatesAutoresizingMaskIntoConstraints = false
        alertIC.tag = icTag
        self.alertView.addSubview(alertIC)

        NSLayoutConstraint.activate([
            alertIC.topAnchor
                .constraint(equalTo: self.alertView
                    .topAnchor,
                            constant: 20),
            alertIC.centerXAnchor
                .constraint(equalTo: self.alertView
                    .centerXAnchor),
            alertIC.widthAnchor
                .constraint(equalToConstant: 80),
            alertIC.heightAnchor
                .constraint(equalToConstant: 80)
        ])

        self.alertViewHC.constant += 80
    }

    private func buildTitle(title: NSAttributedString?) {

        guard let alertTitle = title else { return }

        let titleLB = UILabel()
        titleLB.attributedText = alertTitle
        titleLB.textColor = .colorBlue
        titleLB.font = .boldSystemFont(ofSize: 15)
        titleLB.textAlignment = .center
        titleLB.numberOfLines = 4
        titleLB.tag = titleTag
        titleLB.translatesAutoresizingMaskIntoConstraints = false

        self.alertView.addSubview(titleLB)

        if let icView = self.alertView.findViewWithTag(tag: icTag) {
            NSLayoutConstraint.activate([
                titleLB.topAnchor
                    .constraint(equalTo: icView.bottomAnchor,
                                constant: 20),
                titleLB.widthAnchor
                    .constraint(equalTo: self.alertView.widthAnchor,
                                constant: -40),
                titleLB.centerXAnchor
                    .constraint(equalTo: self.alertView.centerXAnchor)
            ])
        }

        titleLB.sizeToFit()
        self.alertViewHC.constant += titleLB.frame.height + 20
    }

    private func buildMSG(msg: NSAttributedString?) {

        guard let alertMSG = msg else { return }

        let msgLB = UILabel()
        msgLB.attributedText = alertMSG
        msgLB.textColor = .colorBrown
        msgLB.font = .systemFont(ofSize: 15)
        msgLB.textAlignment = .center
        msgLB.numberOfLines = 10
        msgLB.tag = msgTag
        msgLB.translatesAutoresizingMaskIntoConstraints = false

        self.alertView.addSubview(msgLB)

        if let titleView = self.alertView.findViewWithTag(tag: titleTag) {
            NSLayoutConstraint.activate([
                msgLB.widthAnchor.constraint(equalTo: self.alertView
                    .widthAnchor, constant: -40),
                msgLB.topAnchor
                    .constraint(equalTo: titleView.bottomAnchor,
                                constant: 20),
                msgLB.centerXAnchor
                    .constraint(equalTo: self.alertView
                        .centerXAnchor)
            ])
        }

        msgLB.sizeToFit()
        self.alertViewHC.constant += (msgLB.text?.textHeight() ?? 0) + 20
    }

    private func buildAlertPrimaryBtn() {

        guard let btnAction = self.primaryAct else { return }

        let btn = UIButton()
        btn.setTitle(btnAction.title, for: .normal)
        btn.backgroundColor = btnAction.backgroundColor ?? .colorBlue
        btn.tintColor = .white
        btn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        btn.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapPrimaryButton),
                      for: .touchUpInside)

        self.alertView.addSubview(btn)

        if let msgView = self.alertView
            .findViewWithTag(tag: msgTag) {
            NSLayoutConstraint.activate([
                btn.heightAnchor
                    .constraint(equalToConstant: 50),
                btn.widthAnchor
                    .constraint(equalTo: self.alertView.widthAnchor,
                                constant: -40),
                btn.topAnchor
                    .constraint(equalTo: msgView.bottomAnchor,
                                constant: 20),
                btn.centerXAnchor
                    .constraint(equalTo: self.alertView.centerXAnchor)
            ])
        }

        btn.sizeToFit()
        self.alertViewHC.constant += 90
        self.alertView
            .heightAnchor
            .constraint(equalToConstant: self.alertViewHC
                .constant).isActive = true
    }

    private func dismiss(completion: (() -> Void)? = nil) {
        self.dismiss(animated: false,
                     completion: completion)
    }

    // MARK: - Action Methods
    @objc private func didTapPrimaryButton() {
        self.dismiss {
            if let action = self.primaryAct?.action {
                action()
            }
        }
    }

    @objc private func didTapSecundaryButton() {
        self.dismiss {
            if let action = self.secondaryAct?.action {
                action()
            }
        }
    }

    // MARK: - Public Methods
}

// MARK: Extension Methods
extension BaseAlertVC {

    public func buildSimpleAlert(title: NSAttributedString?,
                          msg: NSAttributedString?,
                          alertType: AlertKind) {
        self.setupUI()
        self.buildIC(kind: alertType)
        self.buildTitle(title: title)
        self.buildMSG(msg: msg)
        self.buildAlertPrimaryBtn()
    }
}
