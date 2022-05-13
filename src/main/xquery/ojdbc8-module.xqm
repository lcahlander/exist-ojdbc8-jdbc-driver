xquery version "3.1";

(:~
 : A module for performing SQL queries against MySQL Databases, returning XML representations of the result sets.
 :)
module namespace ojdbc8 = "https://exist-db.org/exist-db/ns/app/ojdbc8";
import module namespace sql="http://exist-db.org/xquery/sql";

declare variable $ojdbc8:classpath := "oracle.jdbc.OracleDriver";

(:~
 : Opens a connection to a ojdbc8 Database
 : @param $url The JDBC connection URL
 : @return an xs:long representing the connection handle
 :)
declare function ojdbc8:get-connection($url as xs:string)
as xs:long?
{
    sql:get-connection($ojdbc8:classpath, $url)
};

(:~
 : Opens a connection to a ojdbc8 Database
 : @param $url The JDBC connection URL
 : @param $properties The JDBC database connection properties in the form &lt;properties&gt;&lt;property name="" value=""/&gt;&lt;/properties&gt;
 : @return an xs:long representing the connection handle
 :)
declare function ojdbc8:get-connection($url as xs:string, $properties as element()?)
as xs:long?
{
    sql:get-connection($ojdbc8:classpath, $url, $properties)
};

(:~
 : Opens a connection to a ojdbc8 Database
 : @param $url The JDBC connection URL
 : @param $username The ojdbc8 database username
 : @param $password The ojdbc8 database password
 : @return an xs:long representing the connection handle
 :)
declare function ojdbc8:get-connection($url as xs:string, $username as xs:string, $password as xs:string)
as xs:long?
{
    sql:get-connection($ojdbc8:classpath, $url, $username, $password)
};

(:~
 : Prepares a SQL statement against a ojdbc8 db using the connection indicated by the connection handle.
 : @param $handle The connection handle
 : @param $sql-statement The SQL statement
 : @return an xs:long representing the statement handle
 :)
declare function ojdbc8:prepare($handle as xs:long, $sql-statement as xs:string)
as xs:long?
{
    sql:prepare($handle,  $sql-statement)
};

(:~
 : Executes a SQL statement against a ojdbc8 database.
 : @param $connection-handle The connection handle
 : @param $sql-statement The SQL statement
 : @param $make-node-from-column-name
 : The flag that indicates whether the xml nodes should be formed
 : from the column names (in this mode a space in a Column Name
 : will be replaced by an underscore!)
 : @return the results
 :)
declare function ojdbc8:execute(
            $connection-handle as xs:long,
            $sql-statement as xs:string,
            $make-node-from-column-name as xs:boolean
)
as element()?
{
    sql:execute($connection-handle, $sql-statement, $make-node-from-column-name)
};

(:~
 : Executes a prepared SQL statement against a ojdbc8 database.
 : @param $connection-handle The connection handle
 : @param $statement-handle The prepared statement handle
 : @param $parameters Parameters for the prepared statement.
 : e.g.
 : &lt;sql:parameters&gt;
 :   &lt;sql:param sql:type="long"&gt;1234&lt;/sql:param&gt;
 :   &lt;sql:param sql:type="varchar"&gt;
 :     &lt;sql:null/&gt;
 :   &lt;/sql:param&gt;
 : &lt;/sql:parameters&gt;
 : @param $make-node-from-column-name
 : The flag that indicates whether the xml nodes should be formed
 : from the column names (in this mode a space in a Column Name
 : will be replaced by an underscore!)
 : @return the results
 :)
declare function ojdbc8:execute(
            $connection-handle as xs:long,
            $statement-handle as xs:long,
            $parameters as element()?,
            $make-node-from-column-name as xs:boolean
)
as element()?
{
    sql:execute($connection-handle, $statement-handle, $parameters, $make-node-from-column-name)
};

