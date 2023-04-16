import styled from "styled-components";

const StyledHamburgerMenu = styled.div`
  width: 40px;
  height: 40px;
  border-radius: 50%;
  cursor: pointer;
  opacity: 0;
  visibility: hidden;
  display: none;

  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);

  :hover,
  :focus {
    background: var(--bg-grey);
  }
  &.toggle {
    position: fixed;
    top: 30px;
    right: min(50px, 5vw);
    z-index: 999;
  }
  .close-icon {
    width: 12px;
    height: 12px;
  }

  @media screen and (max-width: 960px) {
    & {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;

      visibility: visible;
      opacity: 1;
    }
  }
  @media (max-width: 450px) {
    > ul {
      margin-left: 10px;
      width: 80%;
    }
    & {
      right: -60px;
    }
  }
`;

export default StyledHamburgerMenu;
