import java.io.File;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.w3c.dom.Attr;
import org.w3c.dom.DOMImplementation;
import org.w3c.dom.Document;
import org.w3c.dom.DocumentType;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.ls.DOMImplementationLS;

public class XmlDomCreate {
	public static String number_property_strings[] = {"id", "seq_no", "id_contact", "franchise_ox"};
	public static ArrayList<String> number_property_list= new ArrayList<String>();

	
	public static void main(String argv[]) {
 
		for(int i = 0 ; i < number_property_strings.length ; i++)
			number_property_list.add(number_property_strings[i]);
		
		String name = "Code";
		String className = "com.respace.domain.RS_Code";
		String columns = "`code`, `name`, `category`, `seq_no`";
		String orderStr = "seq_no";
		
		name = "Project";
		className = "com.respace.domain.RS_Project";
		columns = "`id_contact`, `title`, `host_name`, `description`, `code_category`";
		orderStr = "";
		
		name = "Article";
		className = "com.respace.domain.RS_Article";
		columns = "`title`, `author`, `email`, `website`, `content`, `category`, `isvalid`, `modifieddate`, `registereddate`";
		
		name = "Asset";
		className = "com.respace.domain.RS_Asset";
		columns = "`reference_id`, `reference_category`, `name`, `url`, `type`, `seq_no`, `registered_date`, `filename`, `filetype`, `filesize`, `modified_date`, `filepath`, `code_status`, `etc`";
		orderStr = "seq_no";
		
		name = "Space";
		className = "com.respace.domain.RS_Space";
		columns = "`id_contact`, `name`, `url`, `address_plain`, `address_si`, `address_do`, `address_dong`, `address_last`, `code_mood`, `email`, `phone`, `phone2`, `franchise_ox`, `frenchise_headquater_phone`, `frenchise_headquater_location`, `business_registered_number`, `cond_input_period_start`, `cond_input_period_end`, `cond_input_type`, `code_target`, `code_level`, `code_size`, `open_time`, `close_time`, `etc`, `open_date`, `registered_date`, `review`";
		orderStr = "";
		
		String sqlMapXml = genSqlXML(name, className, columns.replace("`", ""), orderStr, "a");
		System.out.println(sqlMapXml);
	}

