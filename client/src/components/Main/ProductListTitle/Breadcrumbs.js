import React from "react";
import { NavLink } from "react-router-dom";
import useBreadcrumbs from "use-react-router-breadcrumbs";

const DynamicBreadcrumb = ({ match }) => (
  <span className="regular-font capitalized-text">
    / {match.params.category}
  </span>
);
const StyleClothingBreadcrumb = ({ match }) => (
  <span className="regular-font capitalized-text">/ {match.params.style}</span>
);
const RegularBreadcrumb = ({ text }) => {
  return <span>{text}</span>;
};

// const CustomPropsBreadcrumb = ({ someProp }) => <span>{someProp}</span>;

// define custom breadcrumbs for certain routes.
// breadcrumbs can be components or strings.
const routes = [
  { path: "/shop/:category", breadcrumb: DynamicBreadcrumb },
  {
    path: "/shop",
    breadcrumb: RegularBreadcrumb,
    props: { text: "All products" },
  },
  {
    path: "/shop/s/:style",
    breadcrumb: StyleClothingBreadcrumb,
    props: { text: "" },
  },
  //   {
  //     path: "/custom-props",
  //     breadcrumb: CustomPropsBreadcrumb,
  //     props: { someProp: "Hi" },
  //   },
];

// map & render your breadcrumb components however you want.
const Breadcrumbs = () => {
  const breadcrumbs = useBreadcrumbs(routes, {
    excludePaths: ["/", "/home", "/shop/s"],
  });

  return (
    <>
      {breadcrumbs.map(({ match, breadcrumb }) => (
        <NavLink key={match.pathname} to={match.pathname}>
          {breadcrumb}
        </NavLink>
      ))}
    </>
  );
};

export default Breadcrumbs;
