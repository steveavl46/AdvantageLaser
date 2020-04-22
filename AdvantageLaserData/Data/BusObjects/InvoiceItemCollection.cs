using System;
using System.Collections;
using System.Linq;
using System.Text;


namespace AdvLaser.AdvLaserObjects
{
    public class InvoiceItemCollection : CollectionBase
    {
        public InvoiceItem this[int index]
        {
            get { return ((InvoiceItem)List[index]); }
            set { List[index] = value; }
        }

        public int Add(InvoiceItem aInvoiceItem)
        {
            return (List.Add(aInvoiceItem));
        }

        public void Remove(InvoiceItem aInvoiceItem)
        {
            List.Remove(aInvoiceItem);
        }
    }
}
