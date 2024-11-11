import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["plant", "area", "productionLine"]

    connect() {
        if (this.hasPlantId && this.hasAreaId) {
            // Habilitar los selects
            this.areaTarget.disabled = false
            this.productionLineTarget.disabled = false

            // Asignar valores iniciales
            this.plantTarget.value = this.plantIdValue
            this.areaTarget.value = this.areaIdValue
        }
    }

    // Añade getters para los data attributes
    get hasPlantId() {
        return this.data.has("plantId")
    }

    get hasAreaId() {
        return this.data.has("areaId")
    }

    get plantIdValue() {
        return this.data.get("plantId")
    }

    get areaIdValue() {
        return this.data.get("areaId")
    }

    updateAreas() {
        const plantId = this.plantTarget.value
        if (plantId === "") {
            this.resetSelects("area", "productionLine")
            return
        }

        // Usar Turbo para actualizar el select de áreas
        Turbo.visit(`/organization/plants/${plantId}/areas`, {
            frame: "areas_select",
            action: "replace"
        })

        // Resetear el select de líneas de producción
        this.resetSelects("productionLine")
    }

    updateProductionLines() {
        const areaId = this.areaTarget.value
        if (areaId === "") {
            this.resetSelects("productionLine")
            return
        }

        // Usar Turbo para actualizar el select de líneas de producción
        Turbo.visit(`/organization/areas/${areaId}/production_lines`, {
            frame: "production_lines_select",
            action: "replace"
        })
    }

    resetSelects(...targets) {
        targets.forEach(target => {
            const element = this[`${target}Target`]
            element.disabled = true
            element.innerHTML = `<option value="">${this.defaultPromptFor(target)}</option>`
        })
    }

    defaultPromptFor(target) {
        const prompts = {
            area: "Seleccione un área",
            productionLine: "Seleccione una línea de producción"
        }
        return prompts[target] || "Seleccione una opción"
    }
}