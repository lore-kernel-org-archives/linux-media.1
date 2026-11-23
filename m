Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795422486;
	b=DVnaaDu8aPMaDIWhJ0dUpHjfUf/LJnJMuXz3MjosvCJqZJK2hW6+40D1SMPUouICXe1c
	 W9wzIWQeMVX5/i532dYqML2sOO1MJcvVdlNSAc153dpoLqBPONsrcukLuFB6oWRzx1Hvv
	 1vzTwoz4k1dfbPFwJ1P4v62AXfF7KeCmUe2vBWMq3iJ2f9zC/0g5r9gV78m2bTYViJBbU
	 mCziIkj2GZemZcYgtlEEyB9vEyqzw+5qUYOgO+V2bv67GMZ57z5rKQYWTc4ZNfv0MAdmM
	 hCXm0RFv2QKWDEm/ZqbzQzSWgGNhJ+Nw3yQJDuoY+8iqc4InxLfdDHjtNTPwKItt50g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422486;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=f0ZTvLz7hEcSa4Fe0a3fM+7ZNyFrcUsVb4Q4UmhpXZU=;
	b=kfeGhtXtjA3OamHq1SZl5N9JzQf3SC1ZQ/ZCD6nDZBQ7jogfFPDiMs+k1PqkH6GNJ9CK
	 0OAOXVohB10Kd2bWcbhL0QwE7nEwa8V8ea3Ss8N/FNbxjAtzNsF4WttFO7frGwXXDKxsb
	 nqLMbXN1lcb5zVJaQyD5zfy5fr890TA4DaFUocRPeMXTG145styOq1voMj+RTqxwrNsJy
	 2bm8kPAa8dZbQe6hBg1SGI7w/bJiDGMfl0V6G00xL7fRkA9W4O9YBPGIK4DVsSFnOYBrn
	 LS6y9czcw2/qwD5fBBFNUNbn02XD3DzQIqS/D4hzThjWuNl8fQeYsbKA8P1iiNJSIxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZzYNS6eQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.49
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013049.outbound.protection.outlook.com [40.93.196.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC69C606A68D;
	Mon, 23 Nov 2026 08:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC69C606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZzYNS6eQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbzPwAWWZGt5R646kuHkRuxZEQ+bN1FCq3lyNMCJmd1RXpnbtjMlusJ7jXTC9U7f6Sb1/UcewThAGQAPveNuku/3eizpLal1+J/gPr58e95G2vlIdA2QKWF3soamPE6YD1GuuaEud5m8roUJl18ICTbBEnhQHYEZbhI/zJ1NxswYap57KyXj3exy2/Z/ZcMEwbS1FXCKI6J5u87ionSlIc4fqddJvK/RlDn54b9Kxaycxnm3v8nNRQfhHGCDy9o9P/IzhstRTVPLcqKtcg953b9dMHfWYcGz2C+ozAlaeoCMEJDs3RDwp9LGeME30TcIN5jC7hyoU2NjXVKuSHISdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0ZTvLz7hEcSa4Fe0a3fM+7ZNyFrcUsVb4Q4UmhpXZU=;
 b=lDGIK/gw4H2keUWA2cVSuYMkOfEgEVJpeIH7KRVC58f1LMer9SzfQlIDAtSHSoS3mfu42OvOJQB3+VBlUfUAzry1NCUGs/nyzoqQ2fNuQ5LWDslQs/OJRXr3OZQqqFPYs1eqV4xxR5gbisDeho0sse+/ToGfyTENt+t7/MwX9ITNbl1ZEC7RUv5K7XNOiQphHdvpUxFtgmiYLjSLdpHEB47u87n+gGZKJwPFVf08vRbNI8zDtg0gUN5tlla/wCHECbxcQj7LG9D9+tPqy/F56Z5nn8N0fxEEJZ5sCrpaPqkl4SZTna3iZ/ZIkpqQL5GFdtYuLlkbwLdxHcK+k0j5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0ZTvLz7hEcSa4Fe0a3fM+7ZNyFrcUsVb4Q4UmhpXZU=;
 b=ZzYNS6eQOgJvchIzrAI6VflB9w/PU3kcXo4o6TJiuatqg8YL6qFz8UQdlwbrG/1CIPkN2uyqDJKVwxEwaoB9UXM7qbgxMJwX/rbIBrrJEhrHv5QPO9cLNDYN9BYwbGTu4p0zRFv+8f7xP6Qsnjo39d3SFFg3kxTR26BU5xWevic=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SA1PR12MB5638.namprd12.prod.outlook.com (2603:10b6:806:229::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 08:28:00 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 08:28:00 +0000
Message-ID: <d44cd54f-8fc6-46cb-badf-27e821622f4a@amd.com>
Date: Mon, 23 Nov 2026 09:27:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: xilinx: vip: Make use of the
 devm_clk_get_enabled()
To: Markus Elfring <Markus.Elfring@web.de>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, git@amd.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michal Simek <monstr@monstr.eu>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
 <e2f4a6b4-0615-4b3a-b64c-408a27fdeade@web.de>
 <958ae6b7-dc91-4854-a904-7582020f4413@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <958ae6b7-dc91-4854-a904-7582020f4413@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0035.eurprd03.prod.outlook.com
 (2603:10a6:803:118::38) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SA1PR12MB5638:EE_
X-MS-Office365-Filtering-Correlation-Id: e499038d-f33b-4687-69f2-08df493baf0c
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|260925021311599003|10067099003|261022105027099003|4143699003|260925021911599003|260925022911599003|56012099006|11063799006|261009223027099003|261026140227099003|261028144727099003|261026121527099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	rbk3gWb6CfEYfSqeHO2kEXmV/ZAcEpHYQCb8gsBm+AM2hMiCVw6cRhB0OIVBpgrBK+XPT5RqUUqVKmOLL/ZWCWJUqzpuY3rZqTxoPdzyDIbcO8tBuz8tqwuQodGYT+fij70Ij3vh/kJ0HZIMbWGrZ+5XvLt/7vE5+H99NjSjL0wBQ77dcmeFRh9gWYh6b81bBfhYv3D2a4gPhnjgEaAra0HTnGPzOQTEuWyBRcvbwF1cYEsD9UNntPVrxsb6xS5e+gvkpKKssX8KO4x1EonNvMm1QJqNw3q/ApHpZnUM2b1rOL05p1iuEB8EZAGi5KznhODxIwdyAhy/MfApZS328oAOPXSxGblXdazjX4HLMwBnkWxEQHH1V9QjygO8z11i6B0JPyQMHB5cSx8pl6qlbRa+sWVzQ4BWrPAMwkonhBNlGOGbB/qpUHcJstcf1a2xQWyVlhzD4MzN4GyUjroyg9oAHps0VA1IeTT31LdNY1/EtWtGLz60hWsYsPnaaSDnPQG6h/0AjacatExkHy71VAvXz5PxziVy6jOTHaDBtyrZmc7B8tGUchdJFG9IBJGs5mQvpy2qhizoL1cm3PQDIStfHCPBQKRL9wFKqp2XCe8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(260925021311599003)(10067099003)(261022105027099003)(4143699003)(260925021911599003)(260925022911599003)(56012099006)(11063799006)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkFaSWlyRk5sYTdiZmlyVitQT3plLzFhQkxya0pRazQxNnVLdHpUVWdQanlR?=
 =?utf-8?B?VVZjZVFwdUl5WUxqVUN3NVlJb3lSV0psdnZCUnVRbC8rZEQ5VDArZHVXN2NY?=
 =?utf-8?B?UFBNa1A0T0hNeEZjU1dBNGlPeXRBK1diUUt2M1FtbFRHMitYeitMQm44RldH?=
 =?utf-8?B?dmx1OGZMZElhL1IwYTdWOGdsN2ltN2tFdGtBdXQ5UGt0bWZVRVZYSSttbG9Z?=
 =?utf-8?B?NlpXY0h6a1RRMldqcXV4UnZPeHJRQkVFTlVJeXVIalEyYm9mdWNmelpLaURw?=
 =?utf-8?B?QitoY1RBREE3NFg4LzF5YWQvU1hZQzdETis1eTkxODFRQjlyQ2lTcElQQWMy?=
 =?utf-8?B?MVVBOG5RYkJWT0VQcUJhS3ZOYjFlcm94MHk5SWV2SGJlRVVEd3VRaUp0STFm?=
 =?utf-8?B?aDhvbEp6UnpZRFBNYnAyRExybkxCQ2hNZGRLcTNvY3M0VHBZZWhCWHNPNW96?=
 =?utf-8?B?NlJpUmw3ZmtLb1Bmem14VlBPMW5UUWlnRFIzTWk4Q3V0OU4xWDl3b2k3VmZO?=
 =?utf-8?B?VzlUREI1T2ZNeXhHNzRvYUY3TXJzQ3pxOFFYeEpKeTRJcUJiTFNQa20yNnFF?=
 =?utf-8?B?NGJiTGdZb3p6dExQbUxzeERvekdXSFJIenBOdFk0b2t1WUQvbGQxRzJyVkQ4?=
 =?utf-8?B?a1dUUGZZRXpFTVhEV0dNaHhQajNBZFdqNUMwMGJpYjlwQzZrNExRQ1l0R2Zq?=
 =?utf-8?B?Z1VUYTJrT0NNMVZIdSs3akR0R204TjVkZHlHQU81M2VTSmlaZS9ibm5pTHBj?=
 =?utf-8?B?cytFY21wOW1uYWxQcFRoVnJBK0Y3U3I1Tjh4MDBqajNoQWZXaU94WHRqaXQ4?=
 =?utf-8?B?SERYS0Q0YlVWcFlOMFFUK2hjOEZWa2kwb0I1SVNiS3prSloxZ2NWR0o0Y29B?=
 =?utf-8?B?N3NRQkIrRVQ4a3Q3dHF4VTI3Smg0YVhSeFc1SElzZk4vTXJncW5OdEZJMHk1?=
 =?utf-8?B?S3BiWkJYT0tPaXltUGl4Q3JjNVJiazlqVVloWnFBNWhNbmtBN1A1SDY0SkVZ?=
 =?utf-8?B?eWlNWWFsaU1mNGQvV09ZZ1huQndTQkVlZjZEYzgxTWdtbk5LcWtxbWI2U3Ev?=
 =?utf-8?B?YTBsbHNING5mYVlvOVozVFNyU0NhVzNSb1BiVWFNL3dVbnVuSFlLc1ZCTi9M?=
 =?utf-8?B?ZFNJMHZmV1g4K29yNVc4VC9IYVFyRUF4YThQUEFQNDFwT3cxQXRCWWtyYjJB?=
 =?utf-8?B?OG4wSnQ5RUpyUCtheFBNVlFuQllsU21nTTAxVXNSUmtmTVdkQnhQU3VXcENI?=
 =?utf-8?B?UGk4ZVJYQWt0eUhpQ095MmtIa21MelE1SktTSjlTMmdSMURnMENNRDZ2Smhn?=
 =?utf-8?B?TkQwMFd1YlEvV2xHNXQ5Sy9weUx3L1Qxb0dNRTZNSHYyVVZKcVh6cDhTVlds?=
 =?utf-8?B?SC9qWm1qY1Baa0tiVEZ0Y0s0dHVXbGIrUW5LWU93d2ZMVm5DUGFQdld0MnRv?=
 =?utf-8?B?MkVsaDNnZ1dJOVhuOHNYMVBRUUcvbHJaVGo5N0pSanpFR2N1RUVZMi9lQytu?=
 =?utf-8?B?cHVmVjNrRmJHUE1OalM0SXRJNGl1ejZCMEpQaEk3bmVNWmNwWFRoMHpHbWYv?=
 =?utf-8?B?elBnNG5TbWZpOGFmMFJRbUlPK2ZQdWoyOHl5Z2MweFRzTVp4WFVGVnBPdi95?=
 =?utf-8?B?MlV6Y0JDcUZ1Rk13d0NOd0lmWnNxaGdUNjJ1UjA5bWNPQnBqRnhOMXhab3o5?=
 =?utf-8?B?Sm9aRUJyZi9SZ0k2TitSeERrdG9vd3ZmYzM3QWNmVTIyQXN0VzZJZTBkbndY?=
 =?utf-8?B?OW5ydERXaklFY0VHRWpCTGxSVmJCeDZLL3U2cTI5MllzSHZoYnczdVFWcklZ?=
 =?utf-8?B?VVhZbUJLKy9EanhPazNFUVJ2cTVqYTd5dFpzUUZYV0wyaGFhY2xhcVNGV244?=
 =?utf-8?B?bzFZRkx6cDRCdGxqdGVkdWtndzNwTTgyc0JQQWVEMHhyNE05NlZ6dWtvQ0Zj?=
 =?utf-8?B?cWpKTXV2K1BTRDhSWUhNdFNQU3JWYUN6NnhLTUhNcmNsZWRIK2pvNFpqMzNu?=
 =?utf-8?B?azQvNkd2bzRuZ0kyVlhPYkdYelY5dTJQVnNLc0Z2SWptVDFQTi8yOStuM05W?=
 =?utf-8?B?TGlraVpkZ3d3bytTR2E0N3hWVnBMR0t1NmtFRk1jdW5wOE9lK2JFbEcrNUsx?=
 =?utf-8?B?dkdqK0xlL0NobXR3NXh2NkV3K1QwclZBb0FHaW1ORUdiUWJwVGFqYWZwRUNh?=
 =?utf-8?B?cUxuamNpaEluS3hLRmFoYU5Qa1I0VW15QXNwdWQvUVdhaUV4TzZlNmp6SCsz?=
 =?utf-8?B?ZUp5aElLWk0vVW1LUHVwKzJldk9XNllzTmtKanM4NzdhVFYwSmp4dnhCNTBr?=
 =?utf-8?Q?Wk7cwjhCbcs8mWdPs2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e499038d-f33b-4687-69f2-08df493baf0c
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:27:59.9697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mH9F5OCQPuOgyA5YF33DnqIA6Kaybha4KtQ4yB1gst4k2m0k4vpzwQ8gyHu9TqdG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5638

On 11/23/26 09:18, Michal Simek wrote:
> 
> 
> On 11/19/26 10:46, Markus Elfring wrote:
>>> There is missing return value check from clk_prepare_enable(). Fix it by
>>> using devm_clk_get_enabled() macro.
>>
>> How do you think about to add any tags (like “Fixes” and “Cc”) accordingly?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
>> Documentation/process/submitting-patches.rst?h=v7.4-rc3#n145
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
>> Documentation/process/stable-kernel-rules.rst?h=v7.4-rc3#n34
> I would expect that b4 could pick these two lines automatically when they are 
> sent. Let me test this. :-) If it is not working I will send v2.
> 
> Fixes: df3305156f98 ("[media] v4l: xilinx: Add Xilinx Video IP core")
> Cc: stable@vger.kernel.org
ok. It works but Cc: is not picked up (It looks like that AMD still has issue 
with BADSIG).

Let me send you v2 with it.

Cheers,
Michal

$ b4 am e2f4a6b4-0615-4b3a-b64c-408a27fdeade@web.de
Looking up e2f4a6b4-0615-4b3a-b64c-408a27fdeade@web.de
Analyzing 6 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH] media: xilinx: vip: Make use of the devm_clk_get_enabled()
     + Fixes: df3305156f98 ("[media] v4l: xilinx: Add Xilinx Video IP core") (✗ 
DKIM/amd.com)
   ---
   ✓ Signed: openpgp/michal.simek@amd.com
   ✗ BADSIG: DKIM/amd.com
---
Total patches: 1
---
  Link: 
https://patch.msgid.link/abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com
        git am 
./20261118_michal_simek_media_xilinx_vip_make_use_of_the_devm_clk_get_enabled.mbx

