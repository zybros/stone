package com.stone.product.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.stone.base.service.MybatisBaseServiceImpl;
import com.stone.product.mapper.ProductExtendMapper;
import com.stone.product.mapper.ProductMapper;
import com.stone.product.mapper.TProductStandardMapper;
import com.stone.product.model.Product;
import com.stone.product.model.ProductExtend;
import com.stone.product.model.TProductStandard;

@Service("productService")
public class ProductServiceImpl extends MybatisBaseServiceImpl implements
		IProductService {

	protected static final Logger log = Logger
			.getLogger(ProductServiceImpl.class);

	
	@Override
	public Product getById(int id) throws Exception {

		ProductMapper pm = this.getMapper(ProductMapper.class);
		Product t = pm.selectByPrimaryKey(id);

		ProductExtendMapper pxm = this.getMapper(ProductExtendMapper.class);
		List<Map> extList = pxm.selectByProductId(id);
		// JSONArray arr = JSONArray.fromObject(list);

		TProductStandardMapper psm = this
				.getMapper(TProductStandardMapper.class);
		List<Map> stdList = psm.selectByProductId(id);

		return null;
	}

}
