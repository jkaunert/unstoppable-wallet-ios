import UIKit
import SnapKit

class BackupController: WalletViewController {
    private let delegate: IBackupViewDelegate

    private let subtitleLabel = UILabel()
    private let cancelButton: UIButton = .appGray
    private let proceedButton: UIButton = .appYellow

    init(delegate: IBackupViewDelegate) {
        self.delegate = delegate

        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = delegate.isBackedUp ? "backup.intro.title_show".localized : "backup.intro.title_backup".localized

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        view.addSubview(subtitleLabel)
        subtitleLabel.text = "backup.intro.subtitle".localized(delegate.coinCodes)
        subtitleLabel.font = .appBody
        subtitleLabel.textColor = .appGray
        subtitleLabel.numberOfLines = 0
        subtitleLabel.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(CGFloat.marginTextSide)
            maker.top.equalTo(self.view.snp.topMargin).offset(CGFloat.margin6x)
        }

        view.addSubview(cancelButton)
        cancelButton.setTitle(delegate.isBackedUp ? "backup.close".localized : "backup.intro.later".localized, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelDidTap), for: .touchUpInside)

        cancelButton.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(CGFloat.marginButtonSide)
            maker.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(CGFloat.marginButtonSide)
            maker.size.equalTo(CGSize(width: 85, height: CGFloat.heightButton))
        }

        view.addSubview(proceedButton)
        proceedButton.setTitle(delegate.isBackedUp ? "backup.intro.show_key".localized : "backup.intro.backup_now".localized, for: .normal)
        proceedButton.addTarget(self, action: #selector(proceedDidTap), for: .touchUpInside)

        proceedButton.snp.makeConstraints { maker in
            maker.leading.equalTo(cancelButton.snp.trailing).offset(10)
            maker.trailing.equalToSuperview().inset(CGFloat.marginButtonSide)
            maker.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(CGFloat.marginButtonSide)
            maker.height.equalTo(CGFloat.heightButton)
        }
    }

    @objc func proceedDidTap() {
        delegate.proceedDidTap()
    }

    @objc func cancelDidTap() {
        delegate.cancelDidClick()
    }

}
