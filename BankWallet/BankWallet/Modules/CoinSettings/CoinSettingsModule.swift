protocol ICoinSettingsView: class {
    func showNextButton()
    func showRestoreButton()

    func set(derivation: MnemonicDerivation)
    func set(syncMode: SyncMode)
}

protocol ICoinSettingsInteractor: class {
    var bitcoinDerivation: MnemonicDerivation { get set }
    var syncMode: SyncMode { get set }
}

protocol ICoinSettingsViewDelegate {
    func onLoad()
    func onSelect(derivation: MnemonicDerivation)
    func onSelect(syncMode: SyncMode)
    func onConfirm()
}

protocol ICoinSettingsRouter {
    func notifyConfirm()
    func open(url: String)
}

protocol ICoinSettingsDelegate: class {
    func onConfirm()
}
