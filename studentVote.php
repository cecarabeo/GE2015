<?php

	session_start();
	
	if(!isset($_SESSION['inputStudentID']))
	{
		//redirect to unauthorizedAccess page
		header("location: unauthorizedAccess.php");
	}
	else
	{
		$studentID = $_SESSION['inputStudentID'];
		$college = $_SESSION['college'];
		$studentFName = ucfirst( strtolower( $_SESSION['name'] ) );
	
		include 'db_connect.php';
	}
?>

<html>
	<head>
		
		<link href="css/bootstrap.css" rel="stylesheet" />
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
		
		<link rel="stylesheet" type="text/css" href="css/form-css.css">
		<script src="js/valid.js"></script>
		
		<title>General Elections 2015 - Voting</title>
	
	</head>
	<body>
	<form id="ballotform" action="voteValidationSubmit.php" method="POST">
	
	<table id="mainframe">
		<tr>
			<td>
			<div id="header">
				<span id="banner">General Elections 2015</span>
				<span id="greetuser">Welcome, <?php echo $studentFName; ?>!</span>
			</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="separator"><span class="separator">USG EXECUTIVE BOARD</span></div>
			</td>
		</tr>
		<tr>
			<td>
				<span class="candposition"><?php echo "President"; ?></span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
					<table>
						<tr>
						<?php
						
						/* Query for USG President */
						$q = "SELECT candidate.candidate_id AS ID, voter.first_name AS FName, voter.last_name AS LName, party.party_id AS porder
								FROM voter, candidate, party_candidate, party
								WHERE voter.voter_id = candidate.candidate_id
									AND candidate.candidate_id = party_candidate.candidate_id
									AND party_candidate.party_id = party.party_id
									AND candidate.position LIKE 'USG President'
								ORDER BY porder";
						
						$result = mysql_query( $q );
						
						
						$i = 1;
						$c = 0;
						while( $candidate = mysql_fetch_array( $result ) )
						{
							echo "<td>";
							echo "<input type=\"radio\" name=\"usgpresident\" value=\"" . $candidate['ID'] . "\" id=\"usgpres" . $i . "\">";
							echo "<label class=\"options\" for=\"usgpres" . $i . "\">";
							echo "<div class=\"selector\">";
							echo "<span class=\"candname\">";
							
							$fullname = $candidate['FName'] . " " . $candidate['LName'] . " ";
							
							// Entire name must be 25 characters
							// Fill with non-breakable space &nbsp;
							if ( strlen( $fullname ) < 14 )
							{
								$halfname = (25 - strlen($fullname) ) / 2;
							}
							else
							{
								$halfname = 1;
							}
							
							for( $c = 0; $c < $halfname; $c++ )
							{
								echo "&nbsp;";
							}
							
							echo $fullname;
							
							for( $c = 0; $c < $halfname+5; $c++ )
							{
								echo "&nbsp;";
							}
							
							/*for( $c = strlen( $fullname ) ; $c <= 25; $c++ )
							{
								echo "&nbsp;";
							}*/
							
							echo "</span>";
							echo "<span class=\"checkmark\">&#10004 </span>";
							echo "</div>";
							echo "</label>";
							echo "</td>";
							$i++;
						}
						?>
						</tr>
					</table>
				</center>
			</td>
		</tr>
		<tr>
			<td>
			<center>
				<input type="radio" name="usgpresident" id="abstain" value="pabstain">
				<label class="options" for="abstain">
					<div class="selector_abstain">
						<span class="abstain">Abstain</span>
						<span class="xmark">&#10008 </span>
					</div>
				</label>
			</center>
			</td>
		</tr>
		<tr>
			<td>
				<br /><br />
			</td>
		</tr>
		<tr>
			<td>
				<span class="candposition"><?php echo "Vice-President for Internal Affairs"; ?></span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
					<table>
						<tr>
						<?php
						
						/* Query for USG VP Internal Affairs */
						$q = "SELECT candidate.candidate_id AS ID, voter.first_name AS FName, voter.last_name AS LName, party.party_id AS porder
								FROM voter, candidate, party_candidate, party
								WHERE voter.voter_id = candidate.candidate_id
									AND candidate.candidate_id = party_candidate.candidate_id
									AND party_candidate.party_id = party.party_id
									AND candidate.position LIKE 'VP Internals'
								ORDER BY porder";
									
						$result = mysql_query( $q );
						
		
						$i = 1;
						$c = 0;
						while( $candidate = mysql_fetch_array( $result ) )
						{
							echo "<td>";
							echo "<input type=\"radio\" name=\"usgvicepresidentint\" value=\"" . $candidate['ID'] . "\" id=\"v". $i . "\">";
							echo "<label class=\"options\" for=\"v". $i . "\">";
							echo "<div class=\"selector\">";
							echo "<span class=\"candname\">";
						
							$fullname = $candidate['FName'] . " " . $candidate['LName'] . " ";
							
							// Entire name must be 25 characters
							// Fill with non-breakable space &nbsp;
							if ( strlen( $fullname ) < 14 )
							{
								$halfname = (25 - strlen($fullname) ) / 2;
							}
							else
							{
								$halfname = 1;
							}
							
							for( $c = 0; $c < $halfname; $c++ )
							{
								echo "&nbsp;";
							}
							
							echo $fullname;
							
							for( $c = 0; $c < $halfname+5; $c++ )
							{
								echo "&nbsp;";
							}
						
							echo "</span>";
							echo "<span class=\"checkmark\">&#10004 </span>";
							echo "</div>";
							echo "</label>";
							echo "</td>";
							
							$i++;
						}
					
						?>
						</tr>
					</table>
				</center>
			</td>
		</tr>
		<tr>
			<td>
			<center>
				<input type="radio" name="usgvicepresidentint" id="vabstain" value="viabstain">
				<label class="options" for="vabstain">
					<div class="selector_abstain">
						<span class="abstain">Abstain</span>
						<span class="xmark">&#10008 </span>
					</div>
				</label>
			</center>
			</td>
		</tr>
		<tr>
			<td>
				<br /><br />
			</td>
		</tr>
		<tr>
			<td>
				<span class="candposition"><?php echo "Vice-President for External Affairs"; ?></span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table>
					<tr>
						<?php
						
						/* Query for USG VP External Affairs */
						$q = "SELECT candidate.candidate_id AS ID, voter.first_name AS FName, voter.last_name AS LName, party.party_id AS porder
								FROM voter, candidate, party_candidate, party
								WHERE voter.voter_id = candidate.candidate_id
									AND candidate.candidate_id = party_candidate.candidate_id
									AND party_candidate.party_id = party.party_id
									AND candidate.position LIKE 'VP Externals'
								ORDER BY porder";
									
						$result = mysql_query( $q );
						
		
						$i = 1;
						$c = 0;
						while( $candidate = mysql_fetch_array( $result ) )
						{
							echo "<td>";
							echo "<input type=\"radio\" name=\"usgvicepresidentext\" value=\"" . $candidate['ID'] . "\" id=\"ve". $i . "\">";
							echo "<label class=\"options\" for=\"ve". $i . "\">";
							echo "<div class=\"selector\">";
							echo "<span class=\"candname\">";
						
							$fullname = $candidate['FName'] . " " . $candidate['LName'] . " ";
							
							// Entire name must be 25 characters
							// Fill with non-breakable space &nbsp;
							if ( strlen( $fullname ) < 14 )
							{
								$halfname = ( 25 - strlen($fullname) ) / 2;
							}
							else
							{
								$halfname = 1;
							}
							
							for( $c = 0; $c < $halfname; $c++ )
							{
								echo "&nbsp;";
							}
							
							echo $fullname;
							
							for( $c = 0; $c < $halfname+5; $c++ )
							{
								echo "&nbsp;";
							}
						
							echo "</span>";
							echo "<span class=\"checkmark\">&#10004 </span>";
							echo "</div>";
							echo "</label>";
							echo "</td>";
							
							$i++;
						}
					
						?>
						</tr>
					</table>
				</center>
			</td>
		</tr>
		<tr>
			<td>
			<center>
				<input type="radio" name="usgvicepresidentext" id="veabstain" value="veabstain">
				<label class="options" for="veabstain">
					<div class="selector_abstain">
						<span class="abstain">Abstain</span>
						<span class="xmark">&#10008 </span>
					</div>
				</label>
			</center>
			</td>
		</tr>
		<tr>
			<td>
				<br /><br />
			</td>
		</tr>
		<tr>
			<td>
				<span class="candposition"><?php echo "Treasurer" ?></span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
					<table>
						<tr>
						<?php
						
						/* Query for USG Treasurer */
						$q = "SELECT candidate.candidate_id AS ID, voter.first_name AS FName, voter.last_name AS LName, party.party_id AS porder
								FROM voter, candidate, party_candidate, party
								WHERE voter.voter_id = candidate.candidate_id
									AND candidate.candidate_id = party_candidate.candidate_id
									AND party_candidate.party_id = party.party_id
									AND candidate.position LIKE 'Executive Treasurer'
								ORDER BY porder";
									
						$result = mysql_query( $q );
						
		
						$i = 1;
						$c = 0;
						while( $candidate = mysql_fetch_array( $result ) )
						{
							echo "<td>";
							echo "<input type=\"radio\" name=\"usgtreasurer\" value=\"" . $candidate['ID'] . "\" id=\"t". $i . "\">";
							echo "<label class=\"options\" for=\"t". $i . "\">";
							echo "<div class=\"selector\">";
							echo "<span class=\"candname\">";
						
							$fullname = $candidate['FName'] . " " . $candidate['LName'] . " ";
							
							// Entire name must be 25 characters
							// Fill with non-breakable space &nbsp;
							if ( strlen( $fullname ) < 14 )
							{
								$halfname = ( 25 - strlen($fullname) ) / 2;
							}
							else
							{
								$halfname = 1;
							}
							
							for( $c = 0; $c < $halfname; $c++ )
							{
								echo "&nbsp;";
							}
							
							echo $fullname;
							
							for( $c = 0; $c < $halfname+5; $c++ )
							{
								echo "&nbsp;";
							}
						
							echo "</span>";
							echo "<span class=\"checkmark\">&#10004 </span>";
							echo "</div>";
							echo "</label>";
							echo "</td>";
							
							$i++;
						}
					
						?>
						</tr>
					</table>
				</center>
			</td>
		</tr>
		<tr>
			<td>
			<center>
				<input type="radio" name="usgtreasurer" id="tabstain" value="tabstain">
				<label class="options" for="tabstain">
					<div class="selector_abstain">
						<span class="abstain">Abstain</span>
						<span class="xmark">&#10008 </span>
					</div>
				</label>
			</center>
			</td>
		</tr>
		<tr>
			<td>
				<br /><br />
			</td>
		</tr>
		<tr>
			<td>
				<span class="candposition"><?php echo "Secretary" ?></span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table>
					<tr>
					<?php
						
						/* Query for USG Secretary */
						$q = "SELECT candidate.candidate_id AS ID, voter.first_name AS FName, voter.last_name AS LName, party.party_id AS porder
								FROM voter, candidate, party_candidate, party
								WHERE voter.voter_id = candidate.candidate_id
									AND candidate.candidate_id = party_candidate.candidate_id
									AND party_candidate.party_id = party.party_id
									AND candidate.position LIKE 'Executive Secretary'
								ORDER BY porder";
									
						$result = mysql_query( $q );
						
		
						$i = 1;
						$c = 0;
						while( $candidate = mysql_fetch_array( $result ) )
						{
							echo "<td>";
							echo "<input type=\"radio\" name=\"usgsecretary\" value=\"" . $candidate['ID'] . "\" id=\"s". $i . "\">";
							echo "<label class=\"options\" for=\"s". $i . "\">";
							echo "<div class=\"selector\">";
							echo "<span class=\"candname\">";
						
							$fullname = $candidate['FName'] . " " . $candidate['LName'] . " ";
							
							// Entire name must be 25 characters
							// Fill with non-breakable space &nbsp;
							if ( strlen( $fullname ) < 14 )
							{
								$halfname = ( 25 - strlen($fullname) ) / 2;
							}
							else
							{
								$halfname = 1;
							}
							
							for( $c = 0; $c < $halfname; $c++ )
							{
								echo "&nbsp;";
							}
							
							echo $fullname;
							
							for( $c = 0; $c < $halfname+5; $c++ )
							{
								echo "&nbsp;";
							}
						
							echo "</span>";
							echo "<span class=\"checkmark\">&#10004 </span>";
							echo "</div>";
							echo "</label>";
							echo "</td>";
							
							$i++;
						}
					
						?>
						</tr>
					</table>
				</center>
			</td>
		</tr>
		<tr>
			<td>
			<center>
				<input type="radio" name="usgsecretary" id="sabstain" value="sabstain">
				<label class="options" for="sabstain">
					<div class="selector_abstain">
						<span class="abstain">Abstain</span>
						<span class="xmark">&#10008 </span>
					</div>
				</label>
			</center>
			</td>
		</tr>
		<tr>
			<td>
				<div class="separator"><span class="separator">SCIENCE & TECHNOLOGY COMPLEX GOVERNMENT</span></div>
			</td>
		</tr>
		<tr>
			<td>
				<br /><br />
			</td>
		</tr>
		<tr>
			<td>
				<span class="candposition"><?php echo "Campus President" ?></span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table>
					<tr>
					<?php
						
						/* Query for STC President */
						$q = "SELECT candidate.candidate_id AS ID, voter.first_name AS FName, voter.last_name AS LName, party.party_id AS porder
								FROM voter, candidate, party_candidate, party
								WHERE voter.voter_id = candidate.candidate_id
									AND candidate.candidate_id = party_candidate.candidate_id
									AND party_candidate.party_id = party.party_id
									AND candidate.position LIKE 'STC President'
								ORDER BY porder";
									
						$result = mysql_query( $q );
						
		
						$i = 1;
						$c = 0;
						while( $candidate = mysql_fetch_array( $result ) )
						{
							echo "<td>";
							echo "<input type=\"radio\" name=\"stcpresident\" value=\"" . $candidate['ID'] . "\" id=\"p". $i . "\">";
							echo "<label class=\"options\" for=\"p". $i . "\">";
							echo "<div class=\"selector\">";
							echo "<span class=\"candname\">";
						
							$fullname = $candidate['FName'] . " " . $candidate['LName'] . " ";
							
							// Entire name must be 25 characters
							// Fill with non-breakable space &nbsp;
							if ( strlen( $fullname ) < 14 )
							{
								$halfname = ( 25 - strlen($fullname) ) / 2;
							}
							else
							{
								$halfname = 1;
							}
							
							for( $c = 0; $c < $halfname; $c++ )
							{
								echo "&nbsp;";
							}
							
							echo $fullname;
							
							for( $c = 0; $c < $halfname+5; $c++ )
							{
								echo "&nbsp;";
							}
						
							echo "</span>";
							echo "<span class=\"checkmark\">&#10004 </span>";
							echo "</div>";
							echo "</label>";
							echo "</td>";
							
							$i++;
						}
					
						?>
						</tr>
					</table>
				</center>
			</td>
		</tr>
		<tr>
			<td>
			<center>
				<input type="radio" name="stcpresident" id="pabstain" value="cpabstain">
				<label class="options" for="pabstain">
					<div class="selector_abstain">
						<span class="abstain">Abstain</span>
						<span class="xmark">&#10008 </span>
					</div>
				</label>
			</center>
			</td>
		</tr>
		<tr>
			<td>
				<br /><br />
			</td>
		</tr>
		<tr>
			<td>
				<span class="candposition"><?php echo "College Representative"; ?></span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table>
					<tr>
					<?php
						
						/* Query for College Representative */
						$voterCollege = $college;
						
						$q = "SELECT candidate.candidate_id AS ID, voter.first_name AS FName, voter.last_name AS LName, party.party_id AS porder
								FROM voter, candidate, party_candidate, party
								WHERE voter.voter_id = candidate.candidate_id
									AND candidate.candidate_id = party_candidate.candidate_id
									AND party_candidate.party_id = party.party_id
									AND candidate.position LIKE '" . $voterCollege . " Representative'
								ORDER BY porder";
									
						$result = mysql_query( $q );
						
		
						$i = 1;
						$c = 0;
						while( $candidate = mysql_fetch_array( $result ) )
						{
							echo "<td>";
							echo "<input type=\"radio\" name=\"stccolrep\" value=\"" . $candidate['ID'] . "\" id=\"c". $i . "\">";
							echo "<label class=\"options\" for=\"c". $i . "\">";
							echo "<div class=\"selector\">";
							echo "<span class=\"candname\">";
						
							$fullname = $candidate['FName'] . " " . $candidate['LName'] . " ";
							
							// Entire name must be 25 characters
							// Fill with non-breakable space &nbsp;
							if ( strlen( $fullname ) < 14 )
							{
								$halfname = ( 25 - strlen($fullname) ) / 2;
							}
							else
							{
								$halfname = 1;
							}
							
							for( $c = 0; $c < $halfname; $c++ )
							{
								echo "&nbsp;";
							}
							
							echo $fullname;
							
							for( $c = 0; $c < $halfname+5; $c++ )
							{
								echo "&nbsp;";
							}
						
							echo "</span>";
							echo "<span class=\"checkmark\">&#10004 </span>";
							echo "</div>";
							echo "</label>";
							echo "</td>";
							
							$i++;
						}
					
						?>
						</tr>
					</table>
				</center>
			</td>
		</tr>
		<tr>
			<td>
			<center>
				<input type="radio" name="stccolrep" id="cabstain" value="crabstain">
				<label class="options" for="cabstain">
					<div class="selector_abstain">
						<span class="abstain">Abstain</span>
						<span class="xmark">&#10008 </span>
					</div>
				</label>
			</center>
			</td>
		</tr>
		<tr>
			<td>
				<br /><br />
			</td>
		</tr>
		<tr>
			<td>
				<span class="candposition"><?php echo "Legislative Assembly Representatives" ?></span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table>
					<tr>
					<?php
						
						/* Query for Legislative Assembly Representative */
						$voterCollege = $college;
						
						$q = "SELECT candidate.candidate_id AS ID, voter.first_name AS FName, voter.last_name AS LName, party.party_id AS porder
								FROM voter, candidate, party_candidate, party
								WHERE voter.voter_id = candidate.candidate_id
									AND candidate.candidate_id = party_candidate.candidate_id
									AND party_candidate.party_id = party.party_id
									AND candidate.position LIKE 'Legislative Assembly Representative'
								ORDER BY porder";
									
						$result = mysql_query( $q );
						
		
						$i = 1;
						$c = 0;
						while( $candidate = mysql_fetch_array( $result ) )
						{
							echo "<td>";
							echo "<input type=\"checkbox\" name=\"stclarep[]\" id=\"l". $i . "\" value=\"". $candidate['ID'] ."\" onclick=\"countlarep(this)\">";
							echo "<label class=\"options\" for=\"l". $i . "\">";
							echo "<div class=\"selector\">";
							echo "<span class=\"candname\">";
						
							$fullname = $candidate['FName'] . " " . $candidate['LName'] . " ";
							
							// Entire name must be 25 characters
							// Fill with non-breakable space &nbsp;
							if ( strlen( $fullname ) < 14 )
							{
								$halfname = ( 25 - strlen($fullname) ) / 2;
							}
							else
							{
								$halfname = 1;
							}
							
							for( $c = 0; $c < $halfname; $c++ )
							{
								echo "&nbsp;";
							}
							
							echo $fullname;
							
							for( $c = 0; $c < $halfname+5; $c++ )
							{
								echo "&nbsp;";
							}
						
							echo "</span>";
							echo "<span class=\"checkmark\">&#10004 </span>";
							echo "</div>";
							echo "</label>";
							echo "</td>";
							
							$i++;
						}
					
						?>
						</tr>
					</table>
				</center>
			</td>
		</tr>
		<tr>
			<td>
			<center>
			<table>
				<tr>
					<td>
						<input type="checkbox" name="stclarep[]" id="labstain" value="la1Abstain" onclick="countlarep(this)">
						<label class="options" for="labstain">
							<div class="selector_abstain">
								<span class="abstain">Abstain</span>
								<span class="xmark">&#10008 </span>
							</div>
						</label>
					</td>
					<td>
						<input type="checkbox" name="stclarep[]" id="l2abstain" value="la2Abstain" onclick="countlarep(this)">
						<label class="options" for="l2abstain">
							<div class="selector_abstain">
								<span class="abstain">Abstain</span>
								<span class="xmark">&#10008 </span>
							</div>
						</label>
					</td>
				</tr>
			</table>
			</center>
		</tr>
		<tr>
			<td>
				<button type="button" id="ballotbutton" onclick="submitValidation()" data-toggle="modal" data-target="#confirmBallot">Submit Ballot</button>
			</td>
		</tr>
	</table>
	
	<!-- Modal: Incomplete Ballot -->
	<div class="modal fade" id="confirmBallot" tabindex="-1" role="dialog" aria-labelledby="confirmBallotModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
					<h4 class="modal-title" id="confirmBallotModal">An Error has occurred!</h4>
				</div>
				<div class="modal-body" id="modalBody">
					Please inform a COMELEC member immediately!
				</div>
				<div class="modal-footer" id="modalButtonPlacement" style="text-align: center;">
					<!--<button type="button" class="cancelButton" data-dismiss="modal">Wait! Go Back!</button>
					<button type="submit" class="okayButton" onclick="submitValidation()">Submit my Ballot!</button>-->
				</div>
			</div>
		</div>
	</div>
	
	</form>
	</body>
</html>