import styled from "styled-components";

const StyledReviewsPage = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  min-height: 80vh;

  .header {
    padding: 20px;
    width: 100%;

    position: sticky;
    top: 0;
    left: 0;
    right: 0;

    background-color: #fff;
    border-bottom: 1px solid #0000001f;
    margin-bottom: 10px;
  }
  .count {
    text-align: center;
    margin-bottom: 50px;

    p {
      font-weight: bold;
    }
  }
  .main {
    flex: 1;
    width: 100%;
    margin-bottom: 30px;
  }
  .review-row {
    border-bottom: 1px solid #0000001f;
    padding: 30px 50px 20px 50px;

    display: flex;
    gap: 20px;

    .title {
      font-weight: bold;
      margin-bottom: 15px;
    }
    .left {
      flex: 33.33%;
    }
    .right {
      flex: 66.67%;
    }
    .readmore {
      margin-left: 10px;
    }
  }

  .footer {
    margin-bottom: 30px;
  }
  .pagination {
    display: flex;
    gap: 5px;

    .nav-button {
      margin-inline: 10px;

      &.disabled {
        opacity: 0.3;
        ${"" /* pointer-events: none; */}
        cursor: not-allowed;
      }
    }

    .page-number {
      padding: 10px;
      width: 30px;
      height: 30px;
      border-radius: 100px;
      font-size: 14px;

      &.active {
        background: #333;
        color: #fff;
      }
    }
  }

  @media (max-width: 580px) {
    .review-row {
      flex-direction: column;
    }
    .count svg {
      width: 24px;
    }
  }
`;

export default StyledReviewsPage;