	public static String genSqlXML(String name, String className, String cvs, String orderStr, String bias) {
		try {

			DocumentBuilderFactory docFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

			// root elements
			Document doc = docBuilder.newDocument();
			
			DOMImplementation domImpl = doc.getImplementation();
			DocumentType doctype = domImpl.createDocumentType("sqlMap",
			    "-//ibatis.apache.org//DTD SQL Map 2.0//EN",
			    "http://ibatis.apache.org/dtd/sql-map-2.dtd");
					
			doc.appendChild(doctype);	
			
					
			Element sqlMap = doc.createElement("sqlMap");
			doc.appendChild(sqlMap);
			sqlMap.setAttribute("namespace", name+"Sql");
			
				Element resultMap = doc.createElement("resultMap");
				sqlMap.appendChild(resultMap);
				
				resultMap.setAttribute("id", name);
				resultMap.setAttribute("class", className);
				
				{
					Element result = doc.createElement("result");
					resultMap.appendChild(result);
					Attr p_id = doc.createAttribute("property");
					p_id.setValue("id");
					result.setAttributeNode(p_id);
					Attr property = doc.createAttribute("column");
					property.setValue("ID");
					result.setAttributeNode(property);
				}
				String[] cvs_parts = cvs.split(",");
				for (String p : cvs_parts){
					Element result = doc.createElement("result");
					resultMap.appendChild(result);
					Attr p_id = doc.createAttribute("property");
					p_id.setValue(p.toLowerCase().trim());
					result.setAttributeNode(p_id);
					Attr property = doc.createAttribute("column");
					property.setValue(p.toUpperCase().trim());
					result.setAttributeNode(property);
				}
				
			Element select_read_list = doc.createElement("select");
			sqlMap.appendChild(select_read_list);
			select_read_list.setAttribute("parameterClass", className);
			select_read_list.setAttribute("resultMap", name);
			select_read_list.setAttribute("id", "read"+name+"List");
			
			String select_columns = "";
			for (int i = 0 ; i < cvs_parts.length ; i++){
				if (i == 0)
					select_columns = bias+"."+cvs_parts[i].trim();
				else 
					select_columns += ", "+bias+"."+cvs_parts[i].trim();
			}
			
			select_read_list.setTextContent("SELECT "+bias+".id,"+select_columns+" FROM "+"rs_"+name.toLowerCase()+" "+bias+" WHERE 1=1");
			for (String p : cvs_parts){
				p = p.trim();
				Element isnotnull2 = null;
				if(number_property_list.contains(p)){
					isnotnull2 = doc.createElement("isNotEqual");
					isnotnull2.setAttribute("property", p);
					isnotnull2.setAttribute("compareValue", "0");
				}else{
					isnotnull2 = doc.createElement("isNotEmpty");
					isnotnull2.setAttribute("property", p);
				}
				isnotnull2.setTextContent(" and "+bias+"."+p.toUpperCase()+" = #"+p.toLowerCase()+"#");
				select_read_list.appendChild(isnotnull2);
			}
			if(orderStr.length()>0){
				Element isnotnull2 = null;
				isnotnull2 = doc.createElement("isNotEmpty");
				isnotnull2.setAttribute("property", orderStr);
				isnotnull2.setTextContent(" order by "+orderStr);
				select_read_list.appendChild(isnotnull2);
			}
			
			
			Element select_read = doc.createElement("select");
			sqlMap.appendChild(select_read);
			select_read.setAttribute("parameterClass", className);
			select_read.setAttribute("resultMap", name);
			select_read.setAttribute("id", "read"+name);
			select_read.setTextContent("SELECT "+bias+".id,"+select_columns+" FROM "+"rs_"+name.toLowerCase()+" "+bias+" WHERE ID = #id#");
			for (String p : cvs_parts){
				p = p.trim();
				Element isnotnull2 = null;
				if(number_property_list.contains(p)){
					isnotnull2 = doc.createElement("isNotEqual");
					isnotnull2.setAttribute("property", p);
					isnotnull2.setAttribute("compareValue", "0");
				}else{
					isnotnull2 = doc.createElement("isNotEmpty");
					isnotnull2.setAttribute("property", p);
				}				
				isnotnull2.setTextContent(" and "+bias+"."+p.toUpperCase()+" = #"+p.toLowerCase()+"#");
				select_read.appendChild(isnotnull2);
			}

			Element insert = doc.createElement("insert");
			sqlMap.appendChild(insert);
			insert.setAttribute("parameterClass", className);
			insert.setAttribute("id", "create"+name);
			String sharp_p = "";
			for (int i = 0 ; i < cvs_parts.length ; i++){//String p : cvs_parts){
				String p = cvs_parts[i].trim();
				if( i == 0)
					sharp_p += "#"+p.toLowerCase()+"#";
				else
					sharp_p += ", #"+p.toLowerCase()+"#";
			}
			insert.setTextContent("INSERT INTO rs_"+name.toLowerCase()+"("+cvs+") VALUES ("+sharp_p+")");
			
			Element select_key = null;
			
			select_key = doc.createElement("selectKey");
			select_key.setAttribute("type", "post");
			select_key.setAttribute("resultClass", "int");
			select_key.setAttribute("keyProperty", "id");
			
							
			select_key.setTextContent("SELECT max(id) FROM rs_"+name.toLowerCase());
			insert.appendChild(select_key);
			
			Element update = doc.createElement("update");
			sqlMap.appendChild(update);
			update.setAttribute("parameterClass", className);
			update.setAttribute("id", "update"+name);
			update.setTextContent("update" +" rs_"+name.toLowerCase()+" ID = #id#");
			
			for (String p : cvs_parts){
				p = p.trim();
				Element isnotnull2 = null;
				if(number_property_list.contains(p)){
					isnotnull2 = doc.createElement("isNotEqual");
					isnotnull2.setAttribute("property", p);
					isnotnull2.setAttribute("compareValue", "0");
				}else{
					isnotnull2 = doc.createElement("isNotEmpty");
					isnotnull2.setAttribute("property", p);
				}				
				isnotnull2.setTextContent(","+p.toUpperCase()+" = #"+p.toLowerCase()+"#");
				update.appendChild(isnotnull2);
			}
			
			
			Element delete = doc.createElement("delete");
			sqlMap.appendChild(delete);
			delete.setAttribute("parameterClass", className);
			delete.setAttribute("id", "delete"+name);
			delete.setTextContent("delete FROM "+"rs_"+name.toLowerCase()+" WHERE 1=1");
			
			
			Element isnotnull = doc.createElement("isNotEqual");
			delete.appendChild(isnotnull);
			isnotnull.setAttribute("property", "id");
			isnotnull.setAttribute("compareValue", "0");
			isnotnull.setTextContent(" and "+"id".toUpperCase()+" = #"+"id"+"#");
			for (String p : cvs_parts){
				p = p.trim();
				Element isnotnull2 = null;
				if(number_property_list.contains(p)){
					isnotnull2 = doc.createElement("isNotEqual");
					isnotnull2.setAttribute("property", p);
					isnotnull2.setAttribute("compareValue", "0");
				}else{
					isnotnull2 = doc.createElement("isNotEmpty");
					isnotnull2.setAttribute("property", p);
				}
				isnotnull2.setTextContent(" and "+p.toUpperCase()+" = #"+p.toLowerCase()+"#");
				delete.appendChild(isnotnull2);
			}
			
			//System.out.println(((DOMImplementationLS) domImpl).createLSSerializer()
			//	    .writeToString(doc));

			// write the content into xml file
			TransformerFactory transformerFactory = TransformerFactory
					.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			DOMSource source = new DOMSource(doc);
			
			// StreamResult result = new StreamResult(new
			// File("D:\\workspace2\\RedJava\\WebContent\\doc\\com\\redjava\\java\\xml\\dom\\XmlDomCreate.xml"));

			// Output to console for testing
			// StreamResult result = new StreamResult(System.out);

			StringWriter sw = new StringWriter();
			transformer.transform(source, new StreamResult(sw));

			String xmlResult = sw.toString();
			String prettyXmlResult = prettyFormat(xmlResult, 2);

			
			String result = printXML(doc);
			//return prettyXmlResult;
			return ((DOMImplementationLS) domImpl).createLSSerializer()
				    .writeToString(doc);
			// System.out.println(prettyXmlResult);
			//return prettyXmlResult;
			// System.out.println("File saved!");

		} catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		} catch (TransformerException tfe) {
			tfe.printStackTrace();
		}
		return "fail";
	}

	public static String prettyFormat(String input, int indent) {
		try {
			Source xmlInput = new StreamSource(new StringReader(input));
			StringWriter stringWriter = new StringWriter();
			StreamResult xmlOutput = new StreamResult(stringWriter);
			TransformerFactory transformerFactory = TransformerFactory
					.newInstance();
			transformerFactory.setAttribute("indent-number", indent);
			Transformer transformer = transformerFactory.newTransformer();
			
			transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
		    transformer.setOutputProperty(OutputKeys.METHOD, "xml");
		    transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		    transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
		    transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
			
			transformer.transform(xmlInput, xmlOutput);
			return xmlOutput.getWriter().toString();
		} catch (Exception e) {
			throw new RuntimeException(e); // simple exception handling, please
											// review it
		}
	}
	
	private static boolean skipNL;
	private static String printXML(Node rootNode) {
	    String tab = "";
	    skipNL = false;
	    return "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+(printXML(rootNode, tab));
	}
	private static String printXML(Node rootNode, String tab) {
	    String print = "";
	    if(rootNode.getNodeType()==Node.ELEMENT_NODE) {
	        print += "\n"+tab+"<"+rootNode.getNodeName();
	        for (int i = 0 ; i < rootNode.getAttributes().getLength() ; i++){
	        	Node node = rootNode.getAttributes().item(i);
	        	print += " "+node.getNodeName()+"=\""+node.getNodeValue()+"\"";
	        }
	        if (rootNode.getTextContent().length() > 0)
	        	print += ">";
	        else
	        	print += "/>";
	    }
	    NodeList nl = rootNode.getChildNodes();
	    if(nl.getLength()>0) {
	        for (int i = 0; i < nl.getLength(); i++) {
	        	if (i==0)
	        		print += ""+printXML(nl.item(i), tab+"  ");    // \t
	        	else
	        		print += ""+printXML(nl.item(i), tab+"  ");    // \t
	        }
	    } else {
	        if(rootNode.getNodeValue()!=null) {
	            print = "\n"+tab+rootNode.getNodeValue();
	        }
	        skipNL = true;
	    }
	    if(rootNode.getNodeType()==Node.ELEMENT_NODE) {
	        if(!skipNL) {
	            print += "\n"+tab;
	            print += "</"+rootNode.getNodeName()+">";
	        }
	        
	        	
	        skipNL = false;
	        
	    }
	    return(print);
	}
}