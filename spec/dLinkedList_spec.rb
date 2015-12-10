# encoding: utf-8

require "spec_helper"
require "dLinkedList"

describe DLinkedList do
    
    before :each do
        
        @r1 = DLinkedList::Referencia.new(['Dave Thomas', 'Andy Hunt', 'Chad Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide', '7 de Julio, 2013')
        @l1 = DLinkedList::Libro.new(['David Flanagan', 'Yukihiro Matsumoto'], 'The Ruby Programming Language', '4 Febrero, 2008', 1, 'Dallas, Texas', 'O’Reilly Media')
		@a1 = DLinkedList::Articulo.new(['M. Vargas'], 'El elefante y la cultura', 'Septiembre, 1982', 'Revista Vuelta', '13-16')
		@d1 = DLinkedList::EDocumento.new(['M. Magallón'], 'Filosofía política de la educación', '1993', '5 de Febrero, 2009', 'http://bidi.unam.mx/libroe_2007/0638679/Index.html')
		
		@nodo = DLinkedList::Node.new("Un valor")
		@list = DLinkedList::List.new()
        
    end
    
    describe "Referencia" do
		
		it "# El objeto Referencia básica debe ser de tipo Referencia" do
			expect(@r1).to be_instance_of(DLinkedList::Referencia)
		end
		it "# El objeto Referencia básica debe tener un atributo multivalor para el/los autor/es" do
			expect(@r1).to have_attributes(:autores => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'])
		end
		it "# El objeto Referencia básica debe tener un atributo para el título de la referencia" do
			expect(@r1).to have_attributes(:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide')
		end
		it "# El objeto Referencia básica debe tener un atributo para la fecha de publicación" do
			expect(@r1).to have_attributes(:fecha_publicacion => '7 de Julio, 2013')
		end
		it "# El objeto Referencia básica debe tener un método para obtener la referencia formateada" do
			expect(@r1).to respond_to(:to_s)
		end
		
		describe "# El objeto referencia básica es comparable" do
			
			before :each do
				@r2 = DLinkedList::Referencia.new(['M. Magallón'], 'Filosofía política de la educación', '1993')
				@r3 = DLinkedList::Referencia.new(['M. Magallón'], 'La democracia en América Latina', '1991')
			end
			
			it "# Tipado" do
  				expect(@r1).to be_kind_of(Comparable)
  			end
			
			it "# Operador <" do
				expect(@r1).to be < @r2
				expect(@r2).to be < @r3
			end
			it "# Operador <=" do
				expect(@r1).to be <= @r2
				expect(@r2).to be <= @r3
			end
			it "# Igualdad" do
				expect(@r1).to eql(@r1)
			end
			it "# Operador >" do
				expect(@r2).to be > @r1
				expect(@r3).to be > @r2
			end
			it "# Operador >=" do
				expect(@r2).to be >= @r1
				expect(@r3).to be >= @r2
			end
		end
		
	end
	
	describe "Libro" do
		it "# El objeto Libro debe ser de tipo Libro" do
			expect(@l1).to be_instance_of(DLinkedList::Libro)
		end
		it "# El objeto Libro debe ser también un tipo de Referencia básica" do
			expect(@l1).to be_kind_of(DLinkedList::Referencia)
		end
		it "# El objeto Libro debe tener un atributo multivalor para el/los autor/es" do
			expect(@l1).to have_attributes(:autores => ['David Flanagan', 'Yukihiro Matsumoto'])
		end
		it "# El objeto Libro debe tener un atributo para el título de la referencia" do
			expect(@l1).to have_attributes(:titulo => 'The Ruby Programming Language')
		end
		it "# El objeto Libro debe tener un atributo para la fecha de publicación" do
			expect(@l1).to have_attributes(:fecha_publicacion => '4 Febrero, 2008')
		end
		it "# El objeto Libro debe tener un atributo para la edición" do
			expect(@l1).to have_attributes(:edicion => 1)
		end
		it "# El objeto Libro debe tener un atributo para el lugar de publicación" do
			expect(@l1).to have_attributes(:lugar_publicacion => 'Dallas, Texas')
		end
		it "# El objeto Libro debe tener un atributo para la editorial" do
			expect(@l1).to have_attributes(:editorial => 'O’Reilly Media')
		end
		it "# El objeto Libro debe tener un método para obtener la referencia formateada" do
			expect(@l1).to respond_to(:to_s)
		end		
	end
	
	describe "Articulo" do
		it "# El objeto Articulo debe ser de tipo Articulo" do
			expect(@a1).to be_instance_of(DLinkedList::Articulo)
		end
		it "# El objeto Articulo debe ser también un tipo de Referencia básica" do
			expect(@a1).to be_kind_of(DLinkedList::Referencia)
		end
		it "# El objeto Articulo debe tener un atributo multivalor para el/los autor/es" do
			expect(@a1).to have_attributes(:autores => ['M. Vargas'])
		end
		it "# El objeto Articulo debe tener un atributo para el título de la referencia" do
			expect(@a1).to have_attributes(:titulo => 'El elefante y la cultura')
		end
		it "# El objeto Articulo debe tener un atributo para la fecha de publicación" do
			expect(@a1).to have_attributes(:fecha_publicacion => 'Septiembre, 1982')
		end		
		it "# El objeto Articulo debe tener un atributo para el título de la publicación" do
			expect(@a1).to have_attributes(:titulo_publicacion => 'Revista Vuelta')
		end
		it "# El objeto Articulo debe tener un atributo para las páginas" do
			expect(@a1).to have_attributes(:paginas => '13-16')
		end
		it "# El objeto Articulo debe tener un método para obtener la referencia formateada" do
			expect(@a1).to respond_to(:to_s)
		end		
	end
	
	describe "EDocumento" do
		it "# El objeto EDocumento debe ser de tipo EDocumento" do
			expect(@d1).to be_instance_of(DLinkedList::EDocumento)
		end
		it "# El objeto EDocumento debe ser también un tipo de Referencia básica" do
			expect(@d1).to be_kind_of(DLinkedList::Referencia)
		end
		it "# El objeto EDocumento debe tener un atributo multivalor para el/los autor/es" do
			expect(@d1).to have_attributes(:autores => ['M. Magallón'])
		end
		it "# El objeto EDocumento debe tener un atributo para el título de la referencia" do
			expect(@d1).to have_attributes(:titulo => 'Filosofía política de la educación')
		end
		it "# El objeto EDocumento debe tener un atributo para la fecha de publicación" do
			expect(@d1).to have_attributes(:fecha_publicacion => '1993')
		end		
		it "# El objeto EDocumento debe tener un atributo para la fecha de recuperación" do
			expect(@d1).to have_attributes(:fecha_recuperacion => '5 de Febrero, 2009')
		end
		it "# El objeto EDocumento debe tener un atributo para la URL (Uniform Resource Locator)" do
			expect(@d1).to have_attributes(:dURL => 'http://bidi.unam.mx/libroe_2007/0638679/Index.html')
		end
		it "# El objeto EDocumento debe tener un método para obtener la referencia formateada" do
			expect(@d1).to respond_to(:to_s)
		end		
	end
	
	describe "Node" do
    	it "# Debe existir un Nodo de la lista con sus datos, su siguiente y su anterior" do
      		expect(@nodo).to be_instance_of(DLinkedList::Node)
      		expect(@nodo.value).to eql("Un valor")
      		expect(@nodo.next_node).to be_nil
      		expect(@nodo.prev_node).to be_nil
		end
  	end
  	
  	describe "List" do
  		
  		it "# Debe existir una clase Lista con su cabeza y su cola" do
  			expect(@list).to be_instance_of(DLinkedList::List)
  			expect(@list).to respond_to(:head)
  			expect(@list).to respond_to(:tail)
  		end
  		
  		it " # Se puede insertar un elemento" do
  			@list.push(@r1)
  			expect(@list.head.value).to equal(@r1)
  		end
  		
  		it "# Se pueden insertar varios elementos" do
  			@list.push_multi(@r1, @l1)
  			expect(@list.head.value).to equal(@r1)
  			expect(@list.head.next_node.value).to equal(@l1)
  			expect(@list.tail.prev_node.value).to equal(@r1)
  		end
  		
  		it "# Se puede extraer el primer elemento" do
  			@list.push(@r1)
  			ref = @list.pop()
  			expect(ref).to equal(@r1)
  			expect(@list).to be_empty
  		end
  		
  		it "# Prueba bibliografía" do
  			@list.push_multi(@r1, @l1, @a1, @d1)
  			expect(@list.size).to eql(4)
  		end
  		
  		describe "# La lista es enumerable" do
  		
  			before :each do
  				
  				@le = DLinkedList::List.new()
  				@le.push_multi(@r1, @l1, @a1, @d1)
  				  			
  			end
  			
  			it "# Tipado" do
  				expect(@list).to be_kind_of(Enumerable)
  			end
  			
  			it "# Método all?" do
				expect(@le.all? { |ref| ref.kind_of?(DLinkedList::Referencia)}).to eql(true)
  			end
  			
  			it "# Método any?" do
  				expect(@le.any? { |ref| ref.titulo == 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide'}).to eql(true)
  			end
  			
  			it "# Método count" do
  				expect(@le.count).to eql(4)
  			end
  			
  			it "# Método find_all" do
  				edoc_arr = @le.find_all{ |ref| ref.instance_of?(DLinkedList::EDocumento)}
  				expect(edoc_arr.length).to eql(1)
  			end
  			
  			it "# Método min" do
  				expect(@le.min).to equal(@r1)
  			end
  			
  			it "# Método max" do
  				expect(@le.max).to equal(@a1)
  			end
  			
  			it "# Método sort" do
  				expect(@le.sort).to eql([@r1, @l1, @d1, @a1])
  			end

  		end
  		
  	end
    
end
