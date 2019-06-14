module Hippo_eyeDoc::CodeLists
  class ClaimStatusCategoryCodes
    def self.[](key)
      @@codes[key]
    end

    @@codes = {
    "X0"=>
    {:code=>"X0",
    :description=>"Supplemental Messages",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"10/16/2003",
    :last_modified_date=>"",
    :notes=>""},
    "A0"=>
    {:code=>"A0",
    :description=>
    "Acknowledgement/Forwarded-The claim/encounter has been forwarded to another entity.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "A1"=>
    {:code=>"A1",
    :description=>
    "Acknowledgement/Receipt-The claim/encounter has been received. This does not mean that the claim has been accepted for adjudication.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "A2"=>
    {:code=>"A2",
    :description=>
    "Acknowledgement/Acceptance into adjudication system-The claim/encounter has been accepted into the adjudication system.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "A3"=>
    {:code=>"A3",
    :description=>
    "Acknowledgement/Returned as unprocessable claim-The claim/encounter has been rejected and has not been entered into the adjudication system.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "A4"=>
    {:code=>"A4",
    :description=>
    "Acknowledgement/Not Found-The claim/encounter can not be found in the adjudication system.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "A5"=>
    {:code=>"A5",
    :description=>
    "Acknowledgement/Split Claim-The claim/encounter has been split upon acceptance into the adjudication system.",
    :effective_date=>"02/28/2002",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "A6"=>
    {:code=>"A6",
    :description=>
    "Acknowledgement/Rejected for Missing Information - The claim/encounter is missing the information specified in the Status details and has been rejected.",
    :effective_date=>"10/31/2002",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "A7"=>
    {:code=>"A7",
    :description=>
    "Acknowledgement/Rejected for Invalid Information - The claim/encounter has invalid information as specified in the Status details and has been rejected.",
    :effective_date=>"10/31/2002",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "A8"=>
    {:code=>"A8",
    :description=>"Acknowledgement / Rejected for relational field in error.",
    :effective_date=>"10/31/2004",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "P0"=>
    {:code=>"P0",
    :description=>
    "Pending: Adjudication/Details-This is a generic message about a pended claim. A pended claim is one for which no remittance advice has been issued, or only part of the claim has been paid.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "P1"=>
    {:code=>"P1",
    :description=>
    "Pending/In Process-The claim or encounter is in the adjudication system.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "P2"=>
    {:code=>"P2",
    :description=>
    "Pending/Payer Review-The claim/encounter is suspended and is pending review (e.g. medical review, repricing, Third Party Administrator processing).",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"01/27/2008",
    :notes=>""},
    "P3"=>
    {:code=>"P3",
    :description=>
    "Pending/Provider Requested Information - The claim or encounter is waiting for information that has already been requested from the provider. (Note: A Claim Status Code identifying the type of information requested, must be reported)",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"01/27/2008",
    :notes=>""},
    "P4"=>
    {:code=>"P4",
    :description=>
    "Pending/Patient Requested Information - The claim or encounter is waiting for information that has already been requested from the patient. (Note: A status code identifying the type of information requested must be sent)",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"01/27/2008",
    :notes=>""},
    "P5"=>
    {:code=>"P5",
    :description=>"Pending/Payer Administrative/System hold",
    :effective_date=>"10/31/2006",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "F0"=>
    {:code=>"F0",
    :description=>
    "Finalized-The claim/encounter has completed the adjudication cycle and no more action will be taken.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "F1"=>
    {:code=>"F1",
    :description=>"Finalized/Payment-The claim/line has been paid.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "F2"=>
    {:code=>"F2",
    :description=>"Finalized/Denial-The claim/line has been denied.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "F3"=>
    {:code=>"F3",
    :description=>
    "Finalized/Revised - Adjudication information has been changed",
    :effective_date=>"02/28/2001",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "F3F"=>
    {:code=>"F3F",
    :description=>
    "Finalized/Forwarded-The claim/encounter processing has been completed. Any applicable payment has been made and the claim/encounter has been forwarded to a subsequent entity as identified on the original claim or in this payer's records.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "F3N"=>
    {:code=>"F3N",
    :description=>
    "Finalized/Not Forwarded-The claim/encounter processing has been completed. Any applicable payment has been made. The claim/encounter has NOT been forwarded to any subsequent entity identified on the original claim.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "F4"=>
    {:code=>"F4",
    :description=>
    "Finalized/Adjudication Complete - No payment forthcoming-The claim/encounter has been adjudicated and no further payment is forthcoming.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "F5"=>
    {:code=>"F5",
    :description=>"Finalized/Cannot Process",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"10/16/2003",
    :last_modified_date=>"",
    :notes=>""},
    "R0"=>
    {:code=>"R0",
    :description=>
    "Requests for additional Information/General Requests-Requests that don't fall into other R-type categories.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "R1"=>
    {:code=>"R1",
    :description=>
    "Requests for additional Information/Entity Requests-Requests for information about specific entities (subscribers, patients, various providers).",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "R3"=>
    {:code=>"R3",
    :description=>
    "Requests for additional Information/Claim/Line-Requests for information that could normally be submitted on a claim.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"02/28/1998",
    :notes=>""},
    "R4"=>
    {:code=>"R4",
    :description=>
    "Requests for additional Information/Documentation-Requests for additional supporting documentation. Examples: certification, x-ray, notes.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"02/28/1998",
    :notes=>""},
    "R5"=>
    {:code=>"R5",
    :description=>
    "Request for additional information/more specific detail-Additional information as a follow up to a previous request is needed. The original information was received but is inadequate. More specific/detailed information is requested.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"06/30/1998",
    :notes=>""},
    "R6"=>
    {:code=>"R6",
    :description=>
    "Requests for additional information - Regulatory requirements",
    :effective_date=>"02/28/2007",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "R7"=>
    {:code=>"R7",
    :description=>
    "Requests for additional information - Confirm care is consistent with Health Plan policy coverage",
    :effective_date=>"02/28/2007",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "R8"=>
    {:code=>"R8",
    :description=>
    "Requests for additional information - Confirm care is consistent with health plan coverage exceptions",
    :effective_date=>"02/28/2007",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "R9"=>
    {:code=>"R9",
    :description=>
    "Requests for additional information - Determination of medical necessity",
    :effective_date=>"02/28/2007",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "R10"=>
    {:code=>"R10",
    :description=>
    "Requests for additional information - Support a filed grievance or appeal",
    :effective_date=>"02/28/2007",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "R11"=>
    {:code=>"R11",
    :description=>
    "Requests for additional information - Pre-payment review of claims",
    :effective_date=>"02/28/2007",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "R12"=>
    {:code=>"R12",
    :description=>
    "Requests for additional information - Clarification or justification of use for specified procedure code",
    :effective_date=>"02/28/2007",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "R13"=>
    {:code=>"R13",
    :description=>
    "Requests for additional information - Original documents submitted are not readable. Used only for subsequent request(s).",
    :effective_date=>"02/28/2007",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "R14"=>
    {:code=>"R14",
    :description=>
    "Requests for additional information - Original documents received are not what was requested. Used only for subsequent request(s).",
    :effective_date=>"02/28/2007",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "R15"=>
    {:code=>"R15",
    :description=>
    "Requests for additional information - Workers Compensation coverage determination.",
    :effective_date=>"02/28/2007",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "R16"=>
    {:code=>"R16",
    :description=>
    "Requests for additional information - Eligibility determination",
    :effective_date=>"02/28/2007",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "RQ"=>
    {:code=>"RQ",
    :description=>
    "General Questions (Yes/No Responses)-Questions that may be answered by a simple 'yes' or 'no'.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"01/01/2008",
    :last_modified_date=>"07/09/2007",
    :notes=>""},
    "E0"=>
    {:code=>"E0",
    :description=>"Response not possible - error on submitted request data",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"02/28/2002",
    :notes=>""},
    "E1"=>
    {:code=>"E1",
    :description=>"Response not possible - System Status",
    :effective_date=>"02/29/2000",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "E2"=>
    {:code=>"E2",
    :description=>
    "Information Holder is not responding; resubmit at a later time.",
    :effective_date=>"06/30/2003",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "E3"=>
    {:code=>"E3",
    :description=>"Correction required - relational fields in error.",
    :effective_date=>"01/24/2010",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "E4"=>
    {:code=>"E4",
    :description=>
    "Trading partner agreement specific requirement not met: Data correction required. (Note: A status code identifying the type of information requested must be sent)",
    :effective_date=>"01/30/2011",
    :deactivation_date=>"",
    :last_modified_date=>"",
    :notes=>""},
    "D0"=>
    {:code=>"D0",
    :description=>
    "Data Search Unsuccessful - The payer is unable to return status on the requested claim(s) based on the submitted search criteria.",
    :effective_date=>"01/01/1995",
    :deactivation_date=>"",
    :last_modified_date=>"09/20/2009",
    :notes=>""}}
  end
end
