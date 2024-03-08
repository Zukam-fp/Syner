import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = [ "form", "position", "role", "team" ]
  // connect() {
  //   console.log(this.roleTarget.dataset.position);
  // }
  selectPosition(event) {
    event.preventDefault
    const position = event.currentTarget.dataset.position;
    const team = event.currentTarget.dataset.team;
    console.log(team);
    this.positionTarget.value = position;
    this.teamTarget.value = team;
    this.formTarget.submit();
  }
}
