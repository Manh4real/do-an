export interface IStatisticFieldProps {
    total: number;
    this_week: number;
    last_week: number;
}

export interface Last12MonthsFieldProps {
    year: number;
    month: number;
    sales: number;
}

export interface WeeklyFieldProps {
    sales: number;
    week_start: string;
}
export interface DailyFieldProps {
    sales: number;
    day: number;
    month: number;
    year: number;
}
export interface UserRecentSales {
    user_id: string;
    user_name: string,
    total_price: string,
    created_at: string,
    avatar: string,
}
export interface TopProduct {
    product_id: string;
    product_name: string;
    price: number;
    sold: number;
    sales: number;
}