
import { Controller } from "stimulus"

import '../js/mask'


export default class extends Controller {
	static targets = [ "cpf", "name", "censo", "nascimento", "naturalidade", "cpfmae", "mae", "cpfpai", "pai", "telefone"]

	initialize() {
		//$(this.cpf).mask('000.000.000-00')
		$(this.telefone).mask('(00)0.0000-0000')

		
	}


	search_cpf() {
		var cpf = this.cpf.value
		cpf = cpf.replace(/[^\d]+/g, '')


		fetch('/student/'+cpf)
		.then(response => {response.json()
			.then(data => {
				if (data == null){

					this.pai.value = '',
					this.mae.value = '',
					this.name.value = '',
					this.censo.value = '',
					this.nascimento.value = '',
					this.naturalidade.value = '',
					this.cpfmae.value = '',
					this.cpfpai.value = ''
				} else {
					this.name.value = data.name,
					this.censo.value = data.censo,
					this.nascimento.value = data.nascimento,
					this.naturalidade.value = data.naturalidade,
					this.pai.value = data.pai,
					this.mae.value = data.mae,
					this.cpfmae.value = data.cpfmae,
					this.cpfpai.value = data.cpfpai

				}})
		})
	}

	get telefone() {return this.telefoneTarget}
	get mae() {return this.maeTarget}
	get pai() {return this.paiTarget}
	get cpfmae() {return this.cpfmaeTarget}
	get cpfpai() {return this.cpfpaiTarget}
	get naturalidade() {return this.naturalidadeTarget}
	get censo() {return this.censoTarget}
	get nascimento() {return this.nascimentoTarget}
	get name() {return this.nameTarget}
	get cpf() {return this.cpfTarget}


}
