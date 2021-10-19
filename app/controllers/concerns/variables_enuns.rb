module VariablesEnuns

	def sexos
		@sexos = ApplicationRecord.sexos.keys
	end

	def tipos
		@tipos = ApplicationRecord.tipos.keys
	end

	def situations
		@situacaos = ApplicationRecord.situacaos.keys
	end


end