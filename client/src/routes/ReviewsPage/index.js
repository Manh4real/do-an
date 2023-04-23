import React, { useEffect, useMemo, useState } from "react";
import {
  Link,
  useNavigate,
  useParams,
  useSearchParams,
} from "react-router-dom";

import { ArrowIcon, Star } from "components/Icons";
// import WriteReview from "./WriteReview";

import { getReviews } from "services/reviews";
import { getProductById } from "services/products";
import Spinner from "components/Spinner";
import { getDownloadImage } from "features/firebase";
import StyledReviewsPage from "./StyledReviewsPage";
import ReviewRow from "./ReviewRow";
import clsx from "clsx";

const MAX_RATING_STARS = 5;
const STATUS = {
  idle: "idle",
  pending: "pending",
  error: "error",
  resolved: "resolved",
};
function ReviewsPage() {
  const { productId } = useParams();
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();

  const page = useMemo(() => {
    const p = searchParams.get("page");

    return p ? (Number.isNaN(+p) ? 1 : p) : 1;
  }, [searchParams]);

  const [reviews, setReviews] = useState([]);
  const [product, setProduct] = useState(null);

  const [meta, setMeta] = useState({
    total: 0,
    avg: 0,
    totalPage: 0,
  });

  const [imageUrl, setImageUrl] = useState("");
  const [status, setStatus] = useState(STATUS.idle);

  useEffect(() => {
    const controller = new AbortController();

    if (!productId) return;

    setStatus(STATUS.pending);
    (async () => {
      try {
        const product = await getProductById(productId);

        setProduct(product);

        const reviewsData = await getReviews(product.product_id, page, {
          signal: controller.signal,
        });

        setReviews(reviewsData.data.reviews);
        setMeta({
          total: parseFloat(reviewsData.meta.total) || 0,
          avg: parseFloat(reviewsData.meta.avg) || 0,
          totalPage: parseFloat(reviewsData.meta.totalPage) || 0,
        });
        setStatus(STATUS.resolved);
      } catch (err) {
        setStatus(STATUS.error);
      }
    })();

    return () => {
      controller.abort();
    };
  }, [page, productId]);

  useEffect(() => {
    if (product) {
      const colorId = Object.keys(product.images)[0];
      const imageName = colorId && product.images[colorId][0]?.url;
      getDownloadImage(imageName).then((url) => {
        if (url) setImageUrl(url);
      });
    }
  }, [product]);

  let content = "";
  if (!product && status === STATUS.resolved) {
    content = <h1>Product not found</h1>;
  } else if (!product && status === STATUS.error) {
    content = <h1>Something went wrong</h1>;
  } else if (!product && status === STATUS.pending) {
    content = <Spinner />;
  } else if (!product && status === STATUS.idle) {
    content = <></>;
  } else if (product) {
    const colorId = Object.keys(product.images)[0];

    content = (
      <>
        <header className="header">
          <Link
            to={`/products/${productId}/${colorId}`}
            className="flex gap-15"
          >
            <img src={imageUrl} alt="" width={50} />
            <div>
              <p>{product.product_name}</p>
              <p>VND {product.price}</p>
            </div>
          </Link>
        </header>
        <div className="count">
          <span>
            <Star width={32} height={32} count={Math.trunc(meta.avg) || 0} />
            <Star
              width={32}
              height={32}
              count={MAX_RATING_STARS - Math.trunc(meta.avg) || 0}
              fill="#ddd"
            />
          </span>

          <p className="uppercase-text medium-font mt-10">
            {meta.total} {meta.total > 1 ? "reviews" : "review"}
          </p>
        </div>

        <main className="main">
          {reviews.length === 0 && <h1>No reviews found</h1>}
          {reviews.map((review, i) => {
            return <ReviewRow key={i} review={review} />;
          })}
        </main>

        <footer className="footer">
          <nav className="pagination flex-center gap-15">
            <button
              className={clsx("nav-button", {
                disabled: +page - 1 <= 0,
              })}
              onClick={() => {
                if (+page - 1 > 0) {
                  navigate("/reviews?page=" + (+page - 1));
                }
              }}
            >
              <ArrowIcon type="left" />
            </button>
            {new Array(meta.totalPage).fill(0).map((_, i) => {
              return (
                <Link
                  key={i}
                  to={"?page=" + (i + 1)}
                  className={clsx("page-number", "flex-center", {
                    active: (i + 1).toString() === page.toString(),
                  })}
                >
                  {i + 1}
                </Link>
              );
            })}
            <button
              className={clsx("nav-button", {
                disabled: +page + 1 > meta.totalPage,
              })}
              onClick={() => {
                if (+page + 1 <= meta.totalPage) {
                  navigate("/reviews?page=" + (+page + 1));
                }
              }}
            >
              <ArrowIcon type="right" />
            </button>
          </nav>
        </footer>
      </>
    );
  }

  return <StyledReviewsPage>{content}</StyledReviewsPage>;
}

export default ReviewsPage;
