import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card"
export default class extends Controller {

  static targets = [ "image" ]
  connect() {
    console.log("card connected")
    // this.element.addEventListener('click', this.replaceWithImage.bind(this))
  }

  replaceWithImage(event) {

    event.preventDefault()

    const image = document.createElement('img')
    image.src = event.target.dataset.imageSrc
    console.log(image.src)
    image.style.width = '100%'
    image.style.height = '100%'

    event.target.parentNode.replaceChild(image, event.target)
  }


  disconnect() {
    this.element.removeEventListener('click', this.replaceWithImage.bind(this))
  }
}
