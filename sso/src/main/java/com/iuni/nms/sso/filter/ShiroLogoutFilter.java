package com.iuni.nms.sso.filter;

import com.iuni.nms.sso.dto.ShiroUser;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @ClassName ShiroLogoutFilter
 * 
 * @version dp-admin-1.0.0
 */
public class ShiroLogoutFilter extends LogoutFilter {
	private static final Logger log = LoggerFactory.getLogger(ShiroLogoutFilter.class);

	@Override
	protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
		Subject subject = getSubject(request, response);
		String redirectUrl = getRedirectUrl(request, response, subject);
		HttpSession session = ((HttpServletRequest)request).getSession();
		// try/catch added for SHIRO-298:
		try {
			ShiroUser user = (ShiroUser) subject.getPrincipal();
			if (StringUtils.isNotBlank(user.getSsoTgt())) {
				user.setSsoTgt(null);
			}
			subject.logout();
			if (session != null) {
				session.invalidate();
			}

		} catch (SessionException ise) {
			log.debug("Encountered session exception during logout.  This can generally safely be ignored.", ise);
		}
		issueRedirect(request, response, redirectUrl);
		return false;
	}
}
