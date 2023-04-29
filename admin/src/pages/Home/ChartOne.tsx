import React, { Component } from "react";
import moment from "moment";
import ReactApexChart from "react-apexcharts";
import {
  DailyFieldProps,
  Last12MonthsFieldProps,
  WeeklyFieldProps,
} from "./types";
import {
  lastNDays,
  lastNMonth,
  lastNWeeks,
  numberWithCommas,
} from "../../helpers";

type ActiveType = "day" | "week" | "month";
interface State {
  activeType: ActiveType;
  options: ApexCharts.ApexOptions | undefined;
  series: ApexAxisChartSeries | ApexNonAxisChartSeries | undefined;
}
interface SalesInfo {
  sales: number;
}
interface ChartInfo {
  activeType: ActiveType;
}
interface Props {
  sales: {
    last_6_weeks: WeeklyFieldProps[];
    last_12_months: Last12MonthsFieldProps[];
    last_30_days: DailyFieldProps[];
  };
}

class ChartOne extends Component<Props, State> {
  constructor(props: any) {
    super(props);

    this.state = {
      activeType: "month",
      series: [],
      options: {
        title: {
          text: "Sales of last 12 months",
          margin: 20,
          align: "center",
          floating: true,
          offsetY: 8,
        },
        legend: {
          show: false,
          position: "top",
          horizontalAlign: "left",
        },
        colors: ["#3C50E0", "#80CAEE"],
        chart: {
          fontFamily: "Satoshi, sans-serif",
          height: 450,
          type: "area",
          dropShadow: {
            enabled: true,
            color: "#623CEA14",
            top: 10,
            blur: 4,
            left: 0,
            opacity: 0.1,
          },

          toolbar: {
            show: false,
          },
        },
        responsive: [
          {
            breakpoint: 1024,
            options: {
              chart: {
                height: 350,
              },
            },
          },
          {
            breakpoint: 1366,
            options: {
              chart: {
                height: 400,
              },
            },
          },
        ],
        stroke: {
          width: [2, 2],
          curve: "straight",
        },
        // labels: {
        //   show: false,
        //   position: "top",
        // },
        grid: {
          xaxis: {
            lines: {
              show: true,
            },
          },
          yaxis: {
            lines: {
              show: true,
            },
          },
        },
        dataLabels: {
          enabled: false,
        },
        markers: {
          size: 4,
          colors: "#fff",
          strokeColors: ["#3056D3", "#80CAEE"],
          strokeWidth: 3,
          strokeOpacity: 0.9,
          strokeDashArray: 0,
          fillOpacity: 1,
          discrete: [],
          hover: {
            size: undefined,
            sizeOffset: 5,
          },
        },
        xaxis: {
          type: "category",
          categories: [],
          axisBorder: {
            show: false,
          },
          axisTicks: {
            show: false,
          },
          labels: {
            style: {
              fontSize: "10px",
            },
          },
        },
        yaxis: {
          labels: {
            formatter: (val) => {
              return numberWithCommas(val);
            },
          },
          title: {
            text: "VND",
            style: {
              fontSize: "12px",
              fontWeight: 100,
              cssClass: "font-semibold font-sans",
            },
          },
          min: 0,
          max: 100,
        },
      },
    };
  }

  componentDidMount(): void {
    // console.log(10 ** Math.ceil(Math.log10(11_500_000)));
    // console.log(lastNMonth(12));
    // lastNDays();
    // lastNWeeks();

    const { categories, data, salesInfo } = this.setChartInfo(
      this.state.activeType
    );

    // console.log({ categories, data, salesInfo });

    // set state
    this.setState({
      series: [
        {
          name: "Sales",
          data,
        },
      ],
      options: {
        ...this.state.options,
        xaxis: {
          ...this.state.options?.xaxis,
          categories,
        },
        yaxis: {
          ...this.state.options?.yaxis,
          max:
            10 **
            Math.ceil(
              Math.log10(Math.max(...salesInfo.map(({ sales }) => sales)))
            ),
        },
      },
    });
  }

