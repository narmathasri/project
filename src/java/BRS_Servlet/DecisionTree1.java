/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BRS_Servlet;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class DecisionTree1 
{
    DecisionTree1()
    {
        
    }
    public void findTree()
    {
        try
        {
            DBConnection db=new DBConnection();
            Statement st=db.stt;
            
            st.executeUpdate("delete from sample1");
            
            ArrayList at2=new ArrayList();
            
            ResultSet rst=st.executeQuery("select * from purchase");
            
            while(rst.next())
            {
                String uname=rst.getString(1);
                String pdate=rst.getString(2);
                String bid=rst.getString(3);
                String rate=rst.getString(4).trim();
                String qty=rst.getString(5);
                String amt=rst.getString(6);                        
                    
                String urate="";
                
                if(rate.equals("1"))
                    urate="Poor";
                else if(rate.equals("2"))
                    urate="Fair";
                else if(rate.equals("3"))
                    urate="Good";
                else if(rate.equals("4"))
                    urate="VeryGood";
                else
                    urate="Excellent";
                
                at2.add(uname+"#"+pdate+"#"+bid+"#"+qty+"#"+amt+"#"+urate);
            }
            
            for(int i=0;i<at2.size();i++)
            {
                String g1[]=at2.get(i).toString().split("#");
                st.executeUpdate("insert into sample1 values('"+g1[0]+"','"+g1[1]+"','"+g1[2]+"','"+g1[3]+"','"+g1[4]+"','"+g1[5]+"')");
            }
            ArrayList colName=new ArrayList();
            colName.add("UserName"+"#"+"Class");
            colName.add("Date"+"#"+"Class");
            colName.add("BID"+"#"+"Class");
            colName.add("Quantity"+"#"+"Continues");
            colName.add("Amount"+"#"+"Continues");
            colName.add("UserRating"+"#"+"Class");
            
            ArrayList cls=new ArrayList();
            cls.add("UserName"+"#"+"Class");
            cls.add("Date"+"#"+"Class");
            cls.add("BID"+"#"+"Class");
            cls.add("UserRating"+"#"+"Class");
            
            int N=at2.size();
            
            String cg=cls.get(cls.size()-1).toString();
                
                double TI=FindInfo(cg,N);
                
                String sf[]=cg.split("#");
                ArrayList alist=new ArrayList();
                ResultSet rs=st.executeQuery("select distinct "+sf[0]+" from sample1");
                while(rs.next())
                {
                    String a1=rs.getString(1);
                    alist.add(a1);
                        
                }
                
                ArrayList gain=new ArrayList();
                String att="";
                for(int i=0;i<cls.size()-1;i++)
                {
                    String s1[]=cls.get(i).toString().split("#");
                    String s2=s1[0];
                  //  System.out.println("cls "+s2);
                    ArrayList at1=new ArrayList();
                    ResultSet rs1=st.executeQuery("select distinct "+s2+" from sample1");
                    while(rs1.next())
                    {
                        String a1=rs1.getString(1);
                        at1.add(a1);
                        
                    }
                    double csd=0;
                    for(int j=0;j<at1.size();j++)
                    {
                        String a2=at1.get(j).toString();
                       
                        String qq="select count(*) from sample1 where "+s2+"='"+a2+"'";
                        ResultSet rs2=st.executeQuery(qq);
                        int NV1=0;
                        if(rs2.next())
                        {
                           NV1=rs2.getInt(1);
                           
                        }
                       double da1=(double)NV1/N;
                       double dde=0;
                       String ad[]=cg.split("#");
                       for(int k=0;k<alist.size();k++)
                       {
                           String g1=alist.get(k).toString();
                          // System.out.println("cc "+g1);
                           String aq="select count(*) from sample1 where "+s2+"='"+a2+"' and "+ad[0]+"="+"'"+g1+"'";
                           ResultSet rs3=st.executeQuery(aq);
                           int NV2=0;
                           if(rs3.next())
                           {
                               NV2=rs3.getInt(1);
                           
                           }
                           double da2=(double)NV2/(double)NV1;
                           double d2=0;
                           
                           String i1="";
                           try
                           {
                                i1=String.valueOf(da2);
                                if(i1.equals("NaN"))
                                {
                                    i1="0";
                                }
                                da2=Double.parseDouble(i1);
                                d2=da2*Math.log(da2); 
                                String i2=String.valueOf(d2);
                                if(i2.equals("NaN"))
                                {
                                    i2="0";
                                }
                                d2=Double.parseDouble(i2);
                           }
                           catch(Exception e)
                           {
                              e.printStackTrace() ;
                           }
                           
                           
                           
                           dde=dde+d2;
                         //  System.out.println("NV1 and NV2 "+NV1+" : "+NV2+" : "+d2+" : "+dde);
                       }
                        System.out.println("att "+a2+" : "+(da1*dde));
                        att=att+s2+"#"+a2+"#"+(-da1*dde)+"@";
                      csd=csd+(da1*dde);
                      
                    }
                    csd=-csd;
                   // System.out.println(s2+" : "+csd);
                    gain.add(s2+"#"+(TI-csd));
                 System.out.println("Gain "+s2+" : "+(TI-csd))   ;
                }
                
                System.out.println("gain "+gain);
                
                String rt="";
                String gn="";
                for(int i=0;i<gain.size()-1;i++)
                {
                    String s1[]=gain.get(i).toString().split("#");
                    String s2[]=gain.get(i+1).toString().split("#");
                    
                    double fd=Math.max(Double.parseDouble(s1[1]),Double.parseDouble(s2[1]));
                    if(fd==Double.parseDouble(s1[1]))
                    {
                        rt=s1[0];
                        gn=s1[1];
                    }
                    if(fd==Double.parseDouble(s2[1]))
                    {
                        rt=s2[0];
                        gn=s2[1];
                    }
                }
                System.out.println("Root  "+rt+" : "+gn);
                System.out.println(att);
               
            
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public double FindInfo(String s,int n)
     {
         double ds=0;
        try
        {
            System.out.println(s);
            String s1[]=s.split("#");
            String s2=s1[0];
            
            DBConnection db=new DBConnection();
            Statement st=db.stt;
            
            ArrayList at1=new ArrayList();
            ResultSet rs1=st.executeQuery("select distinct "+s2+" from sample1");
            while(rs1.next())
            {
                String a1=rs1.getString(1);
                at1.add(a1);
                        
            }
            System.out.println(at1);
            for(int i=0;i<at1.size();i++)
            {
                String a2=at1.get(i).toString();
                String qq="select count(*) from sample1 where "+s2+"='"+a2+"'";
                ResultSet rs2=st.executeQuery(qq);
                int NV1=0;
                if(rs2.next())
                {
                      NV1=rs2.getInt(1);
                           
                }
                double d1=(double)NV1/n;
                double d2=d1*Math.log(d1);
                ds=ds+d2;
                //System.out.println("NV and d1 "+NV1+" : "+n+" : "+d1);
            }
            ds=-ds;
            System.out.println("Info of Class "+ds);
        }
        catch(Exception e)
        {
            
        }
        return ds;
    }    
   
}
