#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
/*
 * Copyright (c) 2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package ${package}.domain.${artifactId};

import java.math.BigInteger;
import java.util.Collection;

import ${package}.core.annotation.AuditTrail;
import ${package}.core.annotation.Log;
import ${package}.core.exception.ExceptionLevel;
import ${package}.core.util.ExceptionUtil;
import ${package}.domain.entity.Product;
import ${package}.domain.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Product ${artifactId} implementation with specification.
 * 
 * @author Ilkka Leinonen
 */
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductSpecification productSpecification;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Log
	@AuditTrail
	public Product create(Product product) {
		Collection<Product> products = productRepository.loadByName(product.getName());
		if (productSpecification.isNotEligibleForCreation(product, products)) {
			ExceptionUtil.throwApplicationException(
				"Product already exists: " + product.getName(), 
				ExceptionLevel.INFORMATIVE, 
				ProductService.UNIQUE_EXCEPTION_ENTITY_ALREADY_EXISTS);
		}
		productRepository.create(product);
		return product;
	}
	
	@Log
	@AuditTrail
	public void update(Product product) {
		if (productRepository.loadById(product.getId()) != null) {
			ExceptionUtil.throwApplicationException(
				"Product does not exist: " + product.getName(), 
				ExceptionLevel.ERROR, 
				ProductService.UNIQUE_EXCEPTION_ENTITY_DOES_NOT_EXIST);
		}
	}
	
	@Log
	@AuditTrail
	public Collection<Product> loadAll() {
		return productRepository.loadAll();
	}
	
	@Log
	@AuditTrail
	public Product loadById(BigInteger id) {
		Product product = productRepository.loadById(id);
		if (product == null) {
			ExceptionUtil.throwApplicationException(
				"Product does not exist: " + id, 
				ExceptionLevel.WARNING, 
				ProductService.UNIQUE_EXCEPTION_ENTITY_DOES_NOT_EXIST);
		}
		return product; 
	}
	
	@Log
	@AuditTrail
	public void delete (Product product) {
		if (productRepository.loadById(product.getId()) != null) {
			ExceptionUtil.throwApplicationException(
				"Product does not exist: " + product.getId(), 
				ExceptionLevel.INFORMATIVE, 
				ProductService.UNIQUE_EXCEPTION_ENTITY_DOES_NOT_EXIST);
		}
		productRepository.delete(product);
	}
	
}
