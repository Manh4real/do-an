export { default as Header } from "./Header";

// FAKE-ass DATA
const LIST = [
  {
    href: "/shop/new-releases",
    name: "New Releases",
    categories: {
      id: "ctg1",
      list: [
        // {
        //   name: "New & Featured",
        //   titles: [
        //     "Shop All New Arrivals",
        //     "SNKRS Launch Calendar",
        //     "Best of Air Ma",
        //     "Member Access",
        //     "Gift Guide",
        //     "Stocking Stuffers",
        //     "Cozy Layers",
        //     "Top Gifts",
        //   ],
        // },
        // {
        //   name: "New For Men",
        //   titles: ["Shoes", "Clothing", "Equipment", "Shop All New"],
        // },
        // {
        //   name: "New For Women",
        //   titles: ["Shoes", "Clothing", "Equipment", "Shop All New"],
        // },
      ],
    },
  },
  {
    // href: "/shop/men",
    href: "/shop?gender=male",
    name: "Men",
    categories: {
      id: "ctg2",
      list: [
        // {
        //   name: "New & Featured",
        //   titles: [
        //     "Shop All New Arrivals",
        //     "SNKRS Launch Calendar",
        //     "Best of Air Ma",
        //     "Member Access",
        //     "Gift Guide",
        //     "Stocking Stuffers",
        //     "Cozy Layers",
        //     "Top Gifts",
        //   ],
        // },
        // {
        //   name: "New For Men",
        //   titles: ["Shoes", "Clothing", "Equipment", "Shop All New"],
        // },
        // {
        //   name: "Styles For Men",
        //   titles: [
        //     "Gym & Accessories",
        //     "Classic & Gentlemen",
        //     "Sport",
        //     "Shop All Styles",
        //   ],
        // },
      ],
    },
  },
  {
    // href: "/shop/women",
    href: "/shop?gender=female",
    name: "Women",
    categories: {
      id: "ctg3",
      list: [
        // {
        //   name: "New & Featured",
        //   titles: [
        //     "Shop All New Arrivals",
        //     "SNKRS Launch Calendar",
        //     "Best of Air Ma",
        //     "Member Access",
        //     "Gift Guide",
        //     "Stocking Stuffers",
        //     "Cozy Layers",
        //     "Top Gifts",
        //   ],
        // },
        // {
        //   name: "New For Women",
        //   titles: ["Shoes", "Clothing", "Equipment", "Shop All New"],
        // },
        // {
        //   name: "Styles For Women",
        //   titles: [
        //     "Gym & Accessories",
        //     "Elegant For Ladies",
        //     "Sport",
        //     "Shop All Styles",
        //   ],
        // },
      ],
    },
  },
  {
    href: "/shop/sales",
    name: "Sales",
    categories: {
      id: "ctg5",
      list: [],
    },
  },
  {
    href: "/shop/gifts",
    name: "Gifts",
    categories: {
      id: "ctg6",
      list: [
        // {
        //   name: "New & Featured",
        //   titles: [
        //     "Shop All New Arrivals",
        //     "SNKRS Launch Calendar",
        //     "Best of Air Ma",
        //     "Member Access",
        //     "Gift Guide",
        //     "Stocking Stuffers",
        //     "Cozy Layers",
        //     "Top Gifts",
        //   ],
        // },
        // {
        //   name: "New For Men",
        //   titles: ["Shoes", "Clothing", "Equipment", "Shop All New"],
        // },
        // {
        //   name: "New For Men",
        //   titles: ["Shoes", "Clothing", "Equipment", "Shop All New"],
        // },
      ],
    },
  },
];

const lis = [
  {
    path: "/member/order-status",
    text: "Order Status",
  },
  {
    path: "/member/shipping-delivery",
    text: "Shipping & Delivery",
  },
  {
    path: "/member/returns",
    text: "Returns",
  },
  {
    path: "/member/size-charts",
    text: "Size Charts",
  },
  {
    path: "/contact",
    text: "Contact Us",
  },
  {
    path: "/member/privacy-policy",
    text: "Privacy Policy",
  },
  {
    path: "/member/terms-of-sale",
    text: "Terms of Sale",
  },
  {
    path: "/terms-of-use",
    text: "Terms of Use",
  },
  {
    path: "/member/send-us-feedback",
    text: "Send Us Feedback",
  },
];
export { LIST, lis };
