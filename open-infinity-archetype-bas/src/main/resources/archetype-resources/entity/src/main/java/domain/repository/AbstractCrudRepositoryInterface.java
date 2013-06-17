#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.domain.repository;

import java.math.BigInteger;
import java.util.Collection;

public  interface AbstractCrudRepositoryInterface<T extends Object> /**extends Repository<T, BigInteger>*/ {

	public T create(T product);
	
	public void update(T product);
	
	public Collection<T> loadAll();
	
	public T loadById(BigInteger id);
	
	public void delete (T product);
	
}
