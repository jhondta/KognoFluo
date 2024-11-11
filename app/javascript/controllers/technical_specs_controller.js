import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["container", "template"]

    connect() {
        // Inicializar specs existentes si hay
        const specs = this.element.dataset.specs ? JSON.parse(this.element.dataset.specs) : {}
        this.renderExistingSpecs(specs)
    }

    add(event) {
        event.preventDefault()
        const content = this.templateTarget.content.cloneNode(true)
        this.containerTarget.appendChild(content)
    }

    remove(event) {
        event.preventDefault()
        event.target.closest(".spec-item").remove()
    }

    renderExistingSpecs(specs) {
        Object.entries(specs).forEach(([key, value]) => {
            const content = this.templateTarget.content.cloneNode(true)
            const item = content.querySelector(".spec-item")
            item.querySelector("[name='maintenance_asset[technical_specs[][key]]']").value = key
            item.querySelector("[name='maintenance_asset[technical_specs[][value]]']").value = value
            this.containerTarget.appendChild(content)
        })
    }
}