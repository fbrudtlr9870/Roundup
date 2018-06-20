package com.proj.rup.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 
 * 1. preHandle : DispatcherServlet => controller
 * 2. postHandle : controller => DispatcherServlet
 * 3. afterCompletion : view단처리가 끝난 후. 응답객체가 완성된후
 * 
 *
 */
public class LoggerInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = 
			LoggerFactory.getLogger(getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(logger.isDebugEnabled()) {
			logger.debug("======= start =======");
			logger.debug(request.getRequestURI());
			logger.debug("----------------------");
		}
		
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(logger.isDebugEnabled()) {
			logger.debug("--------- view --------");
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		if(logger.isDebugEnabled()) {
			logger.debug("======= end =======");
		}
		super.afterCompletion(request, response, handler, ex);
	}
	
}
