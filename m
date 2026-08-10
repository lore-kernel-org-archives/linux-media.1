Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011024.outbound.protection.outlook.com [52.103.32.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7976123393E
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372232; cv=fail; b=kAA41VhHPH2hr0wILXLednO8wI/QKhgolFmIIsvWEkr/GhFUZ8109hZPYVCUrOaCLkzj4uH8zE8+6Om66M0X5nuFdgppfCWpp9cBHvJ79FlbT5Tj3uuOR1W0ICWkhGvdqSaIE0UneJXc8akF7mt4KetOJBXsi+tFr5JMWbb3AwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372232; c=relaxed/simple;
	bh=DuK0+j4TvLtZAbIU6SWJ+xTkKcuM/rcHhZbEWLNNO98=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=McH9TeNocjdQsFiT/YuCNOe0dpg9OsdTga8W47a/UClXFprLsIXj+aiMBXa9x6sDVOXETYoU9PyLvWeslPVTLBj6d8ejWsIrUo2+nZN4IwXHIPdC6XIiT95W5HOYARSozxJkfYlAMmUc37zT/gpGB29EP2DDLwo9YwMnSyFpB+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=tuWUBf15; arc=fail smtp.client-ip=52.103.32.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="tuWUBf15"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqXjr+6dJSquenD1EVG78UrI9Lw57oaZLg10mFQo4Duj5Wi3dfs4bjWkhiw2BluthKGiivZRIdqIHQtps47DU0UAOEjEFUvLNm259HQ7DOAudmSPf/dE78ZJQbPFIUu5ymQsuMcjM9Z46Eox/lcKRlCBGra2U4Hr9LGbwQlV1uUOfyEor0gbo7TqSGwN1750ng4vrkTXYgFZqUJ6oJBmsszF0KOX0mftGnHOr2cp6upBdl52MI+0riSSaTWbWCv9cw+AmRqn1PpK7hgPRGhVMrfJGo5MbK0HjvPhdyezsPMOlB2eGbFBym21SbskP22MhBn006Wlmrt9dr6+tWP0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdDBDTPue6B96DyrK8OXpRM/GmfT21tuRItElE2t6EY=;
 b=KIRIxqu3AnwewFe3lmTFkJpX9N9ItuQIRrBkknoG5FunbQR+a3iSZr2+77FDk8+XmBTfg4Fg9pTwv263JpIL+5ynRct1bnd6SiOe9GTM/kLw+nHdEZ92HZLcbb7lX0fPQLa6WxuIg9j2YCQ4i8l+AhHFUoBaU3a3F6jdNNdBepG4O0QHuZDACNEORbu5dQKOKyERORh2+Trxc18/8aBibfbIvP9bFJOm2ldDY7eAxuAyxvkQuetKEZzcvasLr4Wy04J+pN7fQ/p1CqWW99CeUgg7tdhHiRJqkLx5BWQX2imLbfdtUgOHC+rYUOYgQphA+Lz2Zj+lGCVKW0X8wrMprg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdDBDTPue6B96DyrK8OXpRM/GmfT21tuRItElE2t6EY=;
 b=tuWUBf15+4GabsC8BtPipA60Fg+i1B9yuUAoel8IXdwq2sLp+Bj6qAtj4Qdu3Y3nRsdrGjdw5+MDrO35TEIwb3Qvr2y7PzyPjyK5L88h5nFkITUeYU4jZvW9OSX6NfgXclTLGGLOXICZynfVAfLg3hakk9TSV10225I8A6x1aOUMJwQeqUtyB8nxxwA8Exd353+gUA66NG+bigp7Wint86lyHqoes+Utc2eCeh62pCPyhcxmqx+ecP9YAN1WDvxEbH3URVQOSZMYccb2cv2abi4yyUPGS5zaQVS2Q9sTo7pSi7RbLEesirddoi1svi7qciBqSCx66acSlvYU7xkHKw==
Received: from VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM (2603:10a6:808:1::124)
 by AS8P195MB2140.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:56c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 14:30:28 +0000
Received: from VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM
 ([fe80::cfa8:9780:b74e:1465]) by VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM
 ([fe80::cfa8:9780:b74e:1465%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 14:30:27 +0000
Message-ID:
 <VI6PPFD0A65370FCF422FFAE7B31E157D08A3DE2@VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM>
Date: Mon, 10 Aug 2026 16:30:26 +0200
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] media: ipu-bridge: check all DMI entries when overriding
 sensor rotation
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: johannes.goede@oss.qualcomm.com, dan.scally@ideasonboard.com,
 mchehab@kernel.org, linux-media@vger.kernel.org
References: <VI6PPFD0A65370F3F49A1C8B719D27C50F3A3DF2@VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM>
 <anmA9lPTuP4gZ7pj@kekkonen.localdomain>
Content-Language: en-US
From: =?UTF-8?B?Sm9zw6kgTWFyw61hIE1hcnTDrW4=?= <jmmartinf@hotmail.com>
In-Reply-To: <anmA9lPTuP4gZ7pj@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0019.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::17)
 To VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM (2603:10a6:808:1::124)
X-Microsoft-Original-Message-ID:
 <489b6037-e945-4e6d-980f-a7b783cbc0f4@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI6PPFD0A65370F:EE_|AS8P195MB2140:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b233e3-1af0-4d89-6414-08def6ebec67
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|37011999003|25031999004|41001999006|15080799012|55001999006|23021999003|24021099003|51005399006|5072599009|25010399006|12121999013|6090799003|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2J4ZEZ1WWx3YmJQbHhabXpXNENueUc1TmpsQjgxQnlObGNYOGxmZUNFWVBX?=
 =?utf-8?B?R3BzdVQwOWFweE1SYktJeS9KemgzZGxFRjUzODVpb2lObk8rbXhLWUdTdWRi?=
 =?utf-8?B?YlpYNG5PNXpUWHFPTmlySlFvMEQ0R0xCb1gxYzFEbmVqTXhhQSswZEc5cXYw?=
 =?utf-8?B?dXhHT0gyV1F2SkMxS3dvTG9mSTdiZG0vcE1wbCthU215WXVqZ0N3bVY1SDlw?=
 =?utf-8?B?d0lVWncvOS9NSDNHZjNtanlWNmJLaEJXa2dBTGxPdU9kbWZ0RG1MYjVPOTBU?=
 =?utf-8?B?U2orcDg0Q0xRR2tQUjUwbERaY2FqajZSV21GaE1MNXcvRTlVSjgwa1l6VUdV?=
 =?utf-8?B?Qkozb0VTZ0xybEszOTVENFBleFJhekFtaEdvSkdVVW9MckpCd2xic0I4c0hH?=
 =?utf-8?B?WjdWZklpUkNqakZ6eEx6RlJjNWxUOXZDZ1NST2FZaldmenhwTkpBb3BWRXJI?=
 =?utf-8?B?WHAvcU5lZkd4WUJFQU4xSVlHOVdPQW5rSGRMTzN4V3pVQTJhU3ZCNXhRN2p5?=
 =?utf-8?B?UTNIRkhQdHVHcTY0NXlZcTRtU0dJWmNDRzlicXV3NG50dkZQSWlvTjlvemR5?=
 =?utf-8?B?Yy9lK1lLUkI2dnphUXRPSWVkekFXTjNlaElPcjVTNHZHM0VUZnhKdmk4cG1I?=
 =?utf-8?B?RFBSbkhBdk5FTFNlWXpOYS9zM1lOREJlamhUWXpiOFZoOVJDWGM1ZmxZajlY?=
 =?utf-8?B?cWl0andEZjgvZFpEYmV0MXBQS1BjZ2orOFVLR1FwNjkxSUpSSGpFbjYzSVVt?=
 =?utf-8?B?YmJNdzdtUDZ4bTBaL1RuNnBXdm1VSnFaS0NsTTAzYXBXZzhBTTRPQXFLcjhx?=
 =?utf-8?B?blZmYVRxZ3FkaVY4RjhmUlM2VEVDR294dXRiZVhuN3RMZ04vazdKQUtLTmo3?=
 =?utf-8?B?VFVpL09MMm85cUV2OWcvWFNleGIzYUc0dm9DQVg3Qm1YMW02K0IyU1E3VTVp?=
 =?utf-8?B?eDlRclZ6b2pqYUFERWhBbjlkUm5RUmROYiswNzErTnVyd2RnUElkc2ovSU0z?=
 =?utf-8?B?bUhUdHJXWithSnBXbFR0eXdEVDZhb1QrREZSYU1DdGNnVnFQZ3Z6Rk5MOVF3?=
 =?utf-8?B?cGR4b3Y2UjMvWTFnanV3ME9pOXpvekN6QXlqOGxaZ2lwWTZ4UFd1NmIwaTJv?=
 =?utf-8?B?aDhHcUFLbTlZRmdZbndEV1o3OXRzY3lpTW9YbjRuc25qOUxpa29QUVNyaWVT?=
 =?utf-8?B?ZVV6cHAzbHltTWw2NEh3ckc0aDBwQkZpbDErU245clg5NjFtdmxlTGI3Ymp3?=
 =?utf-8?B?enl4ckV3a3ZkTno4eEhXakhoWDNGd0NVbnh2WURaSlA3d2VDTDBBSUY2QXQ1?=
 =?utf-8?B?VFJ0andZZjlZRTZ6cUZpVnJjbEZEN29EdkFtK1pBc2tYdFFUVnBvVWU2MUJl?=
 =?utf-8?B?akhpWW41WEo4aVJ4b3QySit1UXhyZ0s1RXoxUjgyQ0ExN05Sc0pLMDdGU25O?=
 =?utf-8?B?RktFNjBpb1pjUVhFNHUvR2dUSDI1Zy9DczNUVm9xdkpJdDhIYUNCa3ltL0lG?=
 =?utf-8?Q?J9ZhCfeJniqh6UqfQuQn+rWrO24?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlVlSG9xWCttZ0lnQXhTQ2JCWDh1YUY1eVVaWnloOWxZaXcrU2luZ1NSVnF2?=
 =?utf-8?B?TFc2Z2FzMGFNVEk4MUZWZXdKM2liRnNNTzRSd0grMXlLZE9MV0hTVTBSUkR6?=
 =?utf-8?B?K1N6Y3NsU2lJL3hBQ0FwK0RZaGZDcWJKZnF1Z2MwQVJGMVhvOUNSN1J1eFho?=
 =?utf-8?B?dVBublJRUExkbkEzTWtZWkJWV0tHQWZ5VVlKL1Z6RzFiOWYxODY0ZjBoZFRH?=
 =?utf-8?B?cGZRY2Vjcko0YkliN1hpRExGaGVhV3g1NUxRbHVWT1p5SzJhdkttMllBcnly?=
 =?utf-8?B?WmxPUXdBWk5RNmhqakZmYzNLaFlNUnFKVGgxeHFDVWhPQzNPL1JCYjNBamkz?=
 =?utf-8?B?ZHY1S25sYkFpMkZ0TnZWMUxRN1orNkx0WXMzTFB2TlZYUGlnTDFwVlJrNkJ2?=
 =?utf-8?B?cWpJTFVWZ0lnRkVWMkJzeUFTb3B1SXlrM1JmQ0syWGVwTGh3WkFLTU41a3ZR?=
 =?utf-8?B?YmFxbWV3SzU1TWdobXE0eWpMMGFZcmJmZFAyRUw2ZUNpUzMzTkVST1QxLzg1?=
 =?utf-8?B?VzZXdjlJbmZ4ZE04elRHQmRsNjUvNU1YQ3VsakZVSU1MQkZuMkFOdGpWTk1n?=
 =?utf-8?B?bWFqeVZ1elJZT01CVncwUzE3ZUhPaXdjRWU0WUlJYkk4cVkyTkk5QWZrS3da?=
 =?utf-8?B?SlJiaWg4M3pLQ2ZnbU5ueUZnSW5oQ3BXejVaWWg3ZTNWSlR6WjhLZVY0bnl3?=
 =?utf-8?B?Ulh2dWxkVjI2bnFBRGFNUGI2Zi9ybUtrTFF4QmtJWnVyYzJZc2tRUCtRWGRR?=
 =?utf-8?B?MEVaWWVqMXNLTllKZUVyUWZOZ1FYRW1MdmJud0kyZzZ4L1hjQmxvZkFJUmtH?=
 =?utf-8?B?R1FzYk9kV3dlUzJ1SzhPQlJnZXI3UDFzQzRTcmRhWnhLWWxydHBEU203ZFJD?=
 =?utf-8?B?SXROb2FxNm1MZm15SnBxaGllZmlSQzYrRXdXQ2plbzZwQUpRckl3YjR6UW53?=
 =?utf-8?B?V0xEMDVrRHI1RFQ2dXdYMjRqS2JRSVg3YWpwSnA3dHdmWjVlWDRYbkIyTjNH?=
 =?utf-8?B?b1JaUGhDMVQyMGtyaHpWanBVWXg2WllMUVFVVThIcW0wN3VLbUpWUlB4RnJu?=
 =?utf-8?B?ckpJR1lmMU5oUVVsM1hpYlRvdjNBUjVvYlNQbHFqRzZSYndsNXVRYTArUXR5?=
 =?utf-8?B?VnR3cFBBK0sxeHZwK0xoWW0wZENVd2N0N29vNUZkbFhVV29wd2pVbjI4MS9U?=
 =?utf-8?B?VkVrazFsRDR3ekMzVFhCclpaMGJDTnhybFl2K29zR1ZEd3g1ZnRRdjBOamJy?=
 =?utf-8?B?bnVxRW5IMEdpdlUrcnhEOUtoZ1hib1ZXV1NQSHRjM05lY3pmTXRCSTJmYTA1?=
 =?utf-8?B?bGRwdENjdXo3amRWRElMYVIyc3JVdUVZMlFoNW9WM3ZGNmV1RTdIdFlkV0JO?=
 =?utf-8?B?YzlabXJZa1Z1WjJNVkpVQkE3UnZXOGJ6M3pmcWdaclhWZGJDdzdiallaV3ll?=
 =?utf-8?B?OVdxMWVJSkZxdWJReSthKzgwTkJWUkVxa041b0h2MDFxejRseUtqSXlYajZY?=
 =?utf-8?B?b3RGblJTSjZXd3pEOGtvU3RjdXRpOGtTTElrbysyTFBDYUlITkg3cDZHWGxL?=
 =?utf-8?B?ZzYvNk16SGlLSFBuMUZ3cFZPNEtNOHlTKzdCYmxicjRpd0hTUFd2OWtvK0JY?=
 =?utf-8?B?WWkwdzBqWXBraXRoQ0VjYVRXbm16NnVvaERROXBVbU93YjVIdjJQNlJBcXFy?=
 =?utf-8?B?K2c2TjV3YnlMVjl3NXRVeEJxaStrdWtIOVVURkVrTkVhcXZHcTJQWElGa1Vh?=
 =?utf-8?B?YzNrRXl4MkhsV1AzdWpNUGdpejlwZzJ2QjlPYmZuSHc5Zmc0QWVJQU9HN0ZF?=
 =?utf-8?B?bDJGWktzY0l5QmxnSEdaYmticldWeE81ZVRXanFPL3krdUt2ZUgydzBQZGZo?=
 =?utf-8?Q?8+grsMeyje2pM?=
X-OriginatorOrg: sct-15-20-9412-6-msonline-outlook-c31bb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b233e3-1af0-4d89-6414-08def6ebec67
X-MS-Exchange-CrossTenant-AuthSource: VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 14:30:27.9061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2140

A machine can have more than one sensor whose rotation needs to be
overridden, which takes one upside_down_sensor_dmi_ids[] entry per
sensor, all sharing the same DMI match but with different ACPI HIDs in
driver_data.

ipu_bridge_parse_rotation() uses dmi_first_match(), which always stops
at the first entry matching the running machine, so any further entry
for the same machine is unreachable and only one sensor per machine can
ever be corrected.

Walk the whole table and match every entry for the running machine
against the sensor's ACPI HID instead.

Fixes: b75710155a82 ("media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down sensors")
Signed-off-by: José María Martín <jmmartinf@hotmail.com>
---
No machine in the mainline table lists two sensors yet, so this has no
effect on mainline today. It matters downstream: the Microsoft Surface
Pro 9 has both its front (OVTI5693) and rear (OVTID858) cameras mounted
upside down while its SSDB reports degree=0 for both, and the
linux-surface kernel carries such a pair of entries and hits this
limitation.

Tested on a Surface Pro 9 (6.19-based linux-surface kernel with this
change backported): both cameras report Rotation = 180 and render
upright in libcamera clients.

Changes since v1:
- moved the Surface Pro 9 background and the testing notes below the ---
- added a Fixes: tag
- shortened the code comment to a single line

 drivers/media/pci/intel/ipu-bridge.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 88581a4..ad3ddfb 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -298,9 +298,11 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 {
 	const struct dmi_system_id *dmi_id;
 
-	dmi_id = dmi_first_match(upside_down_sensor_dmi_ids);
-	if (dmi_id && acpi_dev_hid_match(adev, dmi_id->driver_data))
-		return 180;
+	/* A machine may have one entry per sensor, so check all matches. */
+	for (dmi_id = dmi_first_match(upside_down_sensor_dmi_ids); dmi_id;
+	     dmi_id = dmi_first_match(dmi_id + 1))
+		if (acpi_dev_hid_match(adev, dmi_id->driver_data))
+			return 180;
 
 	switch (ssdb->degree) {
 	case IPU_SENSOR_ROTATION_NORMAL:
-- 
2.55.0

