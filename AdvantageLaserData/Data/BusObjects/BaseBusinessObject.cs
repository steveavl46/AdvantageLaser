/*
 * Created by SharpDevelop.
 * User: ATL97337
 * Date: 9/19/2008
 * Time: 8:54 AM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */

using System;
using System.Collections;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{
	/// <summary>
	/// Description of BaseBusinessObject.
	/// </summary>
	public class BaseBusinessObject
	{
		private ArrayList errorList = new ArrayList();
		public BaseBusinessObject()
		{
		}
		
		public void ClearErrors() 
        { 
                errorList = new ArrayList();
        }
		 public void AddError(string errorMessage) 
        { 
                errorList.Add(errorMessage); 
        } 
		 
		 public bool IsValid()
		 {
		 	return (errorList.Count == 0);
		 }
		 
		 public ArrayList ErrorList()
		 {
		 	return errorList;
		 }
	}
}
