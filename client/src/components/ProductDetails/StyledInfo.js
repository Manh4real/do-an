import styled from "styled-components";

const StyledInfo = styled.div`
  margin-left: 50px;

  h1 {
    font-weight: 500;
    padding-bottom: 15px;
    line-height: 1.3;
  }
  h4 {
    color: #fa5400;
    font-weight: 500;
  }
  .price {
    font-size: 16px;
    padding: 10px 0 25px 0;
    del {
      margin-left: 10px;
      color: #8d8d8d;
      font-size: 14px;
    }
  }
  .items {
    display: flex;
    flex-wrap: wrap;
    gap: 5px;

    &.disabled {
      opacity: 0.5;
    }

    > a {
      display: inline-flex;
      border-radius: 4px;
      overflow: hidden;
      border: 1px solid transparent;

      width: 70px;
      height: 70px;
      background: #f2f2f2;

      &.active,
      :hover {
        border-color: #111;
      }
    }
    img {
      width: 100%;
      object-fit: cover;
    }
  }
  .sizes {
    padding-bottom: 20px;
    position: relative;

    header {
      display: flex;
      justify-content: space-between;
      padding: 30px 0 10px 0;

      a {
        color: #8d8d8d;
      }
    }
    .sizes-wrapper {
      position: relative;
      padding: 1px;
      border-radius: 5px;

      &.alert {
        border: 1px solid red;
        box-sizing: initial;

        .alert-mes {
          position: absolute;
          bottom: -35px;
          left: 0;
        }
      }
    }
    .sizes-ctn {
      display: grid;
      grid-template-columns: repeat(5, 1fr);
      gap: 7px;
      position: relative;
      z-index: 2;

      > div {
        display: inline-flex;
      }
      .sz {
        min-width: 50px;

        flex-grow: 1;
        height: 48px;

        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        padding: 10px 15px;
        box-shadow: rgb(229, 229, 229) 0px 0px 0px 1px;
        border-radius: 4px;
        cursor: pointer;

        :hover {
          box-shadow: #111 0px 0px 0px 1px;
        }
      }

      input[type="radio"] {
        opacity: 0;
        width: 0;
        height: 0;
        display: none;
      }
      input[type="radio"]:checked + label {
        box-shadow: #111 0px 0px 0px 1px;
      }
      input[type="radio"]:disabled + label {
        color: #ddd;
        background: #f7f7f7;
        cursor: default;
        pointer-events: none;
      }
    }
    h3 {
      font-weight: 500;
    }
  }

  .btns {
    ${"" /* padding: 0 30px 30px 30px; */}
    padding-block: 20px;

    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
    flex-direction: column;

    button {
      padding: 20px;
      text-align: center;
      width: 96%;
      width: 100%;

      border-radius: 50px;
      font-size: 16px;
      background: #fff;
    }
    .add-to-bag-btn {
      background: #111;
      color: #fff;
    }
    .favorite-btn {
      border: 1.5px solid #0000;
      box-shadow: inset 0 1px 0 0 #ccc, inset -1px 0 0 0 #ccc,
        inset 0 -1px 0 0 #ccc, inset 1px 0 0 0 #ccc;

      :hover {
        border-color: #111;
      }
    }
  }

  .sb {
    padding-bottom: 30px;

    p {
      padding: 15px 0;

      small {
        color: #8d8d8d;
        font-size: 13px;
      }
    }
  }
  .small-title {
    padding-bottom: 8px;
    text-transform: capitalize;
  }

  @media (max-width: 450px) {
    & {
      margin-left: 0;
      padding-inline: 20px;
    }

    .btns button.add-to-bag-btn,
    .btns button.favorite-btn {
      padding: 15px;
      width: 90%;
      font-size: 13px;
    }
    .sizes .sizes-ctn .sz {
      padding: 8px 10px;
      height: 40px;
    }
  }
  @media (max-width: 1100px) {
    & {
      margin-left: 30px;
    }
  }
  @media (max-width: 900px) {
    & {
      margin-left: 10px;
    }
  }
  @media (max-width: 720px) {
    & {
      margin-left: 0;
    }
    & {
      grid-column: 1 / -1;
    }
  }
`;

export default StyledInfo;
