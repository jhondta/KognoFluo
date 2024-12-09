import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    remove(event) {
        const container = event.currentTarget.closest("[data-resource-id]")
        container.remove()
    }
}
