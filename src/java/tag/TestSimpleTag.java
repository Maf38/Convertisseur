/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tag;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author gai
 */
public class TestSimpleTag extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        try {
            JspWriter out = getJspContext().getOut();
            out.println("<H1>Bienvenue dans un simple TAG !</H1>");
        } catch (IOException e) {
            throw new JspException(e.toString());
        }
    }
}
