import React from "react";
import styled from "styled-components";

function NotFound() {
  return (
    <Styled>
      <h1>Page Not Found.</h1>
    </Styled>
  );
}

const Styled = styled.div`
  background: #fff;
  min-height: calc(792px - 200px);
  display: flex;
  justify-content: center;
  align-items: center;
`;

export default NotFound;
