# encoding: utf-8

module DLinkedList
    
    # Clase Referencia
	class Referencia
	
		# Incluye Comparable
		include Comparable
		
		attr_reader :autores, :titulo, :fecha_publicacion
		
		def initialize(autores, titulo, fecha_publicacion)
			@autores, @titulo, @fecha_publicacion = autores, titulo, fecha_publicacion
		end
		
		def to_s
			# Formato Autores, (Año de publicación). Título.
			s = ''
			@autores.each() { |a| s << a << ', '}
			s << "(#{@fecha_publicacion}). #{@titulo}."
			return s
		end
		
		# La comparación es por orden alfabético de autores y por orden alfabético de títulos si hay igualdad en los autores
		def <=>(c_ref)
			autores_ord = autores.join(", ") <=> c_ref.autores.join(", ")
			if autores_ord == 0
				return titulo <=> c_ref.titulo
			else
				return autores_ord
			end
		end
		
	end
	
	# Clase Libro
	class Libro < Referencia
	
		attr_reader :edicion, :lugar_publicacion, :editorial
		
		def initialize(autores, titulo, fecha_publicacion, edicion, lugar_publicacion, editorial)
			super(autores, titulo, fecha_publicacion)
			@edicion, @lugar_publicacion, @editorial = edicion, lugar_publicacion, editorial
		end
		
		def to_s
			# Formato Autores, (Año de publicación). Título. (edicion) Lugar de publicación: Editorial.
			return super << " (#{@edicion}ª edición) #{@lugar_publicacion}: #{@editorial}."
		end
	
	end
	
	# Clase Artículo
	class Articulo < Referencia
	
		attr_reader :titulo_publicacion, :paginas
		
		def initialize(autores, titulo, fecha_publicacion, titulo_publicacion, paginas)
			super(autores, titulo, fecha_publicacion)
			@titulo_publicacion, @paginas = titulo_publicacion, paginas
		end
		
		def to_s
			# Formato Autores, (Año de publicación). Título. Título publicación, páginas.
			return super << " #{@titulo_publicacion}, p. #{@paginas}."
		end
	
	end
	
	# Clase E-Documento
	class EDocumento < Referencia
	
		attr_reader :fecha_recuperacion, :dURL
		
		def initialize(autores, titulo, fecha_publicacion, fecha_recuperacion, dURL)
			super(autores, titulo, fecha_publicacion)
			@fecha_recuperacion, @dURL = fecha_recuperacion, dURL
		end
		
		def to_s
			# Formato Autores, (Año de publicación). Título. Fecha de recuperación, URL.
			return super << " Recuperado el #{@fecha_recuperacion}, de #{@dURL}."
		end
	
	end
	
	# Clase Nodo
	class Node

		attr_accessor :value, :next_node, :prev_node
  
    	def initialize(value, next_node = nil, prev_node = nil)
	        @value = value
	        @next_node = next_node
	        @prev_node = prev_node
    	end
    
	end
	
	# Clase Lista
	class List
		
		# Incluye Enumerable
		include Enumerable
		
		# Nodos cabeza/cola y tamaño
		attr_reader :head, :tail, :size
		
		def initialize()
			@head = nil
			@tail = nil
			@size = 0
		end
		
		# ¿Está la lista vacía?
		def empty?()
			return (@head == nil)
		end
		
		# Insertar en lista vacía
		def push_empty(ref)
			
			raise RuntimeError, "[List.push_empty]: Lista no vacía" unless empty?()
			
			nodo = Node.new(ref)
			@head = nodo
			@tail = nodo
			@size += 1
			
			return self
			
		end
		
		# Insertar por el final
		def push(ref)
			if empty?()
				return push_empty(ref)
			else
				nodo = Node.new(ref, nil, @tail)
				@tail.next_node = nodo
				@tail = nodo
				@size += 1
				return self
			end
		end
		
		# Insertar múltiples elementos por el final
		def push_multi(*refs)
			refs.each { |ref| push(ref)}
		end
		
		# Extraer por el principio
		def pop()
			
			raise RuntimeError, "[List.pop]: No se puede extraer elementos de una lista vacía" if empty?()
			
			nodo = @head
			if @head.equal?(@tail)
				@head = nil
				@tail = nil
			else
				@head = @head.next_node
				@head.prev_node = nil
			end
			
			@size -= 1
			
			return nodo.value
			
		end
		
		# Itera la lista, ejecutando el bloque pasado pasándole como parámetro el valor de cada nodo
		def each
			
			nodo = @head
			until nodo.nil?
				yield nodo.value
				nodo = nodo.next_node
			end
			
		end
		
		private :push_empty
		
	end
    
end
