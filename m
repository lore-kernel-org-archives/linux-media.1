Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793925724;
	b=S3sInsqBYiTsA4ERRsc8N20FsH4dnATwQLvbglgbr5zsWjAZZLRGlyyG1v8gRYFHu47y
	 yCqSE4UB2vE8gF0HH3lrBET3TesLnDWFMVI0Zqo+F+FAVlCQ4Jhx7iqYHuqkLMhpH44mC
	 R4yV/UrrI8mImxRrw0uiG61ngA5BvcLUWfwt1ZbeX1lw4zoUhKZ0SKbcfD4p0yh/GMRQ/
	 sD0MES+GSY3NNv83nakVedOPKx7Y6fYuwhMOn7INJ54dNCeRTBWyl+hBL8pprQdsesUZm
	 lDOqSQJFsjpgBCUAa6CzHVS3P5ydfybDLIHM3QZUCJYU2JLPD4ftIOhq9QsGMoqbDQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925724;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
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
	bh=hCr/YWS4fVuciA76hINNpnXgNW2KssvUAkQdmu4X2VI=;
	b=si1mqAU6jfN0tOD5UBB+dUmlbQ+TPp9FQU/wcVYTyBTFO8iFJhJ8Ek8EXQ8AyN8MKzLl
	 IQg6nkCNtKWaEfC1iCENkvdaLmfOfaNElOunv1qRPOrsugALAiZVkP83DAbqUcQK3k7HS
	 6o2lakAL+9VKIQafyoZD18NUl3KLhRbtLFgRpS1KYL87VTZT+uO3uC2Kqe12d7+I6/pVQ
	 +ZmpIyUvZJI0nY+kmrTPv6JW1JewGqgh7dj/fL60eC59ASNjuZH0297SQ0bbM+xIv98ut
	 xBDLPFW87dBdqpEKMeJ0pYVLuStaW+5vwr3+kpDLIidWZOdOQ21aTdXH3ezCcrB87pQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IAX3efMz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.51
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012051.outbound.protection.outlook.com [40.93.195.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580B5606A31B
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 00:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 580B5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IAX3efMz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scwiYExDjhqZwbPOJDaW/8OCgL6otwU+Spn5Uh9/Dc4Bo8GfHsu24sw56+yahJ8Y7KLsqz4rGAn6hZScg6J4CCgEugZoUcSndl3L8lKiLILhMrJk5ULaAUmile8OI/puiaonpnx9WEDT3ihdafmXNVpQquYrtAyZCERLSrXKip51i91a4QY8R3p2Ux/BH5UjudCrjCJe0LV755p64y8iBLmtUBoL+LDtVcQgMyzkUd66HeqC3nCjhiYJGRzSICmvN6UVw5MDh0KmurTozru4qcgPQX99x0P2TCVECcr+MguVjW7/tribJyfB3lTJfOBHnCFX5M7CPvdAb/bnsiev2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCr/YWS4fVuciA76hINNpnXgNW2KssvUAkQdmu4X2VI=;
 b=dhxMP07W2EBe6hWqYIVIjaHpZgO8T2g1XrFBhscsZQG5GzZYQssTzHMPB8skR/s3Z2248J9UfZTEBezr/kBVt4Lsi2D5BQ/0mT9AJDtF3mQ2S+FRCP52TCGE1u3CL3MvZNoM6U33GvmEtwR61rpldYcscO3sxnOlZ4RwolDeFrjWaSTcNbDJAbXIWTgVxBQK0Iywp7qucK8fTJry+zl6MrUcKYi870qGNOYwyLdsTdmyjeom7SW5ReoTcY1uqhztuO/kwz733OU3AG8v6rKiaVWWZg7P38nJwatyk3WuEosZ7Xhalpn+iTDPsriy5UvJiZ14e/7WAN9bQ7oCVteBSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCr/YWS4fVuciA76hINNpnXgNW2KssvUAkQdmu4X2VI=;
 b=IAX3efMzpIq1heK2zWnHIFCGyLr7yavRhA1YAKxM2WQuSC9W/4Tq9TYWvQUATAfD8IMakxMVIH3gMrwpSR8NEIgl8Mnw4oBhonKREiYn1w8o0c7cixyarfiEgeKJvHdt16JDQ0u15CocRScf7ALnCXzogPSMv4ZVJv3qTeVqVt8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15)
 by BL3PR12MB6620.namprd12.prod.outlook.com (2603:10b6:208:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 00:39:58 +0000
Received: from LV8PR12MB9133.namprd12.prod.outlook.com
 ([fe80::d29f:9915:159b:b02]) by LV8PR12MB9133.namprd12.prod.outlook.com
 ([fe80::d29f:9915:159b:b02%4]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 00:39:58 +0000
Message-ID: <4f905414-6fa1-4668-bb0b-d06a5883e10a@amd.com>
Date: Thu, 5 Nov 2026 19:39:56 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: AMD ISP4: SET_STREAM_CONFIG fails, no frames on HP ZBook Ultra
 G1a
To: Guido Kraemer <guido.kraemer@gmx.de>, Bin Du <bin.du@amd.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: linux-media@vger.kernel.org, Caspar Adriani <caspar.adriani@proton.me>,
 Seifelden Abdelmonem <saif.elden.hatim@gmail.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>
References: <3e8ae2ad-c804-45c3-8c52-ab25481cb430@gmx.de>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <3e8ae2ad-c804-45c3-8c52-ab25481cb430@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0245.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::18) To LV8PR12MB9133.namprd12.prod.outlook.com
 (2603:10b6:408:188::15)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9133:EE_|BL3PR12MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: edb84830-41cc-408e-fc23-08df3b9e7c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|10067099003|3023799007|11063799006|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261022115727099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	lJvru6LJA6QW59zZ4jEBswsFtuLuvI+nMMQai7ecRqoxvGqXAT/f6Iyu0WNk12tFpqnG5VCGawPI5C7xArYh2xZhmTBjeJSP7RpgeCCqLvl9hJPqr409NBPMacRc/pd3yaxafI/6wAqRZDxaUBkQScxh30FTQDtjKuLZekrbHK8nx4StA9GyQ7RUvjiVZkZIXstkRE9jdurLLwodP0qOPeer1W9mY6i/q3iyvYQCVTbwhi16GtxBk9w+LVh5OFepLy/OyeFbzTkpKB9WjWZ25KRQU62yV49AzqYE6tNiPSa41X470RDhdOWuVD+ehUZ22g35iju0j0z0Ia+UDA85gBGxTjdBx6YZeW9xGFWgs+kS0jb84vlgXiaqgs1ShQKAIEl9898fqOK3hCLy0LPoln5oDASvmqj/hTFzsNku8XRO3dqi2RRQr8AuhxOh4JNOHZ08NZOzmQqpC9ebu6SM/ls2JgFBT2H0gloh7rILrp4ZK2xRI+D+BDKkxKlTPepR+a0olZQQz1gxoOr6rPA7UouROuFWQ3xOFwCCcgABH0S0wjnoQEq1LMI1myiFC/FuZ6Du2K9tUJIFMOIjkysGDDPWqH3i3zK9IObwzzs+gAY5DMmdvZMCtl71R7wcoh1Utua80LaNJLvxQHzqWv2z9MWvJXDmg/gONUFfZxUy0zg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9133.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(3023799007)(11063799006)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022115727099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUh2MWcvYkpsTjZheGVuRnl3czdJaFI1Y3lPdlBISGxOM0xkSVpLcUU3bXRE?=
 =?utf-8?B?am9BOW9rc0JiNXhNZTlRSUc5V3dYYlZ3ajYwZmpLQTVGMlZnV0hWcWtNT2Jp?=
 =?utf-8?B?VzdIZWV5Mndycm5PVTFwTU00clRqa2VmOWJIN1VwYjJiK1kzMHdYUTF4bzhK?=
 =?utf-8?B?amtlMThQVEpVa1J1d0JBeXNNN1QyblVUa3E4WFhMb2tsekVzVloyNDI3QS9h?=
 =?utf-8?B?emh2YmFEajZqTWhlTmo2YlhDNDYwVm5XQlg0aXFjaHRCMm9yZzgrV3hKbXNj?=
 =?utf-8?B?UTB2ZnZLdUh3Qm1qYnJwdGdEczVPQit2SE1pc1JVQjFUdHFmd0lzRmZKL3FU?=
 =?utf-8?B?R3VsSm1MN3RqbnhnaDNRb1ZHcmVFTnJhMndYTnpITElxL2hnckU5aGQ4RUVm?=
 =?utf-8?B?S0M4YVA1YWxyVU53WHJoSk1IbEZQcG1VL3F5VHlvSVNpK3VRNXkzZUx5Z0Er?=
 =?utf-8?B?MlZVZ2hSbEx2WVZ3b0hXSTdMV1E4YlRQVlp2dHJueFhaMEFnaFhuUXUrUzI4?=
 =?utf-8?B?TEl1dlBtRWszemZFY3ZPM3d5K0hOU0Nsak40eFdOdkRXanJpdy9Zc05zSm1w?=
 =?utf-8?B?T2l1SEFHWlZHT1VzWWVyRGg0bi8zTTF5Z3l6NXZ3dENJQTRxL3p5bU5yNkYz?=
 =?utf-8?B?ZmxFaEh3Q1VWeXVzaWsxUXVqN0pPSU9tS3lVSjBxbGVZWXMyd0UwMXBHb2x1?=
 =?utf-8?B?TnlMdVVOY3ZzY01rR2p5UDI4NVBaUzF0OE43R24zek84MTVMd01mNU9rdlVW?=
 =?utf-8?B?ZEFEZi9JOTJuMXdQRG9xcU4xd2xCQ0c1VXdpQTBCalhYVjNYcG96MG8raW1t?=
 =?utf-8?B?dTVQWVRiS0NzSFN3SXY5UEdaVmZ6OEppS055NC9MdTh0Z1cxUElydDdKeXBD?=
 =?utf-8?B?Q3ovdC9PSUVraTZUK2xmSVM5d3hINmpkdVVWSHYzTWZZa3JiQjk0VjBnd2l4?=
 =?utf-8?B?YUZON2l5TTB5M3Jxa3Ntc2xpU3hWQXNkWUZBRkROVHZRQlFNanlQM254YTkw?=
 =?utf-8?B?R2ZBL2plNmZiVytyTTQ1dWgyYjJSTkt0MG9uQ0IrSTlnVWdXTHI5Q0xqRkhS?=
 =?utf-8?B?YW9seHNOYmdOM1BkUlVmbDRUOW1nQ1lzUkRlN2oyMTc1VmpuVDVOaU1vZ245?=
 =?utf-8?B?V3JkVmJVVU9TYy85ME1VQWZmazQvUUs1SkRLUHM1akg2dDRiYWJRVG9KaGY0?=
 =?utf-8?B?WXRZYmFGcUxDYmNrNU90alYycUJsQ3M5TzNCd013ZTF4MEczTG04bmsvUEZz?=
 =?utf-8?B?b2FBZE5QWW9KR0p1ZmpzRDZUcUg0WkEvVm81TnUwNy81d2VmaWxnYWxra3d2?=
 =?utf-8?B?bkVJd2FGMldXM243VEUrZjJPSk1zaXd0aUx3NGhKeDUvV1pXSFJmUUpKTldq?=
 =?utf-8?B?dU1QRGNFU3h3MFB2SC85OUxYVVoyUTR2aW0xVlRsN2xlQjBRZXQ0d0hScWFr?=
 =?utf-8?B?YnRaN2U0Vk54aXhiSmNOQm5zV0xsNk9Vek91NDZUOWlTZ2JvUndlS3hSUmRK?=
 =?utf-8?B?SnpUQWM3RHcrcXlSMGpqaWpWcHZRM1N3VjNjZzlNcWF6dzV3VnVHTVl2bjZs?=
 =?utf-8?B?a25IUWdEN3phSSsvVXZ6MmVjOFNFUmk1MG81ZWI5L3FleVIydDNqT0hOTHBR?=
 =?utf-8?B?dE15aTVhdVRRdU4xM3ZQaWZUWStkK2lrNmhxTDFpV1VEb0drNVQ2NTZKd0ZM?=
 =?utf-8?B?TmtJNUFmeTcwdDh0MGRybVJpMHJ2ZVZuMy9FMElVTTRHWjQ5NFkyTnU2Y0F1?=
 =?utf-8?B?S2l2MnZxcDNKUDBjZVg2VTFYQjRWV251WWN4YmhGNlMxRlNydkxPU0ZWYnpF?=
 =?utf-8?B?b2x0KzhWOGdqUi9vb1dvblFrY3l4VWljRkZ6ZURzeDlQUDRIWXB0MnZpVldr?=
 =?utf-8?B?NExyOVV3VzRZMnh2blJMSFBMRi9MeTVxUTdNL0FKdzF1dVZWaGlsM3pxQWRv?=
 =?utf-8?B?UW93bXZ6bVFyaTQyazJhUHV1UGdFNkdydWFhWUdjTjBGcis2SXliL0ZJTWdk?=
 =?utf-8?B?elhxWEhVUThrQ2xNQkQ3aTV3RnlqWGdtWFY2aTVOU2FjVGc2czRTK2o4Zk1l?=
 =?utf-8?B?eERvYUp0dkgzSnJWMUdya2JuN2VLMitMU3FOOWpJVjBDZ1gzMm8vdkxqZkcr?=
 =?utf-8?B?c2FTUVNQNE81aU5MYUoxcWxDakdUSmkwdldpblRZSkN4ZlhCVGRxVkV6UW9m?=
 =?utf-8?B?bzE0RGYrL1YrM3U1SHBOdjlkZXpvVnUvcCszdnl1M211RUVHWklPbllNS1pu?=
 =?utf-8?B?enl2aDZrcHF2TFR6dXJkbXFXNncwRjV5TFNoelgxQ29iM3U1d3VxZ1hvbzdR?=
 =?utf-8?B?T3N2VFNpK255d1Jlc2ZRaFd0eHF5cDkzQnBHQmdvL0dBdHZhcGd1Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb84830-41cc-408e-fc23-08df3b9e7c16
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 00:39:58.5483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5ZzYQIj0VzlTIloEmGoSqkRvOlrq6X0aOrRvVYOOHkED+k5zx/76fN3cM9UPhfkomVRoBJw0X6NEjY1bE9AnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6620

Hi Guido,

On 11/5/2026 10:40 AM, Guido Kraemer wrote:
> [You don't often get email from guido.kraemer@gmx.de. Learn why this is 
> important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Bin, hi Pratap,
> 
> the built-in camera of my HP ZBook Ultra G1a stopped delivering frames.
> The ISP firmware boots on every stream start, but answers
> SET_STREAM_CONFIG with ISP4FW_CMD_STATUS_FAIL, and no FRAME_DONE
> notification ever arrives. Applications show a black image.
> 
> Setup:
> 
>    - HP ZBook Ultra G1a 14 inch Mobile Workstation PC
>    - BIOS X89 Ver. 01.06.02 (08/26/2026), updated from 01.05.07 with
>      fwupd on 2026-10-25
>    - Linux 7.3.1 plus Caspar's "fix self-deadlock in
>      isp4sd_start_stream() error path" and Seifelden's two isp4 fixes
>    - linux-firmware-amdgpu 20260916 (isp_4_1_1.bin)
> 
> Debug log of one stream start (dynamic debug on amd_isp4_capture,
> Zoom requesting 1280x720 YUYV):
> 
>    15:44:28.769780 enable isp_subdev module
>    15:44:28.781101 ISP CCPU FW boot success
>    15:44:28.781285 send fw mem pool 0x7fff041d8000(104857600) suc
>    15:44:28.781327 isp4fw_sensor_id 0, pipeId 0x5f91 EnableTnr 1
>    15:44:28.781415 channel:prev,fmt 
> YUV422INTERLEAVED,w:h=1280:720,lp:2560,cp0
>    15:44:28.781538 send meta info suc
>    15:44:28.781620 setup output suc
>    15:44:28.781754 no send start, required 4, buf sent 3
>    15:44:28.792076 stream 1,cmd ISP4FW_CMD_ID_SEND_BUFFER(0x02040001) 
> (0),seq 138, ele 0000000000000000
>    15:44:36.648116 stream 1,cmd 
> ISP4FW_CMD_ID_SET_STREAM_CONFIG(0x02010001)(1),seq 139, ele 
> 0000000000000000
>    15:44:36.648380 stream 1,cmd 
> ISP4FW_CMD_ID_SET_OUT_CHAN_PROP(0x02010003)(0),seq 140, ele 
> 0000000000000000
>    15:44:36.648440 stream 1,cmd 
> ISP4FW_CMD_ID_ENABLE_OUT_CHAN(0x02010005)(0),seq 141, ele 0000000000000000
>    15:44:36.648492 stream 1,cmd ISP4FW_CMD_ID_SEND_BUFFER(0x02040001) 
> (0),seq 142, ele 0000000000000000
>    [... SEND_BUFFER seq 143-158, all status 0, all within 2 ms ...]
> 
> What I see:
> 
>    1. SET_STREAM_CONFIG returns status 1. All other commands return 0.
>    2. The answer to SET_STREAM_CONFIG always comes about 7.85 s late,
>       together with the answers queued behind it (16:24:51 -> 16:24:59
>       and 16:25:02 -> 16:25:10 in two v4l2-ctl starts; 15:44:28 ->
>       15:44:36 above). In one start only the first answer arrived at
>       all.
>    3. Every stop then logs "fail to disable stream" and "fail to stop
>       stream" (the synchronous commands time out).
>    4. In several boots, around the first camera use, the firmware sends
>       two notifications the driver does not know:
>         -><- fail respid unknown respid(0x30002)
>    5. Once, out of many tries, Zoom showed an image with noise, stripes
>       and false colors.
> 
> It does not depend on the format or resolution: v4l2-ctl --stream-mmap
> gets 0 frames for NV12 1920x1080, YUYV 640x480 and NV12 1280x720.
> Reloading amd_isp4_capture does not help.
> 
> The kernel log goes back to June. The first camera errors appear on
> 2026-10-26, the day after the BIOS update to 01.06.02, and then in
> almost every boot, with Arch's 7.2.6, CachyOS 7.2.7 and 7.3.1. The
> built-in camera worked before the BIOS update.
> 
Thank you for reporting this issue and, in particular, for identifying 
the correlation with the BIOS update. This is a valuable data point for 
our investigation. Since we have not yet validated with BIOS X89 
01.06.02, I would like to reproduce the issue locally using the same 
BIOS version.

I don't currently have BIOS X89 01.06.02 readily available. Would you 
mind sharing it with me, along with any additional steps required to 
reproduce the issue locally?


> The driver sends SET_STREAM_CONFIG with isp4if_send_command() and does
> not check the result, so the start succeeds and the application waits
> for frames that never come. Failing the start on a non-zero status
> would at least give userspace an error.
> 
> Questions:
> 
>    - What does SET_STREAM_CONFIG status 1 mean here? Is it the sensor
>      not responding, e.g. because of power, clock or GPIO setup that
>      the BIOS controls?
Status 1 is a generic "firmware could not process this command" flag, 
not a reason code - every failing path in the firmware returns the same 
status 1 and distinguishes itself through a separate error code in the 
same response. So on its own it does not tell us what could be going 
wrong in the firmware.

15:44:36.648116 stream 1,cmd 
ISP4FW_CMD_ID_SET_STREAM_CONFIG(0x02010001)(1),seq 139, ele 0000000000000000

The reason code is already being sent to the host: it is the 
isp4fw_error_code field of struct isp4fw_resp_cmd_done. The driver just 
does not print it. Adding it to the existing dev_dbg() in
isp4sd_fw_resp_cmd_done() will give us more details.


>    - What is notification 0x30002?
This error code indicates that no valid MIPI data is being received, 
which suggests that the sensor is not streaming. However, the underlying 
reason for the streaming failure can only be confirmed after reproducing 
and debugging the issue locally.


>    - Is BIOS 01.06.02 known to affect the ISP or the OV05C10?
Not that we are aware of. We don't have any validation data for this 
BIOS version yet.

> 
> The full debug log of this boot is available; I can send it or run
> more tests (other firmware, other options).
> 
thanks for reporting this and for offering to help debug it. Once I can 
reproduce the issue locally I may come back to you to confirm a fix on 
your system.

Thanks,
Pratap

> Before the deadlock fix, the failed start (with "fail to get out prop")
> hung the process in isp4sd_stop_stream() until reboot. With Caspar's
> patch on 7.3.1 that no longer happens; I'll send a Tested-by in that
> thread.
> 
> Thanks,
> Guido

