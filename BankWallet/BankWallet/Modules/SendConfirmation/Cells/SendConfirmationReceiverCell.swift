import UIKit
import SnapKit

class SendConfirmationReceiverCell: AppCell {
    private let hashView = HashView(singleLine: false)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .appLawrence
        backgroundColor = .clear
        selectionStyle = .none

        addSubview(hashView)

        hashView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(CGFloat.margin2x)
            maker.leading.equalToSuperview().offset(CGFloat.margin4x)
            maker.trailing.lessThanOrEqualToSuperview().inset(CGFloat.margin4x)
        }

        hashView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        hashView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func bind(receiver: String, last: Bool = false, onHashTap: (() -> ())?) {
        super.bind(showDisclosure: false, last: last)
        hashView.bind(value: receiver, showExtra: .icon, onTap: onHashTap)
    }

    static func height(forContainerWidth containerWidth: CGFloat, text: String) -> CGFloat {
        let insets = HashView.textInsets
        return ceil(text.height(forContainerWidth: containerWidth - 2 * CGFloat.margin4x - insets.width, font: .appSubhead1)) + insets.height + 2 * .margin2x
    }

}
