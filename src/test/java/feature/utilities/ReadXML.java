package feature.utilities;


import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import java.io.IOException;
import java.io.StringReader;

public class ReadXML {


    public Node getXMLPathValue(String response, String xpath) throws ParserConfigurationException, IOException, SAXException, XPathExpressionException {
        Node node = null;
        try {
            DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            InputSource src = new InputSource();
            DocumentBuilder dBuilder = null;

            src.setCharacterStream(new StringReader(response));
            Document doc = builder.parse(src);
            XPath xPath = XPathFactory.newInstance().newXPath();
            node = (Node) xPath.compile(xpath).evaluate(doc, XPathConstants.NODE);

        } catch (Exception e) {
            System.out.println("XML error is" + e.getMessage());
        }
        return node;
    }


}

