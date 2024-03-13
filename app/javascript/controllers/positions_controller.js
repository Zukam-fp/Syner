import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["form", "position", "role", "team", "teamform", "positionform", "positionTargets", "positionformTargets", "teamformTargets", "players"]
  connect() {
    /* console.log(this.roleTarget.dataset.position); */
  }
  selectPosition(event) {
    event.preventDefault()


    const position = event.currentTarget.dataset.position;
    const team = event.currentTarget.dataset.team;


    this.positionformTargets[0].value = position;
    this.teamformTargets[0].value = team;
    this.formTargets[0].submit();
  }
}
