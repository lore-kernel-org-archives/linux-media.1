Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013080.outbound.protection.outlook.com [52.103.33.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEB63793BA
	for <linux-media@vger.kernel.org>; Sun,  9 Aug 2026 23:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786318732; cv=fail; b=nRmAyPL5vqZCDkbVMZBJTZpudzb+3UJ3U+dkZBdnmTVrltRXeT+kPn17i/bPUvggrF40vBKqghO6OSW/ZVYAluJ4GF0OeR1+x8kAeF++cc4yJ+tPiTFWwboZbG/gTWC68AT5OV+2QZzeqNKeAnqM85zCNBQ8trvX19vUeS5RKJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786318732; c=relaxed/simple;
	bh=wBi5K/X3SPpzGtTaoIq7PvR3PQYhvwi0oJ+cX/wW0F8=;
	h=Message-ID:Date:From:To:Cc:Subject:Content-Type:MIME-Version; b=Yw4Lxx+P7C0vUCVTufjRL+4HvyQCzO7wPqep2KlXYKLCmGjZOOHCtHLK/JzoGzN5RBRJ16sIX0o1xBskESqZ+LC+/AT+Mxy2UYifJw2WEKncwah+pkSNF/SdoSAidk5QYGhJCCfZ1ksRK8jyxm3eegL5SIDVkNiCH5WzrSDObTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=JPIC1YyM; arc=fail smtp.client-ip=52.103.33.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="JPIC1YyM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/za0WZNUMGGPYeOOSNd5CGl0BaZRZdwBkK2uDeRqd5EfP7QmfV03IbQ8gWgUB78WLFZnfbxoHKK99nF2lfyDXYNLinjvudufIX3NlCCj6VOL54rvi6Z2ONHXI3bl3TUPkzbgv+jWsSSOuFlUcm2Awz1SQxAGCPjpTWBNViTnYe4Kojk4DjY5XGjqvv7NoE6fgYMi9hes9BFSGWKoVj4I46JunFeSwh4S1EaNGMfOVrmMwNRMnlpkkRpNBrJyTTnY7YerzLXnrYmUv2d4uegChfsmlNvVeFSBMsapQ14TSQFkh3PIktjJVfgaOvN4yU9J9b6c8NV97rjjVMThdvEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGYNQosOHNGucFhl+65PNuXZxRrCci0fxir4pyvhk9Y=;
 b=IslZsxTLRQ0svZ26uie8gXtGRl937dZo610VynAhY7IEaNkUQzGZxiCPFjzcw5KqQuQWVXXPXf8cEwqBAcgl/wrgtUeMCSt+AkmtM1wLIfaWuKbksUKmX4+Xjl6KtKERpFDfawe1WMqQDuJ4puTCgTseAferm74xGaezlOviC4hO31eyRjbd9LjhaQCs3Kgr/bHj64+qRHcVqHDwJDCjhlzxfR1k4H02hgb1wjdIV9ck+NlRm6kMd327L5x7zp87tMOh7Pzz9EgaRoylFbWFFhAktAJk576iTU54x/cyHYVIS0O/Q5Iwl+XFy6jcbWwnLiBVe+cDU3Nifl2xGwMmzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGYNQosOHNGucFhl+65PNuXZxRrCci0fxir4pyvhk9Y=;
 b=JPIC1YyMfJKEn5kjrfUpfeeoDWmIrsqyfi4I3QYbXDxBwuTWIHaF40VUtRuKz6h4dViHevDFV2+SZKls3Pjw1crKmthX3NH9epFocBNDnm7s+hxKKkD9/lh1LqgzIKT9nLVTwFIbzK5dabuWvNG8PvexYBhjOSt5HiBBGHkYeWNsFgxdU1IwetRW+rvVFlShGkHh25/ij1ktsDbROvAP3cHUgaI0Mo/ptiZXknnjJDIx3oJsDkU/pLRqaC9C0vccP8OZvsnDUAYOqktl91hEueN6h5v2w0N34/ZMy8Mo/eQEGDbuEJWsehUOr8l/yWyHPt8UD8G/b1ofmafn3Y5CDQ==
Received: from VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM (2603:10a6:808:1::124)
 by DB8P195MB0696.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:15a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 23:38:47 +0000
Received: from VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM
 ([fe80::cfa8:9780:b74e:1465]) by VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM
 ([fe80::cfa8:9780:b74e:1465%4]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 23:38:47 +0000
Message-ID:
 <VI6PPFD0A65370F3F49A1C8B719D27C50F3A3DF2@VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM>
Date: Mon, 10 Aug 2026 01:38:45 +0200
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Sm9zw6kgTWFyw61hIE1hcnTDrW4=?= <jmmartinf@hotmail.com>
To: sakari.ailus@linux.intel.com, johannes.goede@oss.qualcomm.com
Cc: dan.scally@ideasonboard.com, bingbu.cao@intel.com,
 tian.shu.qiu@intel.com, mchehab@kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: check all DMI entries when overriding
 sensor rotation
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0027.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::13) To VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:808:1::124)
X-Microsoft-Original-Message-ID:
 <ce0c894f-361a-4615-b1ca-b426e9acdc18@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI6PPFD0A65370F:EE_|DB8P195MB0696:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a37231e-e047-463d-60be-08def66f5b8e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|37011999003|25031999004|6090799003|39105399006|24071999003|15080799012|23021999003|5072599009|4140399003|25010399006|5062599005|20031999006|41001999006|8060799015|19110799012|3412199025|440099028|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFRMQm5lZ3NDZDI4VHlxNlh1dXI2ZS9uTVlMRTlISEcwM2U3SmdmM2ZSRytT?=
 =?utf-8?B?Q0lRMm0wRWx0OEdjemd4aytmLzhMQXMvOG1ERkVmeGlQYTAwbElZQWR5SnpZ?=
 =?utf-8?B?S3pmaE1BOTBuY3BhWGF1cEpTQnNRaExBMmpGY0MxdENvQVV5UDRvUTd6Zlhk?=
 =?utf-8?B?Q3pCMFFpM2FkOWhueTNYRk1KNXdCU3dxOFBFdzdvcnVXUlhCeVBCZ1JnelZV?=
 =?utf-8?B?YWNzK0NINmxDa0t4cDZ1UUxwbXVzQVhxK3ZLekN2V0d0bTlSMUVaUTJVNnda?=
 =?utf-8?B?K2hJN29DUXpSMnFIZjJ5RzlVOFE3NjR2NXl1OTlwR1lVNUFGakRnMC9pb3BY?=
 =?utf-8?B?cC81QjJ1VnNobFIrZk1MK3htY0hUTEYwM0liWjlPb3lCSWdxK0VjSHoyVGhC?=
 =?utf-8?B?UmZOcFM0Z0J5Tng5OG94dDEwZzFIaEg4ZmhyYkJUcUxyNFhvWmZ0QU1CZVp6?=
 =?utf-8?B?Qit1cjhLOGZFWnp4WDNOanRkQkcxYUJIckdPYlhTQnFQSHlGNmZ4d2ZDeDhj?=
 =?utf-8?B?eWZMamFHRGVZUDA2RnlVZ09lSmhEMUJsUjFSU281VGJyc2MxZjF6NHNtcGZp?=
 =?utf-8?B?akI0WUFzRVpweENXUHpWZjlMYXJlOTZ1Vk9QcGJvWGcxQmM3N3greWpNQllE?=
 =?utf-8?B?YWxiamhEY3JUWWQ2UTd3TDdFbTd6bE8ydUpkNFJPaWlEQUJjWUxNbVJvMURh?=
 =?utf-8?B?L0NCOHRhSWVmMWp6OXFCOXM1RFJHZFR1dDdrT1ZUUlNwa0xzaEZEQXZmWTJp?=
 =?utf-8?B?Z2VhQjJjMys2U1psSldDelR1ZWcvRjdOaGQ0eWp3SjBXYmxGNjJxczBGMFJK?=
 =?utf-8?B?N01GNGRnNExaK2RsM0lyaVl2eTkvekZ3TWw0MFJPa2FXQXpXZ1F2L0ZMc3lW?=
 =?utf-8?B?NHlzWFVzNzQwUzlDcHk4V0ZobVRXdTBoaHZqS2F3cUZwMkcwZ0UvdWZ0SUJY?=
 =?utf-8?B?SXlTeVVLRnl5eGs4ZlF2T283WVBqNlMvbjFDdkdOYnZUVHNYV0NOUmpVRUVo?=
 =?utf-8?B?ZDA0My91TzdwK1VZTXc3ZnZUazBXTFRuZ0tGOXM2R05Sb090S3E1bytZSVIz?=
 =?utf-8?B?MjVYNndva3VJOXl1VzJLajNiYnNCN2g5SW0zZ2NTcHZDN3RQMlRUV3ZmM004?=
 =?utf-8?B?dlorc2FlS0ZiKzJKdXAzaVRwUHVmZG5tVXZPZWNHdkt5NnlOUXZpNFUvZ1Ux?=
 =?utf-8?B?b0lyOFRKaFZ5cWR0ZHJDcnlmNkQvbTNhZCtwSXY2YTUwZEVPeFlmL3Jmekti?=
 =?utf-8?B?ayt4N2ZlWW9DdkFscWJ2N0M1WXRrWWR5bjF6bWorS2pEbmE4L0FMdHRnU083?=
 =?utf-8?B?dk1oY1B6cFFrQ2szNGZPZTNCczlBbHVmcm1OQUh5Q1J1Y1prbGphVXg5UU85?=
 =?utf-8?B?ZnY2Wmg4U1ZOVHdoY2ZZU201M2ZzT1YrazJsSmtIS0NYNDBhZ2VYRVV2U05h?=
 =?utf-8?B?WGI3c0xtdTkwbEhXMXNTRGJBNGJkU050dVR0RnJ3MjhCU1liUkMxVWN4YWIw?=
 =?utf-8?B?Tmh0SG1ueVo5cHl1cXlqaEJjaVFZZTFod25waFFRMkdCR1g3VWJ4a1RVN3oz?=
 =?utf-8?B?MEQxQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWt5UmxqS0xLZ2JFcGRDekJTdnZVdXdjZjVXcGFuUWYvTUZRNkh2SXBtZEdk?=
 =?utf-8?B?ZHRYT2ZsUXp2cXl6NkJLdU9DdUJSRC8yRi9YUmU3SHE5TDVYUXNDWmJpMnly?=
 =?utf-8?B?b0x5L2g5aDBneVpZTWIyVkRkSUdHZGJya1ZKOEZqWWJLZHpvcEtONjArZEtD?=
 =?utf-8?B?cTVwSHZyVFZ0UDAzRXkzMWZWY1pwYmRaS2plRFJpSlJUeU9LYVViWmtkZWJp?=
 =?utf-8?B?SzJNL01YUGV1TUkrYVB6Q3V0VFhncFo5NktmVURENmVzZUMwNEQ4NlVMQTNY?=
 =?utf-8?B?ZDArdG1jUjVGL1pVZEhSSjhLeFVOTnVjN29lZnJZbCtXYUVjYkdUQS9zVEhv?=
 =?utf-8?B?T0xxL2JpM0wzNW9xRmEyS0VscFlUUUl5VVNGU29yS29jT3F6OUJpNngvN1pC?=
 =?utf-8?B?MnAvOHFEdDhGc1JxNFo0ODNGWVZseDZkOUJpRU1neU5JL3A0ekJFV0Fyb1BL?=
 =?utf-8?B?U0VRTjVnUTkxa1dYYmxrd3praENYTlhicWhNazhUSjhoOTVwK0VRL0hXZTVo?=
 =?utf-8?B?K1VLTHp0RFdoeGVJM0lncVhvRVF1REE4bm5QSUxzU0N6R01aNFVYTWROQ1p1?=
 =?utf-8?B?NXozNVhnUGpTNC9WN1N3djRweXE5dVYxVnVIbUtrMGcybEZCWTBmRmttS0xk?=
 =?utf-8?B?SllFOWIwelRLSGtYaTZMUzBsRnZIaTJETUJHMmFpc2Z0c2Z1K3Zlbmh4S2lG?=
 =?utf-8?B?WmdtdVlzTHhSUDF5NUJldXN2QWVXZFVSdEJranhmTHpheWw0ZDFSbG9qVU5a?=
 =?utf-8?B?Z1B3VkFGcUpNM3Zsekowbmduazg5YTliVFhyNmlIczdJNytyZkMraXF4cGZN?=
 =?utf-8?B?UEl0eWNmclNSSllyMzNIS21NenRIWEtrT1NoVkJjQlhaa3JaSjRBOU9RMVc4?=
 =?utf-8?B?RzRyQ1B3VjFtb0FudjQxelZsWklVY0dVK0hkNWdSVXkrUVRRSFAzUUQydFlr?=
 =?utf-8?B?a3R3dFZNWks4UDVySFlmdHlTQ1h2czBFNUZoRnV6YTdHajY2SEI3cTdzVW5V?=
 =?utf-8?B?Z1dkbmJNNjhIaGttelJpK216SnVhekN2cExOdjE4a1M2SExINzhDQnE3eTN2?=
 =?utf-8?B?aHNWeEk3RVk1QUtuT1NLL1RpYkIzcW9IUmdvRDJvdVFva3JXUVFjeTFIVzdY?=
 =?utf-8?B?WmhsYVljMCsyeEllQjdqQTJ2UFQxQkNmSGIxbis0a0NrQVhuV0owZ2JsK0pX?=
 =?utf-8?B?dmNZK1NjNUpmaHFtajB5d2RHd1VBcW43aEtjbk13bC9tN0hGSG9wdXVaUGRu?=
 =?utf-8?B?NGVRWGZmRGxWS2M0aWxYRUdDbEJORGZ3SXNvWkEvcitPM01BYTN3RFBaKzRu?=
 =?utf-8?B?NWV2REhaSjhMajdJbVliQTlaMEtqK2VxdFNXMzhud2NnelZYNnRNdVdYVkNZ?=
 =?utf-8?B?ZEpmYksvemxhYVZmYTJCSUJWRHhlcFJLVklDR3dnVUNnSkxKOENmRHZYem5B?=
 =?utf-8?B?cXkyM0dTWURoR1FaRzFRYktLZ3I2SHMyZVZad1gwb3BQYnpuODlOR3BLbmZH?=
 =?utf-8?B?YmtkM2YrK0dWLytBUFY5SCs0MEFsM093M21PTWRWeDlyaHd3ZitKbGM2YXNh?=
 =?utf-8?B?akVwMkY0eVNZQzZkMXlqYVhjamZVczlZd0hLQysyOTFGMTB0T1JDUm1iQUVR?=
 =?utf-8?B?cnEyczE2WWdWN3krY1dZSDhxMHVmUVJyMjZZeENkQko4YUJ3OXA0QzlvMU1V?=
 =?utf-8?B?dzNtQXFCRTQ1R0xYZWlCYkk5MTVTUTZMRTJRbnNkRVpYOGk2NVkrUVROQVN4?=
 =?utf-8?B?UFJYak9nVnk2NTZ1VHNXaWpYWjg0dy9VS3VsMlJzNzRrMXNFMlppRWVEb1gv?=
 =?utf-8?B?TDRnSXRrcWxab201R1laSmcweHo1eVhQOFl0RXNUamZJb1NhMDQvQWhic2NV?=
 =?utf-8?Q?uGQcgynlcsXv+?=
