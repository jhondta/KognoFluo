import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["toolTemplate", "specialtyTemplate"]

    connect() {
        this.index = this.data.get("resourceIndex") || 0
    }

    addTool(event) {
        event.preventDefault()
        const template = this.toolTemplateTarget.innerHTML
        const newResource = template.replace(/NEW_RECORD/g, new Date().getTime())

        const toolsContainer = event.target.closest("div").nextElementSibling
        toolsContainer.insertAdjacentHTML("beforeend", newResource)

        this.index++
    }

    addSpecialty(event) {
        event.preventDefault()
        const template = this.specialtyTemplateTarget.innerHTML
        const newResource = template.replace(/NEW_RECORD/g, new Date().getTime())

        const specialtiesContainer = event.target.closest("div").nextElementSibling
        specialtiesContainer.insertAdjacentHTML("beforeend", newResource)

        this.index++
    }

    remove(event) {
        event.preventDefault()
        const resourceItem = event.target.closest(".resource-item")

        if (resourceItem.dataset.newRecord !== "true") {
            const input = document.createElement("input")
            input.type = "hidden"
            input.name = "maintenance_plan[maintenance_plan_resources_attributes][][_destroy]"
            input.value = "1"
            resourceItem.appendChild(input)
        }

        resourceItem.style.display = "none"
    }
}