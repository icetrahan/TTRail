import 'package:flutter/material.dart';

Map<String, String> trackRegulationsContents = {
  ' ': ' ',
  '213.9a':
      'Class of Track ! Frieght Trains Max ! Passenger Train Max\nExcepted Track ! 10 mph ! NA \n Class 1 Track ! 10 ! 15 \n Class 2 Track ! 25 ! 30 \n Class 3 Track ! 40 ! 60 \n Class 4 Track ! 60 ! 80 \n Class 5 Track ! 80 ! 90',
  '213.9b':
      'If a segment of track does not meet all the requirements for its intended class, it is reclassified to the next lowest class of track that it meets the requirements of. However, if the the segment of track does not at least meet the requirements for Class 1 track, operations may continue at Class 1 speeds for a period of not more than 30 days without bringing the track back into compliance.',
  '213.13':
      'When unloaded track is measured to detemine compliance with requirements of this part, the amount of rail movement, if any, that occurs while the track is loaded must be added to the measurements of the unloaded track.',
  '213.33':
      'Each drainage or other water carrying facility under or immediately adjacent to the roadbed shall be maintained and kept free of obstruction, to accommodate expected water flow for the area concerned.',
  '213.37':
      'Vegetation on railroad property which is on or immediately adjacent to roadbed shall be controlled so that it does not:\nA. Become a fire hazard to track-carrying structures.\nB. Obstruct visibility of railroad signs and signals along the right-of-way and at highway-rail crossings.\nC. Interfere with railroad employees performing normal trackside duties\nD. Prevent proper functioning of signal and communication lines\nE. Prevent railroad employees from visually inspecting moving equipment from their normal duty stations.',
  '213.53a':
      'Gage is measured between the heads of the rails at right-angles to the rails in a plane five-eighths of an inch below the top of the rail head.',
  '213.53b':
      'Class of Track ! Minimum Gage ! Maximum Gage\nExcepted Track ! NA ! 58.25in \n Class 1 Track ! 56in ! 58in\n Class 2 & 3 Track ! 56in ! 57.75in\nClass 4 & 5 Track ! 56in ! 57.5in',
  '213.55':
      'Class of Track ! Tangent Track Maximum Mid offset Deviation from a 62ft line ! Curved Track Maximum Midordinate Deviation from a 31ft Chord ! Maximum Mid ordinate Deviation from a 62ft Chord\nClass 1 Track ! 5in ! NA ! 5in\n Class 2 Track ! 3in ! NA ! 3in\nClass 3 Track ! 1.75in ! 1.25in ! 1.75in\n Class 4 Track ! 1.5in ! 1in ! 1.5in\n Class 5 Track ! 0.75in ! 0.5in ! 0.62in',
  '213.63':
      'Each track owner shall maintain the surface of its track within the limits prescribed in the following table',
  '213.63a':
      'Track Surface Deviation Max ! Class 1 ! Class 2 ! Class 3 ! Class 4 ! Class 5\nIn 31ft of rail at the end of a raise ! 3.5in ! 3in ! 2in ! 1.5in ! 1in \n From uniform profile on either rail in 62ft ! 3in ! 2.75in ! 2.25in ! 2in ! 1.25in \n From zero crosslevel at any point on tangent or from reverse crosslevel on curves ! 3in ! 2in ! 1.75in ! 1.25in ! 1in \n Difference in crosslevel between any two points less than 62ft apart ! 3in ! 2.25in ! 2in ! 1.75in ! 1.5in',
  '213.103':
      'Unless it is otherwise structurally supported, all track shall be supported by material which will',
  '213.103a':
      'Transmit and distribute the load of the track and railroad rolling equipment to the subgrade',
  '213.103b':
      'Restrain the track laterally, longitudinally, and vertically under dynamic loads imposed by railroad rolling equipment and thermal stress exerted by the rails',
  '213.103c': 'Provide adequate drainage for the track',
  '213.103d': 'Maintain proper track crosslevel, surface, and alinement',
  '213.109a':
      'Crossties shall be made of a material to which rail can be securely fastened.',
  '213.109b':
      'Each 39-foot segment of track shall have at a minimum:\n     1. A sufficient number of crossties that in a combination prodive effective support that will:\n          i. Hold gage within the limits prescribed in 213.53.\n          ii. Maintain surface within the limits prescribed in 213.63\n          iii. Maintain alinement within the limits prescribed in 213.55\n     2. The minimum number of crossties specified in in B.4 and C or D effectively distributed to support the entire segment.\n     3. At least on non-defective crosstie of specified below in C and D is located at a joint location as specified in E.\n     4. The minimum number of crossties as indicated in the following table:',
  '213.109b4':
      'Track Class ! Tangent and Curves less or equal to 2 Degrees ! Turnout and Curves Greate that 2 Degrees \n Class 1 ! 5 Crossties ! 6 Crossties\n Class 2 ! 8 Crossties ! 9 Crossties \n Class 3 ! 8 Crossties ! 10 Crossties \n Class 4 and 5 ! 12 Crossties ! 14 Crossties',
  '213.109c':
      'Crossties other than concrete counted to satisfy the aboved tables requirements shall not be\n    1. Broken through.\n    2. Split or otherwise impaired to the extent the crosstie will allow ballast to work through or will not hold rail fasteners\n    3. So deteriorated that the crosstie plate or base of rail can move laterally 0.5in relative to the crosstie\n    4. Cut by the crosstie plate through more than 40 percent of a crossties thickness.',
  '213.109d':
      'Concrete crossties counted to satisfy the above tables requirements shall not be:\n     1. Broken through or deteriorated to the extent that prestressing material is visible.\n     2. Deteriorated or broken off in the vicinity of the shoulder or insert so that the fastener assembly can either pull out or move laterally more than 3/8in relative to the crosstie\n     3.Deteriorated such that the base of either rail can move laterally more than 3/8in relative to the crosstie on curves of 2 degrees or greater or more than 1/2in on tangent track or curves less than 2 degrees.\n     4. Deteriorated or abraded at any point under the rail seat to a depth or 1/2in or more.\n     5. Deteriorated such that the crossties fastening or anchoring system is unable to maintain longitudinal rail restraint, or maintain rail hold down, or maintain gage due to insuffiecient fastener toeload.\n     6. Configured with less than two fasteners on the same rail except as provided in 213.127',
  '213.109e':
      'Class 1 and 2 track shall have one crosstie whose centerline is within 24 inches of each rail joint (end) location. Class 3, 4, and 5 track shall have either one crosstie whose centerline is within 18 inches of each rail joint location or two crossties whose centerlines are within 24 inches either side of each rail joint location. The relative position of these crossties is described in the following three diagrams:',
  '213.109f.1':
      'Each rail joint in Class 1 and 2 track shall be supported by at least one crosstie specified in paragraphs (c) and (d) of this section whose centerline is within 48 inches as shown in Figure 1.',
  '213.109f Figure 1': 'Class12109f.png',
  '213.109f.2':
      'Each rail joint in Class 3, 4, and 5 track shall be supported by either at least one crosstie specified in paragraphs (c) and (d) of this section whose centerline is within 36 inches as shown in Figure 2 or,',
  '213.109f Figure 2': 'Class345109f.png',
  '213.109f.3':
      'Two crossties, one on each side of the rail joint, whose centerlines are within 24 inches of the rail joint location as shown in Figure 3.',
  '213.109f Figure 3': 'Class345109f2.png',
  '213.110a':
      'A track owner may elect to implement a Gage Restraint Measurement System (GRMS), supplemented by the use of a Portable Track Loading Fixture (PTLF), to determine compliance with the crosstie and fastener requirements specified in §§ 213.109 and 213.127 provided that\n     1. The track owner notifies the appropriate FRA Regional office at least 30 days prior to the designation of any line segment on which GRMS technology will be implemented.\n     2. The track owner notifies the appropriate FRA Regional office at least 10 days prior to the removal of any line segment from GRMS designation.',
  '213.110b':
      'Initial notification under paragraph (a)(1) of this section shall include:\n     1. Identification of the line segment(s) by timetable designation, milepost limits, class of track, or other identifying criteria.\n     2. The most recent record of million gross tons of traffic per year over the identified segment(s).',
  '213.110c':
      '1. The track owner shall also provide to FRA sufficient technical data to establish compliance with the following minimum design requirements of a GRMS vehicle\n2. Gage restraint shall be measured between the heads of rail-\n     i. At an interval not exceeding 16 inches\n     ii. Under an applied vertical load of no less than 10 kips per rail\n     iii. Under an applied lateral load that provides for a lateral/vertical load ratio of between 0.5 and 1.25  , and a load severity greater than 3 kips but less than 8 kips per rail.',
  '213.110d':
      'Load severity is defined by the formula:  S = L - cV\n \n     Where:\n     S = Load Severity(kips)\n     L = Actual lateral load applied(kips)\n     c = Coefficient of friction between rail/tie, which is assigned a nominal value of 0.4\n     V = Actual verticle load applied(kips), or static verticle wheel load if verticle load is not measured.',
  '213.110e':
      'The measured gage values shall be converted to a Projected Loaded Gage 24 (PLG24) as follows \nPLG24 = UTG + A × (LTG−UTG)\n\nWhere - \n     UTG = Unloaded track gage measured by the GRMS vehicle at a point no less than 10 feet from any lateral or vertical load application.\n     LTG = Loaded track gage measured by the GRMS vehicle at a point no more than 12 inches from the lateral load application point.\n     A = The extrapolation factor used to convert the measured loaded gage to expected loaded gage under a 24-kip lateral load and a 33-kip vertical load.',
  '213.110f': '',
  '213.110g':
      'The GRMS vehicle shall be capable of producing output reports that provide a trace, on a constant-distance scale, of all parameters specified in paragraph (l) of this section.',
  '213.110h':
      'The GRMS vehicle shall be capable of providing an exception report containing a systematic listing of all exceptions, by magnitude and location, to all the parameters specified in paragraph (l) of this section.',
  '213.110i':
      'The exception reports required by this section shall be provided to the appropriate person designated as fully qualified under § 213.7 prior to the next inspection required under § 213.233.',
  '213.110j':
      'The track owner shall institute the necessary procedures for maintaining the integrity of the data collected by the GRMS and PTLF systems. At a minimum, the track owner shall - \n     (1) Maintain and make available to the Federal Railroad Administration documented calibration procedures on each GRMS vehicle which, at a minimum, shall specify a daily instrument verification procedure that will ensure correlation between measurements made on the ground and those recorded by the instrumentation with respect to loaded and unloaded gage parameters;\n     (2) Maintain each PTLF used for determining compliance with the requirements of this section such that the 4,000-pound reading is accurate to within five percent of that reading.',
  '213.110k':
      'The track owner shall provide training in GRMS technology to all persons designated as fully qualified under § 213.7 and whose territories are subject to the requirements of this section. The training program shall be made available to the Federal Railroad Administration upon request. At a minimum, the training program shall address - \n     (1) Basic GRMS procedures; \n     (2) Interpretation and handling of exception reports generated by the GRMS vehicle; \n     (3) Locating and verifying defects in the field; \n     (4) Remedial action requirements; \n     (5) Use and calibration of the PTLF; and \n     (6) Recordkeeping requirements.',
  '213.110l':
      'The GRMS record of lateral restraint shall identify two exception levels. At a minimum, the track owner shall initiate the required remedial action at each exception level as defined in the following table -',
  '213.110l1':
      'GRMS parameters ! If measurement value exceeds ! Remedial action required \n First ! Level ! Exception \n UTG ! 58 inches ! (1) Immediately protect the exception location with a 10 m.p.h. speed restriction, then verify location; (2) Restore lateral restraint and maintain in compliance with PTLF criteria as described in paragraph (m) of this section; and (3) Maintain compliance with § 213.53(b) as measured with the PTLF. \n LTG ! 58 inches !   \n PLG24 ! 59 inches !  \n GWP ! 1 inch !  \n  Second ! Level ! Exception  \n LTG ! 57.75 inches on Class 4 and 5 track ! (1) Limit operating speed to no more than the maximum allowable under § 213.9 for Class 3 track, then verify location; (2) Maintain in compliance with PTLF criteria as described in paragraph (m) of this section; and (3) Maintain compliance with § 213.53(b) as measured with the PTLF.\n PLG24 ! 58 inches !   \n GWP ! 0.75 inches !  ',
  '213.110m':
      'Between GRMS inspections, the PTLF may be used as an additional analytical tool to assist fully qualified § 213.7 individuals in determining compliance with the crosstie and fastener requirements of §§ 213.109 and 213.127. When the PTLF is used, whether as an additional analytical tool or to fulfill the requirements of paragraph (l), it shall be used subject to the following criteria - \n     (1) At any location along the track that the PTLF is applied, that location will be deemed in compliance with the crosstie and fastener requirements specified in §§ 213.109 and 213.127 provided that - \n          (i) The total gage widening at that location does not exceed 5/8 inch when increasing the applied force from 0 to 4,000 pounds; and \n          (ii) The gage of the track under 4,000 pounds of applied force does not exceed the allowable gage prescribed in § 213.53(b) for the class of track. \n     (2) Gage widening in excess of 5⁄8 inch shall constitute a deviation from Class 1 standards. \n     (3) A person designated as fully qualified under § 213.7 retains the discretionary authority to prescribe additional remedial actions for those locations which comply with the requirements of paragraph (m)(1)(i) and (ii) of this section. \n     (4) When a functional PTLF is not available to a fully qualified person designated under § 213.7, the criteria for determining crosstie and fastener compliance shall be based solely on the requirements specified in §§ 213.109 and 213.127. \n     (5) If the PTLF becomes non-functional or is missing, the track owner will replace or repair it before the next inspection required under § 213.233. \n     (6) Where vertical loading of the track is necessary for contact with the lateral rail restraint components, a PTLF test will not be considered valid until contact with these components is restored under static loading conditions.',
  '213.110n':
      'The track owner shall maintain a record of the two most recent GRMS inspections at locations which meet the requirements specified in § 213.241(b). At a minimum, records shall indicate the following - \n     (1) Location and nature of each First Level exception; and \n     (2) Nature and date of remedial action, if any, for each exception identified in paragraph (n)(1) of this section.',
  '213.110o':
      'The inspection interval for designated GRMS line segments shall be such that - \n     (1) On line segments where the annual tonnage exceeds two million gross tons, or where the maximum operating speeds for passenger trains exceeds 30 mph, GRMS inspections must be performed annually at an interval not to exceed 14 months; or \n     (2) On line segments where the annual tonnage is two million gross tons or less and the maximum operating speed for passenger trains does not exceed 30 mph, the interval between GRMS inspections must not exceed 24 months.',
  '213.110p':
      'As used in this section - \n     (1) Gage Restraint Measurement System (GRMS)  means a track loading vehicle meeting the minimum design requirements specified in this section. \n     (2) Gage Widening Projection (GWP)  means the measured gage widening, which is the difference between loaded and unloaded gage, at the applied loads, projected to reference loads of 16 kips of lateral force and 33 kips of vertical force. \n     (3) L/V ratio  means the numerical ratio of lateral load applied at a point on the rail to the vertical load applied at that same point. GRMS design requirements specify an L/V ratio of between 0.5 and 1.25. \n     (4) Load severity  means the amount of lateral load applied to the fastener system after friction between rail and tie is overcome by any applied gage-widening lateral load. \n     (5) Loaded Track Gage (LTG)  means the gage measured by the GRMS vehicle at a point no more than 12 inches from the lateral load application point. \n     (6) Portable Track Loading Fixture (PTLF)  means a portable track loading device capable of applying an increasing lateral force from 0 to 4,000 pounds on the web/base fillet of each rail simultaneously. \n     (7) Projected Loaded Gage (PLG)  means an extrapolated value for loaded gage calculated from actual measured loads and deflections. PLG 24 means the extrapolated value for loaded gage under a 24,000 pound lateral load and a 33,000 pound vertical load. \n     (8) Unloaded Track Gage (UTG)  means the gage measured by the GRMS vehicle at a point no less than 10 feet from any lateral or vertical load.',
  '213.113a':
      'When an owner of track learns that a rail in the track contains any of the defects listed in the table contained in paragraph (c) of this section, a person designated under § 213.7 shall determine whether the track may continue in use. If the designated person determines that the track may continue in use, operation over the defective rail is not permitted until\n     1. The rail is replaced or repaired\n     2. The remedial action prescribed in the table contained in paragraph (c) of this section is initiated.',
  '213.113b':
      'When an owner of track learns that a rail in the track contains an indication of any of the defects listed in the table contained in paragraph (c) of this section, the track owner shall verify the indication. Except as provided in § 213.240, the track owner must verify the indication within four hours, unless the track owner has an indication of the existence of a defect that requires remedial action A, A2, or B identified in the table contained in paragraph (c) of this section, in which case the track owner must immediately verify the indication. If the indication is verified, the track owner must -\n     1. Replace or repair the rail\n     2. Initiate the remedial action prescribed in the table contained in paragraph (c) of this section.',
  '213.113c':
      'A track owner who learns that a rail contains one of the following defects shall prescribe the remedial action specified if the rail is not replaced or repaired, in accordance with this paragraphs table: ',
  '213.113c Figure 1': '213113d.png',
  '213.113c.2':
      '     A. Assign a person designated under 213.7 to visually supervise each operation over the defective rail.\n     A2. Assign a person designated under 213.7 to make a visual inspection. After a visual inspection, that person may authorize operation to continue without continuous visual supervision at a maximum of 10 mph for up to 24 hours prior to another such visual inspection or replacement or repair of the rail\n     B. Limit operation speed over the defective rail to that as authorized by a person designated under 213.7(a), who has at least one year of supervisory experience in railroad track maintenance. The operating speed cannot be over 30mph, or the maximum allowable speed under 213.9 for the class of track concerned, whichever is lower.\n     C. Apply joint bars bolted only through the outermost holes to the defect within 10 days after it is determined to continue the track in use. In the case of Class 3 through 5 track, limit the operating speed over the defective rail to 30 mph until joint bars are applied; thereafter, limit the speed to 50mph or the maximum allowable speed under 213.9 for the class of track concerned, whichever is lower. When a search for internal rail defects is conducted under 213.237, and defects are discovered in Class 3 through 5 track that require remedial action C, the operating speed shall be limited to 50mph or the maximum allowable speed under 213.9 for the class of track concerned, whichever is lower, for a period not to exceed 4 days. If the defective rail has not be removed from the track or a permanent repair made within 4 days of the discovery, limit operating speed over the defective rail to 30mph until joint bars are applied; thereafter, limit speed to 50mph or the maximum allowable speed under 213.9 for the class of track concerned, whichever is lower. When joint bars have not been applied within 10 days, the speed must be limited to 10 mph until joint bars are applied.\n     D. Apply joint bars bolted only though the outermost holes to the defect within 7 days after it is determined to continue the track in use. In the case of Class 3 through 5 track limit operating speed over the defective rail to 30mph or less as authorized by a person designated under 213.7(a), who has at least one year of supervisory experience in railroad track maintenance, until joint bars are applied; thereafter, limit speed to 50mph or the maximum allowable speed under 213.9 for the class of track concerned, whichever is lower. When joint bars have not been applied within 7 days, the speed must be limited to 10 mph until the joint bars are applied.\n     E. Apply joint bars to the defect and bolt in accordance with 213.121(d) and (e)\n     F. Inspect the rail within 90 days after it is determined to continue the track in use. If the rail remains in the track and is not replaced or repaired, the reinspection cycle starts over with each successive reinspection unless the reinspection reveals the rail defect to have increased in size and therefore become subject to a more restrictive remedial action. This process continues indefinitely until the rail is removed from the track or repaired. If not inspected within 90 days, limit speed to that for Class 2 track or the maximum allowable speed under 213.9 for the class of track concerned, whichever is lower, until it is inspected.\n     G. Inspect rail within 30 days after it is determined to continue the track in use. If the rail remains in the track and is not replaced or repaired, the reinspection cycle starts over with each successive reinspection unless the reinspection reveals the rail defect to have increased in size and therefore become subject to a more restrictive remedial action. This process continues indefinitely until the rail is removed from the track or repaired. If not inspected within 30 days, limit speed to that for Class 2 track or the maximum allowable speed under 213.9 for the class of track concerned, whichever is lower, until it is inspected.\n     H. Limit operating speed over the defective rail to 50 mph or the maximum allowable speed under 213.9 for the class of track concerned, whichever is lower.\n     I.  Limit operating speed over the defective rail to 30 mph or the maximum allowable speed under 213.9 for the class of track concerned, whichever is lower.',
  '213.113d':
      'As used in this section - \n     (1) Bolt hole crack  means a crack across the web, originating from a bolt hole, and progressing on a path either inclined upward toward the rail head or inclined downward toward the base. Fully developed bolt hole cracks may continue horizontally along the head/web or base/web fillet, or they may progress into and through the head or base to separate a piece of the rail end from the rail. Multiple cracks occurring in one rail end are considered to be a single defect. However, bolt hole cracks occurring in adjacent rail ends within the same joint must be reported as separate defects. \n     (2) Broken base  means any break in the base of the rail. \n     (3) Compound fissure  means a progressive fracture originating from a horizontal split head that turns up or down, or in both directions, in the head of the rail. Transverse development normally progresses substantially at a right angle to the length of the rail. \n     (4) Crushed head  means a short length of rail, not at a joint, which has drooped or sagged across the width of the rail head to a depth of 3/8 inch or more below the rest of the rail head and 8 inches or more in length. Unlike flattened rail where the depression is visible on the rail head only, the sagging or drooping is also visible in the head/web fillet area. \n     (5) Damaged rail  means any rail broken or otherwise damaged by a derailment, broken, flat, or unbalanced wheel, wheel slipping, or similar causes. \n     (6) Defective weld  means a field or plant weld containing any discontinuities or pockets, exceeding 5 percent of the rail head area individually or 10 percent in the aggregate, oriented in or near the transverse plane, due to incomplete penetration of the weld metal between the rail ends, lack of fusion between weld and rail end metal, entrainment of slag or sand, under-bead or shrinkage cracking, or fatigue cracking. Weld defects may originate in the rail head, web, or base, and in some cases, cracks may progress from the defect into either or both adjoining rail ends. If the weld defect progresses longitudinally through the weld section, the defect is considered a split web for purposes of remedial action required by this section. \n     (7) Detail fracture  means a progressive fracture originating at or near the surface of the rail head. These fractures should not be confused with transverse fissures, compound fissures, or other defects which have internal origins. Detail fractures may arise from shelled spots, head checks, or flaking. \n     (8) Engine burn fracture  means a progressive fracture originating in spots where driving wheels have slipped on top of the rail head. In developing downward these fractures frequently resemble the compound or even transverse fissures with which they should not be confused or classified. \n     (9) Flattened rail  means a short length of rail, not at a joint, which has flattened out across the width of the rail head to a depth of 3⁄8 inch or more below the rest of the rail and 8 inches or more in length. Flattened rail occurrences have no repetitive regularity and thus do not include corrugations, and have no apparent localized cause such as a weld or engine burn. Their individual length is relatively short, as compared to a condition such as head flow on the low rail of curves.\n      (10) Head and web separation  means a progressive fracture, longitudinally separating the head from the web of the rail at the head fillet area. \n      (11) Horizontal split head  means a horizontal progressive defect originating inside of the rail head, usually 1⁄4 inch or more below the running surface and progressing horizontally in all directions, and generally accompanied by a flat spot on the running surface. The defect appears as a crack lengthwise of the rail when it reaches the side of the rail head. \n     (12) Ordinary break  means a partial or complete break in which there is no sign of a fissure, and in which none of the other defects described in this paragraph (d) is found. \n     (13) Piped rail  means a vertical split in a rail, usually in the web, due to failure of the shrinkage cavity in the ingot to unite in rolling. \n     (14) Split web  means a lengthwise crack along the side of the web and extending into or through it.\n     (15) Transverse fissure  means a progressive crosswise fracture starting from a crystalline center or nucleus inside the head from which it spreads outward as a smooth, bright, or dark round or oval surface substantially at a right angle to the length of the rail. The distinguishing features of a transverse fissure from other types of fractures or defects are the crystalline center or nucleus and the nearly smooth surface of the development which surrounds it.\n     (16) Vertical split head  means a vertical split through or near the middle of the head, and extending into or through it. A crack or rust streak may show under the head close to the web or pieces may be split off the side of the head.',
  '213.115':
      'Any mismatch of rails at joints may not be more than that prescribed by the following table',
  '213.115a':
      'Class of Track ! Max on the tread of the rail ends ! Max on the gage side of the rail ends \n Class 1 ! 1/4in ! 1/4in \n Class 2 ! 1/4in ! 3/16in \n Class 3 ! 3/16in ! 3/16in \n Class 4 and 5 ! 1/8in ! 1/8in',
  '213.118a':
      'Each track owner with track constructed of CWR shall have in effect and comply with a plan that contains written procedures which address: the installation, adjustment, maintenance, and inspection of CWR; inspection of CWR joints; and a training program for the application of those procedures.',
  '213.118b':
      'The track owner shall file its CWR plan with the FRA Associate Administrator for Railroad Safety/Chief Safety Officer (Associate Administrator). Within 30 days of receipt of the submission, FRA will review the plan for compliance with this subpart. FRA will approve, disapprove or conditionally approve the submitted plan, and will provide written notice of its determination.',
  '213.118c':
      'The track owners existing plan shall remain in effect until the track owners new plan is approved or conditionally approved and is effective pursuant to paragraph (d) of this section.',
  '213.118d':
      'The track owner shall, upon receipt of FRAs approval or conditional approval, establish the plans effective date. The track owner shall advise in writing FRA and all affected employees of the effective date.',
  '213.118e':
      'FRA, for cause stated, may, subsequent to plan approval or conditional approval, require revisions to the plan to bring the plan into conformity with this subpart. Notice of a revision requirement shall be made in writing and specify the basis of FRAs requirement. The track owner may, within 30 days of the revision requirement, respond and provide written submissions in support of the original plan. FRA renders a final decision in writing. Not more than 30 days following any final decision requiring revisions to a CWR plan, the track owner shall amend the plan in accordance with FRAs decision and resubmit the conforming plan. The conforming plan becomes effective upon its submission to FRA.',
  '213.119a':
      'Procedures for the installation and adjustment of CWR which include -\n     (1) Designation of a desired rail installation temperature range for the geographic area in which the CWR is located;\n     (2) De-stressing procedures/methods which address proper attainment of the desired rail installation temperature range when adjusting CWR.',
  '213.119b':
      'Rail anchoring or fastening requirements that will provide sufficient restraint to limit longitudinal rail and crosstie movement to the extent practical, and specifically addressing CWR rail anchoring or fastening patterns on bridges, bridge approaches, and at other locations where possible longitudinal rail and crosstie movement associated with normally expected train-induced forces, is restricted.',
  '213.119c':
      'CWR joint installation and maintenance procedures which require that - \n     (1) Each rail shall be bolted with at least two bolts at each CWR joint; \n      (2) In the case of a bolted joint installed during CWR installation after October 21, 2009, the track owner shall either, within 60 days - \n          (i) Weld the joint; \n          (ii) Install a joint with six bolts; or \n          (iii) Anchor every tie 195 feet in both directions from the joint;\n     (3) In the case of a bolted joint in CWR experiencing service failure or a failed bar with a rail gap present, the track owner shall either - \n          (i) Weld the joint; \n          (ii) Replace the broken bar(s), replace the broken bolts, adjust the anchors and, within 30 days, weld the joint; \n          (iii) Replace the broken bar(s), replace the broken bolts, install one additional bolt per rail end, and adjust anchors; \n          (iv) Replace the broken bar(s), replace the broken bolts, and anchor every tie 195 feet in both directions from the CWR joint; or \n          (v) Replace the broken bar(s), replace the broken bolts, add rail with provisions for later adjustment pursuant to paragraph (d)(2) of this section, and reapply the anchors.',
  '213.119d':
      'Procedures which specifically address maintaining a desired rail installation temperature range when cutting CWR, including rail repairs, in-track welding, and in conjunction with adjustments made in the area of tight track, a track buckle, or a pull-apart. Rail repair practices shall take into consideration existing rail temperature so that - \n     (1) When rail is removed, the length installed shall be determined by taking into consideration the existing rail temperature and the desired rail installation temperature range; and \n     (2) Under no circumstances should rail be added when the rail temperature is below that designated by paragraph (a)(1) of this section, without provisions for later adjustment.',
  '213.119e':
      'Procedures which address the monitoring of CWR in curved track for inward shifts of alinement toward the center of the curve as a result of disturbed track.',
  '213.119f':
      'Procedures which govern train speed on CWR track when -\n     (1) Maintenance work, track rehabilitation, track construction, or any other event occurs which disturbs the roadbed or ballast section and reduces the lateral or longitudinal resistance of the track; and \n     (2) The difference between the average rail temperature and the average rail neutral temperature is in a range that causes buckling-prone conditions to be present at a specific location; and \n     (3) In formulating the procedures under paragraphs (f)(1) and (f)(2) of this section, the track owner shall - \n          (i) Determine the speed required, and the duration and subsequent removal of any speed restriction based on the restoration of the ballast, along with sufficient ballast re-consolidation to stabilize the track to a level that can accommodate expected train-induced forces. Ballast re-consolidation can be achieved through either the passage of train tonnage or mechanical stabilization procedures, or both; and \n          (ii) Take into consideration the type of crossties used.',
  '213.119g':
      'Procedures which prescribe when physical track inspections are to be performed. \n     (1) At a minimum, these procedures shall address inspecting track to identify - \n          (i) Buckling-prone conditions in CWR track, including - \n               (A) Locations where tight or kinky rail conditions are likely to occur; and \n               (B) Locations where track work of the nature described in paragraph (f)(1)(i) of this section has recently been performed; and \n          (ii) Pull-apart prone conditions in CWR track, including locations where pull-apart or stripped-joint rail conditions are likely to occur; and \n     (2) In formulating the procedures under paragraph (g)(1) of this section, the track owner shall - \n          (i) Specify when the inspections will be conducted; and \n          (ii) Specify the appropriate remedial actions to be taken when either buckling-prone or pull-apart prone conditions are found.',
  '213.119h':
      'Procedures which prescribe the scheduling and conduct of inspections to detect cracks and other indications of potential failures in CWR joints. In formulating the procedures under this paragraph, the track owner shall - \n     (1) Address the inspection of joints and the track structure at joints, including, at a minimum, periodic on-foot inspections; \n     (2) Identify joint bars with visible or otherwise detectable cracks and conduct remedial action pursuant to § 213.121; \n     (3) Specify the conditions of actual or potential joint failure for which personnel must inspect, including, at a minimum, the following items: \n          (i) Loose, bent, or missing joint bolts; \n          (ii) Rail end batter or mismatch that contributes to instability of the joint; and \n          (iii) Evidence of excessive longitudinal rail movement in or near the joint, including, but not limited to; wide rail gap, defective joint bolts, disturbed ballast, surface deviations, gap between tie plates and rail, or displaced rail anchors;\n     (4) Specify the procedures for the inspection of CWR joints that are imbedded in highway-rail crossings or in other structures that prevent a complete inspection of the joint, including procedures for the removal from the joint of loose material or other temporary material; \n     (5) Specify the appropriate corrective actions to be taken when personnel find conditions of actual or potential joint failure, including on-foot follow-up inspections to monitor conditions of potential joint failure in any period prior to completion of repairs; \n     (6) Specify the timing of periodic inspections, which shall be based on the configuration and condition of the joint: \n          (i) Except as provided in paragraphs (h)(6)\n          (ii) through (h)(6)(iv) of this section, track owners must specify that all CWR joints are inspected, at a minimum, in accordance with the intervals identified in the following table:\n          (ii) Consistent with any limitations applied by the track owner, a passenger train conducting an unscheduled detour operation may proceed over track not normally used for passenger operations at a speed not to exceed the maximum authorized speed otherwise allowed, even though CWR joints have not been inspected in accordance with the frequency identified in paragraph (h)(6)(i) of this section, provided that: \n               (A) All CWR joints have been inspected consistent with requirements for freight service; and \n               (B) The unscheduled detour operation lasts no more than 14 consecutive calendar days. In order to continue operations beyond the 14-day period, the track owner must inspect the CWR joints in accordance with the requirements of paragraph (h)(6)(i) of this section. \n          (iii) Tourist, scenic, historic, or excursion operations, if limited to the maximum authorized speed for passenger trains over the next lower class of track, need not be considered in determining the frequency of inspections under paragraph (h)(6)(i) of this section. \n          (iv) All CWR joints that are located in switches, turnouts, track crossings, lift rail assemblies or other transition devices on moveable bridges must be inspected on foot at least monthly, consistent with the requirements in § 213.235; and all records of those inspections must be kept in accordance with the requirements in § 213.241. A track owner may include in its § 213.235 inspections, in lieu of the joint inspections required by paragraph (h)(6)(i) of this section, CWR joints that are located in track structure that is adjacent to switches and turnouts, provided that the track owner precisely defines the parameters of that arrangement in the CWR plans. \n     (7) Specify the recordkeeping requirements related to joint bars in CWR, including the following: \n          (i) The track owner shall keep a record of each periodic and follow-up inspection required to be performed by the track owners CWR plan, except for those inspections conducted pursuant to § 213.235 for which track owners must maintain records pursuant to § 213.241. The record shall be prepared on the day the inspection is made and signed by the person making the inspection. The record shall include, at a minimum, the following items: the boundaries of the territory inspected; the nature and location of any deviations at the joint from the requirements of this part or of the track owners CWR plan, with the location identified with sufficient precision that personnel could return to the joint and identify it without ambiguity; the date of the inspection; the remedial action, corrective action, or both, that has been taken or will be taken; and the name or identification number of the person who made the inspection. \n          (ii) [Reserved] \n     (8) In lieu of the requirements for the inspection of rail joints contained in paragraphs (h)(1) through (h)(7) of this section, a track owner may seek approval from FRA to use alternate procedures. \n          (i) The track owner shall submit the proposed alternate procedures and a supporting statement of justification to the Associate Administrator. \n          (ii) If the Associate Administrator finds that the proposed alternate procedures provide an equivalent or higher level of safety than the requirements in paragraphs (h)(1) through (h)(7) of this section, the Associate Administrator will approve the alternate procedures by notifying the track owner in writing. The Associate Administrator will specify in the written notification the date on which the procedures will become effective, and after that date, the track owner shall comply with the procedures. If the Associate Administrator determines that the alternate procedures do not provide an equivalent level of safety, the Associate Administrator will disapprove the alternate procedures in writing, and the track owner shall continue to comply with the requirements in paragraphs (h)(1) through (h)(7) of this section. \n         (iii) While a determination is pending with the Associate Administrator on a request submitted pursuant to paragraph (h)(8) of this section, the track owner shall continue to comply with the requirements contained in paragraphs (h)(1) through (h)(7) of this section.',
  '213.119i':
      'The track owner shall have in effect a comprehensive training program for the application of these written CWR procedures, with provisions for annual re-training, for those individuals designated under § 213.7(c) as qualified to supervise the installation, adjustment, and maintenance of CWR track and to perform inspections of CWR track. The track owner shall make the training program available for review by FRA upon request.',
  '213.119j':
      'The track owner shall prescribe and comply with recordkeeping requirements necessary to provide an adequate history of track constructed with CWR. At a minimum, these records must include: \n     (1) Rail temperature, location, and date of CWR installations. Each record shall be retained for at least one year; \n     (2) A record of any CWR installation or maintenance work that does not conform to the written procedures. Such record shall include the location of the rail and be maintained until the CWR is brought into conformance with such procedures; and \n     (3) Information on inspection of rail joints as specified in paragraph (h)(7) of this section.',
  '213.119k':
      'The track owner shall make readily available, at every job site where personnel are assigned to install, inspect or maintain CWR, a copy of the track owners CWR procedures and all revisions, appendices, updates, and referenced materials related thereto prior to their effective date. Such CWR procedures shall be issued and maintained in one CWR standards and procedures manual.',
  '213.119l':
      'As used in this section - \n     Adjusting/de-stressing   means a procedure by which a rails neutral temperature is re-adjusted to the desired value. It typically consists of cutting the rail and removing rail anchoring devices, which provides for the necessary expansion and contraction, and then re-assembling the track. \n     Annual re-training   means training every calendar year. \n     Buckling incident   means the formation of a lateral misalignment sufficient in magnitude to constitute a deviation from the Class 1 requirements specified in § 213.55. These normally occur when rail temperatures are relatively high and are caused by high longitudinal compressive forces. \n     Buckling-prone condition   means a track condition that can result in the track being laterally displaced due to high compression forces caused by critical rail temperature combined with insufficient track strength and/or train dynamics. \n     Continuous welded rail (CWR)   means rail that has been welded together into lengths exceeding 400 feet. Rail installed as CWR remains CWR, regardless of whether a joint or plug is installed into the rail at a later time. \n     Corrective actions   mean those actions which track owners specify in their CWR plans to address conditions of actual or potential joint failure, including, as applicable, repair, restrictions on operations, and additional on-foot inspections. \n     CWR join  t means any joint directly connected to CWR. \n     Desired rail installation temperature range   means the rail temperature range, within a specific geographical area, at which forces in CWR should not cause a buckling incident in extreme heat, or a pull apart during extreme cold weather. \n     Disturbed track   means the disturbance of the roadbed or ballast section, as a result of track maintenance or any other event, which reduces the lateral or longitudinal resistance of the track, or both. \n     Mechanical stabilization   means a type of procedure used to restore track resistance to disturbed track following certain maintenance operations. This procedure may incorporate dynamic track stabilizers or ballast consolidators, which are units of work equipment that are used as a substitute for the stabilization action provided by the passage of tonnage trains. \n     Pull apart or stripped joint   means a condition when no bolts are mounted through a joint on the rail end, rending the joint bar ineffective due to excessive expansive or contractive forces. \n     Pull-apart prone condition   means a condition when the actual rail temperature is below the rail neutral temperature at or near a joint where longitudinal tensile forces may affect the fastenings at the joint. \n     Rail anchors   mean those devices which are attached to the rail and bear against the side of the crosstie to control longitudinal rail movement. Certain types of rail fasteners also act as rail anchors and control longitudinal rail movement by exerting a downward clamping force on the upper surface of the rail base. \n     Rail neutral temperature   is the temperature at which the rail is neither in compression nor tension. \n     Rail temperature   means the temperature of the rail, measured with a rail thermometer. \n     Remedial actions   mean those actions which track owners are required to take as a result of requirements of this part to address a non-compliant condition. \n     Tight/kinky rail   means CWR which exhibits minute alinement irregularities which indicate that the rail is in a considerable amount of compression. \n     Tourist, scenic, historic, or excursion operations   mean railroad operations that carry passengers with the conveyance of the passengers to a particular destination not being the principal purpose.\n     Track lateral resistance   means the resistance provided by the rail/crosstie structure against lateral displacement. \n     Track longitudinal resistance   means the resistance provided by the rail anchors/rail fasteners and the ballast section to the rail/crosstie structure against longitudinal displacement. \n     Train-induced forces   means the vertical, longitudinal, and lateral dynamic forces which are generated during train movement and which can contribute to the buckling potential of the rail. \n     Unscheduled detour operation   means a short-term, unscheduled operation where a track owner has no more than 14 calendar days notice that the operation is going to occur.',
  '213.121a':
      'Each rail joint, insulated joint, and compromise joint shall be of a structurally sound design and dimensions for the rail on which it is applied.',
  '213.121b':
      'If a joint bar on Classes 3 through 5 track is cracked, broken, or because of wear allows excessive vertical movement of either rail when all bolts are tight, it shall be replaced.',
  '213.121c':
      'If a joint bar is cracked or broken between the middle two bolt holes it shall be replaced.',
  '213.121d':
      'In the case of conventional jointed track, each rail shall be bolted with at least two bolts at each joint in Classes 2 through 5 track, and with at least one bolt in Class 1 track.',
  '213.121e':
      'In the case of continuous welded rail track, each rail shall be bolted with at least two bolts at each joint.',
  '213.121f':
      'Each joint bar shall be held in position by track bolts tightened to allow the joint bar to firmly support the abutting rail ends and to allow longitudinal movement of the rail in the joint to accommodate expansion and contraction due to temperature variations. When no-slip, joint-to-rail contact exists by design, the requirements of this paragraph do not apply. Those locations when over 400 feet in length, are considered to be continuous welded rail track and shall meet all the requirements for continuous welded rail track prescribed in this part.',
  '213.121g':
      'No rail shall have a bolt hole which is torch cut or burned in Classes 2 through 5 track. For Class 2 track, this paragraph (g) is applicable September 21, 1999.',
  '213.121h':
      'No joint bar shall be reconfigured by torch cutting in Classes 3 through 5 track.',
  '213.122a':
      'Except as a temporary repair in emergency situations no rail having a torch cut end shall be used in Classes 3 through 5 track. When a rail end is torch cut in emergency situations, train speed over that rail end shall not exceed the maximum allowable for Class 2 track. For existing torch cut rail ends in Classes 3 through 5 track the following shall apply - \n     (1) Within one year of September 21, 1998, all torch cut rail ends in Class 5 track shall be removed; \n     (2) Within two years of September 21, 1998, all torch cut rail ends in Class 4 track shall be removed; and \n     (3) Within one year of September 21, 1998, all torch cut rail ends in Class 3 track over which regularly scheduled passenger trains operate, shall be inventoried by the track owner.',
  '213.122b':
      'Following the expiration of the time limits specified in paragraphs (a)(1), (2), and (3) of this section, any torch cut rail end not removed from Classes 4 and 5 track, or any torch cut rail end not inventoried in Class 3 track over which regularly scheduled passenger trains operate, shall be removed within 30 days of discovery. Train speed over that rail end shall not exceed the maximum allowable for Class 2 track until removed.',
  '213.123a':
      'In Classes 3 through 5 track where timber crossties are in use there shall be tie plates under the running rails on at least eight of any 10 consecutive ties.',
  '213.123b':
      'In Classes 3 through 5 track no metal object which causes a concentrated load by solely supporting a rail shall be allowed between the base of the rail and the bearing surface of the tie plate. This paragraph (b) is applicable September 21, 1999.)',
  '213.127a':
      'Track shall be fastened by a system of components that effectively maintains gage within the limits prescribed in § 213.53(b). Each component of each such system shall be evaluated to determine whether gage is effectively being maintained.',
  '213.127b':
      'If rail anchors are applied to concrete crossties, the combination of the crossties, fasteners, and rail anchors must provide effective longitudinal restraint.',
  '213.127c':
      'Where fastener placement impedes insulated joints from performing as intended, the fastener may be modified or removed, provided that the crosstie supports the rail.',
  '213.133a':
      'In turnouts and track crossings, the fastenings shall be intact and maintained so as to keep the components securely in place. Also, each switch, frog, and guard rail shall be kept free of obstructions that may interfere with the passage of wheels.',
  '213.133b':
      'Classes 3 through 5 track shall be equipped with rail anchoring through and on each side of track crossings and turnouts, to restrain rail movement affecting the position of switch points and frogs. For Class 3 track, this paragraph (b) is applicable September 21, 1999.)',
  '213.133c':
      'Each flangeway at turnouts and track crossings shall be at least 1.5 inches wide.',
  '213.135a':
      'Each stock rail must be securely seated in switch plates, but care shall be used to avoid canting the rail by overtightening the rail braces.',
  '213.135b':
      'Each switch point shall fit its stock rail properly, with the switch stand in either of its closed positions to allow wheels to pass the switch point. Lateral and vertical movement of a stock rail in the switch plates or of a switch plate on a tie shall not adversely affect the fit of the switch point to the stock rail. Broken or cracked switch point rails will be subject to the requirements of § 213.113, except that where remedial actions C, D, or E require the use of joint bars, and joint bars cannot be placed due to the physical configuration of the switch, remedial action B will govern, taking into account any added safety provided by the presence of reinforcing bars on the switch points.',
  '213.135c':
      'Each switch shall be maintained so that the outer edge of the wheel tread cannot contact the gage side of the stock rail.',
  '213.135d':
      'The heel of each switch rail shall be secure and the bolts in each heel shall be kept tight.',
  '213.135e':
      'Each switch stand and connecting rod shall be securely fastened and operable without excessive lost motion.',
  '213.135f':
      'Each throw lever shall be maintained so that it cannot be operated with the lock or keeper in place.',
  '213.135g':
      'Each switch position indicator shall be clearly visible at all times.',
  '213.135h':
      'Unusually chipped or worn switch points shall be repaired or replaced. Metal flow shall be removed to insure proper closure.',
  '213.135i':
      'Tongue & Plain Mate switches, which by design exceed Class 1 and excepted track maximum gage limits, are permitted in Class 1 and excepted track.',
  '213.137a':
      'Except as provided in paragraph (e) of this section, the flangeway depth measured from a plane across the wheel-bearing area of a frog on Class 1 track shall not be less than 1 3/8 inches, or less than 1 1/2 inches on Classes 2 through 5 track.',
  '213.137b':
      'If a frog point is chipped, broken, or worn more than five-eighths inch down and 6 inches back, operating speed over the frog shall not be more than 10 m.p.h.',
  '213.137c':
      'If the tread portion of a frog casting is worn down more than three-eighths inch below the original contour, operating speed over that frog shall not be more than 10 m.p.h.',
  '213.137d':
      'Where frogs are designed as flange-bearing, flangeway depth may be less than that shown for Class 1 if operated at Class 1 speeds.',
  '213.137e':
      'The flange depth requirements in paragraph (a) do not apply to a frog designed as a flange-bearing frog (FBF) used in a crossing diamond in Classes 2 through 5 track, provided that the crossing angle is greater than 20 degrees unless movable guard rails are used.',
  '213.139a':
      'The outer edge of a wheel tread shall not contact the gage side of a spring wing rail.',
  '213.139b':
      'The toe of each wing rail shall be solidly tamped and fully and tightly bolted.',
  '213.139c':
      'Each frog with a bolt hole defect or head-web separation shall be replaced.',
  '213.139d':
      'Each spring shall have compression sufficient to hold the wing rail against the point rail.',
  '213.139e':
      'The clearance between the holddown housing and the horn shall not be more than one-fourth of an inch.',
  '213.141a':
      'The raised guard on a self-guarded frog shall not be worn more than three-eighths of an inch.',
  '213.141b':
      'If repairs are made to a self-guarded frog without removing it from service, the guarding face shall be restored before rebuilding the point.',
  '213.143a':
      'The guard check and guard face gages in frogs shall be within the following limits-',
  '213.143a1':
      'Class of Track ! The distance between the gage line of a frog to the guard line of its guard rail or guarding face, measured across the track at right angles to the gage line, may not be less than  ! The distance between guard lines, measured across the track at right angles to the gage line, may not be more than \n Class 1 Track ! 54 1/8 ! 53 1/4 \n Class 2 Track ! 54 1/4 ! 53 1/8 \n Class 3 and 4 ! 54 3/8 ! 53 1/8 \n Class 5 Track ! 54 1/2 ! 53 ',
  '213.143b':
      'For any heavy-point frog (HPF) on Class 5 track, the guard check gage may be less than 54 1/2 but not be less than 54 3/8, provided that:\n     (1) Each HPF and guard rails on both rails through the turnout are equipped with at least three serviceable through-gage plates with elastic rail fasteners and guard rail braces that permit adjustment of the guard check gage without removing spikes or other fasteners from the crossties; and \n     (2) Each HPF bears an identifying mark applied by either the track owner, railroad, or the frog manufacturer that identifies the frog as an HPF.',
  '213.205a': 'Each derail shall be clearly visible.',
  '213.205b':
      'When in a locked position, a derail shall be free of lost motion which would prevent it from performing its intended function.',
  '213.205c': 'Each derail shall be maintained to function as intended.',
  '213.205d':
      'Each derail shall be properly installed for the rail to which it is applied. (This paragraph (d) is applicable September 21, 1999.)',
  '213.233a':
      'All track shall be inspected in accordance with the schedule prescribed in paragraph (c) of this section by a person designated under § 213.7.',
  '213.233b':
      'Each inspection shall be made on foot or by traversing the track in a vehicle at a speed that allows the person making the inspection to visually inspect the track structure for compliance with this part. However, mechanical, electrical, and other track inspection devices may be used to supplement visual inspection. If a vehicle is used for visual inspection, the speed of the vehicle may not be more than 5 m.p.h. when traversing track crossings and turnouts; otherwise, the inspection vehicle speed shall be at the sole discretion of the inspector, based on track conditions and inspection requirements. When traversing the track in a vehicle, the inspection will be subject to the following conditions - \n     (1) One inspector in a vehicle may inspect up to two tracks at one time provided that the inspectors visibility remains unobstructed by any cause and that the second track is not centered more than 30 feet from the track the inspector traverses; \n     (2) Two inspectors in one vehicle may inspect up to four tracks at a time provided that the inspectors visibility remains unobstructed by any cause and that each track being inspected is centered within 39 feet from the track the inspectors traverse; \n     (3) Each main track must be traversed by the vehicle or inspected on foot at least once every two weeks, and each siding must be traversed by the vehicle or inspected on foot at least once every month; and \n     (4) Track inspection records shall indicate which track(s) are traversed by the vehicle or inspected on foot as outlined in paragraph (b)(3) of this section.',
  '213.233c':
      'Class of Track  !  Track of Track  !  Required Frequency  \n Excepted track, and Class 1, 2, and 3 track ! Main track and sidings ! Weekly1 with at least 3 calendar days interval between inspections, or before use, if the track is used less than once a week, or twice weekly with at least 1 calendar day interval between inspections, if the track carries passenger trains2 or more than 10 million gross tons of traffic during the preceding calendar year.  \n Excepted track and Class 1, 2, and 3 track ! Other than main track and sidings ! Monthly with at least 20 calendar days interval between inspections. \n Class 4 and 5 track !    ! Twice weekly with at least 1 calendar day interval between inspections.',
  '213.233d':
      'If the § 213.7 qualified person making the inspection finds a deviation from the requirements of this part, the inspector shall immediately initiate remedial action. Any subsequent movements to facilitate repairs on track that is out of service must be authorized by a § 213.7 qualified person.',
  '213.234a':
      'General.  Except for track described in paragraph (c) of this section, the provisions in this section are applicable on and after July 1, 2012. In addition to the track inspection required under § 213.233, for Class 3 main track constructed with concrete crossties over which regularly scheduled passenger service trains operate, and for Class 4 and 5 main track constructed with concrete crossties, automated inspection technology shall be used as indicated in paragraph (b) of this section, as a supplement to visual inspection, by Class I railroads (including Amtrak), Class II railroads, other intercity passenger railroads, and commuter railroads or small governmental jurisdictions that serve populations greater than 50,000. Automated inspection shall identify and report exceptions to conditions described in § 213.109(d)(4).',
  '213.234b':
      'Frequency of automated inspections.  Automated inspections shall be conducted at the following frequencies: \n     (1) If annual tonnage on Class 4 and 5 main track and Class 3 main track with regularly scheduled passenger service, exceeds 40 million gross tons (mgt) annually, at least twice each calendar year, with no less than 160 days between inspections. \n     (2) If annual tonnage on Class 4 and 5 main track and Class 3 main track with regularly scheduled passenger service is equal to or less than 40 mgt annually, at least once each calendar year. \n     (3) On Class 3, 4, and 5 main track with exclusively passenger service, either an automated inspection or walking inspection must be conducted once per calendar year. \n     (4) Track not inspected in accordance with paragraph (b)(1) or (b)(2) of this section because of train operation interruption shall be reinspected within 45 days of the resumption of train operations by a walking or automated inspection. If this inspection is conducted as a walking inspection, the next inspection shall be an automated inspection as prescribed in this paragraph.',
  '213.234c':
      'Nonapplication.  Sections of tangent track 600 feet or less constructed of concrete crossties, including, but not limited to, isolated track segments, experimental or test track segments, highway-rail crossings, and wayside detectors, are excluded from the requirements of this section.',
  '213.234d':
      'Performance standard for automated inspection measurement system.  The automated inspection measurement system must be capable of indicating and processing rail seat deterioration requirements that specify the following: \n     (1) An accuracy, to within 1⁄8 of an inch; \n     (2) A distance-based sampling interval, which shall not exceed five feet; and \n     (3) Calibration procedures and parameters assigned to the system, which assure that indicated and recorded values accurately represent rail seat deterioration.',
  '213.234e':
      'Exception reports to be produced by system; duty to field-verify exceptions.  The automated inspection measurement system shall produce an exception report containing a systematic listing of all exceptions to § 213.109(d)(4), identified so that an appropriate person(s) designated as fully qualified under § 213.7 can field-verify each exception. \n     (1) Exception reports must be provided to or be made available to all persons designated as fully qualified under § 213.7 and whose territories are subject to the requirements of § 213.234. \n     (2) Each exception must be located and field-verified no later than 48 hours after the automated inspection. \n     (3) All field-verified exceptions are subject to all the requirements of this part. \n     (4) Exception reports must note areas identified between 3⁄8 of an inch and 1⁄2 of an inch as an “alert.”',
  '213.234f':
      'Recordkeeping requirements.  The track owner shall maintain and make available to FRA a record of the inspection data and the exception record for the track inspected in accordance with this paragraph for a minimum of two years. The exception reports must include the following: \n     (1) Date and location of limits of the inspection; \n     (2) Type and location of each exception; \n     (3) Results of field verification; and \n     (4) Remedial action if required.',
  '213.234g':
      'Procedures for integrity of data.  The track owner shall institute the necessary procedures for maintaining the integrity of the data collected by the measurement system. At a minimum, the track owner shall do the following: \n     (1) Maintain and make available to FRA documented calibration procedures of the measurement system that, at a minimum, specify an instrument verification procedure that ensures correlation between measurements made on the ground and those recorded by the instrumentation; and \n     (2) Maintain each instrument used for determining compliance with this section such that it accurately provides an indication of the depth of rail seat deterioration in accordance with paragraph (d)(1) of this section.',
  '213.234h':
      'Training.  The track owner shall provide annual training in handling rail seat deterioration exceptions to all persons designated as fully qualified under § 213.7 and whose territories are subject to the requirements of § 213.234. At a minimum, the training shall address the following: \n     (1) Interpretation and handling of the exception reports generated by the automated inspection measurement system; \n     (2) Locating and verifying exceptions in the field and required remedial action; and \n     (3) Recordkeeping requirements.',
  '213.235a':
      'Except as provided in paragraph (c) of this section, each switch, turnout, track crossing, and moveable bridge lift rail assembly or other transition device shall be inspected on foot at least monthly.',
  '213.235b':
      'Each switch in Classes 3 through 5 track that is held in position only by the operating mechanism and one connecting rod shall be operated to all of its positions during one inspection in every 3 month period.',
  '213.235c':
      'In the case of track that is used less than once a month, each switch, turnout, track crossing, and moveable bridge lift rail assembly or other transition device shall be inspected on foot before it is used.',
  '213.237a':
      'In addition to the inspections required by § 213.233, each track owner shall conduct internal rail inspections sufficient to maintain service failure rates per rail inspection segment in accordance with this paragraph (a) for a 12-month period, as determined by the track owner and calculated within 45 days of the end of the period. These rates shall not include service failures that occur in rail that has been replaced through rail relay since the time of the service failure. Rail used to repair a service failure defect is not considered relayed rail. The service failure rates shall not exceed - \n     (1) 0.1 service failure per year per mile of track for all Class 4 and 5 track; \n     (2) 0.09 service failure per year per mile of track for all Class 3, 4, and 5 track that carries regularly-scheduled passenger trains or is a hazardous materials route; and \n     (3) 0.08 service failure per year per mile of track for all Class 3, 4, and 5 track that carries regularly-scheduled passenger trains and is a hazardous materials route.',
  '213.237b':
      'Each rail inspection segment shall be designated by the track owner no later than March 25, 2014 for track that is Class 4 or 5 track, or Class 3 track that carries regularly-scheduled passenger trains or is a hazardous materials route and is used to determine the milepost limits for the individual rail inspection frequency. \n     (1) To change the designation of a rail inspection segment or to establish a new segment pursuant to this section, a track owner must submit a detailed request to the FRA Associate Administrator for Railroad Safety/Chief Safety Officer (Associate Administrator). Within 30 days of receipt of the submission, FRA will review the request. FRA will approve, disapprove, or conditionally approve the submitted request, and will provide written notice of its determination. \n     (2) The track owners existing designation shall remain in effect until the track owners new designation is approved or conditionally approved by FRA. \n     (3) The track owner shall, upon receipt of FRAs approval or conditional approval, establish the designations effective date. The track owner shall advise in writing FRA and all affected railroad employees of the effective date.',
  '213.237c':
      'Internal rail inspections on Class 4 and 5 track, or Class 3 track with regularly-scheduled passenger trains or that is a hazardous materials route, shall not exceed a time interval of 370 days between inspections or a tonnage interval of 30 million gross tons (mgt) between inspections, whichever is shorter. Internal rail inspections on Class 3 track that is without regularly-scheduled passenger trains and not a hazardous materials route must be inspected at least once each calendar year, with no more than 18 months between inspections, or at least once every 30 mgt, whichever interval is longer, but in no case may inspections be more than 5 years apart. \n     (1) Any rail used as a replacement plug rail in track that is required to be tested in accordance with this section must have been tested for internal rail flaws. \n     (2) The track owner must verify that any plug rail installed after March 25, 2014 has not accumulated more than a total of 30 mgt in previous and new locations since its last internal rail flaw test, before the next test on the rail required by this section is performed. \n     (3) If plug rail not in compliance with this paragraph (c) is in use after March 25, 2014, trains over that rail must not exceed Class 2 speeds until the rail is tested in accordance with this section.',
  '213.237d':
      'If the service failure rate target identified in paragraph (a) of this section is not achieved, the track owner must inform FRA of this fact within 45 days of the end of the defined 12-month period in which the performance target is exceeded. In addition, the track owner may provide to FRA an explanation as to why the performance target was not achieved and provide a remedial action plan. \n     (1) If the performance target rate is not met for two consecutive years, then for the area where the greatest number of service failures is occurring, either: \n          (i) The inspection tonnage interval between tests must be reduced to 10 mgt; or \n          (ii) The class of track must be reduced to Class 2 until the target service failure rate is achieved. \n     (2) In cases where a single service failure would cause the rate to exceed the applicable service failure rate as designated in paragraph (a) of this section, the service failure rate will be considered to comply with paragraph (a) of this section unless a second such failure occurs within a designated 12-month period. For the purposes of this paragraph (d)(2), a period begins no earlier than January 24, 2014.',
  '213.237e':
      'Each defective rail shall be marked with a highly visible marking on both sides of the web and base except that, where a side or sides of the web and base are inaccessible because of permanent features, the highly visible marking may be placed on or next to the head of the rail.',
  '213.237f':
      'Inspection equipment shall be capable of detecting defects between joint bars, in the area enclosed by joint bars.',
  '213.237g':
      'If the person assigned to operate the rail defect detection equipment (i.e., the qualified operator) determines that a valid search for internal defects could not be made over a particular length of track, that particular length of track may not be considered as internally inspected under paragraphs (a) and (c) of this section.',
  '213.237h':
      'If a valid search for internal defects could not be conducted, the track owner shall, before expiration of the time or tonnage limits in paragraph (a) or (c) of this section - \n     (1) Conduct a valid search for internal defects; \n     (2) Reduce operating speed to a maximum of 25 m.p.h. until such time as a valid search can be made; or \n     (3) Replace the rail that had not been inspected.',
  '213.237i':
      'The person assigned to operate the rail defect detection equipment must be a qualified operator as defined in § 213.238 and have demonstrated proficiency in the rail flaw detection process for each type of equipment the operator is assigned.',
  '213.237j':
      'As used in this section - \n     (1) Hazardous materials route  means track over which a minimum of 10,000 car loads or intermodal portable tank car loads of hazardous materials as defined in 49 CFR 171.8 travel over a period of one calendar year; or track over which a minimum of 4,000 car loads or intermodal portable tank car loads of the hazardous materials specified in 49 CFR 172.820 travel, in a period of one calendar year. \n     (2) Plug rail  means a length of rail that has been removed from one track location and stored for future use as a replacement rail at another location. \n     (3) Service failure  means a broken rail occurrence, the cause of which is determined to be a compound fissure, transverse fissure, detail fracture, or vertical split head. \n     (4) Valid search  means a continuous inspection for internal rail defects where the equipment performs as intended and equipment responses are interpreted by a qualified operator as defined in § 213.238.',
  '213.238a':
      'Each provider of rail flaw detection shall have a documented training program in place and shall identify the types of rail flaw detection equipment for which each equipment operator it employs has received training and is qualified. A provider of rail flaw detection may be the track owner. A track owner shall not utilize a provider of rail flaw detection that fails to comply with the requirements of this paragraph.',
  '213.238b':
      'A qualified operator shall be trained and have written authorization from his or her employer to: \n     (1) Conduct a valid search for internal rail defects utilizing the specific type(s) of equipment for which he or she is authorized and qualified to operate; \n     (2) Determine that such equipment is performing as intended; \n     (3) Interpret equipment responses and institute appropriate action in accordance with the employers procedures and instructions and \n     (4) Determine that each valid search for an internal rail defect is continuous throughout the area inspected and has not been compromised due to environmental contamination, rail conditions, or equipment malfunction.',
  '213.238c':
      'To be qualified, the operator must have received training in accordance with the documented training program and a minimum of 160 hours of rail flaw detection experience under direct supervision of a qualified operator or rail flaw detection equipment manufacturers representative, or some combination of both. The operator must demonstrate proficiency in the rail defect detection process, including the equipment to be utilized, prior to initial qualification and authorization by the employer for each type of equipment.',
  '213.238d':
      'Each employer shall reevaluate the qualifications of, and administer any necessary recurrent training for, the operator as determined by and in accordance with the employers documented program. The reevaluation process shall require that the employee successfully complete a recorded examination and demonstrate proficiency to the employer on the specific equipment type(s) to be operated. Proficiency may be determined by a periodic review of test data submitted by the operator.',
  '213.238e':
      'Each employer of a qualified operator shall maintain written or electronic records of each qualification in effect. Each record shall include the name of the employee, the equipment to which the qualification applies, date of qualification, and date of the most recent reevaluation, if any.',
  '213.238f':
      'Any employee who has demonstrated proficiency in the operation of rail flaw detection equipment prior to January 24, 2014, is deemed a qualified operator, regardless of the previous training program under which the employee was qualified. Such an operator shall be subject to paragraph (d) of this section.',
  '213.238g':
      'Records concerning the qualification of operators, including copies of equipment-specific training programs and materials, recorded examinations, demonstrated proficiency records, and authorization records, shall be kept at a location designated by the employer and available for inspection and copying by FRA during regular business hours.',
  '213.239':
      'In the event of fire, flood, severe storm, or other occurrence which might have damaged track structure, a special inspection shall be made of the track involved as soon as possible after the occurrence and, if possible, before the operation of any train over that track.',
  '213.240a':
      'Track owners may elect to use continuous rail testing to satisfy the requirements for conducting internal rail inspections under § 213.237 or § 213.339. When a track owner utilizes the continuous rail test inspection process under the requirements of this section, the track owner is exempt from the requirements of § 213.113(b); all other requirements of § 213.113 apply.',
  '213.240b':
      'Track owners shall adopt the necessary procedures for conducting continuous testing. At a minimum, the procedures must conform to the requirements of this section and ensure the following: \n     (1) Test data is timely and accurately transmitted and analyzed; \n     (2) Suspect locations are accurately identified for field verification; \n     (3) Suspect locations are categorized and prioritized according to their potential severity; \n     (4) Suspect locations are accurately field-verified; and \n     (5) Suspect locations will be designated following field verification.',
  '213.240c':
      'The track owner must designate and record the type of rail test (continuous or stop-and-verify) to be conducted prior to commencing the test over a track segment and make those records available to FRA upon request during regular business hours following reasonable notice. If the type of rail test changes following commencement of the test, the change must be documented and include the time the test was started and when it was changed, and the milepost where the test started and where it was changed. If the track owner intends to conduct a continuous test, the track owner must designate and record whether the test is being conducted to satisfy the requirements for an internal rail inspection under § 213.237 or § 213.339. This documentation must be provided to FRA upon request during regular business hours following reasonable notice.',
  '213.240d':
      '     (1) Continuous rail test inspection vehicle operators must be qualified under § 213.238, with the exception of § 213.238(b)(3). \n     (2) Internal rail inspection data collected during continuous rail tests must be reviewed and interpreted by a person qualified to interpret the equipment responses. Each employer of a person qualified to interpret equipment responses shall maintain written or electronic records of each qualification in effect, including the name of the employee, the equipment to which the qualification applies, the date of qualification, and the date of the most recent reevaluation of the qualification, if any. Records concerning these qualifications, including copies of training programs, training materials, and recorded examinations shall be kept at a location designated by the employer and available for inspection and copying by FRA during regular business hours, following reasonable notice. \n     (3) All suspect locations must be field-verified by a person qualified under § 213.238.',
  '213.240e':
      'At a minimum, the continuous rail test process must produce a report containing a systematic listing of all suspected locations that may contain any of the defects listed in the table in § 213.113(c), identified so that a person qualified under § 213.238 can accurately locate and field-verify each suspected defect. \n     (1) Except as provided in paragraph (e)(6) of this section, and subject to the requirements of paragraphs (e)(2) and (3) of this section, if the continuous rail test inspection vehicle indicates a suspect location, field verification must be conducted within 84 hours of the indication of the suspect location. \n     (2) Except as provided in paragraph (e)(6) of this section, and subject to the requirements of paragraph (e)(3) of this section, if the continuous rail test inspection vehicle indicates a suspect location containing a suspected defect that, if verified, requires remedial action A, A2, or B identified in the table contained in § 213.113(c), the track owner must field-verify the suspect location no more than 36 hours from indication of the suspect location. \n     (3) If the continuous rail test inspection vehicle indicates a broken rail with rail separation, the track owner must have procedures to ensure that adequate protection is immediately implemented. \n     (4) A suspect location is not considered a defect under § 213.113(c) until it has been field-verified by a person qualified under § 213.238. After the suspect location is field-verified and determined to be a defect, the track owner must immediately perform all required remedial actions prescribed in § 213.113(a). \n     (5) Any suspected location not field-verified within the time required under paragraphs (e)(1) and (2) of this section must be protected by applying the most restrictive remedial action under § 213.113(c) for the suspected type and size of the suspected defect. The remedial action must be applied over a sufficient segment of track to assure coverage of the suspected defect location until field-verified. \n     (6) A continuous rail test that is not conducted to satisfy the requirements for an internal rail inspection under § 213.237 or § 213.339, and has been properly designated and recorded by the track owner under paragraph (c) of this section, is exempt from the requirements of paragraphs (e)(1), (2), and (5) of this section.',
  '213.240f':
      'Each suspect location must be recorded with repeatable accuracy that allows for the location to be accurately located for subsequent verification and, as necessary, remedial action.',
  '213.240g':
      'Within 45 days following the end of each calendar year, each track owner utilizing continuous rail testing must provide the FRA Associate Administrator for Railroad Safety/Chief Safety Officer with an annual report, in a reasonably usable format, or its native electronic format, containing at least the following information for each track segment requiring internal rail inspection under § 213.237 or § 213.339: \n     (1) The track owners name; \n     (2) The railroad division and subdivision; \n     (3) The segment identifier, milepost limits, and length of each segment; \n     (4) The track number; \n     (5) The class of track; \n     6) The annual million gross tons over the track; \n     (7) The total number of stop-and-verify rail tests and the total number of continuous rail tests over each track segment; \n     (8) The total number of defects identified over each track segment; and \n     (9) The total number of service failures on each track segment.',
  '213.241a':
      'Each owner of track to which this part applies shall keep a record of each inspection required to be performed on that track under this subpart.',
  '213.241b':
      'Each record of an inspection under §§ 213.4, 213.119, 213.233, and 213.235 shall be prepared on the day the inspection is made and signed or otherwise certified by the person making the inspection. Records shall specify the author of the record, the type of track inspected, date and location of inspection, location and nature of any deviation from the requirements of this part, and the remedial action taken by the person making the inspection. The track owner shall designate the location(s) where each original record shall be maintained for at least one year after the inspection covered by the record. The track owner shall also designate one location, within 100 miles of each State in which it conducts operations, where copies of records that apply to those operations are maintained or can be viewed following 10 days notice by the Federal Railroad Administration.',
  '213.241c':
      'Records of internal rail inspections required by § 213.237 shall specify the - \n     (1) Date of inspection; \n     (2) Track inspected, including beginning and end points; \n     (3) Location and type of defects found under § 213.113; \n     (4) Size of defects found under § 213.113, if not removed prior to the next train movement; \n     (5) Initial remedial action taken and the date thereof; and \n     (6) Location of any track not tested pursuant to § 213.237(g).',
  '213.241d':
      'The track owner shall retain a rail inspection record under paragraph (c) of this section for at least two years after the inspection and for one year after initial remedial action is taken.',
  '213.241e':
      'The track owner shall maintain records sufficient to demonstrate the means by which it computes the service failure rate on all track segments subject to the requirements of § 213.237(a) for the purpose of determining compliance with the applicable service failure rate target.',
  '213.241f':
      'Records of continuous rail testing under § 213.240 shall - \n     (1) Include all information required under § 213.240(e); \n     (2) State whether the test is being conducted to satisfy the requirements for an internal rail inspection under § 213.237; \n     (3) List the date(s) and time(s) of the continuous rail test data collection, including the date and time of the start and end of the test run, and the date and time each suspect location was identified and field-verified; \n     (4) Include the determination made after field verification of each suspect location, including the: \n          (i) Location and type of defect found; \n          (ii) Size of defect; and \n          (iii) Initial remedial action taken, if required, and the date thereof; and \n     (5) Be retained for at least two years after the inspection and for at least one year after initial remedial action is taken, whichever is later.',
  '213.241g':
      'Track owners that elect to utilize continuous rail testing under § 213.240 shall maintain records of all continuous rail testing operations sufficient for monitoring and determining compliance with all applicable regulations and shall make those records available to FRA during regular business hours following reasonable notice.',
  '213.241h':
      'Track inspection records shall be kept available to persons who performed the inspections and to persons performing subsequent inspections of the track segment.',
  '213.241i':
      'Each track owner required to keep inspection records under this section shall make those records available for inspection and copying by FRA upon request during regular business hours following reasonable notice.',
  '213.241j':
      'For purposes of complying with the requirements of this section, a track owner may create, retain, transmit, store, and retrieve records by electronic means provided that - \n     (1) The system used to generate the electronic record meets all requirements and contains the information required under this subpart; \n     (2) The track owner monitors its electronic records database to ensure record accuracy; \n     (3) The electronic system is designed to uniquely identify the author of the record. No two persons shall have the same electronic identity; \n     (4) The electronic system ensures that each record cannot be modified in any way, or replaced, once the record is completed; \n     (5) The electronic storage of each record shall be initiated by the person making the inspection within 72 hours following the completion of that inspection;\n     (6) Any amendment to a record shall be electronically stored apart from the record which it amends. Each amendment to a record shall be uniquely identified as to the person making the amendment.',
};

