import React from "react";

const Card = prop => {
  return (
    <div class="card">
      <div class="card-image">
        <figure class="image is-4by3">
          <img src={prop.stateToProp.img} alt="Image" />
        </figure>
      </div>
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src={prop.stateToProp.img2} alt="555" />
            </figure>
          </div>
          <div class="media-content">
            <p class="title is-4">{prop.stateToProp.title}</p>
            <p class="subtitle is-6">{prop.stateToProp.subtitle}</p>
          </div>
        </div>

        <div class="content">
          {prop.stateToProp.content}
          <br />
          <div>11:39 PM - 28 Mar 2019</div>
        </div>
      </div>
    </div>
  );
};

export default Card;
