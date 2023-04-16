import { useCallback } from "react";
import { useLocation, useNavigate } from "react-router-dom";

function useRedirect() {
  const navigate = useNavigate();
  const location = useLocation();

  const redirect = useCallback(
    ({ to }) => {
      navigate(to, { state: { from: location }, replace: true });
    },
    [location, navigate]
  );

  return redirect;
}

export default useRedirect;
