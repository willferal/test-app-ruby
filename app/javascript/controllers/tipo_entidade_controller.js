import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tipo-entidade"
export default class extends Controller {
  static targets = ['razaoSocial', 'cpfCnpj'];

  select(event) {
    const { selectedIndex, options } = event.target;
    const selectedText = options[selectedIndex].text;

    this._changeTargetAttributes(selectedText);

    this.dispatch('select');
  }

  _changeTargetAttributes(selectedText) {
    if (selectedText == 'Jurídica') {
      this.razaoSocialTarget.classList.remove('hidden');
      this.cpfCnpjTarget.placeholder = '00.000.000/0000-00';
      this.cpfCnpjTarget.setAttribute('data-mask-target', 'cnpj')
    } else {
      this.razaoSocialTarget.classList.add('hidden');
      this.cpfCnpjTarget.placeholder = '000.000.000-00';
      this.cpfCnpjTarget.setAttribute('data-mask-target', 'cpf')
    } 
  }
}
