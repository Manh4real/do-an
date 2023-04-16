// import { Fragment } from "react";
import styled from "styled-components";

const StyledHome = styled.div`
  .main-content-ctn {
    padding: 0 50px 30px 50px;
    background: var(--white);
  }
  .main-section {
    padding: 100px 0;
  }
  .sl-btns {
    display: flex;
    button {
      margin-left: 5px;
    }
  }
  .image {
    background-position: center;
    background-size: cover;
    background-repeat: no-repeat;
  }
  .big-cover {
    position: relative;
    width: 100%;
    height: 685px;
    & > a {
      width: 100%;
      height: 100%;
    }
  }
  .cover {
    height: max-content;
  }
  .cover-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: absolute;
    top: 0;
    left: 0;
  }
  .df-fnt {
    font-family: "Anton", sans-serif;
    line-height: 1;
    font-weight: bold;
    letter-spacing: 3px;
    margin-bottom: 25px;
  }
  .cover-title {
    position: absolute;
    left: 0;
    bottom: 0;
    z-index: 1;
    color: var(--white);
    font-size: 15px;
    padding: 35px;
    line-height: 1.4;

    .df-fnt {
      color: var(--white);
    }
    p {
      color: var(--white);
    }
  }
  .shop-btn {
    margin-top: 25px;
    padding: 12px 28px;
    background: var(--white);
    color: #111;
    font-size: 15px;
    border: none;
    border-radius: 30px;

    :hover {
      background: #ffffff90;
    }
  }
  .pd-cover img {
    width: 465px;
    height: 465px;
    object-fit: cover;
  }
  .pd-title {
    text-align: left;
    color: #111;
    font-size: 24px;
    line-height: 3;
  }
  .pd-title-i {
    font-size: 16px;
    line-height: 1.4;
    height: 125px;
    padding-right: 15px;
  }
  .pd-type {
    color: #757575;
  }
  .best-gift-ever {
    text-align: center;
    font-size: 18px;
    line-height: 1;
    position: relative;
    padding-bottom: 100px;

    .btns {
      display: flex;
      justify-content: center;
      position: absolute;
      bottom: 30px;
      left: 50%;
      transform: translateX(-50%);
    }
    .shop-btn {
      background: #111;
      color: var(--white);
      font-size: 18px;
      margin-right: 10px;

      :hover {
        background: #000000bf;
      }
    }
  }
  .bge-title {
    text-align: center;
    padding-top: 25px;
  }
  .trending-now-ctn {
    padding: 50px 0;
  }
  .trending-now {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 15px 15px;

    a {
      height: 100%;
    }
    img {
      height: 100%;
      object-fit: cover;
      width: 100%;
    }
    & > div {
      position: relative;
    }
    .title {
      position: absolute;
      bottom: 36px;
      left: 36px;
      color: var(--white);

      h2 {
        color: var(--white);
        font-weight: 500;
        font-size: 24px;
      }
    }
    .itm-1 {
      grid-row: span 4;
      grid-column: 1 / 2;
    }
    .itm-2,
    .itm-3 {
      grid-row: span 2;
      grid-column: 2 / 3;
    }
    .itm-4 {
      grid-row: span 1;
      grid-column: span 2;

      .title {
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        font-size: 17px;
        white-space: nowrap;

        > * {
          padding-bottom: 26px;
          color: var(--white);
        }
        h1 {
          font-family: "Anton", sans-serif;
          font-weight: 100;
          letter-spacing: -1px;
          ${"" /* font-size: 48px; */}
          line-height: 1;
        }
        a {
          height: max-content;
          padding-bottom: 5px;
          color: var(--white);
          line-height: 1;

          &.underlined {
            ::after {
              border-color: #fff;
              border-width: 2px;
            }
            :hover::after {
              border-width: 3px;
            }
          }
        }
      }
    }
  }
  .drop-down-menu.drop-down-bottom {
    h3 {
      cursor: pointer;
    }
  }
  @media (max-width: 1200px) {
    .shop-btn {
      margin-top: 10px;
    }
    .trending-now .bg img {
      height: 300px;
    }
  }
  @media (max-width: 1120px) {
    .df-fnt {
      letter-spacing: 1px;
    }
    .max-font {
      margin-bottom: 10px;
    }
    .bge-title,
    .regular-font {
      text-align: left;
    }
    .best-gift-ever .btns {
      left: 0;
      transform: none;
    }

    .trending-now {
      grid-template-columns: 1fr;
      gap: 15px 0;

      .itm-1,
      .itm-2,
      .itm-3 {
        grid-column: 1 / span 1;
        grid-row: span 1;

        a {
          width: 100%;
        }
        img {
          width: 100%;
        }
      }
    }
  }
  @media (max-width: 850px) {
    .large-font {
      line-height: 1.3;
      font-size: 20px !important;
    }
    .drop-down-menu.drop-down-bottom {
      padding-inline: 50px;
    }
    .drop-down-menu > div {
      flex: 1;
    }
  }

  @media (max-width: 720px) {
    .best-gift-ever {
      padding-bottom: 75px;

      .btns {
        bottom: 0;
      }
    }
    .trending-now-ctn {
      padding-bottom: 0;
    }
    .main-section {
      padding: 50px 0;
    }
    .drop-down-menu.drop-down-bottom {
      padding: 0;
    }
    .trending-now {
      .itm-4 {
        .title {
          font-size: 15px;
          > * {
            padding-bottom: 10px;
          }
          a {
            font-size: 14px;
          }
        }
      }
    }
  }
  @media (max-width: 650px) {
    .df-fnt {
      letter-spacing: 0;
    }

    .trending-now {
      .itm-4 {
        .title {
          font-size: 14px;
          > * {
            padding-bottom: 8px;
          }
          h1 {
            margin: 0;
            font-size: 40px;
          }
          a {
            font-size: 13px;
          }
        }
      }
    }
  }
  @media (max-width: 450px) {
    .trending-now {
      .itm-4 {
        .title {
          font-size: 12px;
          h1 {
            font-size: 35px;
          }
        }
      }
    }
  }
`;

export default StyledHome;
