import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["synonym"];

  addSynonym() {
    const newSynonym = this.synonymTarget.cloneNode(true);
    this.synonymTarget.parentNode.insertBefore(newSynonym, this.synonymTarget);
  }

  removeSynonym() {
    this.synonymTarget.remove();
  }
}