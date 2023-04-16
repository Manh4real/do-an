import styled from "styled-components";

const StyledBag = styled.div`
  position: relative;

  .bag__number {
    position: absolute;
    font-size: 9px;
    font-weight: bold;
    top: 50%;
    left: 50%;
    transform: translate(-40%, -45%);
  }
  a {
    height: 35px;
    aspect-ratio: 1;
  }
`;

export default StyledBag;
