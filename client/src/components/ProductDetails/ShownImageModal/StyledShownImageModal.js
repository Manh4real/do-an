import styled from "styled-components";

const StyledShownImageModal = styled.div`
  display: grid;
  place-items: center;
  background: #fff;

  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  z-index: 100;
  overflow-y: auto;

  visibility: hidden;
  opacity: 0;
  transition: all 0.05s ease-out;

  &.shown {
    visibility: visible;
    opacity: 1;
  }
  img {
    height: 90%;
    max-width: 95%;
    /* object-fit: contain; */
  }
  .close-modal-btn {
    position: fixed;
    top: 20px;
    right: 20px;
    padding: 30px;
    cursor: pointer;
    z-index: 111;
  }
  .close-modal-btn button {
    padding: 20px 25px;
    font-size: 25px;
    background: transparent;
  }
`;

export default StyledShownImageModal;
