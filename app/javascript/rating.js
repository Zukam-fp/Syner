// Sélectionnez tous les éléments avec la classe "stars"
const starsElements = document.querySelectorAll(".stars");

// Ajoutez un écouteur d'événements pour le clic de souris sur chaque élément
starsElements.forEach((starsEl) => {
  starsEl.addEventListener("click", (e) => {
    // Vérifiez si l'élément cliqué a la classe "fa-star"
    if (!e.target.matches(".fa-star")) return;

    // Calculez l'indice de l'élément cliqué par rapport à ses frères et sœurs
    const value = [...e.currentTarget.children].indexOf(e.target);

    // Mettez à jour l'attribut "data-rating" de l'élément parent
    e.currentTarget.setAttribute("data-rating", value + 1);

    // Mettez à jour les classes CSS des éléments enfants pour afficher des étoiles pleines ou vides
    e.currentTarget.querySelectorAll(".fas").forEach((starEl, index) => {
      starEl.className = index <= value ? "fas fa-star" : "far fa-star";
    });
  });
});

// document.querySelectorAll(".stars").forEach((starsEl) => {
//   starsEl.addEventListener("click", (e) => {
//     if (!e.target.matches(".fa-star")) return;
//     const value = [...e.currentTarget.children].indexOf(e.target);
//     e.currentTarget.setAttribute("data-rating", value + 1);
//     e.currentTarget.querySelectorAll(".fas").forEach((starEl, index) => {
//       starEl.className = index <= value ? "fas fa-star" : "far fa-star";
//     });
//   });
// });