  render() {
    const activeType = this.state.activeType;
    const activeClasses = "bg-white shadow shadow-gray-300";
    const normalClasses = "hover:bg-white hover:shadow hover:shadow-gray-300";

    const categories = this.state.options?.xaxis?.categories;
    const a = categories?.at(0);
    const b = categories?.at(-1);

    return (
      <div className="col-span-12 rounded-sm border border-gray-300 bg-white px-5 pt-7 pb-5 shadow-gray-200 shadow-md  sm:px-7 xl:col-span-8">
        <div className="flex flex-wrap items-start justify-between gap-3 sm:flex-nowrap">
          <div className="flex w-full flex-wrap gap-3 sm:gap-5">
            <div className="flex gap-3 items-start">
              <span className="mt-1 w-6 h-6 flex items-center justify-center rounded-full border border-violet-800">
                <span className="block h-3 w-3 rounded-full bg-violet-800"></span>
              </span>
              <div>
                <p className="font-semibold text-primary">Total Sales</p>
                <p className="text-sm font-medium">
                  {this.state.activeType === "week"
                    ? `${a.slice(0, 10)} -${b?.slice(-10)}`
                    : `${a} - ${b}`}
                </p>
              </div>
            </div>
            {/* <div className="flex gap-3 items-start">
              <span className="mt-1 w-6 h-6 flex items-center justify-center rounded-full border border-blue-400">
                <span className="block h-3 w-3 rounded-full bg-blue-400"></span>
              </span>
              <div>
                <p className="font-semibold text-primary">Total Revenue</p>
                <p className="text-sm font-medium">12.04.2022 - 12.05.2022</p>
              </div>
            </div> */}
          </div>
          <div className="flex w-full justify-end">
            <div className="inline-flex gap-2 items-center rounded-md bg-gray-100 p-1.5">
              <button
                className={
                  (activeType === "day" ? activeClasses : normalClasses) +
                  " rounded py-1 px-3 text-xs font-medium text-black"
                }
                onClick={() => {
                  this.configChartInfo({
                    activeType: "day",
                  });
                }}
              >
                Day
              </button>
              <button
                className={
                  (activeType === "week" ? activeClasses : normalClasses) +
                  " rounded py-1 px-3 text-xs font-medium text-black"
                }
                onClick={() => {
                  this.configChartInfo({
                    activeType: "week",
                  });
                }}
              >
                Week
              </button>
              <button
                className={
                  (activeType === "month" ? activeClasses : normalClasses) +
                  " rounded py-1 px-3 text-xs font-medium text-black"
                }
                onClick={() => {
                  this.configChartInfo({
                    activeType: "month",
                  });
                }}
              >
                Month
              </button>
            </div>
          </div>
        </div>

        <div>
          <div id="chartOne" className="-ml-5">
            <ReactApexChart
              options={this.state.options}
              series={this.state.series}
              type="area"
              height={380}
            />
          </div>
        </div>
      </div>
    );
  }

  setChartInfo(activeType: "day" | "week" | "month") {
    let salesInfo: SalesInfo[] = [];
    let data: number[] = [];
    let categories: string[] = [];
    let title: string = "";
    // const activeType = this.state.activeType;

    if (activeType === "month") {
      salesInfo = this.props.sales.last_12_months;
      title = "Sales of last 12 months";
      data = lastNMonth(12).reduceRight((acc, month) => {
        const sales = this.props.sales.last_12_months.find(
          ({ month: salesMonth, year }) =>
            salesMonth === month.monthNum && year === month.year
        );

        let n = 0;
        if (sales !== undefined) {
          n = sales.sales;
        }

        acc.push(n);

        return acc;
      }, [] as number[]);

      categories = lastNMonth(12).reduceRight(
        (acc, { monthLiteral: month, year }) => {
          acc.push(month + " " + year);

          return acc;
        },
        [] as string[]
      );
    } else if (activeType === "week") {
      salesInfo = this.props.sales.last_6_weeks;
      title = "Sales of last 6 weeks";

      const last6Weeks = lastNWeeks();

      data = last6Weeks.reduce((acc, { weekStart, weekEnd }) => {
        let n = 0;
        const sales = (salesInfo as WeeklyFieldProps[]).find(
          ({ week_start }) => {
            var compareDate = moment(new Date(week_start));
            var startDate = moment(weekStart).toDate();
            var endDate = moment(weekEnd).toDate();

            // omitting the optional third parameter, 'units'
            return compareDate.isBetween(startDate, endDate, undefined, "[]"); //false in this case
          }
        );
        if (sales !== undefined) {
          n = sales.sales;
        }

        acc.push(n);

        return acc;
      }, [] as number[]);

      categories = last6Weeks.map(({ weekStart, weekEnd }) => {
        return (
          moment(weekStart).format("DD/MM/YYYY") +
          " - " +
          moment(weekEnd).format("DD/MM/YYYY")
        );
      });
    } else if (activeType === "day") {
      const last30Days = lastNDays();
      title = "Sales of last 30 days";
      salesInfo = this.props.sales.last_30_days as DailyFieldProps[];

      data = last30Days.reduce((acc, date) => {
        let n = 0;

        const sales = (salesInfo as DailyFieldProps[]).find(
          ({ day, month, year }) => {
            return (
              day === date.getDate() &&
              month === date.getMonth() + 1 &&
              year === date.getFullYear()
            );
          }
        );

        if (sales !== undefined) {
          n = sales.sales;
        }

        acc.push(n);

        return acc;
      }, [] as number[]);

      categories = last30Days.map((date) => {
        return moment(date).format("DD/MM/YYYY");
      });
    }

    return {
      data,
      title,
      categories,
      salesInfo,
    };
  }
  configChartInfo({ activeType }: ChartInfo) {
    const { categories, data, title, salesInfo } =
      this.setChartInfo(activeType);

    this.setState({
      activeType,
      series: [
        {
          name: "Sales",
          data,
        },
      ],
      options: {
        ...this.state.options,
        title: {
          ...this.state.options?.title,
          text: title,
        },
        xaxis: {
          ...this.state.options?.xaxis,
          categories,
        },
        yaxis: {
          ...this.state.options?.yaxis,
          max:
            10 **
            Math.ceil(
              Math.log10(Math.max(...salesInfo.map(({ sales }) => sales)))
            ),
        },
      },
    });
  }
}

export default ChartOne;
