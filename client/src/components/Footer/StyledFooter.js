import styled from "styled-components";

const StyledFooter = styled.div`
  background: #111;
  width: 100%;
  color: #fff;

  display: grid;
  grid-template-columns: repeat(5, 1fr);
  gap: 40px 0;
  max-width: 100%;
  padding: 50px 75px 10px 75px;
  margin-bottom: 30px;
  transition: all 0.3s ease-out;

  position: relative;

  .minus-icon,
  .plus-icon {
    fill: #fff;
    width: 10px;
  }
  a {
    color: #7e7e7e;
    line-height: 2.5;
    font-size: 12px;
    white-space: nowrap;

    :hover {
      color: #fff;
    }
    &.bold-font {
      font-family: var(--pri-font);
      font-weight: 700;
      font-size: 14.3px;
    }
    &.col-title {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding-right: 15px;
    }
  }
  li {
    margin-bottom: 2px;
  }
  .bold-font {
    color: #fff;
    letter-spacing: 0.5px;
    font-weight: 100;
    font-size: 14px;
  }
  .col-title {
    text-transform: uppercase;
  }
  .social-links {
    &.flex-end {
      gap: 15px;
    }
  }
  .social {
    background: transparent;
    width: 32px;
    aspect-ratio: 1;
    border-radius: 50%;
    display: flex;

    svg {
      fill: #7e7e7e;
    }
    :hover {
      svg {
        fill: #fff;
      }
    }
  }
  @media (max-width: 900px) {
    & {
      grid-template-columns: repeat(4, 1fr);
      gap: 30px;
    }
    .socials-col {
      grid-column: 1 / -1;
    }
    .social-links {
      justify-content: flex-start;
    }
    .bottom-menu {
      grid-column: span 1;
    }
  }
  @media (max-width: 850px) {
    & {
      grid-template-columns: repeat(3, 1fr);
    }
  }
  @media (max-width: 780px) {
    & {
      padding-inline: 20px;
      grid-template-columns: 1fr;

      .col-2 {
        grid-row: 2 / 3;
      }
      .col-3 {
        grid-row: 3 / 4;
      }
      .col-4 {
        grid-row: 4 / 5;
      }
      .lc-cp {
        grid-column: span 1;
      }
    }
  }
  @media (max-width: 450px) {
    & {
      padding: 15px;
      gap: 20px;

      .expand {
        opacity: 0;
        max-height: 0;
        overflow: hidden;
        visibility: hidden;
        transition: all 0.3s ease-out;

        &.active {
          max-height: 300px;
          opacity: 1;
          visibility: visible;
        }
      }
    }
  }
`;

export default StyledFooter;
