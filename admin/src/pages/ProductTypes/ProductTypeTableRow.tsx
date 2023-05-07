import React from "react";
import { IProductType } from "../../types";
import DeleteButton from "./DeleteButton";
import EditProductTypeButton from "./EditProductTypeButton";

interface Props {
  type: IProductType;
}

function ProductTypeTableRow({ type }: Props) {
  return (
    <tr>
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap font-medium">
        {type.type_id}
      </td>
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap capitalize">
        {type.type_name}
      </td>
      <td>
        <div className="flex items-center gap-x-6 max-w-xs ml-auto">
          <DeleteButton typeId={type.type_id} />
          <EditProductTypeButton type={type} />
        </div>
      </td>
    </tr>
  );
}

export default ProductTypeTableRow;
