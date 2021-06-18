using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ZAP_BeachCamping
{
    public class SQLManager
    {
        private const string connString = "Data Source=172.16.21.21;Initial Catalog=ZAP_Beach_Camping;User ID=sa;Password=Passw0rd!";//Connection string for the database
        private SqlConnection conn = new SqlConnection(connString);//connection too the database;

        //Method Foor Quickly opening or closing connection for the database
        public void OpenOrCloseConn(bool openOrClose)
        {
            if (openOrClose)
            {
                conn.Open();
            }
            else
            {
                conn.Close();
            }
        }

        public void AddNewBookings(string fName, string lName, string email, string phoneNumb, string address, DateTime sDate, DateTime eDate, string type, int adults, int Children, int dogs, int adgangbadB, int adgangbadA, int cykelleje, int morgenKompletB, int morgenKompletA, int sengelinned, int slutrengøring, int hasView)
        {
            SqlCommand addCmd = new SqlCommand("AddNewBooking", conn);
            addCmd.CommandType = System.Data.CommandType.StoredProcedure;
            //Assign all the parameters that needs to be sent too the database
            addCmd.Parameters.AddWithValue("@fName", fName);
            addCmd.Parameters.AddWithValue("@lName", lName);
            addCmd.Parameters.AddWithValue("@email", email);
            addCmd.Parameters.AddWithValue("@phoneNum", phoneNumb);
            addCmd.Parameters.AddWithValue("@address", address);
            addCmd.Parameters.AddWithValue("@startDate", sDate);
            addCmd.Parameters.AddWithValue("@endDate", eDate);
            addCmd.Parameters.AddWithValue("@type", type);
            addCmd.Parameters.AddWithValue("@adult", adults);
            addCmd.Parameters.AddWithValue("@child", Children);
            addCmd.Parameters.AddWithValue("@dogs", dogs);
            addCmd.Parameters.AddWithValue("@AdgangBadB", adgangbadB);
            addCmd.Parameters.AddWithValue("@AdgangBadA",adgangbadA);
            addCmd.Parameters.AddWithValue("@Cykelleje", cykelleje);
            addCmd.Parameters.AddWithValue("@MorgenKompletB", morgenKompletB);
            addCmd.Parameters.AddWithValue("@MorgenKompletA", morgenKompletA);
            addCmd.Parameters.AddWithValue("@Sengelinned", sengelinned);
            addCmd.Parameters.AddWithValue("@Slutrengoring", slutrengøring);
            addCmd.Parameters.AddWithValue("@hasView", hasView);
            OpenOrCloseConn(true);//Opens the connection
            addCmd.ExecuteNonQuery();//Executes the created stored procedure
            OpenOrCloseConn(false);//Closes Connection
        }

        public void AddNewSpot(string type, int hasview)//Method for adding new spots to the SQLDB
        {
            SqlCommand cmd = new SqlCommand("AddNewSpot", conn);//Sets which command is used
            cmd.CommandType = System.Data.CommandType.StoredProcedure;//Sets the Command type
            cmd.Parameters.AddWithValue("hasView", hasview);//Add parameter to stored procedure
            cmd.Parameters.AddWithValue("type", type);
            OpenOrCloseConn(true);//opens connection
            cmd.ExecuteNonQuery();//Executes query
            OpenOrCloseConn(false);//Close Connection
        }
    }
}
