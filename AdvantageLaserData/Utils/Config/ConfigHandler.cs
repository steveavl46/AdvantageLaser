using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Xml;
using System.Collections.Specialized;
using System.Collections;

namespace AdvantageLaserData.Utils.Config
{


    public class ConfigHandler : IConfigurationSectionHandler
    {
        #region IConfigurationSectionHandler Members

        object IConfigurationSectionHandler.Create(
          object parent, object configContext, XmlNode section)
        {
            // Creates the configuration object that this method will return.
            // This can be a custom configuration class.
            // In this example, we use a System.Collections.Hashtable.
            Hashtable myConfigObject = new Hashtable();

            // Gets any attributes for this section element.
            Hashtable myAttribs = new Hashtable();
            foreach (XmlAttribute attrib in section.Attributes)
            {
                if (XmlNodeType.Attribute == attrib.NodeType)
                    myAttribs.Add(attrib.Name, attrib.Value);
            }

            // Puts the section name and attributes as the first config object item.
            myConfigObject.Add(section.Name, myAttribs);

            // Gets the child element names and attributes.
            foreach (XmlNode child in section.ChildNodes)
            {
                if (XmlNodeType.Element == child.NodeType)
                {
                    Hashtable myChildAttribs = new Hashtable();

                    foreach (XmlAttribute childAttrib in child.Attributes)
                    {
                        if (XmlNodeType.Attribute == childAttrib.NodeType)
                            myChildAttribs.Add(childAttrib.Name, childAttrib.Value);
                    }
                    
                    //
                    foreach (XmlNode sub in child.ChildNodes)
                    {
                        if (XmlNodeType.Element == child.NodeType)
                        {
                            Hashtable subAttribs = new Hashtable();

                            foreach (XmlAttribute childAttrib in sub.Attributes)
                            {
                                if (XmlNodeType.Attribute == childAttrib.NodeType)
                                    subAttribs.Add(childAttrib.Name, childAttrib.Value);
                            }
                            myChildAttribs.Add(sub.Name, subAttribs);
                        }
                    }
                    myConfigObject.Add(child.Name, myChildAttribs);

                    //
                }

                
                 
            }

            return (myConfigObject);
        }
        #endregion
    }
}
