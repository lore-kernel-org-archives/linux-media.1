Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8103815DC;
	Wed, 19 Aug 2026 05:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787117657; cv=fail; b=nlEEU2dnqp8xdTRZ2TvZYHNoFsl8TC7wsrkCsOWVrQkBRjPwWIWezJnCwaDZtTmn8MjAoJVtO5xcUg+SZw6t17I1R7cNNcdWgGRjM6F4LpFaU3UnpUZOox66vERX3r2ejXQ3q2xY/gZcWiTbBEEV/JFtooZGMMvMj6tfzoItQv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787117657; c=relaxed/simple;
	bh=e2W0dgq4HywwOVSjXXgaTO4l8NnUq4WVOUU9ZXghyZ0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T7j8ARl0NhVEx6ohgs/oZxZJOAblhV0xKPjOpOUh4rbbHW1NFagj8QucThR9XqVt/wHC3xXaOfQzqmzk9SgB0QxFBYVX6o0eDMGrEA2fAlzboxg3/hLe70o707YVjzqP5TdkNonbcLhdqyXOjt5enqbaoPN9GiF86yaWkm5/7dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=cNDu03T6; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="cNDu03T6"
Received: from pps.filterd (m0209329.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J2k4Nu3430008;
	Wed, 19 Aug 2026 05:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=ukGqq4K
	uvzRCA+ONjF9B3L6hK/d+q99tVyWxnRQgNUA=; b=cNDu03T6WdvDLbiRyVE+JVp
	ZTiqRaX8q3ekANnhmi2TJwEDDhcfkUZCRuGl16PrglBWwXnFQP95JGd8ai2yALTN
	GfOYIiaS86YeP7K3bzN/ebqRwqvJ5DKZJctKUuJETUQoIAXzuxAojZxVWp51s8Xu
	gdJRdH5fseuUHpWQ7RmJhTHynweXHXm4VtdSPVlsE4vaCebUR/2QASbuVAkAsDKi
	oR9Wtgo7At4n2kpE+TIg9eiwnIve0go04C9cs6i/YWHg+SpmqO5WaO8aHJhT8o/U
	LZfQk72u93z2Vz/v2iHwS8uG1auZ4iDR4+zlYoPn/u+fI57erojnCcbQ3WgxXpQ=
	=
Received: from os0p286cu010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4g4yeprf4c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2026 05:07:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNI8KxY2IYgJLMDkASZC56Oo0VSiD2rqm8a2l1yfUVO0mao1DcDjHVyVKILrGoCOEPp2wr+IfEfY5SiT4OIQEU60HFy4rP4jLbpuZewGXSiIrhJir/mSEqNmZSnCp/338MSAIO8IKXMQ9gT2zy2aR//cqqrlIB4DoTxnt5MhRSrAzYDI2B1TeBI89kPH2Ynf/ZhMev20PWzW1jRWZzNbT16Q+1a0S1PgnFr0llbD8A+6E7k4JLKRYbZaRbS84hxesriQh3E5dMNNyzYsm0H1LzMNVt8CzD2gxKMaRzBXBeGFuMJEW2EWPvjPDMl8hmFFgKJxNuuy+vetTRvAHYoLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukGqq4KuvzRCA+ONjF9B3L6hK/d+q99tVyWxnRQgNUA=;
 b=sOIKpeElImXsi4oSoSzZX3wBHt6dQ2dDIiPGWNsl0qyyfq8seE/B/Oks+6KIghkUD1WXbapQL9MntzdJcr7rt7EOtlYCbn1coJQfdWhqQF7hYhekKNVzvDHQpNc9sQnprWbc8tvfJqoGxiUIBY316V1hGw9vabgrUXIKRwnWWdZ8xAtJTyhm4vlhugryFsD3TxPg0Mk0qtEDZ+7Dp79ItwdpYKthCnE4gtxgUJa00t/uqEvUR1s0hNXg6rfupPtPX3J7FAMpMZF2RzjCnFk9u7AX8T8zlPQ9HLSTTGKAgcMZ28G1uwz4wuBNSZmapSTLRDkMTvPwEpfhnHVmorh0mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from OS7PR01MB17833.jpnprd01.prod.outlook.com
 (2603:1096:604:445::14) by OS9PR01MB15945.jpnprd01.prod.outlook.com
 (2603:1096:604:3d1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 05:07:13 +0000
Received: from OS7PR01MB17833.jpnprd01.prod.outlook.com
 ([fe80::6938:cbba:dd27:306a]) by OS7PR01MB17833.jpnprd01.prod.outlook.com
 ([fe80::6938:cbba:dd27:306a%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 05:07:12 +0000
Message-ID: <38ce1e44-2dd6-410d-abc5-554564cb1252@sony.com>
Date: Wed, 19 Aug 2026 14:06:57 +0900
User-Agent: Mozilla Thunderbird
From: Lachlan Michael <Lachlan.Michael@sony.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add Sony IMX908 image sensor driver
To: Jai Luthra <jai.luthra@ideasonboard.com>, devicetree@vger.kernel.org,
        hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        kieran.bingham@ideasonboard.com, Ryuichi.Tadano@sony.com,
        Kengo.Hayasaka@sony.com, Tim.Bird@sony.com, Kazumi.A.Sato@sony.com,
        linux-kernel@vger.kernel.org
References: <20260806070934.21764-1-lachlan.michael@sony.com>
 <20260806070934.21764-3-lachlan.michael@sony.com>
 <178608558219.4139729.1786136799159384307@freya>
Content-Language: en-US
Organization: Sony Semiconductor Solutions Corporation
In-Reply-To: <178608558219.4139729.1786136799159384307@freya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::14) To OS7PR01MB17833.jpnprd01.prod.outlook.com
 (2603:1096:604:445::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB17833:EE_|OS9PR01MB15945:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d7044d-4cda-4076-6f7a-08defdafbac4
X-LD-Processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|4022899009|7416014|376014|10070799003|10067099003|56012099006|6133799003|3023799007|5023799004|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 PhGv2hH0iBiOLLetkgGnCOqBbFx7uupEWIP3MNQe4ao7iFTO4KbKcFgwB5GuAEGGt1BLtGGqRHdEKlkhvea/NQ6lVK7lKLkihWEojyLrcwoC0r8sAabOAx4wLtTfSwnnWVy+0h66ApyTsbdPoPlW+ayzvGGBXXRTxRa6FDlQ21DVHGkjgDX7g3PCvbqS4e74BMZalwzmAW5Snjo4saDYeSumq/YcGAHnpFRKcXmce+C5rPgqoJEhtrm5EmZPF/wwLDXowuPKuyGItNJR4stpUx4FvGRmxrnuOorSKJGLGDgYmfKTXxnWEj6oUm3K8S1QciTypMB+qHJSKQDmlaqO4V0sJhVSDZj8V62W3Q2PhrFDdd/3wNP6Wt3XLtbHk5TwCfyACTXAkOb9ENYOBU7gM9pyR/DnXNECuH2TLDPxPIwKNZuJlj1LU1xNwugAilslQKuYNTOllZrB7D8P04JF0rD/kaB1FKJlpv5vhNHiK3LGubmVallrzoFunKfvqT20bTq6Q998HqiJKG2XYdOthpjs6RjSq6HUVbaN2TIuTL/4U3cPhN1tjP6TyDHmTgim4DTTnXVM3DH1hv5cbUJWbJcIkjysVmwavzBDjqATeTLyvBTWXbBecuRDSGlTkHvwz5f8rqZP3fXqFNw0Dx5nTU9j0VEeTWCa7LJ9nbHE/BE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB17833.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(4022899009)(7416014)(376014)(10070799003)(10067099003)(56012099006)(6133799003)(3023799007)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?alluL1ZqYkppcGxBNkpMZENQeDN1dnN4ZkQyc3UyZnNnNVJEaGNBelJueXJ3?=
 =?utf-8?B?MSsxbGVsbmJURUQwN0ZXWlJobHpmbW5yVkxqRkNEVk9mbGZJblIwM2R5a3dn?=
 =?utf-8?B?Unk3djFWMmE3RjBFTVMrWG15U1prZnEzeXM2QkM3NUtxbFZEdEpuNXlpem5t?=
 =?utf-8?B?VzZmUUhlZlZ5MUZ1MGhkK0lUL0N2TzRESnFmTUw4RjIxUTJucnlveVJWVTFC?=
 =?utf-8?B?NXVZOW9yRmRWZUdxWkFaZW00eC9rUnJrQmFCbGs5elEzRmVYTzVXNEdqY2ty?=
 =?utf-8?B?RFMrenZjVm15SFZ3bXlTTXFTUWVXeTF6V1FHK2lqcXc0ODR1TmtxM2tGMUpM?=
 =?utf-8?B?MVpjajRlNHk0Z2x6NVFlY3hCdDk1bzdvclpPYjFmOURuTUtpODNrL2FMOWdR?=
 =?utf-8?B?emN5Y3JLQmU1am1NK1FoaklmWHNMMFNETUlrQldjZHBvU2ZvZnlIZHh3NElC?=
 =?utf-8?B?RExCNm1ibXovL0g4TlRqSnIxc2lyV2NodEQ3OE5GandIR3AwVFRyNG5WNWw4?=
 =?utf-8?B?ZzlEU1JldW5JcC9jRy9yOEdoTkd6RU0vbHFJZWFORlUxNUYwc2trcCtOdE83?=
 =?utf-8?B?MWFzWUI4d1M1L2ZvTGpTZXhMUWcvSE1jb0gvOFJITkVWRVBGQXFKT0ZOUS9p?=
 =?utf-8?B?UWtnVnpXR2sxalJiQjhKRkZadHpqK2xHK0lTUzRlL2lVM0dRZkhyTWNSSGZX?=
 =?utf-8?B?YkdsbnRMbWwxWVBEVjc4MWphRklBTnRHb3g0RHo3Q1U3N3ZTQkpYcHk5cysw?=
 =?utf-8?B?eXVDNDkvcEZydm5jV0VxTmZLTFd4bjl2eG1seFQzNVZPTEdvNDFkZmZYWHBI?=
 =?utf-8?B?YmphRW00QkNpSEdmci9LVDhEbnRtclZ6MXBKd1UxNGlFVy9BOUNxd3IwSmdJ?=
 =?utf-8?B?c3poUDNvZk1FbG9naHFyNXY0MTg1UTFkWnhudHZ2S3BsSFp3Y1VTY1gvMXVQ?=
 =?utf-8?B?ZUFNRTV1RHI3VWc2RE92K2FYeHZ3T1Z3SnJ0MjZpSGltZVl5RWdMTDZLcVk2?=
 =?utf-8?B?aWlURUFabmV3VThyR2RsazZ5V0R4NFdhNjFhakRGQUtJdjFIVzAyeksyaUpm?=
 =?utf-8?B?aExlcTVoZ1luS2JUVW5LQ0svVi9CYUs2NVRKZ0pnaFJ5c0FKNG4wNmxUc2kx?=
 =?utf-8?B?Q1JoS2ppeWtmVm1wV3ppRjg4aHdBMXo1cm5yRFFmd0JpelJxK0dmWVlHU3dV?=
 =?utf-8?B?T0ltRlZmZW85ck52Y0NLR0FtaEpOMlJCYW9WaWoraUJ3b283NHAreWVUTldB?=
 =?utf-8?B?eUR4aHdMZVVCMDFWNS9HSk5LMk95WTdxQlY1c3dtMXY1bGFmZDJGTE9VaUMw?=
 =?utf-8?B?clFJNGtIcmo0UTJBZ0pNRkg1QVVhRkhqL1RRbGVKWmhpV0NqMHdPb1F2TDJh?=
 =?utf-8?B?Mi9LeEh1RldPMlEzRGl6Y090NjUwb3NvTzQ1VXNIUmREZUZTU2ZDa3ovam1i?=
 =?utf-8?B?WVlwYVN3WWk5b2s2SjQzNWJuejlxMGVsT1hsUEowc1g4dVNMY0FBMDRHd3dn?=
 =?utf-8?B?NWlWVk8yclJlVXJpM0NhMmJSNkRZNy9jUlVPZVR3M1Qwdm1SN2tteHV5cmEy?=
 =?utf-8?B?aUpQZUZQakxzeHFTTjhZMElKVURUbGhldzFzMGU5VDRmMXlSREw0Q3F5Q2tX?=
 =?utf-8?B?ekdMU2pJaUptUXVzZFdwZDhRMUdDV3RJWFp5Mks2SzFaOExFQWtVUjJYT3Qy?=
 =?utf-8?B?ZVpGZE0xM1B2UndsVUo3SDJla0NyaFRaY1FHdDdvRWFUampPcEx2akhMYjhx?=
 =?utf-8?B?ZElVYXluN21PNTdEdWJiTXVKTkZOREI4M3A0am1YQTZ0bGQvYzM2MVhRdVRE?=
 =?utf-8?B?aENmQi9DUElDNUNkdytJWG52LzJKNzYzWUlNNlZ3Tm1SNWJzZzE0T0FSUWgx?=
 =?utf-8?B?czErVVU0U1Q2TUhoaWVrVnVCZVlmaWlWUWw5UWp0Mzc0ODF0bGxEN3FRYi9v?=
 =?utf-8?B?UHdtTmZLdFJVWkE4TGExMlRZZlRXdE5hdkZmQlZiM3gyV0RrV3J5UHhYZW13?=
 =?utf-8?B?WGZZSUJBV1E2Nnpna1puVnJkRzluY0hTeWp4UkpRT0VMdmJLajIzekJ1bzJI?=
 =?utf-8?B?Y3Y1WjUxYXNRcmMwaGtzOXpDTGhuM0pneWZHLzNFWktPR2ZwM0dnRU5BZHF1?=
 =?utf-8?B?NXMveTNJcWh0bkJRbm5Ra2FIUUEwcDNBdjN1NEhQaXZOeXo4WW44M2tncnQ1?=
 =?utf-8?B?bi9VZy9vcytzcWRYYXUwQWhlbUhuQjhTT2FKb3BiNXcvY2lQNXNNbExYUmhn?=
 =?utf-8?B?NXJFM1lHNVlEcC9CYWppSU1GY0JwbDNGZkFvWXExZWNpeW1uWWYrVzdWVGp6?=
 =?utf-8?B?TkR4c0Fqbld2Y0Qvbm1hZnFlc0lxeUljRjFMcmV6anFOenJsUi8rL1NSbXR0?=
 =?utf-8?Q?jnkujJsHhFWrnkCPm7hBHQRPACizvgsYDXC5SciyyfRsk?=
X-MS-Exchange-AntiSpam-MessageData-1: AKzAunAvAAPzXRrnHeZJ0e1E87fRVAAcXrk=
X-Exchange-RoutingPolicyChecked:
	q/kjjYc8PiCcL6+2NLMLtc0gT+pt136Qojd3VxVboNjGaJGDWfbMWXoQGlV+TmiMLDrYjg22H0nPjtHv03lIv0c6hc1sptGkusiGaqtlFsGeSZyAKMwUFMiYz7B8YNfx3eOPZJtZDUn8FI6g8lO76P54dKmP5JzBOkVHdY0Fv2bsNYjSPpLW0d32XBIRMVDYhUYdHqh8bUuBK6o0Csp54/fXZwkAgm/cBW5a1IP6RC3gCzrHlRo7F3QFabARkdD+zjmauUnxHs5F3dIBHwxZRRYSsQzbexSfcIVDvWQCu3ht3QeXKqpZ4/GV5WRXc+DyEMkDkGthGRlIE4KcFnhKCQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4ZE1srQPDgQtpJ8eCgz4ewk9i6RGuflel/asm1AoRygVyPpcn4FQWs9MD3VZKoKUEFkZWLCA+czP0ZuclHkxCSJdkMfFYZhmAeIsU56fFyucWGXJbPhvR4mL/MYd/f+7XPrn6ykfP1AK6PykHK3mzGvd8AWHA1nKZqvE37vYDnb1CkofakfFuzaG9I17DIWaeuzQI0SgDFwtwG2neqFh0ILdUGJewqfvCN65iSEcHJGLkuog0fjOw3g+YQzjYcQEj370W6QDTQLEd1O3vrOgLS00aiDKVVY4xCtJmO06ZL/6/huHFeilih4MQVeUfdGl+2ZPLSLW8aD8UR2FnVPYz/Skj9+Ke+mK7U1IKuBbcLHzj7xLXhlfWYkVL1hP/lZ9+K1odr413Zt6QpB3ENDd6XSKwFQRlbo7jj2zMB12r0fjNrkg+wDOv3kqNtgGISFai7EefFMdBmnQOr+N1TbzbSMwiGL7Zr+0NUdoS6zUqGwTUQ4/xfGpsoi8mc2ABbVZE+y6FE9OtW8N4754Ah/dsoY52gaOh28og75ULat3PifPWCZB1dGLRN56fxkNjSfiSJEIX8ha/qxSIqscilae3e6r+bu9ZNe+C/UcaNESedgBuhLsLxrxYD3mJpjXxzWK
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d7044d-4cda-4076-6f7a-08defdafbac4
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB17833.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 05:07:12.9021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CoxcTHKwPBP7s6IBS9kr9LUAZGtpeLDOvQCM4ih3APU89HaAZu8XcmoJGKSuCc0fOL1sNWfUKYIwm8ADZJEd/hF2xf9iBUkUCSMl0qHIms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15945
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzNiBTYWx0ZWRfX/H1Vs4XsLC4P
 nNuSOpP079D5W+H0i9IiGokfVNScAZLwTJ7rfqf0xhOVGpDmbaMZOl0K+/IHnwNeY+qX5feKdI6
 8LZVqlOIIFCY1eOUaH4JNtaYJk1xUyM92tgf3OOGwzBCy83MG7/DthTpo6S4LbB6LEXOGc2HmuD
 mpFbPrx9WC9W4EqKBybm1/n9TT9G9r5Di1BZq27J4B4J5x6evBtK7Q85HrK/AicUd1D9AcewEt5
 8ULp1O1wLGt4yaFXOD9gwBOkO0n0cwbTxfg/DKV9ys6Nh59Rh0/SSy8qvVAE2BE34OLEFpzPP93
 GJDZHEwWqouQOg2+CvnbnYbYFymzDQpAPjV3aeSVH2HvcOdq0DR20YQy/7cu2OAwyLGNPcXd1Bb
 i0Vwvg6mVXPeyd9F0ZzAr2MckYWk0ubn7+Ao/6IsJWxjmXtuYjWVbaPBMPn1xZgeOnqFhWde5b0
 63w45QiCgsWMOntoybA==
X-Authority-Analysis: v=2.4 cv=LdYMLDfi c=1 sm=1 tr=0 ts=6a853a0b cx=c_pps
 a=uOCW0hy1NNVQXinR4U6sFw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=pQehfwC0D4oxWvs5GOjV:22
 a=NEAV23lmAAAA:8 a=z6gsHLkEAAAA:8 a=WD66JCu4U_OUO5sd7lEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: KcC_ywcP68Ajs2xN19qlKNOoJvfmEudN
X-Proofpoint-GUID: KcC_ywcP68Ajs2xN19qlKNOoJvfmEudN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzNiBTYWx0ZWRfX5Q/OXvo3Bybt
 n9ZfNG9BK0792WkpeDBI9PK5CPZECaJFEqFvmk3N66wpb3va1Ds3gJQbcXM69+oPrmLj50s6NsD
 nUl0J2T9W3ZlqBo0ZdgnmcPVzxt9lkUKFEyC4GAogkK1uFyUb89e
X-Sony-Outbound-GUID: KcC_ywcP68Ajs2xN19qlKNOoJvfmEudN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01

Dear Jai,

Thank-you for the review,

On 8/7/2026 3:53 PM, Jai Luthra wrote:
> Hi Lachlan, Thank you for the patch! The driver is mostly in good shape, 
> except a few small things and requests for information that Sony is in 
> the best position to help us with. Quoting Lachlan Michael (2026-08-06 
> 12: 39: 34) > The Sony IMX908
> 
> Hi Lachlan,
> 
> Thank you for the patch!
> 
> The driver is mostly in good shape, except a few small things and requests
> for information that Sony is in the best position to help us with.
> 
> Quoting Lachlan Michael (2026-08-06 12:39:34)
>> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
>> with a MIPI CSI-2 output interface, configurable as either 2 or 4
>> data lanes.
>> 
>> Add a V4L2 sub-device driver for the sensor. The driver supports
>> RAW10 and RAW12 output formats, exposure and analogue gain controls,
>> horizontal and vertical flipping, horizontal and vertical blanking
>> controls, window cropping and test pattern generation.
>> 
>> HDR modes and RAW16 output are not currently supported.
>> 
>> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
>> ---
>> Changes in v2:
>> - Treat the pixel rate as a fixed sensor property (594 MHz, 8 px/clock),
>>   read-only.
>> - Compute HMAX from both the array and MIPI link floors.
>> - Express HBLANK in pixels with a step of 8; keep HMAX fixed in crop
>>   mode.
>> - Drop struct imx908_mode; cache hmax/vmax directly.
>> - Change the link-frequency table to s64.
>> - Fix the probe error-unwind ordering.
>> - Be silent on success (chip ID print is now dev_dbg).
>> - Drop redundant comments.
>> - Kconfig: fix a "module will be called" typo.
> 
> [...]
> 
>> +#define IMX908_EXPOSURE_MIN    1
>> +#define IMX908_EXPOSURE_STEP   1
>> +
>> +/* ---- Speed of internal clock */
>> +#define IMX908_XHS_HZ          74250000ULL
>> +
>> +/* Fixed pixel rate: column ADC reads 8 pixels per 74.25 MHz clock */
>> +#define IMX908_PIX_PER_CLK     8U
> 
> Can you confirm if the hardware is actually doing this, or this is just a
> guess like I had made for IMX678?
> 
> It's ideal to know what the hardware does to better calculate minimum HMAX
> value for cropped modes for Starvis2/3 sensors in future.

For v2 I have just aligned with the IMX678.
However, upon further calculation I think this value should be 16 for 
the IMX908.

The reason is that the operating mode table contains valid modes using a 
recording width of 3840 pixels with HMAX values that cannot be achieved 
if the array-side producer limit is based on 8 pixels per internal clock.

With PIX_PER_CLK = 8, the minimum producer-side HMAX would be:
ceil(3840/8) = 480

However, the operating mode table includes the following valid modes:
4-lane, 2376 Mbps, RAW10, 90 fps -> HMAX = 366
4-lane, 2376 Mbps, RAW12, 75 fps -> HMAX = 440

Since both values are below 480, this suggests that sensor must be 
capable of exceeding 8 pixels per clock in at least some operating 
modes. The smallest power-of-two value consistent with all documented 
operating modes is 16 pixels-per-clock, so I have changed PIX_PER_CLK to 
16U in v3.
ceil(3840/16) = 240

>> +#define IMX908_PIXEL_RATE      (IMX908_XHS_HZ * IMX908_PIX_PER_CLK)    /* 594 MHz */
>> +
>> +/* ---- Subdev Pads */
>> +#define IMX908_SOURCE_PAD      0
>> +
>> +#define IMX908_DEFAULT_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
>> +
>> +/*
>> + * IMX908 total area includes active area height plus
>> + *  4 pixels effective pixel ignored area
>> + * 10 pixels vertical direction effective OB
>> + * 10 pixels OB side ignored area
>> + */
>> +static const struct v4l2_rect imx908_total_area = {
>> +       .top = 0,
>> +       .left = 0,
>> +       .width = 3856,
>> +       .height = 2200,
>> +};
>> +
>> +static const struct v4l2_rect imx908_active_area = {
>> +       .top = 0,
>> +       .left = 0,
>> +       .width = 3856,
>> +       .height = 2176,
>> +};
>> +
>> +/* Recommended 4K recording area centered within the active area */
>> +static const struct v4l2_rect imx908_recording_area = {
>> +       .top = 8,
>> +       .left = 8,
>> +       .width = 3840,
>> +       .height = 2160,
> 
> If I understand correctly it's better if the sensor captures common
> resolutions like 1080p or 2160p with some margin, as some ISPs might need
> to discard a few pixels during de-bayer color processing.

Ok, the main reason I had this here was that the datasheet seems to 
promote 4K rather than the active array area.

I deleted this struct and just use active_area in v3.

> Another comment on this below in imx908_get_selection().
> 
> [...]
> 
>> +struct imx908 {
>> +       struct v4l2_subdev sd;
>> +       struct media_pad pad;
>> +       struct device *dev;
>> +
>> +       struct regmap *cci;
>> +
>> +       struct clk *xclk;
>> +       struct gpio_desc *reset_gpio;
>> +       struct regulator_bulk_data supplies[ARRAY_SIZE(imx908_supply_names)];
>> +
>> +       u8  inck_sel;
> 
> nit: extra space

Fixed.

>> +
>> +       u8 num_lanes;
>> +       unsigned long link_freq_bitmap;
>> +       unsigned int link_freq_idx;
>> +
>> +       /* Cached current sensor timing */
>> +       u16 hmax;       /* clocks per line */
>> +       u32 vmax;       /* lines per frame */
>> +
>> +       struct {
>> +               struct v4l2_ctrl_handler handler;
>> +
>> +               struct v4l2_ctrl *pixel_rate;   /* fixed, read-only */
> 
> You can drop this as it is not used by the driver after init.
> 
>> +               struct v4l2_ctrl *exposure;
>> +               struct v4l2_ctrl *vblank;
>> +               struct v4l2_ctrl *hblank;
>> +               struct v4l2_ctrl *test_pattern;
> 
> Same here.

Ok, dropped pixel_rate and test_pattern and used local in init_controls.

> 
>> +       } ctrls;
>> +};
>> +
>> +static inline struct imx908 *to_imx908(struct v4l2_subdev *_sd)
>> +{
>> +       return container_of(_sd, struct imx908, sd);
>> +}
>> +
> 
> [...]
> 
>> +static u32 imx908_calc_link_min_hmax(struct imx908 *imx, u32 width, u8 bpp)
>> +{
>> +       u64 link_hz = imx908_link_freqs[imx->link_freq_idx];
>> +       u64 num = (u64)width * bpp * IMX908_XHS_HZ;
>> +       u64 den = (u64)imx->num_lanes * link_hz * 2; /* DDR */
>> +
>> +       /*
>> +        * den can exceed 32 bits (e.g. 4 lanes * 720 MHz * 2 = 5.76 GHz), so
>> +        * DIV_ROUND_UP_ULL / do_div would truncate the divisor to u32. Use a
>> +        * full 64/64 division.
>> +        */
>> +       return DIV64_U64_ROUND_UP(num, den);
> 
> Have you tested the lowest values generated here on the sensor? I tend to
> agree with Dave's comment on the missing margin, but I don't know enough
> about the sensor internals.
> 
> It would be helpful if Sony can provide info on the interface between the
> pixel array (producer) and MIPI (consumer), if there is a FIFO in between,
> and if they have separate PLL clock trees and pixel rates, or use the same
> 74.25 Mhz clock as your code suggests. And of course what kind of margins
> are needed on the blankings.
> 
> Does Sony have some internal spreadsheet or tool to figure this out and
> populate the recommended values in the "4. Operating Mode" table in the
> SRM? We could do the same calculation in the driver directly, this would
> help us support free-configuration of crop and HBLANK values for different
> usecases.

At the present time I only have the datasheets.I have not yet done 
extensive testing of the lowest HMAX values generated by the calculation.

> [...]
> 
>> +/* --------------------------- V4L2 controls ------------------------------ */
>> +
>> +static int imx908_set_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +       struct imx908 *imx = container_of(ctrl->handler, struct imx908,
>> +                                         ctrls.handler);
>> +       struct v4l2_subdev_state *state;
>> +       const struct v4l2_mbus_framefmt *format;
>> +       int ret = 0;
>> +
>> +       state = v4l2_subdev_get_locked_active_state(&imx->sd);
>> +       format = v4l2_subdev_state_get_format(state, IMX908_SOURCE_PAD);
>> +
>> +       /* Update exposure control limits even if the sensor is not streaming */
>> +       if (ctrl->id == V4L2_CID_VBLANK) {
>> +               const struct v4l2_rect *crop;
>> +
>> +               crop = v4l2_subdev_state_get_crop(state, IMX908_SOURCE_PAD);
>> +
>> +               u32 min_vblank = imx908_calc_min_vblank(crop);
>> +               u32 max_vblank = imx908_calc_max_vblank(format->height);
>> +               u32 vblank = clamp_t(u32, ctrl->val, min_vblank, max_vblank);
>> +
>> +               imx->vmax = imx908_calc_vmax(format->height, vblank);
>> +
>> +               __v4l2_ctrl_modify_range(imx->ctrls.exposure,
>> +                                        IMX908_EXPOSURE_MIN,
>> +                                        imx->vmax - IMX908_MIN_SHR0,
>> +                                        IMX908_EXPOSURE_STEP,
>> +                                        imx->ctrls.exposure->default_value);
>> +       }
>> +
>> +       /* Hardware writes only when powered; cached ctrls applied on resume */
>> +       ret = pm_runtime_get_if_in_use(imx->dev);
>> +       if (ret <= 0)
> 
> This should early return only in the case of ret == 0, as the function
> returns negative error code if the PM framework is disabled (CONFIG_PM=n),
> in which case we should proceed to update the sensor registers below.
> 
> I believe what you did in v1 was correct, but maybe got misled by the LLM
> bot? I have opened a bug report for it:
> https://github.com/sashiko-dev/sashiko/issues/396

Thanks for spotting that. I've corrected this in v3.

>> +               return ret;
>> +       ret = 0;
>> +
>> +       switch (ctrl->id) {
>> +       case V4L2_CID_EXPOSURE:
>> +               ret = imx908_set_exposure_lines(imx, ctrl->val);
>> +               break;
>> +
>> +       case V4L2_CID_ANALOGUE_GAIN:
>> +               cci_write(imx->cci, IMX908_REG_GAIN, ctrl->val, &ret);
>> +               break;
>> +
>> +       case V4L2_CID_VBLANK:
>> +               ret = cci_write(imx->cci, IMX908_REG_VMAX, imx->vmax, NULL);
>> +               /* SHR0 derived from VMAX, re-apply exposure after changes */
>> +               if (!ret)
>> +                       ret = imx908_set_exposure_lines(imx,
>> +                                                       imx->ctrls.exposure->val);
>> +
>> +               break;
>> +
>> +       case V4L2_CID_HBLANK: {
>> +               const struct v4l2_rect *crop;
>> +
>> +               crop = v4l2_subdev_state_get_crop(state, IMX908_SOURCE_PAD);
>> +
>> +               /* HBLANK drives HMAX only in all-pixel; crop HMAX is fixed */
>> +               if (v4l2_rect_equal(crop, &imx908_active_area))
>> +                       imx->hmax = imx908_calc_hmax(format->width, ctrl->val);
>> +
>> +               cci_write(imx->cci, IMX908_REG_HMAX, imx->hmax, &ret);
>> +               break;
>> +       }
>> +
>> +       case V4L2_CID_PIXEL_RATE:
>> +       case V4L2_CID_LINK_FREQ:
>> +               break;
>> +
> 
> You can drop the above block. RO controls should never reach here.

Understood. Removed in v3.

>> +       case V4L2_CID_TEST_PATTERN:
>> +               ret = imx908_update_test_pattern(imx, ctrl->val);
>> +               break;
>> +
>> +       case V4L2_CID_HFLIP:
>> +               cci_write(imx->cci, IMX908_REG_HREVERSE, ctrl->val, &ret);
>> +               break;
>> +
>> +       case V4L2_CID_VFLIP:
>> +               cci_write(imx->cci, IMX908_REG_VREVERSE, ctrl->val, &ret);
>> +               break;
>> +
>> +       default:
>> +               dev_warn(imx->dev,
>> +                        "ctrl(id:0x%x,val:0x%x) is not handled\n",
>> +                        ctrl->id, ctrl->val);
>> +               break;
>> +       }
>> +
>> +       pm_runtime_put(imx->dev);
>> +       return ret;
>> +}
>> +
> 
> [...]
> 
>> +static int imx908_get_selection(struct v4l2_subdev *sd,
>> +                               struct v4l2_subdev_state *sd_state,
>> +                               struct v4l2_subdev_selection *sel)
>> +{
>> +       switch (sel->target) {
>> +       case V4L2_SEL_TGT_CROP:
>> +               sel->r = *v4l2_subdev_state_get_crop(sd_state,
>> +                                                    IMX908_SOURCE_PAD);
>> +               return 0;
>> +
>> +       case V4L2_SEL_TGT_NATIVE_SIZE:
>> +               sel->r = imx908_total_area;
>> +               return 0;
>> +
>> +       case V4L2_SEL_TGT_CROP_DEFAULT:
>> +               sel->r = imx908_recording_area;
>> +               return 0;
> 
> Kernel doc "8.1.1 Selection targets" for V4L2_SEL_TGT_CROP_DEFAULT:
> 
>      Suggested cropping rectangle that covers the “whole picture”. This
>      includes only active pixels and excludes other non-active pixels such
>      as black pixels.
> 
> I believe this means CROP_DEFAULT should include the active non-black
> pixels that are supposed to be used as a margin.
> 
> In init_state() the driver configures the rectangle to imx908_active_area,
> which is the correct thing to do.
> 
> Maybe you can drop imx908_recording_area altogether?

Thanks for the guidance. I have changed to active_area and removed the 
recording_area altogether in v3.

>> +
>> +       case V4L2_SEL_TGT_CROP_BOUNDS:
>> +               sel->r = imx908_active_area;
>> +               return 0;
>> +
>> +       default:
>> +               return -EINVAL;
>> +       }
>> +}
>> +
>> +static int imx908_enable_streams(struct v4l2_subdev *sd,
>> +                                struct v4l2_subdev_state *sd_state,
>> +                                u32 pad,
>> +                                u64 streams_mask)
>> +{
>> +       struct imx908 *imx = to_imx908(sd);
>> +       int ret;
>> +
>> +       ret = pm_runtime_resume_and_get(imx->dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = imx908_start_streaming(imx, sd_state);
>> +       if (ret) {
>> +               pm_runtime_mark_last_busy(imx->dev);
> 
> Drop.
> 
> pm_runtime_put_autosuspend() calls pm_runtime_mark_last_busy() for you.

Ok, removed.

>> +               pm_runtime_put_autosuspend(imx->dev);
>> +               return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int imx908_disable_streams(struct v4l2_subdev *sd,
>> +                                 struct v4l2_subdev_state *sd_state,
>> +                                 u32 pad,
>> +                                 u64 streams_mask)
>> +{
>> +       struct imx908 *imx = to_imx908(sd);
>> +       int ret;
>> +
>> +       ret = imx908_stop_streaming(imx);
>> +
>> +       pm_runtime_mark_last_busy(imx->dev);
> 
> Same here and anywehere else.

Ok, removed.

>> +       pm_runtime_put_autosuspend(imx->dev);
>> +
>> +       return ret;
>> +}
>> +
>> +static int imx908_init_state(struct v4l2_subdev *sd,
>> +                            struct v4l2_subdev_state *sd_state)
>> +{
>> +       struct v4l2_subdev_selection sel = {
>> +               .which  = V4L2_SUBDEV_FORMAT_TRY,
>> +               .pad    = IMX908_SOURCE_PAD,
>> +               .target = V4L2_SEL_TGT_CROP,
>> +               .r      = imx908_active_area,
>> +       };
>> +       struct v4l2_subdev_format fmt = {
>> +               .which = V4L2_SUBDEV_FORMAT_TRY,
>> +               .pad   = IMX908_SOURCE_PAD,
>> +               .format = {
>> +                       .code   = IMX908_DEFAULT_MBUS_CODE,
>> +                       .width  = imx908_active_area.width,
>> +                       .height = imx908_active_area.height,
>> +               },
>> +       };
>> +
>> +       imx908_set_selection(sd, sd_state, &sel);
>> +       imx908_set_pad_format(sd, sd_state, &fmt);
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_core_ops imx908_core_ops = {
>> +       .subscribe_event   = v4l2_ctrl_subdev_subscribe_event,
>> +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
>> +};
> 
> Drop.
> See 17971a430ff9 ("media: i2c: Drop HAS_EVENTS and event handlers")

Understood. Fixed in v3.

>> +
>> +static const struct v4l2_subdev_video_ops imx908_video_ops = {
>> +       .s_stream = v4l2_subdev_s_stream_helper,
>> +};
>> +
>> +static const struct v4l2_subdev_pad_ops imx908_pad_ops = {
>> +       .enum_mbus_code      = imx908_enum_mbus_code,
>> +       .enum_frame_size     = imx908_enum_frame_size,
>> +       .get_fmt             = v4l2_subdev_get_fmt,
>> +       .set_fmt             = imx908_set_pad_format,
>> +       .get_selection       = imx908_get_selection,
>> +       .set_selection       = imx908_set_selection,
>> +       .enable_streams      = imx908_enable_streams,
>> +       .disable_streams     = imx908_disable_streams,
>> +};
>> +
>> +static const struct v4l2_subdev_internal_ops imx908_internal_ops = {
>> +       .init_state = imx908_init_state,
>> +};
>> +
>> +static const struct v4l2_subdev_ops imx908_subdev_ops = {
>> +       .core  = &imx908_core_ops,
>> +       .video = &imx908_video_ops,
>> +       .pad   = &imx908_pad_ops,
>> +};
>> +
>> +/* ----------------------- Power management ---------------------- */
>> +
>> +static int imx908_power_on(struct imx908 *imx)
>> +{
>> +       int ret;
>> +
>> +       ret = regulator_bulk_enable(ARRAY_SIZE(imx908_supply_names),
>> +                                   imx->supplies);
>> +       if (ret) {
>> +               dev_err(imx->dev, "failed to enable regulators\n");
>> +               return ret;
>> +       }
>> +       msleep(200); /* IMX908 power ok after 200ms */
> 
> If there is a required delay for stabilization after the power supplies
> come up, that delay is usually modeled as `startup-delay-us = <200000>` in
> the device tree node for the regulator(s) so that regulator_bulk_enable()
> includes it.

The 200 ms delay came from T0 in the datasheet power-on sequence. 
Reviewing the timing diagram again, T0 is specified as the maximum 
power-supply rise time rather than a post-power stabilization delay. The 
only explicit delay after power-up is TLOW (500 ns) followed by T1 (20 
us before register communication). I removed the unconditional 
msleep(200) in v3.

>> +
>> +       if (imx->reset_gpio) {
> 
> Not needed as the below function handles optional GPIOs.

Ok.
>> +               gpiod_set_value_cansleep(imx->reset_gpio, 1); /* XCLR low */
> 
> Drop, the reset is asserted because it was initialized as GPIOD_OUT_HIGH.

Ok.
>> +               udelay(1); /* >= 500ns T_low */
>> +               gpiod_set_value_cansleep(imx->reset_gpio, 0); /* Sensor start */
>> +       }
>> +
>> +       ret = clk_prepare_enable(imx->xclk);
>> +       if (ret) {
>> +               dev_err(imx->dev, "failed to enable xclk: %d\n", ret);
>> +               goto err_reset;
>> +       }
>> +
>> +       /* T_1 >=20us delay before initial SDA/SCL */
>> +       usleep_range(20, 25);
>> +
>> +       return 0;
>> +
>> +err_reset:
>> +       gpiod_set_value_cansleep(imx->reset_gpio, 1); /* assert reset */
>> +       regulator_bulk_disable(ARRAY_SIZE(imx908_supply_names), imx->supplies);
>> +       return ret;
>> +}
>> +
> 
> [...]
> 
>> +static int imx908_parse_fwnode(struct imx908 *imx)
>> +{
>> +       struct fwnode_handle *ep;
>> +       struct v4l2_fwnode_endpoint bus_cfg = {
>> +               .bus_type = V4L2_MBUS_CSI2_DPHY
>> +       };
>> +       int ret = 0;
>> +
>> +       ep = fwnode_graph_get_next_endpoint(dev_fwnode(imx->dev), NULL);
>> +       if (!ep) {
>> +               dev_err(imx->dev, "failed to find endpoint in device tree\n");
>> +               return -ENXIO;
>> +       }
>> +
>> +       /* Only data-lanes and link-frequencies are used from the endpoint */
>> +       ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>> +       fwnode_handle_put(ep);
>> +       if (ret)
>> +               return ret;
>> +
>> +       imx->num_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
>> +
>> +       if (imx->num_lanes != 2 && imx->num_lanes != 4) {
>> +               dev_err(imx->dev,
>> +                       "only 2 or 4 CSI-2 data lanes are supported (got %u)\n",
>> +                       imx->num_lanes);
>> +               ret = -EINVAL;
>> +               goto out_free;
>> +       }
>> +
>> +       ret = v4l2_link_freq_to_bitmap(imx->dev,
>> +                                      bus_cfg.link_frequencies,
>> +                                      bus_cfg.nr_of_link_frequencies,
>> +                                      imx908_link_freqs,
>> +                                      ARRAY_SIZE(imx908_link_freqs),
>> +                                      &imx->link_freq_bitmap);
>> +       if (ret) {
>> +               dev_err(imx->dev, "failed to parse link frequencies from DT\n");
>> +               goto out_free;
>> +       }
>> +
>> +       if (bitmap_empty(&imx->link_freq_bitmap, ARRAY_SIZE(imx908_link_freqs))) {
> 
> Isn't this handled by -ENOENT retval of v4l2_link_freq_to_bitmap() ?

Yes it is :-) The explicit bitmap_empty() check is redundant because 
v4l2_link_freq_to_bitmap() already returns -ENOENT when no matching 
frequencies are found. I removed the extra check.

>> +               dev_err(imx->dev,
>> +                       "no common link frequencies between driver and DT\n");
>> +               ret = -EINVAL;
>> +               goto out_free;
>> +       }
>> +
>> +       imx->link_freq_idx = __ffs(imx->link_freq_bitmap);
>> +       dev_dbg(imx->dev, "using %u lanes at link freq %llu Hz\n",
>> +               imx->num_lanes, imx908_link_freqs[imx->link_freq_idx]);
>> +
>> +out_free:
>> +       v4l2_fwnode_endpoint_free(&bus_cfg);
>> +       return ret;
>> +}
>> +
>> +static int imx908_init_controls(struct imx908 *imx)
>> +{
>> +       struct v4l2_ctrl_handler *hdl = &imx->ctrls.handler;
>> +       struct v4l2_fwnode_device_properties props;
>> +       struct v4l2_ctrl *link_freq_ctl;
>> +       int ret;
>> +
>> +       ret = v4l2_ctrl_handler_init(hdl, 11);
>> +       if (ret)
>> +               return ret;
>> +
>> +       imx->ctrls.pixel_rate = v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
>> +                                                 V4L2_CID_PIXEL_RATE,
>> +                                                 IMX908_PIXEL_RATE,
>> +                                                 IMX908_PIXEL_RATE, 1,
>> +                                                 IMX908_PIXEL_RATE);
>> +       if (imx->ctrls.pixel_rate)
>> +               imx->ctrls.pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> Not needed, PIXEL_RATE is marked as RO by the control framework

Ok. I also removed the redundant READ_ONLY flag from LINK_FREQ.

>> +
>> +       link_freq_ctl = v4l2_ctrl_new_int_menu(hdl, &imx908_ctrl_ops,
>> +                                              V4L2_CID_LINK_FREQ,
>> +                                              ARRAY_SIZE(imx908_link_freqs) - 1,
>> +                                              imx->link_freq_idx,
>> +                                              imx908_link_freqs);
>> +
>> +       if (link_freq_ctl)
>> +               link_freq_ctl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +
>> +       imx->hmax = IMX908_HMAX_DEFAULT;
>> +       imx->vmax = IMX908_VMAX_DEFAULT;
>> +
>> +       u32 min_vblank = IMX908_VMAX_DEFAULT - imx908_active_area.height;
>> +       u32 max_vblank = imx908_calc_max_vblank(imx908_active_area.height);
>> +
>> +       imx->ctrls.vblank = v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
>> +                                             V4L2_CID_VBLANK,
>> +                                             min_vblank,
>> +                                             max_vblank,
>> +                                             1,
>> +                                             min_vblank);
>> +
>> +       u8 bpp = imx908_bits_per_pixel(IMX908_DEFAULT_MBUS_CODE);
>> +       u16 min_hmax = imx908_calc_min_hmax(imx, imx908_active_area.width, bpp);
>> +       u32 min_hblank = imx908_hmax_to_hblank(min_hmax,
>> +                                              imx908_active_area.width);
>> +       u32 max_hblank = imx908_hmax_to_hblank(IMX908_HMAX_MAX,
>> +                                              imx908_active_area.width);
>> +       u32 hblank = imx908_hmax_to_hblank(IMX908_HMAX_DEFAULT,
>> +                                          imx908_active_area.width);
>> +
>> +       /* Default HMAX can be infeasible at low link freqs; clamp into range */
>> +       hblank = clamp_t(u32, hblank, min_hblank, max_hblank);
>> +
>> +       /* Keep cached HMAX consistent with the clamped default */
>> +       imx->hmax = imx908_calc_hmax(imx908_active_area.width, hblank);
>> +
>> +       imx->ctrls.hblank = v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
>> +                                             V4L2_CID_HBLANK,
>> +                                             min_hblank,
>> +                                             max_hblank,
>> +                                             IMX908_PIX_PER_CLK,
>> +                                             hblank);
>> +       u32 max_exp = IMX908_VMAX_DEFAULT - IMX908_MIN_SHR0;
>> +
>> +       imx->ctrls.exposure = v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
>> +                                               V4L2_CID_EXPOSURE,
>> +                                               IMX908_EXPOSURE_MIN,
>> +                                               max_exp,
>> +                                               IMX908_EXPOSURE_STEP,
>> +                                               max_exp / 2);
>> +
>> +       v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
>> +                         IMX908_ANA_GAIN_MIN, IMX908_ANA_GAIN_MAX,
>> +                         IMX908_ANA_GAIN_STEP, IMX908_ANA_GAIN_DEFAULT);
>> +
>> +       /* Set test pattern. Menu (13 entries: Disabled + 12 patterns) */
>> +       imx->ctrls.test_pattern = v4l2_ctrl_new_std_menu_items(hdl,
>> +                                                              &imx908_ctrl_ops,
>> +                                                              V4L2_CID_TEST_PATTERN,
>> +                                                              ARRAY_SIZE(imx908_tpg_menu) - 1,
>> +                                                              0,
>> +                                                              0,
>> +                                                              imx908_tpg_menu);
>> +       if (imx->ctrls.test_pattern)
>> +               imx->ctrls.test_pattern->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
>> +
> 
> Any particular reason to use this?
> I've never needed this for test pattern control before.

I don't think it is needed either. Removed in v3.
>> +       v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
>> +       v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
>> +
>> +       /* Read rotation and orientation properties from the firmware node */
>> +       ret = v4l2_fwnode_device_parse(imx->dev, &props);
>> +       if (ret)
>> +               goto err_free;
> 
> nit: You could move this section before v4l2_ctrl_handler_init() to
> simplify error handling and get rid of the goto.

Ok. Done in v3.
>> +
>> +       v4l2_ctrl_new_fwnode_properties(hdl, &imx908_ctrl_ops, &props);
>> +       if (hdl->error) {
>> +               ret = hdl->error;
>> +               goto err_free;
>> +       }
>> +
>> +       imx->sd.ctrl_handler = hdl;
>> +
>> +       return 0;
>> +
>> +err_free:
>> +       v4l2_ctrl_handler_free(hdl);
>> +       return ret;
>> +}
> 
> [...]
> 
>> +static int imx908_probe(struct i2c_client *client)
>> +{
>> +       struct imx908 *imx;
>> +       int ret;
>> +
>> +       imx = devm_kzalloc(&client->dev, sizeof(*imx), GFP_KERNEL);
>> +       if (!imx)
>> +               return -ENOMEM;
>> +       imx->dev = &client->dev;
>> +
>> +       v4l2_i2c_subdev_init(&imx->sd, client, &imx908_subdev_ops);
>> +       imx->sd.internal_ops = &imx908_internal_ops;
>> +
>> +       imx->cci = devm_cci_regmap_init_i2c(client, 16);
>> +       if (IS_ERR(imx->cci))
>> +               return dev_err_probe(&client->dev, PTR_ERR(imx->cci),
>> +                                    "CCI regmap init failed\n");
>> +
>> +       imx->xclk = devm_clk_get(imx->dev, NULL);
>> +       if (IS_ERR(imx->xclk))
>> +               return dev_err_probe(imx->dev, PTR_ERR(imx->xclk),
>> +                                    "failed to get clock\n");
>> +
>> +       ret = imx908_get_inck_sel(imx, clk_get_rate(imx->xclk));
>> +       if (ret)
>> +               return ret;
>> +
>> +       imx->reset_gpio = devm_gpiod_get_optional(imx->dev, "reset",
>> +                                                 GPIOD_OUT_HIGH);
>> +
>> +       if (IS_ERR(imx->reset_gpio))
>> +               return dev_err_probe(imx->dev, PTR_ERR(imx->reset_gpio),
>> +                                    "failed to get reset gpio\n");
>> +
>> +       ret = imx908_get_regulators(imx);
>> +       if (ret)
>> +               return dev_err_probe(&client->dev, ret,
>> +                                    "failed to get regulators\n");
>> +
>> +       ret = imx908_parse_fwnode(imx);
>> +       if (ret)
>> +               return dev_err_probe(&client->dev, ret,
>> +                                    "device tree parse failed\n");
>> +
>> +       ret = imx908_power_on(imx);
>> +       if (ret)
>> +               return dev_err_probe(&client->dev, ret, "power-on failed\n");
>> +
>> +       ret = imx908_identify_model(imx);
>> +       if (ret) {
>> +               dev_err(imx->dev, "failed to identify model: %d\n", ret);
>> +               goto err_power_off;
>> +       }
>> +
>> +       pm_runtime_set_active(imx->dev);
>> +       pm_runtime_enable(imx->dev);
>> +
>> +       ret = imx908_init_controls(imx);
>> +       if (ret)
>> +               goto err_pm_disable;
>> +
>> +       imx->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> 
> Drop.
> See 17971a430ff9 ("media: i2c: Drop HAS_EVENTS and event handlers")

Ok.

>> +       imx->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>> +       imx->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +       ret = media_entity_pads_init(&imx->sd.entity, 1, &imx->pad);
>> +       if (ret)
>> +               goto err_hdl;
>> +
>> +       /* Share the ctrl handler lock so s_ctrl can access the locked state */
>> +       imx->sd.state_lock = imx->ctrls.handler.lock;
>> +
>> +       ret = v4l2_subdev_init_finalize(&imx->sd);
>> +       if (ret)
>> +               goto err_entity;
>> +
>> +       pm_runtime_set_autosuspend_delay(imx->dev, 1000);
>> +       pm_runtime_use_autosuspend(imx->dev);
>> +       pm_runtime_mark_last_busy(imx->dev);
>> +
> 
> Missing pm_runtime_idle(), and this whole block should probably go just
> before the `return 0`.

Addressed by the runtime-PM rework following Dave's review. Probe now 
holds a PM reference using pm_runtime_get_noresume() and releases it 
with pm_runtime_put_autosuspend() after subdevice registration completes.

Thanks,

Lachlan
