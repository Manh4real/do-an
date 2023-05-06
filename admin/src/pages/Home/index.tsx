import React, { useEffect, useState } from "react";

import CardSales from "./CardSales";
import CardUsers from "./CardUsers";
import CardOrders from "./CardOrders";

import ChartOne from "./ChartOne";
// import ChartTwo from "./ChartTwo";
import {
  DailyFieldProps,
  IStatisticFieldProps,
  Last12MonthsFieldProps,
  TopProduct,
  UserRecentSales,
  WeeklyFieldProps,
} from "./types";
import { getStatistics } from "../../services/statistics";
import Spinner from "../../components/Spinner";
import RecentSales from "./RecentSales";
import TopProductsTable from "./TopProductsTable";

interface IStatistics {
  sales: IStatisticFieldProps;
  items: IStatisticFieldProps;
  users: IStatisticFieldProps;
  user_recent_sales: UserRecentSales[];
  top_products: TopProduct[];
  last_12_months: {
    sales: Last12MonthsFieldProps[];
  };
  last_6_weeks: {
    sales: WeeklyFieldProps[];
  };
  last_30_days: {
    sales: DailyFieldProps[];
  };
}

const initialValue = {
  total: 0,
  last_week: 0,
  this_week: 0,
} as const;

function Home() {
  const [statistics, setStatistics] = useState<IStatistics>({
    items: initialValue,
    sales: initialValue,
    users: initialValue,
    user_recent_sales: [],
    last_12_months: {
      sales: [],
    },
    last_30_days: {
      sales: [],
    },
    last_6_weeks: {
      sales: [],
    },
    top_products: [],
  });
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    setLoading(true);
    getStatistics()
      .then((data) => {
        setStatistics(data);
      })
      .finally(() => {
        setLoading(false);
      });
  }, []);

  if (loading) {
    return (
      <div className="flex items-center justify-center h-screen">
        <Spinner />
      </div>
    );
  }

  return (
    <h1 className="ext-3xl p-8">
      <div className="grid grid-cols-1 gap-4 md:grid-cols-2 md:gap-6 xl:grid-cols-11 2xl:gap-7.5">
        <CardSales sales={statistics.sales} />
        <CardOrders items={statistics.items} />
        <CardUsers users={statistics.users} />
      </div>

      <div className="mt-4 grid grid-cols-12 gap-4 md:mt-6 md:gap-6 2xl:mt-7.5 2xl:gap-7.5">
        <ChartOne
          sales={{
            last_12_months: statistics.last_12_months.sales,
            last_30_days: statistics.last_30_days.sales,
            last_6_weeks: statistics.last_6_weeks.sales,
          }}
        />
        <RecentSales recentSales={statistics.user_recent_sales} />
        <TopProductsTable topProducts={statistics.top_products} />
        {/* <MapOne /> */}
        <div className="col-span-12 xl:col-span-8">{/* <TableOne /> */}</div>
        {/* <ChatCard /> */}
      </div>
    </h1>
  );
}

export default Home;
