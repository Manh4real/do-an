import React from "react";
import { IManufacturer } from "../../types";
import DeleteButton from "./DeleteButton";
import EditManufacturerButton from "./EditManufacturerButton";

interface Props {
  nth: number;
  manufacturer: IManufacturer;
}

function ManufacturerTableRow({ nth, manufacturer }: Props) {
  return (
    <tr>
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap font-medium">
        {nth}
      </td>
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap font-medium">
        {manufacturer.manufacturer_id}
      </td>
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap capitalize">
        {manufacturer.manufacturer_name}
      </td>
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap capitalize">
        {manufacturer.brand_name}
      </td>
      <td>
        <div className="flex items-center gap-x-6 max-w-xs ml-auto">
          <DeleteButton manufacturerId={manufacturer.manufacturer_id} />
          <EditManufacturerButton manufacturer={manufacturer} />
        </div>
      </td>
    </tr>
  );
}

export default ManufacturerTableRow;
