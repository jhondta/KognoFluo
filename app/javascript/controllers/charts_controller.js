// app/javascript/controllers/charts_controller.js
import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["availability", "costs", "distribution"]

    connect() {
        this.initCostsChart()
        this.initDistributionChart()
    }

    initCostsChart() {
        const options = {
            series: [{
                name: 'Costos',
                data: [44, 55, 57, 56, 61, 58]
            }],
            chart: {
                type: 'bar',
                height: 250,
                toolbar: {show: false}
            },
            colors: ['#10B981'],
            plotOptions: {
                bar: {
                    borderRadius: 4,
                    horizontal: false
                }
            },
            xaxis: {
                categories: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun']
            },
            yaxis: {
                labels: {
                    formatter: (value) => `$${value}k`
                }
            }
        }

        const chart = new ApexCharts(this.costsTarget, options)
        chart.render()
    }

    initDistributionChart() {
        const options = {
            series: [44, 55, 13],
            chart: {
                type: 'donut',
                height: 250
            },
            labels: ['Preventivo', 'Correctivo', 'Predictivo'],
            colors: ['#3B82F6', '#EF4444', '#F59E0B'],
            legend: {
                position: 'bottom'
            }
        }

        const chart = new ApexCharts(this.distributionTarget, options)
        chart.render()
    }
}
