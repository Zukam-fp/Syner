import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = [ "form", "position", "role", "team", "teamform", "positionform" ]
  connect() {
    /* console.log(this.roleTarget.dataset.position); */

  }
  selectPosition(event) {
    // event.preventDefault()

    const position = event.currentTarget.dataset.position;
    // console.log("position", position);


    const team = event.currentTarget.dataset.team;
    // console.log("team", team);


    console.log(this.formTargets)
    // this.positionformTarget.value = position;

    // this.teamformTarget.value = team;
    //   console.log(this.teamTarget.value);
    console.log('coucou')



    // this.formTarget.submit();
/*     console.log(this.formTarget);
 */  }
}
