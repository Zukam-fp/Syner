import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="rating"
export default class extends Controller {
  static values = { rating: Number, total: Number, count: Number };
  static targets = ["star", "input"];

  connect() {
    console.log(this.formTarget);
  }

  rating(event) {
    const numberOfStars = event.currentTarget.dataset.index;

    this.starTargets.forEach((star) => {
      star.classList.add("far");
      star.classList.remove("fas");
    });

    this.starTargets.slice(0, numberOfStars).forEach((star) => {
      star.classList.remove("far");
      star.classList.add("fas");
    });

    // Met à jour la valeur du rating
    this.inputTarget.value = numberOfStars;

    console.log(this.inputTarget.value);
  }

  validate(event) {
    console.log(this.formTarget);
    console.log(event.currentTarget);
    this.teamworkTarget.value = this.ratingValue;
    console.log(this.teamworkTarget.value);
    this.formTarget.submit();
  }

  profilRating() {
    const numberOfStars = currentTarget.dataset.index;

    this.starTargets.forEach((star) => {
      star.classList.add("far");
      star.classList.remove("fas");
    });

    this.starTargets.slice(0, numberOfStars).forEach((star) => {
      star.classList.remove("far");
      star.classList.add("fas");
    });
  }
}
