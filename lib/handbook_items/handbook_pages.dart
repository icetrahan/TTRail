import 'package:flutter/material.dart';

Map<String, String> trackRegulationsTitles = {
  '213.9': 'Maximum Allowable Operating Speeds',
  '213.13': 'Measuring Track Not Under Load',
  '213.33': 'Drainage',
  '213.37': 'Vegetation',
  '213.53': 'Gage',
  '213.55': 'Track Alinement',
  '213.63': 'Track Surface',
};

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
  '213.110e': '',
  '213.110f': '',
  '213.110g': '',
  '213.110h': '',
  '213.110i': '',
  '213.110j': '',
  '213.110k': '',
  '213.110l': '',
  '213.110m': '',
  '213.110n': '',
  '213.110o': '',
  '213.110p': '',
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
      'Class of Track ! Max on the tread of the rail ends ! Max on the gage side of the rail ends \n Class 1 ! 1/4in ! 1/4in \n Class 2 ! 1/4in ! 3/16in \n Class 3 ! 3/16in ! 3/16in \n Class 4 and 5 ! 1/8in ! 1/8in'
};

Map trackRegulationsSubparts = {
  'A General': ['213.1', '213.19'],
  'B Roadbed': ['213.31', '213.37'],
  'C Track Geometry': ['213.51', '213.63'],
  'D Track Structure': ['213.101', '213.143'],
  'E Track Appliances': ['213.201', '213.205'],
  'F Inspections': ['213.231', '213.241'],
  'G Train Operations': ['213.301', '213.369'],
};

Map trackRegulationSubpartsLists = {
  'A General': ['213.9a', '213.9b', '213.13'],
  'B Roadbed': ['213.33', '213.37'],
  'C Track Geometry': ['213.53a', '213.53b', '213.55', '213.63', '213.63a'],
  'D Track Structure': ['213.101', '213.143'],
  'E Track Appliances': ['213.201', '213.205'],
  'F Inspections': ['213.231', '213.241'],
  'G Train Operations': ['213.301', '213.369'],
};

List trackRegulationTables = [
  '213.9a',
  '213.53b',
  '213.55',
  '213.63a',
  '213.109b4',
  '213.115a',
];

Map trackRegulationTableTitles = {
  '213.9a': 'Maximum Allowable Operating Speeds Table',
  '213.53b': 'Track Gage Restrictions Table',
  '213.55': 'Track Alinement Restrictions Table',
  '213.63a': 'Track Surface Deviation Restrictions Table',
  '213.109b4': 'Minimum Allowed Crossties in 39ft Segment',
  '213.115a': 'Rail End Mismatch Restrictions Table',
};

Map trackRegulationSubtitles = {
  ' ': 'Maximum Allowable Operating Speeds',
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
};
