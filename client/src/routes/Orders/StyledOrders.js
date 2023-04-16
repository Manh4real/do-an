import styled from "styled-components";

const StyledOrders = styled.div`
  font-size: 14px;
  margin-block: 50px;
  padding-inline: 50px;
  border-top: 1px solid #e5e5e5;

  display: grid;
  grid-template-columns: repeat(6, 1fr);

  min-height: 70vh;

  .title {
    line-height: 1;
  }
  .order-title {
    grid-column: 2 / -2;
    padding: 20px;
  }
  .title,
  .grid-item {
    padding-block: 20px 30px;
    grid-column: 2 / -2;
  }
  .grid-item {
    border-bottom: 1px solid #e5e5e5;

    .left {
      gap: 20px;
      align-items: flex-start;
      height: 100%;
    }
  }
  .grid-item:nth-of-type(1) {
    border-top: 1px solid #e5e5e5;
  }
  .image {
    width: 150px;
    height: 150px;
    aspect-ratio: 1 / 1;

    img {
      width: 100%;
    }
  }

  @media screen and (max-width: 1100px) {
    .title,
    .grid-item {
      padding-block: 20px 30px;
      grid-column: 1 / -1;
    }
    .order-title {
      grid-column: 1 / -1;
    }
  }
  @media screen and (max-width: 780px) {
    & {
      padding-inline: 20px;
    }
    .grid-item {
      .container {
        flex-direction: column;
        align-items: flex-start;
        gap: 30px;
      }
    }
    .right {
      flex-direction: row;
    }

    .order-title {
      flex-direction: column;
      align-items: start;
    }
  }
  @media screen and (max-width: 450px) {
    .right {
      width: 100%;
      flex-direction: column;

      > * {
        display: block;
        flex: 1;
      }
    }
    .image {
      width: 130px;
      height: 130px;
    }
  }
`;

export default StyledOrders;
