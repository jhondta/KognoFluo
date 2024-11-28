import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "preview"]

    trigger() {
        this.inputTarget.click()
    }

    preview() {
        console.log("Preview called")
        console.log("File:", this.inputTarget.files[0])
        console.log("Preview target:", this.previewTarget)
        
        const file = this.inputTarget.files[0]
        if (file) {
            const reader = new FileReader()
            reader.onload = (e) => {
                // Si el preview es una imagen, actualiza su src
                if (this.previewTarget.tagName === 'IMG') {
                    this.previewTarget.src = e.target.result
                } else {
                    // Si es el div de iniciales, reemplázalo por una imagen
                    const img = document.createElement('img')
                    img.src = e.target.result
                    img.className = this.previewTarget.className
                    img.dataset.avatarUploadTarget = "preview"
                    this.previewTarget.replaceWith(img)
                }
            }
            reader.readAsDataURL(file)
        }
    }
}
