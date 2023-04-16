import styled from "styled-components";

const StyledProductDetailsModal = styled.div`
  display: grid;
  place-items: center;
  background: #0008;

  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  z-index: 100;

  transition: all 0.05s ease-out;

  .product-details-modal {
    padding: 30px;
    border-radius: 15px;
    width: 500px;
    min-height: 250px;
    max-height: 80%;

    overflow: auto;

    background: #fff;
    line-height: 1.8;
    position: relative;

    .close-btn-ctn {
      position: absolute;
      top: 20px;
      right: 20px;
    }
  }

  p {
    margin: 10px 0;
  }

  @media (max-width: 450px) {
    .product-details-modal {
      width: 90%;
      max-height: 90%;
    }
  }
`;

export default StyledProductDetailsModal;
