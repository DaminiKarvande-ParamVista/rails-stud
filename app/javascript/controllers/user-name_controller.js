import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["search", "row"]

  connect() {
    console.log("Live Search Connected ✅")
  }

  filter() {
    const query = this.searchTarget.value.toLowerCase()

    this.rowTargets.forEach((row) => {
      const text = row.textContent.toLowerCase()

      if (text.includes(query)) {
        row.style.display = ""
      } else {
        row.style.display = "none"
      }
    })
  }
}