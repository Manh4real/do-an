import React from "react";
import ReactDOM from "react-dom";

interface Props {
  large?: boolean;
  children: React.ReactNode;
}

function Modal({ large = false, children }: Props) {
  const sizeClass = large ? "sm:max-w-4xl" : "sm:max-w-lg";

  return ReactDOM.createPortal(
    <div
      className="relative z-30"
      aria-labelledby="modal-title"
      role="dialog"
      aria-modal="true"
    >
      <div className="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"></div>

      <div className="fixed inset-0 z-10 overflow-y-auto">
        <div className="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0">
          <div
            className={
              "relative transform overflow-hidden rounded-lg bg-white text-left shadow-xl transition-all sm:my-8 sm:w-full " +
              sizeClass
            }
          >
            <div className="max-h-[90vh] overflow-auto bg-white px-4 pb-4 pt-5 sm:p-6 sm:pb-4">
              {children}
            </div>
          </div>
        </div>
      </div>
    </div>,
    document.getElementById("modal-root") as HTMLElement
  );
}
export default Modal;
