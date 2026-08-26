Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012071.outbound.protection.outlook.com [52.103.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CAC345EA9
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 09:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737017; cv=fail; b=VDgaicu8rUNRPFSJi41VRwxCIfrDZaEw0NWlhqqIVCQ0nu/pG2HCfEYQCEis0WUbIjgAfnPoyF1AR+qVJ8GlqLDW3PBpprVkLZBBKYzh/bkCVKI/Z9rxg4jUpBqfRoM+iiMRoTa98cKsYgAoYV6eRQdHWYkqMgB/+4asl6GnkH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737017; c=relaxed/simple;
	bh=ACdmvepgFLi3OpnNil3JoyjeyckRH2C1UwCGLRvczA4=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=KPM472Qb2zMB5VDjNnBgY9s73K4y+454LMyeyRAu7opSqpT+k0Yb7+fpVdQmleOz0uJhGn1+LV6uKlUaw//88eihCgd+bPbKHAGEb6jnJNY5V7YQATBhqv2bhZIFe+oQnYm+Wwy2lRRqQzwvPjCE4MGtu+W6xUQHW25ERyXDlHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=Pf8KzktR; arc=fail smtp.client-ip=52.103.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="Pf8KzktR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRP54mEhxqpf4Yeteu3dv4DMnDtALxkJpWgj96KgmcvQhHi3OD3lAjO022LJwPtI5Zh9smb5mmdyoJeoPfJT2Y7TJQDOdp4wDuY0GGJGgja5oFVtcYi/r5pEBiGt4B2FtTMjstSdFxXvnz6onjPqQ7BPZqwMftLrJFsut2+nYyo93itxw45hYg4f7IRGKNONslUhDE6xYKmmc+iJEdwY2e1cHLIYD59YsRNaDKNMvnWN1LXMKLFXtATxAQRPIgbbQ3pOaMsdUtfV7kN3173N20sqgPqMjneDTUf5DNYLZWq32vyUKnK+5dOEzD2fcEWsiO9MScUJNDSOcnjmpk257w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klcIVQ79Z9xq9DiQkumlQwG2QvauCpU3M65HxK2ttxI=;
 b=u7oCjft3Z6P9SYLzs+4SaZzsyMZgo1/XAGdht62+tjekXYc6y2uysczQXaQ/h2D5AoZwi9PeKbYOcg4Tt9O9faknRRpwWVJ1vCR172wjkaEpY9XA/ZzlLYJHveGSfRdqY3oPlT8wy6YT07iIKbWJ4t6opMNW+ieidrZAORAi/Ihb6yW0vfv3OQvH+sCNDGhL1FJnYauPAfy40Nz0WbbYNzadhfVG4zYMlFpLAUAPIWPODhjiUDfzzLFhgMeID2R8yYk7Fkb6bnQHlPGqRtUq9O45rsDp47/JsU7BE/Ug+46y0vN/6wTISRjtjpr9cgetCv05VPw0NYjBjYITpiGK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klcIVQ79Z9xq9DiQkumlQwG2QvauCpU3M65HxK2ttxI=;
 b=Pf8KzktRIa44MBfjnxjQScxSvpav+9cCc3Fb/OOtBUlPxApjUvRnKVPjfhbV+6v24EouBTdlb4UTvUs9DRdlKqFNF3NtZ9q5OH/EnwwidTfsW8pQD94h7EpVItGx+GSJ1f3QeG2D7ORdLbw63Yc162kmVRt/zpOYt/BbLm2fYca9xnjJ7FkauMsJd3JjMBHdBa+jdZac3H6YaboLdbQLA3nNO2zdIVNOtj0lK5CVHz9fh0oKS/aHsk7kgRp69fOoGs7Uk7bCHC2wlah8uYxwX47ul8B579nHyWT3nIJcwC9ULPxOWioKK+fkmUHlw3aWUufaYCNZLzQOHNFJzPEKaA==
Received: from ME6PR01MB10716.ausprd01.prod.outlook.com
 (2603:10c6:220:25c::10) by SY4PR01MB6380.ausprd01.prod.outlook.com
 (2603:10c6:10:10e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 09:36:52 +0000
Received: from ME6PR01MB10716.ausprd01.prod.outlook.com
 ([fe80::8784:27a1:988b:bc6f]) by ME6PR01MB10716.ausprd01.prod.outlook.com
 ([fe80::8784:27a1:988b:bc6f%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 09:36:52 +0000
Message-ID:
 <ME6PR01MB10716F138AFAF015ED70D3AFAF4AE2@ME6PR01MB10716.ausprd01.prod.outlook.com>
Date: Wed, 26 Aug 2026 17:36:49 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dave.stevenson@raspberrypi.com
Cc: linux-media@vger.kernel.org
From: eee <D_0000000000@hotmail.com>
Subject: OV9282 driver may not set correct value for VBLANK and HBLANK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0024.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::14) To ME6PR01MB10716.ausprd01.prod.outlook.com
 (2603:10c6:220:25c::10)
X-Microsoft-Original-Message-ID:
 <d85376c2-4148-4c42-a74b-4dea6801f52d@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME6PR01MB10716:EE_|SY4PR01MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: b331ec99-de1e-4229-44ea-08df03558efe
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799015|6090799003|39105399006|19110799012|24021099003|4140399003|25010399006|20031999006|15080799012|12121999013|23021999003|40105399003|2607281247196008|440099028|26104999009|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnNvVmZqQXF5alJUVGI2Z3h6RzBMOThjZWgxNXByMFpDZnVubG1BOTc4cUZY?=
 =?utf-8?B?aldydHFsNTNiSlN5K1NZVE1XaWx4R2c3cHhLTHk2ckNZaU8rZHhCVXBoVFRU?=
 =?utf-8?B?NTV6WmlCYlRtR3FGWExQK0ZkSitsQzgwbDZVUnREOEtlUXZzSXhIRnlUL2tG?=
 =?utf-8?B?T1k4WEJqMnNIUWN6eDdCbHZ6ZVd1YU1IZkZZM0N5TDV1WGhzRVFvN2QrdGpC?=
 =?utf-8?B?d1BkSU44dG9sL2hlNU9ZeG1pcS8wWFZkMEw2SzRvOHo0bGdMcXB0bmFEWXNi?=
 =?utf-8?B?RkhVWXNOblJWMHZkM1F5UVpuSlhaaDVSSk9DM2pNVUNyMkYzNGFrR1BLU1Aw?=
 =?utf-8?B?bFJ2QjEyenk4QUN1RUxyYStKbkx3N0dHYzRHb1I1ckV4SEVzNUJINE43K044?=
 =?utf-8?B?MVJYdjZ3SzJISEVxQTNoWm1GMmxScTRLdW9EWXNnZjNRVGpuaUlmbzBzRW4w?=
 =?utf-8?B?MExTaVIycTlRTXFCZkIvUjN5NlFnK1pMaGFGM2ZtT01GY2dzVHRsd3FkZWpY?=
 =?utf-8?B?UUw3b0xveVhrTXB2QllJdnpJYng3ZGorajJUeGdvT29wN3hhU0FTaHpHZjM2?=
 =?utf-8?B?VTF6TTJjRkp3ZHNZWUp6RDZjOGpIZHB1RlBhOHExS0xxTUZUK2J4bU1BRUxr?=
 =?utf-8?B?SWJ4aWZqNXM5REZIWlZ5NlU0QnFJVzJ5MlJKK25lc09TVlNvYTVOMXp3UVVR?=
 =?utf-8?B?QmxBQm1FV01LNy80Y2IwR2JvaWs4VDZmcldyd3NvakJCazFnZkgrZFZYSHRV?=
 =?utf-8?B?OGhELzdWVzlQb1VLcnRGTWxkdU9kT0JHSXo3UEN2cS9iYks0aWhIOGI0OE5J?=
 =?utf-8?B?U25Db05iMHZ1aUdocnZSOUE4RlRCd0c5TEY2TDR0RXlRdmhiRmRWbHRBcnV2?=
 =?utf-8?B?N2NJa3p0eDNxY3lmdTBuQWZwTFpxS2habW9aUTdvQ09TcDdYTGxDYWRkc1J2?=
 =?utf-8?B?WXlqSWFPeGV6M3pPZFFDYWR6S3pUdkorKzBpVmtCaDhUdUpoWUlGSDZSMkp3?=
 =?utf-8?B?U0ZwaW84YkJGNDE2emlxTXZ0Zm9hWGhoQnQ5bEsvZSt4RDlwSGExcGFaMFJJ?=
 =?utf-8?B?RHFZK3lKMG1IM29CZjF1NGs3UmtqU29SU0tRQVlWUlN6cnFlSnRvSTVqc1Fu?=
 =?utf-8?B?UmNrM2ZzaUlVM2lFR1BZN3psQ0N5UjRJUlN2LzNzRnF1Mjd4YXFpaGlHZng0?=
 =?utf-8?B?NnYrOE8vYklZZ2pzS0dlYlMwZHRNTVhmaVczdEk5SGRCQnhWYnJyc091TVdy?=
 =?utf-8?B?WE45a2FIb1RMMmUwQWlSMFd5TUptNnhmNkNBbzRxUEtqM3NVTU5SejQ4eS9S?=
 =?utf-8?B?NGdVTVlRWDVKZzRQenQ4NW9JUTVkRlhUaHJWcUV5eUc2cTNjbUVhRElqSG5F?=
 =?utf-8?Q?3SDGcM+Q+VfOitbllnUqmYg7kiQG2iZA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFZvdWRtYkFNREZrdXZOWW50YVpVdU5sZ0xDbnB5YzduU213QWFpOWJHd2lU?=
 =?utf-8?B?cWN0MUFsbjQxWFJmWEdWc1NkbHlFdTdONnUrYTU3VVptb2E5YlpuYXBqWVpZ?=
 =?utf-8?B?NjBoSnU0Z0tUK0ZxaGZscFhsS2ZtSWIvUkMvNCtaa0FpTjJtcmdFQk8xbmdL?=
 =?utf-8?B?cDlJeVgwdldhM2h1NDdvcUh2bXUyYVhuY3k2K2tZeEFUK3RRbW5vd3FpWGtS?=
 =?utf-8?B?YmxOeEJMdWxTT2Z1NGdvK1lKeXN5UDNyeHV3S2diMDB4RWdWZ3p5aVVQanFr?=
 =?utf-8?B?ZmtPTVc2R2c4bURGNmpXT210SEVLM2ZRZy9EU1dPQzRKcjU2bDhUYlc5Nlc1?=
 =?utf-8?B?b3dqUXRGelRPKzZrRzJ5UDFRSGVUS094T3FMemhSVnQ2T3FxQ2ZoRzdYcWY3?=
 =?utf-8?B?WlJLQTUwSDlsMHduSnJMSGRla3FKM3JRM2FsOVhQOHNZK0dmN1kyL1M2R1lt?=
 =?utf-8?B?ckhuVXh0V09qTDJZWVJyM2l3Y3k0MDdzSW5IRFRPd2JsQUh5OHp2SUsvTEtF?=
 =?utf-8?B?d0FyU3BFenY2ZlhGRExLdktpcHgxOXd6dnBMQ0FTazlKQVFPWFM5cjQwYzZr?=
 =?utf-8?B?bzJCc3BNU3FpUlZETWUza2ZZaWRPR2FOR09Ia1JEbTJMQ2pEMlRBRzRwNmpi?=
 =?utf-8?B?cW52UytZNi9keUFEcHJIK3ZNdlpQWGFRQWg4dkNZamY5Vm5mL0hvTlpFMjEz?=
 =?utf-8?B?MDVoNi9RV3p5SWllMEVFMkdLQVVHMVAwOHB6N0VxcWxyVVVnaUptNm82WVp6?=
 =?utf-8?B?MzhEUUl1aDQyREUxS3JOR1V6akxYQjMxRk9mbUFJMFluSEhuOTY2cUc3NG04?=
 =?utf-8?B?WGVTOU1ZWmxIUndhS1JoUDFKRzJSSmRTaWlET3VWZ1Y4a25WMUpZb0VvL0k1?=
 =?utf-8?B?MnEwRFVEcERIdDk4M1ByY3ArK1QydEswTUJyekNJeG9BTCtTR2VnMkxKS0ZE?=
 =?utf-8?B?Yk5oM1JmMzRvRXBxQTVFNndNekk3VXdld0V5bXJNYWhSUmQyWGNOdzlJMFQy?=
 =?utf-8?B?SEtRVzEwaElFZ214eFlORE00ZXQxOHpWQk1VYXgzSmwyTnpPbkV4ZDNOc3Z2?=
 =?utf-8?B?TW1tRTIwWEVXTXdGVTdqUU5nZGVldHY5RkpEQ3J2NHZRWUZxV1hGanJpV0gv?=
 =?utf-8?B?UG5VeHVkS3VPVEh0M0V5cHVNNGZyMHVETWRPS1pETG9KMkwyLzB1enlGRHNP?=
 =?utf-8?B?QXQvaXR2RHdKY1hlR3pxZmtXZlZHd25BL2cydjYwSU5iWnM5aVdTTU1jNWdG?=
 =?utf-8?B?cXEvaTZUaTY5WGNzSW1uK05jWkZRREw4UEhyZzVnUW5rYW5rOXBmODRIZmdw?=
 =?utf-8?B?TGphN3I0SW1PUE9DSEpIZFU5N01UNnJWRXZYcWtwTk5Rc2FsN1ZSRWZxSXJ5?=
 =?utf-8?B?dW1keVlRbEQvSUNvQ0tGc3g5azlIZ0JNKzVXb3RoTmJaZzNxK0ttZk1YQW5a?=
 =?utf-8?B?Ymp2Z1REa2t0azh5RUUyeTNMMnRZWGs1WWVMd3l3aFRTT21XVEFjYzU1UjE3?=
 =?utf-8?B?NzZVMEFLY296THhVSHBUUjA5RXRHRXpNWUdqVFF3SWx5V0c4bEtMRVdTQ1dY?=
 =?utf-8?B?QTF6UGRvOGFUM2VOa3ozN0ZPclQyejZaUHltTUQzL0Z2VGs4azZNUHIrK0Vr?=
 =?utf-8?B?b3BZRnZ6NHRZaDlPeEVnT3d2YWpUQ2ZjTmRUZ3BpbE45NUU4cW5naUhHZmhV?=
 =?utf-8?B?SnRVWFVTOTJZNXduNTkwSUF6Z2VRcEdQb2YxV0Fza0U1TVRQTkluZ0tzc0hG?=
 =?utf-8?B?eWJjeHZreWk0bStScWZFbFdUajhLTTBaZytIUW1VRytKSm5WYWRlSWVhMlZS?=
 =?utf-8?B?b09ZOXI0NXRBMVNvYy9mM2dLeGd1amFwQWFVTjRITjlvOEtFQzBYby9FSVRL?=
 =?utf-8?B?bnVmdkFEakxqN1JsU2pscDlMa2hVejFCcFY3aGpxTEhLUWxPRHJsbmtCS1hu?=
 =?utf-8?Q?C59qypqA1Xw=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-feddd.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b331ec99-de1e-4229-44ea-08df03558efe
X-MS-Exchange-CrossTenant-AuthSource: ME6PR01MB10716.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:36:51.9173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4PR01MB6380

Hello

     I am trying to get an  OV9281 sensor running on a rockchip RK3576 
single board shipped with a vendor-customized 6.1 kernel. Sensor can 
only run at 1280x800@30FPS, not 1280x800@120FPS as product brief said.  
I downloaded a OV9281 datasheet (definitely not compatible with GPL 
license) and checked register tables. I found that driver may not set 
correct value on VBLANK and HBLANK. Since OV9281 and OV9282 use the same 
driver in mainline kernel and both kernel set the same value, mainline 
kernel may have the same issue.

    There is no relationship between VBLANK/HBLANK and VTS/HTS. LPFR 
(line per frame) in OV9282 driver is not VTS in OV9281 datasheet. The 
only requirement is VTS x HTS * FPS == SYS_CLK. For default settings VTS 
is 0x038E HTS is 0x02D8 SYS_CLK is 80MHz and FPS is 120. Maximum image 
transfer rate can be reached.  For those settings resolution can be 
1280x800 which is greater than VTS and HTS. OV9282 driver set VTS to 
VBLANK + HEIGHT. I think driver may set wrong HTS and VTS.

     I patched vendor-customized kernel and my OV9281 sensor can 
reached 1280x800@120FPS and work normally. Mainline kernel 
and vendor-customized kernel use same value, mainline kernel could have 
the same issue. Unfortunately I may not be able to provide a patch for 
mainline due to my work, but I think I can provide my patch for 
rockchip-customized kernel. As OV9281 and OV9282 drivers are almost the 
same, I think it does not violate rockchip's license.

     Please let me know if further information is needed.

