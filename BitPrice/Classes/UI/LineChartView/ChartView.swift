//
//  ChartView.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Charts
import UIKit

class ChartView: LineChartView {

    // MARK: - LineChartView

    override func awakeFromNib() {
        super.awakeFromNib()

        setupNoData()
        setupLeftAxis()
        setupXAxis()

        chartDescription?.enabled = false
        rightAxis.enabled = false
        legend.enabled = false
        isUserInteractionEnabled = false
    }

    // MARK: - Public

    func setData(values: [ChartDataEntry]) {
        let line = self.line(values: values)

        let data = LineChartData()
        data.addDataSet(line)

        self.data = data
    }

    // MARK: - Private

    private func line(values: [ChartDataEntry]) -> LineChartDataSet {
        let color = UIColor.app.purple
        let line = LineChartDataSet(values: values, label: nil)

        line.setColor(color)
        line.setCircleColor(color)
        line.lineWidth = 3
        line.drawCirclesEnabled = false
        line.drawValuesEnabled = false

        return line
    }

    private func setupNoData() {
        noDataFont = UIFont.appFont(ofSize: 20)
        noDataTextColor = UIColor.app.black
        noDataText = "chart_view.no_data".localized
    }

    private func setupLeftAxis() {
        setupAxis(leftAxis)
        leftAxis.labelFont = UIFont.appFont(ofSize: 10)

        leftAxis.valueFormatter = DefaultAxisValueFormatter.with(block: { (value, axis) -> String in
            return Float(value).toCurrencyString(fractionDigits: 0)
        })
    }

    private func setupXAxis() {
        setupAxis(xAxis)
        xAxis.labelPosition = .bottom
        xAxis.labelFont = UIFont.appFont(ofSize: 9)

        xAxis.valueFormatter = DefaultAxisValueFormatter.with(block: { (value, axis) -> String in
            let dateFormat = "chart_view.date_format".localized
            return Date(timeIntervalSince1970: value).toString(dateFormat: dateFormat)
        })

    }

    private func setupAxis(_ axis: AxisBase) {
        axis.gridColor = UIColor.app.lightGray
        axis.labelTextColor = UIColor.app.purple
        axis.axisLineColor = UIColor.clear
    }

}
