package com.stone.site.service;

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
import com.stone.product.mapper.TProductSkuMapper;
import com.stone.product.mapper.TProductStandardMapper;
import com.stone.product.mapper.TSkuValueMapper;
import com.stone.product.model.Product;
import com.stone.product.model.ProductExtend;
import com.stone.product.model.TProductSku;
import com.stone.product.model.TProductStandard;
import com.stone.product.model.TSkuValue;
import com.stone.site.mapper.TNavigationFieldMapper;
import com.stone.site.mapper.TNavigationRecordMapper;
import com.stone.site.model.TNavigationField;
import com.stone.site.model.TNavigationRecord;

@Service("navigationServiceImpl")
public class NavigationServiceImpl extends MybatisBaseServiceImpl implements
		INavigationService {

	protected static final Logger log = Logger
			.getLogger(NavigationServiceImpl.class);

	// 两种例外
		// 1.unchecked 默认回滚事务(RuntimeException)
		// 2.checked 默认不回滚事务(Exception)
		// 开启事务.并设置unchecked例外不回滚
		// @Transactional(propagation = Propagation.REQUIRED, noRollbackFor =
		// RuntimeException.class)
		@Transactional(propagation = Propagation.REQUIRED)
		@Override
		public void add(TNavigationRecord record) throws Exception {
			
			TNavigationRecordMapper nrm = this.getMapper(TNavigationRecordMapper.class);
			nrm.insert(record);

			List<TNavigationField> fields = new ArrayList<TNavigationField>();
			List<TNavigationField> fieldList = record.getFieldList();
			for(TNavigationField field : fieldList){
				if(field.getHot()!=null){
					field.setRecordId(record.getRecordId());
					fields.add(field);
				}
			}
			TNavigationFieldMapper nfm = this.getMapper(TNavigationFieldMapper.class);
			if (fields.size() > 0) {
				nfm.insertList(fields);
			} 

		}
		
		
		
		// 两种例外
				// 1.unchecked 默认回滚事务(RuntimeException)
				// 2.checked 默认不回滚事务(Exception)
				// 开启事务.并设置unchecked例外不回滚
				// @Transactional(propagation = Propagation.REQUIRED, noRollbackFor =
				// RuntimeException.class)
				@Transactional(propagation = Propagation.REQUIRED)
				@Override
				public void update(TNavigationRecord record) throws Exception {
					
					TNavigationRecordMapper nrm = this.getMapper(TNavigationRecordMapper.class);
					nrm.updateByPrimaryKey(record);
					
					TNavigationFieldMapper nfm = this.getMapper(TNavigationFieldMapper.class);
					nfm.deleteByRecordId(record.getRecordId());
					
					List<TNavigationField> fields = new ArrayList<TNavigationField>();
					List<TNavigationField> fieldList = record.getFieldList();
					for(TNavigationField field : fieldList){
						if(field.getHot()!=null){
							field.setRecordId(record.getRecordId());
							fields.add(field);
						}
					}
					if (fields.size() > 0) {
						nfm.insertList(fields);
					} 

				}

	

}
