import React, { useState, useCallback, useEffect } from "react";
import { To, useLocation, useNavigate } from "react-router-dom";
import { savePDF } from "@progress/kendo-react-pdf";
import { getDownloadImage } from "../features/firebase";

interface Props {
  to: To;
}

export function useRedirect() {
  const navigate = useNavigate();
  const location = useLocation();

  const redirect = useCallback(
    ({ to }: Props) => {
      navigate(to, { state: { from: location }, replace: true });
    },
    [location, navigate]
  );

  return redirect;
}

interface ExportToPDFHookProps {
  fileName: string;
  title: string;
}
export const useExportToPDF = ({ fileName, title }: ExportToPDFHookProps) => {
  const container = React.useRef<HTMLDivElement>(null);
  const exportPDFWithMethod = () => {
    let element = container.current || document.body;
    savePDF(element, {
      paperSize: "auto",
      margin: 40,
      fileName,
      date: new Date(),
      title,
    });
  };

  return {
    container,
    exportPDFWithMethod,
  };
};

export const useFetchImage = (imageName: string | undefined) => {
  const [imageUrl, setImageUrl] = useState("");

  // first image with first color
  const firstImageName = imageName || "default-product-image.png";

  useEffect(() => {
    let ignore = false;
    getDownloadImage(firstImageName).then((url) => {
      if (!ignore) {
        url && setImageUrl(url);
      }
    });

    return () => {
      ignore = true;
    };
  }, [firstImageName]);

  return { imageUrl };
};