Map trackRegulationsSubparts = {
  'A General': ['213.1', '213.19'],
  'B Roadbed': ['213.31', '213.37'],
  'C Track Geometry': ['213.51', '213.63'],
  'D Track Structure': ['213.101', '213.143'],
  'E Track Appliances': ['213.201', '213.205'],
  'F Inspections': ['213.231', '213.241'],
};

Map trackRegulationSubpartsLists = {
  'A General': ['213.9a', '213.9b', '213.13'],
  'B Roadbed': ['213.33', '213.37'],
  'C Track Geometry': ['213.53a', '213.53b', '213.55', '213.63', '213.63a'],
  'D Track Structure': [
    '213.103',
    '213.103a',
    '213.103b',
    '213.103c',
    '213.103d',
    '213.109a',
    '213.109b',
    '213.109b4',
    '213.109c',
    '213.109d',
    '213.109e',
    '213.109f.1',
    '213.109f Figure 1',
    '213.109f.2',
    '213.109f Figure 2',
    '213.109f.3',
    '213.109f Figure 3',
    '213.110a',
    '213.110b',
    '213.110c',
    '213.110d',
    '213.110e',
    '213.110f',
    '213.110g',
    '213.110h',
    '213.110i',
    '213.110j',
    '213.110k',
    '213.110l',
    '213.110l1',
    '213.110m',
    '213.110n',
    '213.110o',
    '213.110p',
    '213.113a',
    '213.113b',
    '213.113c',
    '213.113c Figure 1',
    '213.113c.2',
    '213.113d',
    '213.115',
    '213.115a',
    '213.118a',
    '213.118b',
    '213.118c',
    '213.118d',
    '213.118e',
    '213.119a',
    '213.119b',
    '213.119c',
    '213.119d',
    '213.119e',
    '213.119f',
    '213.119g',
    '213.119h',
    '213.119i',
    '213.119j',
    '213.119k',
    '213.119l',
    '213.121a',
    '213.121b',
    '213.121c',
    '213.121d',
    '213.121e',
    '213.121f',
    '213.121g',
    '213.121h',
    '213.122a',
    '213.122b',
    '213.123a',
    '213.123b',
    '213.127a',
    '213.127b',
    '213.127c',
    '213.133a',
    '213.133b',
    '213.133c',
    '213.135a',
    '213.135b',
    '213.135c',
    '213.135d',
    '213.135e',
    '213.135f',
    '213.135g',
    '213.135h',
    '213.135i',
    '213.137a',
    '213.137b',
    '213.137c',
    '213.137d',
    '213.137e',
    '213.139a',
    '213.139b',
    '213.139c',
    '213.139d',
    '213.139e',
    '213.141a',
    '213.141b',
    '213.143a',
    '213.143a1',
    '213.143b'
  ],
  'E Track Appliances': ['213.205a', '213.205b', '213.205c', '213.205d'],
  'F Inspections': [
    '213.233a',
    '213.233b',
    '213.233c',
    '213.233d',
    '213.234a',
    '213.234b',
    '213.234c',
    '213.234d',
    '213.234e',
    '213.234f',
    '213.234g',
    '213.234h',
    '213.235a',
    '213.235b',
    '213.235c',
    '213.237a',
    '213.237b',
    '213.237c',
    '213.237d',
    '213.237e',
    '213.237f',
    '213.237g',
    '213.237h',
    '213.237i',
    '213.237j',
    '213.238a',
    '213.238b',
    '213.238c',
    '213.238d',
    '213.238e',
    '213.238f',
    '213.238g',
    '213.239',
    '213.240a',
    '213.240b',
    '213.240c',
    '213.240d',
    '213.240e',
    '213.240f',
    '213.240g',
    '213.241a',
    '213.241b',
    '213.241c',
    '213.241d',
    '213.241e',
    '213.241f',
    '213.241g',
    '213.241h',
    '213.241i',
    '213.241j'
  ],
};

