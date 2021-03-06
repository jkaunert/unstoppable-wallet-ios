import Foundation
import Chart

extension ChartConfiguration {

    static var balanceChart: ChartConfiguration {
        let configuration = ChartConfiguration()
        configuration.setCryptoColors()

        configuration.showGrid = false
        configuration.showLimitValues = false

        return configuration
    }

    static func fullChart(currency: Currency) -> ChartConfiguration {
        let configuration = ChartConfiguration()
        configuration.setCryptoColors()

        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencyCode = currency.code
        currencyFormatter.currencySymbol = currency.symbol

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.appCurrent

        configuration.limitTextFormatter = currencyFormatter
        configuration.dateFormatter = dateFormatter
        return configuration
    }
    
    private func setCryptoColors() {
        curvePositiveColor = .cryptoGreen
        curveNegativeColor = .appLucian
        curveIncompleteColor = .appGray50

        gradientPositiveColor = .cryptoGreen
        gradientNegativeColor = .cryptoRed
        gradientIncompleteColor = .appGray50

        limitColor = .appNina

        gridColor = .cryptoSteel20
        gridTextColor = .cryptoGray

        limitTextFont = .appSubhead1
        limitTextColor = .appLeah

        selectedIndicatorColor = .appOz
        selectedCurveColor = .appOz
        selectedGradientColor = .appOz
    }

}
