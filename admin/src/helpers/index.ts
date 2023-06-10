import moment from "moment";
import { MONTHS } from "../pages/Home/constants";
import { OrderStatus, PaymentStatus } from "../types";

export function setAccessTokenAtLocalStorage(value: string) {
    localStorage.setItem("accessToken", JSON.stringify(value));
}
export function getAccessTokenFromLocalStorage() {
    const a = localStorage.getItem("accessToken");
    return a && JSON.parse(a);
}


export const countryFromCountryCode = (code: string) => {
    let regionNames = new Intl.DisplayNames(["en"], { type: "region" });
    return regionNames.of(code);
};

export function compressImage(
    imageFile: File,
    resizingFactor = 1,
    quality: number,
    onSuccess: (blob: Blob) => void
) {
    // showing the compressed image
    const canvas = document.createElement("canvas");
    const context = canvas.getContext("2d");

    const image = document.createElement("img");
    image.crossOrigin = "anonymous";

    image.src = URL.createObjectURL(imageFile);

    image.addEventListener("load", function () {
        const originalWidth = this.width;
        const originalHeight = this.height;

        const canvasWidth = originalWidth * resizingFactor;
        const canvasHeight = originalHeight * resizingFactor;

        canvas.width = canvasWidth;
        canvas.height = canvasHeight;

        if (!context) return;

        context.drawImage(
            this,
            0,
            0,
            originalWidth * resizingFactor,
            originalHeight * resizingFactor
        );

        // reducing the quality of the image
        canvas.toBlob(
            (blob) => {
                if (blob) {
                    onSuccess(blob);
                }
            },
            imageFile.type,
            quality
        );
    });
}

export function formatPhoneNumber(phoneNumberString: string) {
    var cleaned = phoneNumberString.replace(/\D/g, '');
    var match = cleaned.match(/^(\d{3})(\d{3})(\d{4})$/);
    if (match) {
        return '(' + match[1] + ') ' + match[2] + '-' + match[3];
    }
    return null;
}

export const getStatusClasses = (status: OrderStatus) => {
    let statusColorClass = {
        background: "transparent",
        color: "text-gray-500"
    };

    if (status === "canceled")
        statusColorClass = {
            background: "bg-red-400",
            color: "text-red-800"
        };
    else if (status === "delivered")
        statusColorClass = {
            background: "bg-green-200",
            color: "text-green-800"
        };
    else if (status === "delivering")
        statusColorClass = {
            background: "bg-green-200",
            color: "text-green-800"
        };
    else if (status === "done")
        statusColorClass = {
            background: "bg-green-200",
            color: "text-green-800"
        };
    else if (status === "processing")
        statusColorClass = {
            background: "bg-yellow-100",
            color: "text-yellow-400"
        };
    else if (status === "ready")
        statusColorClass = {
            background: "bg-blue-200",
            color: "text-blue-600"
        };

    return {
        ...statusColorClass, toString() {
            return `${statusColorClass.background} ${statusColorClass.color}`
        }
    };
}
export const getPaymentStatusClasses = (status: PaymentStatus) => {
    let statusColorClass = {
        background: "transparent",
        color: "text-gray-500"
    };

    if (status === "failed")
        statusColorClass = {
            background: "bg-red-400",
            color: "text-red-500"
        };
    else if (status === "success")
        statusColorClass = {
            background: "bg-green-200",
            color: "text-green-400"
        };
    else if (status === "initial")
        statusColorClass = {
            background: "bg-yellow-100",
            color: "text-yellow-400"
        };

    return {
        ...statusColorClass,
        toString() {
            return `${statusColorClass.background} ${statusColorClass.color}`
        }
    };
}

export const isInThePast = (date: Date) => {
    var now = new Date();
    now.setHours(0, 0, 0, 0);
    if (date < now) {
        return true;
    } else {
        return false;
    }
}

export const formatCurrency = (value: number) => {
    return new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',
    }).format(value).slice(0, -2);
}

export function numberWithCommas(x: number) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

export function nFormatter(num: number, digits: number = 0) {
    const lookup = [
        { value: 1, symbol: "" },
        { value: 1e3, symbol: "k" },
        { value: 1e6, symbol: "M" },
        { value: 1e9, symbol: "G" },
        { value: 1e12, symbol: "T" },
        { value: 1e15, symbol: "P" },
        { value: 1e18, symbol: "E" }
    ];
    const rx = /\.0+$|(\.[0-9]*[1-9])0+$/;
    var item = lookup.slice().reverse().find(function (item) {
        return num >= item.value;
    });
    return item ? (num / item.value).toFixed(digits).replace(rx, "$1") + item.symbol : "0";
}

export function lastNMonth(n: number = 12) {
    let months = [];
    let tmpDate = new Date();
    let tmpYear = tmpDate.getFullYear();
    let tmpMonth = tmpDate.getMonth();
    let monthLiteral;

    for (let i = 0; i < n; i++) {
        tmpDate.setMonth(tmpMonth - i);
        tmpDate.setFullYear(tmpYear);
        monthLiteral = MONTHS[tmpMonth];
        months.push({
            monthLiteral,
            monthNum: tmpMonth + 1,
            year: tmpYear
        });
        tmpYear = (tmpMonth === 0) ? tmpYear - 1 : tmpYear;
        tmpMonth = (tmpMonth === 0) ? 11 : tmpMonth - 1;
    }

    return months;
}

export function lastNWeeks(n: number = 6) {
    const weeks = [];

    const now = new Date();

    for (let i = n - 1; i >= 0; i--) {
        // const dow = moment().day();
        // const weekStart = moment().subtract((i + 1) * 7 - dow, 'days').startOf('day').toDate();
        // const weekEnd = moment().subtract(7 * i - dow + 1, 'days').endOf('day').toDate();
        const weekStart = moment(now).subtract((i + 1) * 7, "days").weekday(8).startOf('day').toDate();
        const weekEnd = moment(now).subtract(7 * (i - 1), 'days').weekday(0).endOf('day').toDate();

        weeks.push({
            weekStart, weekEnd
        })
    }

    return weeks;
}

export function lastNDays(n: number = 30) {
    const last30daysDate = (moment().subtract(n, 'days').toDate());

    const now = new Date();
    let days = [];
    for (let d = last30daysDate; d <= now; d.setDate(d.getDate() + 1)) {
        days.push(new Date(d));
    }

    return days;
}

export function comprareDate(d1: Date, d2: Date) {
    let date1 = d1;
    let date2 = d2;

    // comparing the dates
    if (date1.getTime() < date2.getTime()) {
        // date 1 is behind the date2
        return false;
    } else if (date1 > date2) {
        // date1 is further to date2
        return false;
    } else {
        // date1 and date2 is same
        return true;
    }
}