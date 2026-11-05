Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793891652;
	b=hYrAFO+pyQ2BP87Z5KjrEO0Dv1s/01uHsxcidfUvWTMtE0E2BGjOPhk6zad+r5XsYZd5
	 Pwjw/4EyR5f67JGPPyxt1dU29bnGowBo0oaE3Mjm5qFiPnyCp+K17a2r/Z6CtNc6Z2NNb
	 dSUZohvIfFw5aPWJAgcceH2QM/ErcjSB3mA8yEia/kgfSG3qwvCccRGd22OICT2nVnrBz
	 BaWl5b+fhFtWqjeNzOrnNjqfJdS6BzR6jEawiMoBZNe57KqMg+ejoIMdAqwZQji0l1k6I
	 eEjeuoqXl1DqCHQpLhJvuC9X2rLtqptrtAYAEdxqLUce370KfSp/MZwEB+d3gk9igUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891652;
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
	bh=h9r4HgWteu0o56+pwnEDriaVfIGbR5g+1s7mw9tabTM=;
	b=PyCp4ZSeF+C+s3CSplMqMQ6yt4J3NWzN9dLJLY5ZAnVn8DAS+OMHUdqCV5qoDqXDrPeq
	 95Gv4qO9uqKRV1j6KxvHgC8K2i+rh7EjVGGK5WL9hxqL94oWEn722r26vmDRb9Ffccyw7
	 3CG7eLCxZ/JtvA375HS+oF9JsaXBDDCxRZnJqP0xncERGj+tDKsefCPbj57xfUzvR0WmS
	 E3mOMpPbmecTGSNI2DVa/ZcmeAYtUZXq7GsuLozuqFS9/4hlnlBukB/35Tp6SDS9mo+f4
	 gidqXQkdBSLS8ncQ0f6IGAUi/tPSf0GdVWCDepwmxlVGjHqOiMZX+TIKRF8kiq44w1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nNyf7I8V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.15
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05246606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 15:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05246606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nNyf7I8V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGKCaO++fGSk9QgkYhAXylQTtiq0C7HeSwduPy/A3/YFMQiQN9U4sDWzqeMtMBf63PdB2l+ALqET7t43WLZyRmoN0kdRAZ2yukGMcLjjW36UlLFQUqHuD2HF2s4poP1OD5WYR/8f3gcaE2Ftjq1pAffNbjZUCwSBmleAonRdody2Cw12NabNLtiVm4ebuaOsUPR8xF6PYaUGHvY9BjoO3ekK1gKqS+sfdCSV7HwpjyI98w68slV5J0pa9R4Cfi3B2MkqY+8N1A58rwieV2LF5q5CVXDGWXCLcqrKG8SX0wT1mgRVMAl2uL1wdAwXODkuyzxI4e3awn0sqX9L1SLg3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9r4HgWteu0o56+pwnEDriaVfIGbR5g+1s7mw9tabTM=;
 b=iSdELvJJyR94xfs0ZvFkdI9hr+Hxizty/UfN4Z1pBiMQXvPWY4F8YrjJ7eN/EvN3vyd+e0Gj+muD/Ghrnl3Zf9msWIaZ5ah6wt8BjLMRIf3/tCuhAxBKlTjxybzUfeOL0S934w9d1mTd94OfAgTW9X+FDpP/gDPoZzqtHYcNL2JBiqO7IwbQLaMiIJe+2Opi8KO/+X2ELPXv/KodfKaIxX/r00PrMxtfDzXEg3L+xZsPn5kQmoi65LC1mONr/fUhsmCTqsQ0AhGEoz3GebCnBS7g6G3a+Fw8Y4NtBHH2W7exyfICnWHDLCG/fuTnKZ4kZuno4HK78urKy6UqnftYOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9r4HgWteu0o56+pwnEDriaVfIGbR5g+1s7mw9tabTM=;
 b=nNyf7I8V8TXrV+2xZHt6nFEuR5rUuwOkR7AFE89UjmVd+5ikIpNC+gerDSCZ/odcfuSVnfrhgvEqKkf5QZrPAA5N5LVcZeVFEDst18aaruqvJBWe6vHdfh1Qh6vsdB1AJD8NquzuVFs5kVWuV7XqUPEGw0N2dJXkjgbqJxk2rSA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB347031.namprd12.prod.outlook.com (2603:10b6:408:417::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 15:14:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 15:14:09 +0000
Message-ID: <d54605a2-21c9-495f-a3d6-0af2738d5000@amd.com>
Date: Thu, 5 Nov 2026 16:14:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dma-buf/sw_sync: Avoid taking references to released
 fences
To: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, syzkaller-bugs@googlegroups.com,
 syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
References: <CADZg-m0hnuZ+KpqkUgwZvkhjUdN24syvc8qxuR+oZC5rkJHSNw@mail.gmail.com>
 <CADZg-m3HZ8qpXdRSQ5RhjTYQ+3Lf6dbu=radMm_m8zDRMB8GbQ@mail.gmail.com>
 <CADZg-m2pL2rY7ptSSD8OXWGPrAJx9Yn7N25HNYGonWNzMKysDw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADZg-m2pL2rY7ptSSD8OXWGPrAJx9Yn7N25HNYGonWNzMKysDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB347031:EE_
X-MS-Office365-Filtering-Correlation-Id: ef47fa57-5376-42fa-0567-08df3b4f70c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|10067099003|4143699003|11063799006|261026140227099003|261026121527099003|261102123227099003|261028144727099003|261022105027099003|56012099006|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	BKzRJtHYyJC/dDK1MCzhalu5frUN7FrVltLe3ef/lRK4iKQR+rcqnj7rHtb4u6K4/4LrUqOlBTrtJk5o6ggKYYcQImYSSjHOSo4PVC4qlwrx6XvSSaw2z6mNt+sti3HQl5u6emfUM2DcvpeUZMhczJp0mVlrjATp26G9QKGhcEdBLqqQi5jS7Ak5CNIMze2w4zgifUyqkLu8h+DXAvlLxvPJqVPbhOBrkIhBoYMtxjNEqYZPL5Z6JSdAkacXdfYHMX9P05fFCUUs3ynIoHZBv6tFWUZC3FJixdo4tp2S6tF12WRwBVj+e4nv3bkOYA91XtQlh87H9TaSIRxOzmyZ9Ij3VyyXq2RLMQJEjdTGUHb1pA6dHly52lWZQOjmKom3xr4xftolbLAdsKeVzRuEt0XxgSaAt/NkWNoxH4NOhqlXr65IyvpguE/qmaLTkBEs6mpp+/Yj8zK8Mu7P4XeYb1sxOz6qRPeS0bHb6rtfYQ2EZLt3I1p3JAjwAC7eQnPw91mPjuaHmSVm5SfjPlFlIsT87ZMvvVyMIthvCMQcK01TrRTKH0kf7XKQshWahhcsWUPuGTPUE8CwK6/qcrpzI1yIeTcAiq+oqdhymEoSTek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(261022105027099003)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWZTWHBZWlk5Y0l1eFdxNStBdUxvQUNmUWtZNHZrajJtVktoczhXQlgyWnVK?=
 =?utf-8?B?VkkyZS9KVytnVGE5ZHhUOUxEeDFHTG9PeGI0QzVFeFhpUUIycG8rMVRKK0xZ?=
 =?utf-8?B?YXUwTkJjbmtKaWJFOTRXZFl2Q045encwREgxNVZkdlNsQ2Nmc0gybk1sTitT?=
 =?utf-8?B?ZHFQY05kTzNsYWUzak9CWDRzYktJN2NJNVMxNVBOSWppRGkreWVrU2FubW50?=
 =?utf-8?B?R2txTUV6aWZFYzlBM21yRUxkeDMwTXRwbFpVTXB1OW8wTVZONnJ3Q1d0clJM?=
 =?utf-8?B?N0JjUzZLMkN6dFY2THZsYW9ETXpUeFQyQWNiUzF4MjcvcVBvZ3k5aGxrMWdU?=
 =?utf-8?B?QmhxTlFPMlJ2T0ZvTGt2TVpSZko4emVIaXZXZU13akhnZmQ2QUNEUjdITzQy?=
 =?utf-8?B?OC9aMkdibDNPemNGQlA3OUF3bWJKdVJWSlF4c2RvSWk5cnE2ellxazdaL0xn?=
 =?utf-8?B?OE0vMVRLQnZmKzF4YmVzVm54cDR4VWJaUHFmaUVidW1ybHY4RlZHeDdRYjF0?=
 =?utf-8?B?YUdqY0ViYlozZnN5Vzh3endRVWV4NEh1UWJlaG5mV2NteC82eDBqOFNnQ2Ur?=
 =?utf-8?B?OU5nRm5QMGJwSnRRTWFoeTNHUFloaXVPVml6dlpldkx1ZlUvbU96T3EyZXk4?=
 =?utf-8?B?UkZxd1hjTXIxMmF6WHQwTktSUWVGS0tubDV0UGRqYW12dklpVlAvRDBwYVpK?=
 =?utf-8?B?ZXIvK0tNNXYyRVNzSWlubmZleDVrSEg1eGxZNytEWUFSYTJ6OU10TGdlczAx?=
 =?utf-8?B?ZlN0S2JtV0toU2NGSEpPYXBBYUhGN0M5RmYxNjdocG50dzdKVzFwOWZ4cnl2?=
 =?utf-8?B?Z0dVMmZ2UEk4d2VJL0h3cTlEMTRDTGpVbFdlWnlGZVY5VjYxY0dpUFFZaUQ4?=
 =?utf-8?B?Z0o3Tm5kVDF0dWl4cml4ZmdRMGM0b3dnNDNJalBET1ppK0pRdW1ab2c2dWpa?=
 =?utf-8?B?Mm5GTjNiUGF5UFhuajRYZmZqYnFiUE9KY1hmR0JOcUpjMHZiYjBFaEt5d3Vu?=
 =?utf-8?B?VDlPZlRVWHJkT2h2RU1sWEcxOTVTT3BDMFUzRkV1K1RlckRuWTFuWlpBOVh0?=
 =?utf-8?B?aFJWZmFVMlZSTmlFR3E2WkxjUFlQK3d2VmpDR3gwTGxKNXpZajExdnFPNEZO?=
 =?utf-8?B?UVJGV2VXTEpqZUkybndyUUh5UG9hNXRNVmp5eTYzTXdDaHhFRTdDaUM1bjIw?=
 =?utf-8?B?QTgydVdQSUlYMlZ5Vk0rOVdzZDU2ZWJwaUtodkcxa2RObi9DYmJNZTNUWG5O?=
 =?utf-8?B?WW1UME1oSDRTbzhXNmhVODc0MEVweHZHRlIwVExycDdiTjJFSHRLSE5GY3FQ?=
 =?utf-8?B?bHRIVXZrcXhNNWhFeUdNUEdBWVdGVHBuV1ZKMWludGxnS3dNRHpVOFpyR0lC?=
 =?utf-8?B?dlQ1ams0M1VUZkxhaEZnVGsvTmI2ek1sV3FqZ1BUMGwyQ3JPOHhBSzBxb0Q3?=
 =?utf-8?B?VS9oV0E2bWhSVGU2Mjc2Q3VHWms1TUpYdFRTOGcvVjFIUGNCRWFOcm01eDJ5?=
 =?utf-8?B?TW5yM0tDY2pKQjdiT2M4MDNJdThKV050cVlWTGF4OTZTRFoxa1UzbXB1NVA1?=
 =?utf-8?B?Q2NoU1NnOWhNRDZoeThXRExSRFRzMUd1dlRnbmZSeDNZSEo4K1B5Y2p2WEZ4?=
 =?utf-8?B?QVN0S3VxUmswSUpTVW4yUmlqY05yMXBtOXdMelB5RXk3MWVRNnZrQzJjK2pF?=
 =?utf-8?B?WnEwMmJtaGpmNzNxZU9IYkp1T1duVDFZbm92eHUwclRZejNWMVFaVkM1V1A2?=
 =?utf-8?B?SzlMRDdwTlJicHNkRkhHL1VINkd1WisxZEdPTUt2blVJaDhDVjg2UGt6enI4?=
 =?utf-8?B?bnhtdnY5YytDV1VKOWVvcmJqOHR3Y0dPNXJSSSthemcraEFBSmx3K1czQUt1?=
 =?utf-8?B?MXlDaW8wME9neExNYmVMM3RISk9VZWtpYVlkandvbWY5VTZTSXh1NWprN3Yy?=
 =?utf-8?B?T05WWVVQSFFmRlN3KzcrWHcwTnhXcW0yUFcwM1VNWUU4SnpZUmI1K0pnZi9z?=
 =?utf-8?B?OXVaMVhYOUVlMFFMZzZManNCeEd3UGl3KzFUM1VlTXFzMW9makVFYnFUZFRL?=
 =?utf-8?B?d0d2a2tCS2ZNSnVLTVAwamRmUUJLVy90Snp4TFU0aXFIdmFBS3dwNEc2TGMv?=
 =?utf-8?B?aTcvcldCUFU1UC9yQW5RNTJyRm9XZHlXOWlBa3ZDNFozdUIrNnNId3JSUlgr?=
 =?utf-8?B?SVgrWnRSUkF6R2I3ajhtZXJheml1SzQ5aklueFc3M2kzSHhoMEFuNmpraThQ?=
 =?utf-8?B?LzhKUkVNMXZuMkFpK3dtbHF1OGF4SjFwdkx2cUZCZFU3T1labGpzQ09yVUxj?=
 =?utf-8?Q?j8QwzsIhgibK7ssi4s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef47fa57-5376-42fa-0567-08df3b4f70c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 15:14:09.1614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eT0Rzp34V1z7ODHMeevDaa2RxEWrqnTY1IzcH3Xd2ikCFJbqXbMX822oSALyZgj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB347031

On 11/5/26 15:26, Kirtikumar Anandrao Ramchandani wrote:
> The last dma_fence_put() can drop a sync point's reference count to zero
> before timeline_fence_release() acquires the timeline lock. If
> sync_timeline_signal() takes the lock in that window, dma_fence_get()
> attempts to increment a zero reference count.
> 
> Use dma_fence_get_rcu() for the temporary signaling reference and skip a
> point whose reference count has reached zero. The timeline lock serializes
> with timeline_fence_release(), keeping the point allocated while its
> reference count is examined. The release callback removes the point from
> the list and tree after acquiring the lock.
> 
> For a live point, retain the temporary reference until after dropping the
> lock, avoiding recursive locking through signaling callbacks.
> 
> Reported-by: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=cba1a1f459230395a076
> Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

I will push this to drm-misc-next soon.

Thanks,
Christian.

> ---
> Changes in v4:
> - Document why the timeline lock makes the conditional reference
>   acquisition safe without an RCU read-side critical section.
> - Leave list and rb-tree removal to timeline_fence_release().
> - Drop the Fixes tag because SW_SYNC fixes are not intended for stable.
> 
> Changes in v3:
> - Unlink zero-reference points from both indexes while holding the
>   timeline lock.
> 
>  drivers/dma-buf/sw_sync.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 8df20b021..8aa3ed777 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -221,7 +221,12 @@ static void sync_timeline_signal(struct
> sync_timeline *obj, unsigned int inc)
>                 if (!timeline_fence_signaled(&pt->base))
>                         break;
> 
> -               dma_fence_get(&pt->base);
> +               /*
> +                * The timeline lock prevents timeline_fence_release() from
> +                * removing and freeing pt while its reference count is examined.
> +                */
> +               if (!dma_fence_get_rcu(&pt->base))
> +                       continue;
> 
>                 list_move_tail(&pt->link, &signalled);
>                 rb_erase(&pt->node, &obj->pt_tree);
> 
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d

