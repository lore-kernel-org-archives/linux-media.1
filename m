Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023106.outbound.protection.outlook.com [52.101.127.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9934C26F2B9;
	Mon, 27 Jul 2026 06:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785134197; cv=fail; b=FG8PXV83cHg04XApg4aTA/3vtYlENkn/f5aXOQxWq2ZE0LJOH8PIhzDf63fKGmf/c6c0ORD9scAARG1lnK8ZFXI62IkcLL8qSW966zuYU/lPg5nDF6rHQ7B+gVnwyeTEQnbwDdI3syEyHvJGFY3/L+CVPXKFO0qTjzOWSZbPbRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785134197; c=relaxed/simple;
	bh=o3eQ3qHX8BhY0jeEw6ZjBP1EQ3O1qD3iwEzmuly3wJ8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KEqkZA0131UrccaqpA0qIHuaofCvrSJwFMEAW/+DMYV8l38jTQTQvP0TKzC8Y14yug2aNEaaAqy9SslgM96lykIBd8kxZTEnvuemAMAwmGvyNdutLX9OKmF1ciuGZqardpVUPR9iHRltXqwm62NZgC/Ygir3zzXYKByQb38wwtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Bxzr5tcC; arc=fail smtp.client-ip=52.101.127.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Bxzr5tcC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAItL6aqVeiK9KxY5hcDjtBSDpd2juo79SZC9oX7oyfcuPyy+hVjZRwuDMw2egNkrczxyWB/k8VMmPrBCvjz06pnSPLRaXlG7/aShvwCu/nMpJlWAN49cIerezcLBusmQ9OpupUJN61znzciySWMdosl9MwkFSvUiiLj11/G5CN+TM/Eu7w0z2nATBjKVkYvIge/mMzajsczfuiBPL6GWun2Kl7Ga5dSVl//T+Qpm9cBn+mt5fZSNS1L6baomkqX/McDb0IZa8YHNMwFYpF67WO07OhMEowsCqxJNXDIOZ7e+N6rLP0QrHv/Llo8jTSpeQmhFfD0CiqQzamPV+WWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTwixURNmk4hSR9fXeUGxPGPBLwxcdFVk1C8QqzsGHM=;
 b=GiTzj6CUDmkOkEKDkTYdjYOxxcStN2bFm0mZ8i9XWBNVisQrhUekRyMZ2NBjCNuv1RYeFcAm7BIQK2YkydBw3ymy7BtyaU0qnTTvdmYWfv7Y8zA4Ghe7Ljvw6Nw5TJtKEZzcxBH3Z4tJB+Nr7XlZtPYIl+1cSG+U4YY944hHzverB/aV09dSBJ/19INUsknTJIEcOYqCG2BA1EuMGtAB4uU+rk5ICPVQN3S6Y8iLOeywcFqkhY3g/ijxCLqZcpoR75pCFMlRs3mMLtYHjT+LxQjFq+HqA8zz+N28yZ7zIhYsnh5sLzgneod5JZXHR0bU/17JXb3DY+An4CKSb6a6HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTwixURNmk4hSR9fXeUGxPGPBLwxcdFVk1C8QqzsGHM=;
 b=Bxzr5tcC0RwoZH6tMp+vin2zf8irlDjWaGhVHEOn1LHJuh9q0uaux1/uBP0kYFe8X/BjiDP3/eJXgu7dnwC8EmHNP5OFRv3BqL9wf5B6wsRuDLgKnWW22A2Ew+hJEYMWGOyA4NgOrlUpl3DZzkQAk+lZOkKmvnML3tKugmPG/E1yZq6NJjMZZ1wtxSTqO4cWTu9XTtA0NpQQjy5mIrLE8+eEOmVXF0g8Uqt1slwoaJ22Q/TlDKp0PNkZkdI2Ykz9HfPSvsE0eNxcigi0kAeBnnRUO9zAof5UASJwt3uH//WWB5O9U29hJJyUU82hefl+Z7sOKRIOegM7XbumAm/j+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by TYZPR03MB6977.apcprd03.prod.outlook.com (2603:1096:400:28f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 06:36:30 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 06:36:30 +0000
Message-ID: <b7d083b4-fe1e-4788-b027-fa803d067521@amlogic.com>
Date: Mon, 27 Jul 2026 14:36:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-6-6072a7ee7428@amlogic.com>
 <20260727-vivid-native-bloodhound-4c7ff6@quoll>
 <16ede5f1-dcd4-4b43-98a9-02754796de81@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <16ede5f1-dcd4-4b43-98a9-02754796de81@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0108.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::13) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|TYZPR03MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: 8315df10-ab23-4700-90a4-08deeba964af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|7416014|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	urCB7x3Us4FWf34AXAydFQnn24r40Pd8p3Xwli29ZPVXT7VvFq5NOYeQ0gf0Iv+KErbnV7e9Bo9cdEU2bLz5PmUlcW29LCTgOeAoOgVvpetmmZwhiOzh2FifouWXrt41SNI6HCxA0QT4DjQ7z6xOizG5wPMZ/Hy37xWySqtUFM6ZzOQDs5yg/G+Kk1g8PJYYa0H2BsvoN4uVDX3hetVTG3ran8OyXzp9cxD7b/oVGSI4E9bahYuW4krrNma6RGAKo4xA9E4TTQFGPMlCvBTiqYeIiIdAGlkns8/V4h8js1Hw0DDbctSjmG/mjPqY+NKe+HHhCJP34DZhv8fEC/EcKnUN7iBrVkhNvzJA8K3chJzAGyyWOakp14uNmjjOVwPlEdXcZ5Q3Fh/axj1jbtONEePdbx2CaYuARkbU96NV4Yoc6GUXfEeqCnWzZLU1nezAJ3RAopss+rpCGq8+qL86CI50MT+cZg6TLdn3DpyYvJyQs4rgBwDLnolDGqK2I4S0lIo4PZtu344sUp8Y6QvkgBmXYuMJ1IHH7n3Lw4nnLlumPgzA99W91ljrwQMDS90ti4ZxATU9ugXZq1LxUatOilD2FSNKjjk1CPvMzyhLDYVAS3IR8Z08m3Z2I6OQBUfYSzg1ofXjd3e1kYfESN7ZOgBZoWxy/zzjCImAav+4rDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(7416014)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R296ZkNGL0cyeTFVTzV1enE4emUydVRYdEM0Vi8yclczRUZIMjV6YUcwblNx?=
 =?utf-8?B?WlRyKzB1ZDQ1OTcxNjFOLzZWU2VMWXdxS0t3bmJjTFJCeXVzNU1MVWJXVTc3?=
 =?utf-8?B?c05peEcyK0VsRC93QUlrNVB0a09uYTdPWXY5RnNDaklCNENUa3VaNXh6NVV3?=
 =?utf-8?B?cmtOZEp2YTRCMEkrY2I1cWJNdnNoWFZPYTVQdE0reEtDZTc0WnliV2ZlUGJZ?=
 =?utf-8?B?dUh6T3lvU1ozVzlMSnpNT2VaUi9WU1VDUmFrVWNxOEtoQXdHVEhvb2ZxelRy?=
 =?utf-8?B?WmJtMkhzeGpqcmN4TG1rZkxWT3BjOStlK2Y1KzViY3dkZ3hIdFBzTzB1OXVp?=
 =?utf-8?B?RDNZTXBJaXcxYzRuaTIyUEJ6RnlWK29XYm83TEtQOUJZb09LMWhhUDBzV2pE?=
 =?utf-8?B?L2dzcENVTlg1aTJxRzJjcThtMnJ3S2lidENSWTN6UnN2aDMxR3Noa09lL09O?=
 =?utf-8?B?cWZESndLOXRZSkhsYzIvTDFJUDhhWHYvdm1oTFZvd21JYlJmWUx2L2FMOWZu?=
 =?utf-8?B?NlNjY3dXYWJ5dlZMUEI3ZUlObW5aNk5oem5hZDZkOHhhZEZid1VnSm9RK1l6?=
 =?utf-8?B?dWRqMTJpUUVTa1MxOTRDU1ZRb1JLaUErcCtFWWkyTGVVbExiTlNiNHBQRndo?=
 =?utf-8?B?QXVaWEUvTm04TUtRWHhvQ3hyblhDYXFldXVHTkJmYTZhVGpXVVM3Q25hVGVL?=
 =?utf-8?B?Rk1UOFgyWWk2eXl2bTlVVWdiRFdTa0FxS0FMYno2TjJzb2xiVnFTWlRJQXBy?=
 =?utf-8?B?aWVuODNnVEUxNkdKWTRQZzhLZDBNdTVXemxPajZRbUtaeTRuZDlndUovamJy?=
 =?utf-8?B?MjNVNVF3TkVQa0JkdlhxMEx2WGJJeWhZOHNrOEIxbkVDbmtna1Zub0J1eUY5?=
 =?utf-8?B?OVVrdUVXUDdCaEVXYVFMV3VYcy9kNURPSTJhNDVCcTBXQ2luR3JVdm8zUjJz?=
 =?utf-8?B?OEQyK0gxbTkwYm1ROGJyTnU0dDd6cDBDejh2Y3BvNzVpdE1lUWpjNEFncmJE?=
 =?utf-8?B?d2piNk9Zb1FRd0NJdEVWYUQ3RTNaRDkyT2pCSFVSWWxTajJldVFSVitGaVZi?=
 =?utf-8?B?c3R1VVVxdG1kK3lvZHpUQlUzYjhXbGlyMW5xYlFyZ3BuNTZZMnRTMWhNVm1h?=
 =?utf-8?B?bFVBaXRhZ09qY1pldVBjWWVWNTBTVVN3WU9rME5UUnl4SC9mTUtTZnlJaitr?=
 =?utf-8?B?M2gyL1BiY3dFcGZRQ0RITXNERWt2L01SNEI1eG5mYkpQb1FIaWZIcVVYOTda?=
 =?utf-8?B?K0w5b2NFZlZXTk1FdVRIWnJ3YXR1eExuUGJ6MDJ3RC9jVmVpK2loQ3M5akxD?=
 =?utf-8?B?Z2l6QWdROHdLVzBFRnl0YVVFeGFReFR6eHhqZUV5Vk9LWEVZYW5jTDh3SCta?=
 =?utf-8?B?aFZ0ak41bkdyTUxwdXhTUUJZNXY2Zi9kdlF4NXJiK1plU3pjbk5icjNXMTl1?=
 =?utf-8?B?TEtLVTFOL05kTkluamNDcUFZbm5oSDU5Rmc3Zld6SzlLR3BIVnlSeFNDSTJI?=
 =?utf-8?B?RkJaL1ByOUREMVRQcjNUSDc1R0V5VVhuWXJYRkF0TDlheXp1S3NrNTlkTGdo?=
 =?utf-8?B?djFqdWdLUjN0M2FwZUY3a2l2SzNMS0tCc29zMFlkdW53cDlTNzEweUFHdFUv?=
 =?utf-8?B?WEp4MnRMcDZwOFREYmlnc1djRStWbytUaE4zb25qVHRnVzgrVzJIaXJ1MVp1?=
 =?utf-8?B?TXQ5MEltZ2dGZktDa3RUQ09oQjBzN3dYbFJHUlpqdTlMY1FudnFUM3F2L0Nr?=
 =?utf-8?B?dnhVZENPR3lmZXYrU2pOeVlydy9JbUlnVU9CSU41NzB4bzN2TC9pVkEvNmxN?=
 =?utf-8?B?aDVmS0Y3RnBwR3hVclhXV1BHUTRMT1BwUlBKUDl2eXpOTDhxSVBVSytZZDlI?=
 =?utf-8?B?SXNiZlRkN2U1ZlBjNWlhd3E3QjExQkl2Mm9DQTQwVlU0RTJxNStMZ25FVmsz?=
 =?utf-8?B?Q0NoTWViQzBxVTVENHdNZVZjU0RvaVRFWnZmNWk5U3dqaUpFb2oxYXhxREtk?=
 =?utf-8?B?c2ZEQjlYN0J2VU9Od3VPcnFkZWRmNk45Skd1b3BjNDNVWktESko1OCt2Um9R?=
 =?utf-8?B?djJyWUx4N2FINVRObGZtWURpZGFSTVJaeGlaT21zSnpDMjVCNXJxKzg0VVJQ?=
 =?utf-8?B?SkNmY1ZwNjlFV2Jxa3pyZERIRmdTZTZLN0ZZRWVhZGJkUUE1T0liL0FiQVRP?=
 =?utf-8?B?aEoyZzh2ZXBreFFLVWxjTHl0MW94VEd4WmEyQ3NlTk9lV0FIbThRMFBFWXhE?=
 =?utf-8?B?ZDhsZTJZcWw2NW44Y2RiOEdnZW5Zc2VZL210OWpVdVpxbWhxV2ZEUVZiMUVq?=
 =?utf-8?B?NW5VVlNwNEVDMTVuZEY1c0t1Q1Byb0MrT0o3czd0RGk5NllLV2RSdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8315df10-ab23-4700-90a4-08deeba964af
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 06:36:30.6010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbPxvwSs2SuYRFqngaY/PlE8Je6OqAp4uxBsSu00cPPxzOBslrFLFbf+/Gzp/4D3Pj04N4XC3apCIBXl8vS9eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6977

Hi Krzysztof

> On 27/07/2026 08:24, Krzysztof Kozlowski wrote:
>> On Fri, Jul 24, 2026 at 03:04:56PM +0800, Zhentao Guo wrote:
>>> Enable the Amlogic V4L2 stateless video decoder driver as a module
>>> in the arm64 defconfig. This driver is needed for stateless video
>>> decoding support on Amlogic SoCs.
>> Which boards use it? Look at `git log` to learn how this commit should
>> be written.
> I already ASKED YOU this at v4 and pointing you to git log history. Not
> much improved.
>
> Did you even check any commits?
I did check some of the commits. I'll refer to more git logs of other 
commits, and describe this patch as clearly as possible.
>
> NAK
>
> Best regards,
> Krzysztof

BRs

Zhentao

