import styled from "styled-components";

const StyledFilterContainer = styled.div`
  .filter-container::-webkit-scrollbar {
    width: 8px;
  }
  .filter-container::-webkit-scrollbar-thumb {
    border-radius: 30px;
    background: grey;
  }
  .filter-container::-webkit-scrollbar-track {
    background: transparent;
  }
  .filter-container {
    position: sticky;
    top: var(--toStickedFilter);
    height: calc(100vh - var(--toStickedFilter));
    /* max-height: 635px; */
    max-height: 100vh;
    width: 320px;
    overflow-y: auto;
    /* overflow-x: hidden; */
    font-size: 16px;
    padding-bottom: 50px;
    padding-left: 3px;
    margin-right: 50px;
    background: #fff;
    visibility: visible;
    opacity: 1;
    transition-delay: 0.3s;
    transition: width 0.2s ease-out, opacity 0.2s ease-out;
    /* white-space: nowrap; */

    &.desktop--hide {
      width: 0;
      visibility: hidden;
      opacity: 0;
      margin: 0;
      padding: 0;
    }
    &.is--tablet {
      &.tablet--show {
        .filter-close-btn {
          opacity: 1;
          visibility: visible;
        }
      }
    }
    .filter-close-btn {
      position: fixed;
      top: 20px;
      right: 20px;
      width: 50px;
      aspect-ratio: 1;
      background: var(--bg-grey);
      border-radius: 50%;
      transition: none;

      opacity: 0;
      visibility: hidden;

      :hover {
        background: #e5e5e580;
      }
    }

    details {
      cursor: pointer;
    }
    input[type="text"] {
      border: 1px solid #ccc;
      padding: 5px;
      font-size: 14px;
      width: 100%;
    }
    .line {
      width: 10px;
      border-bottom: 2px solid #333;
    }
    .filter-ctg {
      padding: 15px 0;
      border-bottom: 1px solid #e5e5e5;
      /* width: calc(100% - 17px); */

      > div {
        padding: 5px 0;
      }
      label {
        cursor: pointer;
        text-transform: capitalize;
      }
      label:hover {
        opacity: 0.8;
      }
    }
    .clothing-type {
      padding-bottom: 45px;

      li {
        margin: 0;
      }
      a {
        padding: 6px 0;
        line-height: 1.3;
        width: 100%;
        font-size: 16px;
        text-transform: capitalize;

        &.active {
          font-weight: bold;
          color: #333;
        }
      }
    }
  }
  /* .filter-container .clothing-type a:focus {
      outline: 1px solid #111;
    } */
  details summary {
    padding-bottom: 10px;
    user-select: none;
  }
  .filter-by-store {
    display: inline-block;
    margin: 5px 0px 25px 0;
    background: linear-gradient(#111, #111);
    background-size: 2px 1px;
    background-repeat: repeat-x;
    background-position: 0px 29px;
    line-height: 2;
    cursor: pointer;

    &:hover {
      background-size: 2px 1.5px;
    }
  }

  input[name="rating"] + label {
    border: 1px solid transparent;
    padding-block: 5px;
    margin-bottom: 3px;
  }
  input[name="rating"]:checked + label {
    border-color: var(--pri-black);
  }

  @media screen and (max-width: 1450px) {
    .filter-container.is--tablet {
      visibility: hidden;
      opacity: 0;
      margin: 0;
      padding: 0;
      height: 0;
      transition: height 0.1s ease-out;
    }

    .filter-container.tablet--show {
      /* position: relative; */
      position: fixed;
      inset: 0;
      z-index: 100;

      height: 100%;
      min-height: 100%;
      width: 100%;
      /* height: 250px; */

      display: block;
      visibility: visible;
      opacity: 1;
      margin: 0;
      padding: 30px 30px;

      /* box-shadow: 1px 5px 15px 0 rgba(0, 0, 0, 0.05); */
    }
  }
`;

export default StyledFilterContainer;
