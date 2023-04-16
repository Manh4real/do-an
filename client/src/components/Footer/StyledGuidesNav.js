import styled from "styled-components";

const StyledGuidesNav = styled.div`
  padding: 25px;
  box-shadow: 0 0 1px 1px #fff;
  border-radius: 2px;
  background-color: #111;

  position: absolute;
  left: calc(50% - 50px);
  bottom: 35px;
  width: 50%;

  ul {
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    max-height: 180px;
  }

  @media (max-width: 900px) {
    & {
      left: 50px;
      width: calc(100% - 100px);
    }
  }
  @media (max-width: 450px) {
    & {
      left: 15px;
      width: calc(100% - 30px);
    }
  }
`;

export default StyledGuidesNav;