X-OriginatorOrg: sct-15-20-9412-6-msonline-outlook-c31bb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a37231e-e047-463d-60be-08def66f5b8e
X-MS-Exchange-CrossTenant-AuthSource: VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 23:38:47.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0696

A machine can have more than one sensor whose rotation needs to be
overridden, which takes one upside_down_sensor_dmi_ids[] entry per
sensor, all sharing the same DMI match but with different ACPI HIDs in
driver_data.

ipu_bridge_parse_rotation() uses dmi_first_match(), which always stops
at the first entry matching the running machine, so any further entry
for the same machine is unreachable and only one sensor per machine can
ever be corrected.

No machine in the mainline table currently lists two sensors, but the
Microsoft Surface Pro 9 has both its front (OVTI5693) and rear
(OVTID858) cameras mounted upside down while its SSDB reports degree=0
for both; the linux-surface downstream kernel carries such a pair of
entries and hits this limitation.

Walk the whole table and match every entry for the running machine
against the sensor's ACPI HID instead.

Tested on a Surface Pro 9 (6.19-based linux-surface kernel with this
change backported): both cameras report Rotation = 180 and render
upright in libcamera clients.

Signed-off-by: José María Martín <jmmartinf@hotmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 88581a4..75db4cb 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -298,9 +298,18 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 {
 	const struct dmi_system_id *dmi_id;
 
-	dmi_id = dmi_first_match(upside_down_sensor_dmi_ids);
-	if (dmi_id && acpi_dev_hid_match(adev, dmi_id->driver_data))
-		return 180;
+	/*
+	 * A machine can have more than one sensor whose rotation must be
+	 * overridden (e.g. both the front and the rear camera), listed as
+	 * one entry per sensor sharing the same DMI match.
+	 * dmi_first_match() only ever returns the first matching entry, so
+	 * walk the whole table and match each candidate against the
+	 * sensor's ACPI HID.
+	 */
+	for (dmi_id = dmi_first_match(upside_down_sensor_dmi_ids); dmi_id;
+	     dmi_id = dmi_first_match(dmi_id + 1))
+		if (acpi_dev_hid_match(adev, dmi_id->driver_data))
+			return 180;
 
 	switch (ssdb->degree) {
 	case IPU_SENSOR_ROTATION_NORMAL:
-- 
2.55.0

