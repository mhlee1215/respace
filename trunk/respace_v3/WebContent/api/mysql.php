<?
class mysql
{
	var $db;
	var $row_num = 0;
	static $mysql_array;
	static function get($selector = "etov") {
		if(!mysql::$mysql_array) {
			mysql::$mysql_array = array();
		}
		
		if(!mysql::$mysql_array[$selector])
			mysql::$mysql_array[$selector] = new mysql($selector);
		
		return mysql::$mysql_array[$selector];
	}
	
	function __construct($selector)
	{
		global $_CONNECTION;
		$this -> db = mysql_connect($_CONNECTION[$selector]["host"], $_CONNECTION[$selector]["user"], $_CONNECTION[$selector]["pw"]);
		mysql_select_db($_CONNECTION[$selector]["db"], $this -> db);
		mysql_query("set names UTF8", $this -> db);
	}
	
	function get_multi_record($query, $start = 0, $limit = -1)
	{
		$result_array = array();

		$result = mysql_query($query);
		
		if(!$result)
			return false;
		
		$this -> row_num = mysql_num_rows($result);

		if(@mysql_data_seek($result, $start) === false)
			return $result_array;
		
		if($limit == -1)
		{
			while($row = mysql_fetch_assoc($result))
				$result_array[] = $row;
		}
		else
		{
			for($i = 0; $i < $limit && $row = mysql_fetch_assoc($result); $i++)
				$result_array[] = $row;
		}
		
		return $result_array;
	}
	
	function get_multi_column($query, $start = 0, $limit = -1)
	{
		$result_array = array();

		$result = mysql_query($query);
		
		if(!$result)
			return false;
		
		$this -> row_num = mysql_num_rows($result);
		
		if(@mysql_data_seek($result, $start) === false)
			return $result_array;
		
		if($limit == -1)
		{
			while($row = mysql_fetch_row($result))
				$result_array[] = $row[0];
		}
		else
		{
			for($i = 0; $i < $limit && $row = mysql_fetch_row($result); $i++)
				$result_array[] = $row[0];
		}
		
		return $result_array;
	}
	
	function get_column($query)
	{
		if($result = @mysql_query($query))
		{
				$row = mysql_fetch_row($result);
				return $row[0];
		}
		else
			return false;
	}

	function get_record($query)
	{
		$result = @mysql_query($query);
		if(!$result)
			return false;
		
		return @mysql_fetch_assoc($result);
	}
	
	function insert($query)
	{
		if(@mysql_query($query))
		{
			$id = mysql_insert_id();
			return $id ? $id : true;
		}
		else
			return false;
	}
	
	function update($query)
	{
		if(@mysql_query($query))
			return mysql_affected_rows();
		else
			return false;
	}
	
	function delete($query)
	{
		if(@mysql_query($query))
			return mysql_affected_rows();
		else
			return false;
	}
	
	function get_error()
	{
		$data["mysql"]["errno"] = mysql_errno();
		$data["mysql"]["error"] = mysql_error();
		
		return $data;
	}
	
	function count_record()
	{
		return $this -> row_num;
	}
};
?>