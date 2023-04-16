import styled from "styled-components";

const StyledDropdownMenu = styled.div`
  position: absolute;
  top: 100%;
  left: 0;
  width: 100%;
  padding: 0 30px;
  transform-origin: top center;
  transform: scaleY(0);
  background: var(--white);
  display: flex;
  justify-content: center;
  visibility: hidden;
  transition: all 0.3s ease-out;
  z-index: 2;

  &.active {
    transform: scaleY(1);
    visibility: visible;

    > div {
      transition-delay: 0.5s;
      transition-duration: 0.3s;
      opacity: 1;
      transform: translateY(0);
    }
  }
  > div {
    /* width: 270px; */
    width: calc(70% / 3);
    padding: 30px 10px;
    opacity: 0;
    transform: translateY(-5px);
  }
  a {
    color: var(--darker-grey);
    width: 100%;
    line-height: 1.3;

    :hover {
      color: var(--pri-black);
    }
  }
  li {
    margin: 5px;
  }
  h3 {
    margin-bottom: 10px;
    color: #222;
    font-weight: 100;
    user-select: none;
  }
`;

export default StyledDropdownMenu;
