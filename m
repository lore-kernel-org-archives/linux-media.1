Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795403088;
	b=XNcr8EqRW+pnZOXlMdHnWegEH6OEtNiik2N2w7PsH35pusKdAHnuQ4eOFrmwutUr9ndy
	 E4jBcTXbleo0GdOgS/3EVJg9awqUGydqqfNfmka7tXXomNav9O3BfWB+j76aCdcBMqwkg
	 bKlE98xeQ+aAdJyVzk59rC1h9kWNHiRMMRUXhTsdYM8oMIRZaYeWfH2wqjiFhhjAH8Tw8
	 4HX/KaqR8JGpa6AacuI07+whycwHaAIFsiTMWB+QveXlyYH8hqDCmjmMEr2wxvbx5IIcj
	 Sl3v7iAXy5KH1Ud77blbhsD6/mO3JBjg8pTMnDXsAooo4eOw2sWqhmesQT+tta/MOvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403088;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=O9sezsgnrkdf3D0PLk4Soehtn93rbnFgUq/F/+Xbx+c=;
	b=auBiCtKp3PIxbGvBBnAv/8lT1P40hziuL6COYC525uWuETT1XPBoRXjr7MibjNoWa3A7
	 GEKAnuagOQ1B4k5BRGwhPohPvDAsJu34q7pMP/PUjMwAvqB0U2ShgYkIvFVxkfx8v48aS
	 RTEStbt7HM+T2QNyUbPpUHvXYU4qO1D/Alxviezl5vTM6NWYvgoupj3omFCub7jByQHSQ
	 PqanAFNgrwL2ThjDjePJEs2DSMXXRWiU9XxZgRBwm6h0yKn9SW+QhJbxX3rwZzZ2qBhdp
	 TQgsOKagRo9pfsjcLIOsR2ubvx+6Bdo2ewHbhQmcOVkOSIjwGRvVAj3cvM6c0nCie0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=QV0fnC4e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.122
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022122.outbound.protection.outlook.com [52.101.126.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84672606A31E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 03:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84672606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=QV0fnC4e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RP/+2x759K8qVVRgjIXHZJNwS5y42Si3PcT29h5g/Xh71USH1mlF4BRG8ZLCuqV8LUeOQB5cyNyDEQOYCeO4/laG5cpCl1JxuMKCg13eTSdPecP0zBSq835IP+zVrNnE+fA7XJ1OCfQqcw9TE9f0q16HYkQNMQeiGT3nciYZalii2+bIQ+KE6DF3EoGbDlpPREHK2qrrudJccgUyb3bMf4X/y74sZwtiYwmnLFZZC5clPsrTacyMzXOyRLqRNWvPIPuj6OAibluDuPuycpBUgTEFiJgqZQ7JEsFpYndYnV6cJqIE84W3od91N9c9HvPnush3CzJQBVBOyygUAu4zVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9sezsgnrkdf3D0PLk4Soehtn93rbnFgUq/F/+Xbx+c=;
 b=khSvVc4A6+ZsqICPLV4EIxOMyoUgBtIMX9+MkJZXM13POff3lYtGQIWEDWE1KSU468dZ0cXlDjQkX3vNMBBPGFUlxwUKa0t0R7wVbT1v5umfQ9N39Qac4PlavZynk4mOeIJ6mGo+f20oZSQFQFnCTYuzjNV6gzz1/uAiHFk7gNq/pk5ElNNXQUKCIG2VRu1WRURy8DIjDm4exif1BkI3ba2PNvXbjdhl3aIi20cDFnXaNVCEpS3vAH31766NvleRfzeR+cmHeRvDAnGNXPruD3drlNIYg2svKneaVecxVeNnD4L2QSXqS4844fmXSSsjf9WHJZigruf76ioLNqE1Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9sezsgnrkdf3D0PLk4Soehtn93rbnFgUq/F/+Xbx+c=;
 b=QV0fnC4epnyx3WBKS3Fz1xSxybQgNYCycez5uoWd8o8BIeO8tvtWvgLJKTZsY4WEfHrRDcY53gj5fRiG27m4SH8bKg8OENJWsblG5dtXMGF0SoGGPdPQXkxF6wGE65HuMLfyGyCKLOHsI7r9YAajFCZ0J02xpIvJ8h+nYLS4WwB845UyKr22yQvulNy2FnDURsr9RIGeJJ+gfX8SKLKjIDbKCjnqu+x0Rg1MEiFVMU2dICBeTbAZyJCOTgcMnQUNA/Iq/BlY5bZQ9Puz+xXzI58u2TeOUmPTDAnqKDIFg2qCjNCVdPCH9ISUkt+yGXhaJCPWkb9qF4LllyltWXoetg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SE1PPF2F43B4ACE.apcprd03.prod.outlook.com (2603:1096:108:1::84b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 03:04:43 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 03:04:43 +0000
Message-ID: <8be8337a-5b73-4a9a-82a5-5acbdb6d6964@amlogic.com>
Date: Mon, 23 Nov 2026 11:04:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Amlogic S4 (S805X2) video decoder firmware for linux-firmware
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>, Arden Jin <Arden.Jin@amlogic.com>,
 zhentao.guo@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org
References: <cda06da6-e7e0-4522-b1ab-ec542d4703d2@molgen.mpg.de>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <cda06da6-e7e0-4522-b1ab-ec542d4703d2@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
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
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SE1PPF2F43B4ACE:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e37336-b884-4fca-2ddc-08df490e859e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|261009223027099003|22082099003|18002099003|261021121427099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|56012099006|10067099003|261102123227099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	Fr+Mbd1T6WIOkM7+bhaP1zvzr6O4+3XmJ09+Z3nyb8Vb0OdBmGOZhf0FWjkw4f/5r0B2NRXTUgXjo6tkAPGsnULDl2neAsW949uE7ZI9TLXnNujNy+AXDX2jDrQpFMsznTCBHpYkBRH+SuRGpOJEKcUAIeotj0UcuzLHkA/bkOe1ncnymRa69A8ztw73y6asLUFn/aII1RsJR3ZjaChYDf9VQPcKjpj2fpgHbkLhGkFuHQdzPUSC+mjlJPwZGU5ZqitrW48udOXQe64qJzKMVQxeaClZVkxUc874MRT1hxhZNXFpNMRat6ra5PrcpRx7sLdpWvVNU2Atsh+sLMpGQP9BDEzz9KMQvmHYXB+0UGG5jWnw0VUclLMHwxUlqsIrbzPW+yDtSf69x2Db0ZxSwvRuO9XYlxHOOD1041ZUX1XQWtvaxhsieqysf0Ww22xPPWIiO3puwqWeo3yto6I+QVsTyOKXRROxYSw/Iyp5Oc/7lFNuvTO18jw1ebkd2Qd7M5IZSDNRG+vgZgynp3fVYr9R4j5bupDmpvYgE06FoD86Voe7arsRGJFOkjO+vxWjfRbwrKfgzj5ZR75n7ATXieY/nR+FVvNI33ADI9kwi7k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261009223027099003)(22082099003)(18002099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(261102123227099003)(5023799004)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzNib0FRaWtJMTAraDgzdjZrMFpaL0J4cHc0bmRCL1diQnpuNXI1cnpldjlt?=
 =?utf-8?B?M2tvN2U3WW5CTHZVU1QveE9aQWxXL0EvTWg3MTVZd2UzaTJ5dEN3ZVN4V3VW?=
 =?utf-8?B?bUV4N3ZjQmRjZzZ5cWxYNHFLZ1pGcmZhVUJ1WTRhZ3ExeFU2UjNnWSt0cXND?=
 =?utf-8?B?dllndGpyTXh5OGhLcHZGdUFxRFIrNVc1U0gxdms0aEFxRUVhTElZL2dsQ1By?=
 =?utf-8?B?R1dZRlQ2SkdZdG80MTAzZzBqVG1RMWtrOURlZSs2ZEdXMWhLcllnNnNVSGxa?=
 =?utf-8?B?WjNKK3I0YjB0TUNkbHp6d2tRS0VIb3dVSWE4amVOU04rNjdJK1gwSWlLdCtm?=
 =?utf-8?B?QTUrTVUrcnlHVkdQamhReFBDTkpIZ053UGJ4NUxwM1lORGUyWk13YmVjelZ3?=
 =?utf-8?B?TStWbTl4ZlFxK3BVRWFiNzJnVEFhYzNrYWx6QzQ5dkhoWUZBNDFsakNudDdy?=
 =?utf-8?B?ZkV3Q1JEVUtzdFMrNFhkK1FzcG1YbnR6N1puV2Z2Um1kQ202SHgwYkF0c1cx?=
 =?utf-8?B?YzVDb0srWHlQTGF5OGkxY1E0bUJ3ZlI5MUFPeXpDaW92RTVTSCtmejVNM3dT?=
 =?utf-8?B?NGxVVlUyOFZwRlMwUE8wemduYSt2SEdJS1E3YjZFb1VQVG5STHhVYjdEaC91?=
 =?utf-8?B?cnZMcDJuZmxjZmJ6am5DOXBsRUpmNkFpZjlBMG52aG9qSG5Ec01Wd3IyeGdz?=
 =?utf-8?B?NitWSDhxQXlKNXRyZXlqdFUwQ1krY0pkOG1PY2xrVnpORGdlbWdGdndMTUxW?=
 =?utf-8?B?djZkSG14ZlVVNmJhUzVkdmY5d0YrNy92TVF1VWlrSVNJbUdGL3Y1QzZXY2NV?=
 =?utf-8?B?MFRsNkdLakw1b3B1ckpQdmxWVUZGNzZpNnI2YlRpU2Q0Z1J3ZmNvQnIvZFBW?=
 =?utf-8?B?L01GNDhNc0c3ZWdPd1lnd1lEOGVySnFFY0I0MnhBNW9mNWx1YmJxdjRQc1c3?=
 =?utf-8?B?VUFmL2JTSElwc3l1N08ycmpaNGc5UTdabCtCWndNTHZLUlNTKzdtRHF3a3gz?=
 =?utf-8?B?UWNEY29EWXVSQXgrV25YNFczUU51TGhnb3lwQnlRdTlXM1BuSCtza1A0R3BK?=
 =?utf-8?B?NkwzYUY1ZUtlbkJ1VVFGbXhVaGFVWVJVb005OFBHUzJ1RHZTdW1rSjYyd1lR?=
 =?utf-8?B?b3E4d2cvdEp2SWdCb1pKb1pnYUc2QlI4b1RBaFBDSHY3c3dvQS9HZXltUVpO?=
 =?utf-8?B?Rk5NUTF4WnNsQXNQbXgvS21BajVyaExPVDRXYyt4ZzBWc2FuQXNPL2dWcmhi?=
 =?utf-8?B?aGVrNEQ4MGZZdlhKL3lmckdWSDc2Q3F3ZUhPWC9pVVF3by9wcEF5MU1TZ2Uw?=
 =?utf-8?B?YnhzdjcyclhaSzAwTE41bURlenJGOU1JN3JjLzdjbkdpd3JSNjNmejEzM0RO?=
 =?utf-8?B?L2gzVmRxU2podkNTY2RRTlp5ZnVVS0doUFR6eG9HczlLbmsyRmJ2VkkxenBq?=
 =?utf-8?B?OEF4OTQxZDBGMFgvZjZ3c0hUc1d6SFEyM3dNTEtpNjNucFpBVXc1MStOd0Ry?=
 =?utf-8?B?dzNwMm13OFNvNzdLMmxHTGl5d3FmVmI0T1oxOG5zM2FjMXNPejlzVzZZeS9l?=
 =?utf-8?B?MGI2SmE1VHN2RWl5NEgwTEY1akxnUnZ0VEUzeW5zbUhNc1BGR2gwRENuUnQ5?=
 =?utf-8?B?TFpSRWRBOXpkcHVscndxR3VhQ29tY2xhZnFWem5IMEdIMGcyV2tGVTRxdzJG?=
 =?utf-8?B?MTduSU1uTFRHdEpaT3ZrWEhId3RtRVhrWWhjMzR4cUYzUnc4UW1YVVFDcTc5?=
 =?utf-8?B?dDR4QXVES1Yyc0xYY3UydDA3U0JVS0N3L1I3anVCSEZIN2h1c2oxMW9hY2ZX?=
 =?utf-8?B?UWRnREVLakRJbU9lU2I2QjFSdmVEYkc2OXlJUmtCZHpzRElVVi9FOTJaTWFN?=
 =?utf-8?B?YmlrZktoMk92NGRUZUVtVWZMdnJnN1lWYk13ZEhTYnZNVjVZSGk1VTk3dldj?=
 =?utf-8?B?Q3Jna2NXUm5XTjFCYzNjV3ZqVWo3OXF5dHFiT1RNZE4wTEVjMUVtNnFHVTc2?=
 =?utf-8?B?QzBSaUpBNDNpNHlRZWNoK21ucGJ1VHN6V0ZFWGI1a3VQRUJpc1dyWmU2NW13?=
 =?utf-8?B?U2x2d1l6SHlSMmFweHBGWSt4OEZhOUVjV2t3N2E1bDlvdGZUNVRSWjI2Nngz?=
 =?utf-8?B?SHBFSStYRzdXODliNVVjMytUY2xobVorVWxqYU8zN1ZWVXFWVnZXSXgwcHEx?=
 =?utf-8?B?UW4rbkE5V25kWGpOZVgza2ZpcXdzditGME54Yy9UVkc3dWR3RmNMTWpnenow?=
 =?utf-8?B?blhOeExQaHZyb3lNVGNzdzF5aWdGMlhIRGhYelh1eXJZTDVOc3ltMDBnWnda?=
 =?utf-8?B?TVcyWnBZMm5CNEdRQnhoamdFV2RaaTNmS1RZbFMzSDJua3llSXNmNndEL2Zk?=
 =?utf-8?Q?4GSgDRGlweR/+A40=3D?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e37336-b884-4fca-2ddc-08df490e859e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 03:04:43.1083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7N049N+xi9WLBPEzhlKvtb+7kXz2uFC81dohIOSF6bUIKSM6zdUVNSF0RFFao12wLT3r1E5XM3wRksbgEyMwnL82z2PJkKgnzUnsEUJpD+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF2F43B4ACE

Hi Paul,
    A colleague of ours(zhentao.guo@amlogic.com) knows this part better.

Hi Zhentao,
    Could you please take a look? Thanks!

On 2026/11/22 17:18, Paul Menzel wrote:
> 
> Dear Xianwei, dear Arden,
> 
> 
> Before buying a Chromecast with Google TV HD (boreal, Amlogic
> S805X2/S4), I would like to sort out the firmware situation.
> 
> linux-firmware has meson/vdec/*.bin for GXBB up to SM1 under
> LICENSES/LICENSE.amlogic_vdec, extracted from Amlogic’s July 2019
> release (linux-firmware commits e04cc56d and fb505a69, with Arden in
> Cc). There is nothing for S4.
> 
> In the media_modules sources Google published for boreal [1] (package
> v0.4.66, commit 1752357, built 2024-12-27), I found:
> 
> 1.  firmware/S805X2/video_ucode.bin and firmware/S805X2G/video_ucode.bin
> are NEWP packages: only the headers are in plaintext, and the microcode
> is encrypted and loaded through OP-TEE (TEE_SMC_LOAD_VIDEO_FW).
> 
> 2.  The headers record the CRC32 of the plaintext. Each of the 14 S4
> entries has the CRC32 and size of an entry in the generic plaintext
> package firmware/video_ucode.bin:
> 
>      - SM1 builds: h264_multi, mpeg12_multi, vc1, xvid_multi, avs_multi,
> h264_mvc
>      - G12A builds: hevc, h264_multi_mmu
>      - T5D builds: vp9_mmu, hevc_mmu, hevc_mmu_swap
>      - SC2 av1_mmu, T7 avs2_mmu, G12B mjpeg_multi
> 
> 3.  None of them is byte-identical to a file in linux-firmware, and the
> current package no longer contains the single-instance H.264 and
> MPEG-1/2 microcode that the mainline driver loads (g12a_h264.bin,
> gxl_mpeg12.bin).
> 
> The files carry no license, so I cannot submit them myself. My questions:
> 
> 1.  Does Amlogic agree to distributing the S4 video decoder firmware in
> linux-firmware under LICENSE.amlogic_vdec? Concretely, the plaintext
> builds S4 uses, as meson/vdec/s4_*.bin. Would you prefer to submit them
> yourself, or to ack a submission from me?
> 
> 2.  The mainline driver loads the microcode from the non-secure world,
> by pointing (HEVC_)IMEM_DMA_ADR at a coherent buffer. Does this work on
> S4, or does the DOS block only accept microcode loaded by BL32? If the
> latter, is the SMC interface documented, and does the BL32 on production
> S4 devices include the microcode?
> 
> 3.  Does g12a_h264.bin work on S4, or is there an S4 build of the
> single-instance H.264 microcode? Or should the mainline driver use
> h264_multi on newer SoCs?
> 
> 
> Kind regards,
> 
> Paul
> 
> 
> [1]: https://nest-open-source.googlesource.com/manifest_repos/media_modules
