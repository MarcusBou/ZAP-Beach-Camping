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

        public void AddNewBookings(string fName, string lName, string email, string phoneNumb, string address, string sDate, string eDate, string type, int adults, int Children, int dogs, int adgangbadB, int adgangbadA, int cykelleje, int morgenKompletB, int morgenKompletA, int sengelinned, int slutrengøring, int hasView)
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

        public Dictionary<string, int> GetAllPrices()
        {
            Dictionary<string, int> prices = new Dictionary<string, int>();//The Dictionary that is used to store the prices in.

            SqlCommand cmd1 = new SqlCommand("GetAllPricesFromPrices", conn);//Sets which command is used
            cmd1.CommandType = System.Data.CommandType.StoredProcedure;//Sets the Command type to StoredProcedure
            SqlCommand cmd2 = new SqlCommand("GetAllPricesFromAttributes", conn);//Sets which command is used
            cmd2.CommandType = System.Data.CommandType.StoredProcedure;//Sets the Command type to StoredProcedure
            OpenOrCloseConn(true);//opens connection
            SqlDataReader reader1 = cmd1.ExecuteReader();//Executes query
            
            while (reader1.Read())
            {
                for (int i = 1; i <= 2; i++)//Loops through each row twice to add both a low and high season
                {
                    if (i == 1)//Index 1 in the row equals to the low season 
                    {
                        prices.Add(reader1[0] + "Low", Convert.ToInt32(reader1[i]));
                    }
                    else if (i == 2)//Index 2 equals to the high season
                    {
                        prices.Add(reader1[0] + "High", Convert.ToInt32(reader1[i]));
                    }
                }
            }
            reader1.Close();

            SqlDataReader reader2 = cmd2.ExecuteReader();
            while (reader2.Read())
            {
                prices.Add(reader2[0].ToString(), Convert.ToInt32(reader2[1]));
            }
            reader2.Close();

            OpenOrCloseConn(false);//Closes Connection
            return prices; //Retuns the SqlDataReader
        }
    }
}