List trackRegulationTables = [
  '213.9a',
  '213.53b',
  '213.55',
  '213.63a',
  '213.109b4',
  '213.115a',
  '213.110l1',
  '213.233c',
];

Map trackRegulationTableTitles = {
  '213.9a': 'Maximum Allowable Operating Speeds Table',
  '213.53b': 'Track Gage Restrictions Table',
  '213.55': 'Track Alinement Restrictions Table',
  '213.63a': 'Track Surface Deviation Restrictions Table',
  '213.109b4': 'Minimum Allowed Crossties in 39ft Segment',
  '213.115a': 'Rail End Mismatch Restrictions Table',
  '213.110l1': 'GRMS Lateral Restraint Table',
  '213.233c': 'Track Inspection Schedule',
};

Map trackRegulationSubtitles = {
  '213.9': 'Maximum Allowable Operating Speeds',
  '213.13': 'Measuring Track Not Under Load',
  '213.33': 'Drainage',
  '213.37': 'Vegetation',
  '213.53a': 'Gage',
  '213.55': 'Track Alinement',
  '213.63': 'Track Surface',
  '213.103': 'Ballast',
  '213.109a': 'Crossties',
  '213.110a': 'Gage Restraint Measurement Systems',
  '213.113a': 'Defective Rails',
  '213.115': 'Rail End Mismatch',
  '213.118': 'CWR; plan review and approval.',
  '213.119': 'CWR; plan contents.',
  '213.121': 'Rail Joints',
  '213.122': 'Torch Cut Rail',
  '213.123': 'Tie Plates',
  '213.127': 'Rail Fastening Systems',
  '213.133': 'Turnouts and Track Crossings Generally',
  '213.135': 'Switches',
  '213.137': 'Frogs',
  '213.139': 'Spring Rail Frogs',
  '213.141': 'Self-Gaurded Frogs',
  '213.143': 'Frog Guard Rails and Gaurd Faces: Gage',
  '213.205': 'Derails',
  '213.233': 'Visual Track Inspections',
  '213.234':
      'Automated inspection of track constructed with concrete crossties.',
  '213.235': 'Inspection of Switches and Track Crossings',
  '213.237': 'Inspection of Rail',
  '213.238': 'Qualified Operator',
  '213.239': 'Special Inspections',
  '213.240': 'Continuous Rail Testing',
  '213.241': 'Inspection Records',
  // '213.303': 'Responsibility for Compliance',
  // '213.305': 'Designation of Qualified Individuals',
  // '213.307': 'Classes of Track, Operating Speed Limits',
  // '213.309': 'Restoration or Renewal of Track Under Traffic Conditions',
  // '213.311': 'Measuring Track Not Under Load',
  // '213.313': 'Application of Requirements to Curved Track',
  // '213.317': 'Waivers',
  // '213.316': 'Drainage',
  // '213.321': 'Vegetation',
  // '213.323': 'Track Gage',
  // '213.327': 'Track Alinement',
  // '213.329': 'Curves',
  // '213.331': 'Track Surface',
  // '213.332': 'Combined Track Alinement and Service Deviations',
  // '213.333': 'Automated Vehicle-Based Inspection Systems',
  // '213.334': 'Ballast',
  // '213.335': 'Crossties',
  // '213.337': 'Defective Rails',
  // '213.339': 'Inspection of Rail in Service',
  // '213.341': 'Initial Inspection of New Rail and Welds',
  // '213.343': 'Continuous Welded Rail',
  // '213.345': 'Vehicle/Track System Qualification',
  // '213.347': 'Automotive or Railroad Crossings at Grade',
  // '213.349': 'Rail End Mismatch',
  // '213.351': 'Rail Joints',
  // '213.352': 'Torch Cut Rail',
  // '213.353': 'Turnouts, Crossovers, and Lift Rail',
  // '213.355': 'Frog Guard Rails and Guard Faces',
  // '213.357': 'Derials',
  // '213.359': 'Track Stiffness',
  // '213.361': 'Right of Way',
  // '213.365': 'Visual Track Inspections',
  // '213.367': 'Special Inspections',
  // '213.369': 'Inspection Records',
};
