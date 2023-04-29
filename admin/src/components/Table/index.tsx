import React from "react";

import { ArrowLeft, ArrowRight } from "../../Icons";
import Row from "./Row";
import TableHeader from "./TableHeader";

interface Props {
  data: [];
}

function Table({ data }: Props) {
  return (
    <section className="container px-4 mx-auto">
      <div className="flex items-center gap-x-3">
        <h2 className="text-lg font-medium text-gray-800">Users</h2>

        <span className="px-3 py-1 text-xs text-blue-600 bg-blue-100 rounded-full ">
          100 users
        </span>
      </div>

      <div className="flex flex-col mt-6">
        <div className="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
          <div className="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
            <div className="overflow-hidden border border-gray-200 md:rounded-lg">
              <table className="min-w-full divide-y divide-gray-200">
                <thead className="bg-gray-50">
                  <TableHeader />
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                  <Row />
                  <Row />
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

      <div className="flex items-center justify-between mt-6">
        <a
          href="/"
          className="flex items-center px-5 py-2 text-sm text-gray-700 capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100"
        >
          <ArrowLeft />

          <span>previous</span>
        </a>

        <div className="items-center hidden lg:flex gap-x-3">
          <PageNumber number={1} active />
          <PageNumber number={2} />
          <PageNumber number={3} />
          <a
            href="/"
            className="px-2 py-1 text-sm text-gray-500 rounded-md hover:bg-gray-100"
          >
            ...
          </a>
          <PageNumber number={12} />
          <PageNumber number={13} />
          <PageNumber number={14} />
        </div>

        <a
          href="/"
          className="flex items-center px-5 py-2 text-sm text-gray-700 capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100"
        >
          <span>Next</span>

          <ArrowRight />
        </a>
      </div>
    </section>
  );
}

const PageNumber = ({
  number,
  active = false,
}: {
  number: number;
  active?: boolean;
}) => {
  return (
    <a
      href="/"
      className={
        active
          ? "px-2 py-1 text-sm text-blue-500 rounded-md bg-blue-100/60"
          : "px-2 py-1 text-sm text-gray-500 rounded-md hover:bg-gray-100"
      }
    >
      {number}
    </a>
  );
};

export default Table;
