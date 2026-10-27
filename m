Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793119584;
	b=1NXmMg++oRvkr5gLg1252E6DWGKOpaeIjbjJoPkpqQO2ccDBITQTovenyt4fibBExX/g
	 mRRhpSZ4EFrUzOoVAnMA0/HB/jeru27ECnTI/SDi+sVj3vzZ5vdMg+r2d2HDmK9jmnnEw
	 hIKbHtQq/qiv1CwGv47wRb32zJXHNmBmfUu6vkalexFOT7vgvwWU9BGpnimkEeUBJDJdY
	 BNSE2JtGXazM58sHEbzJ1UOL83Sr4Rc4IQ7hlv2tWcrE2JnwkQS9IlWO1MqtUmPG3Z/vJ
	 IxC1uPkN0cji3qSFv7FEPWTOHrP69VULIuyVdr510LXynU0425gd7Alo3eT2I5hS2bQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119584;
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
	bh=OHSlqZqo46L9vrovILxn8NMeCKrLZCM3Xql+8iqpkj0=;
	b=W8uw4kwyGyy9QPMT3FfWl1tC/RywA4fvnrYZVsmWuKHIA/bpl9XVZJFPk8TGc9Ruasy/
	 9bOJTgJGBvVPpIWeqcrf8GCIe5FdSyTlSQVms4miDweqzTr94mFAobPL6aQP9dEmgKqNm
	 ONTAwvaoZFrDbQPcNZB02ExrwTQy+a1ofaEXQS3PZ+wtT+5dRSdtc65fhswnXKzkL75QN
	 3uEk4CChGfSuaVLRBze8OnWXOWsXJhp1dFKQqFouapMMmjy769t0hiCKKQKBvRSu+CGed
	 KUl9PGdSmgyLhTuGuFQvpftGtC23CzVYj7aT2sNRxCfcP1wj1X3yyx4xbVWfqUs3VPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	dkim=pass header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=UJ6x+nGz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.1
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013001.outbound.protection.outlook.com [40.107.162.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE40606A320
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAE40606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=UJ6x+nGz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGJPT2v8qsAneqojCxNTAM50v7f5IwZ3n25GZYxPhtq/n7D2SY82Wl6xRnh8f2qbh07yzhpPVH31V5HVeQbbH6dSEOKwb194LV31Tj5MX2XKpEju1M/UmyRJeNUYdOi0pjvamUnNUxVQPRe7PCIIf6ACLYz/gGa15nOaUeOK1pTlIYoXSV+JZ0wxE73mmvnMGSibDZr0IOtkREtqWVNtQXMANFnPG2TU0+uCef6sLAXnc8KtKHafQwbPg7g/8jlM0AfumUAGI5wwFWisIVRiZq9BBhLyUaZvrAsVIiUw+9zlUtQ3rYjkzIai03ckawC/U/a6cJS3VnZEAMCrvc/51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHSlqZqo46L9vrovILxn8NMeCKrLZCM3Xql+8iqpkj0=;
 b=AAyUab6wr+PkZSoBtPZwjKrMhcZjuGf/HBXY5otuGe6yiTMO4wDsrt4++B/WT/WRzYlf7qIwWAL1i9HBZyntPayGqAs3gxuvhvKxvq74taqaQexJdbbwIrUvtQ/F4sCyxCIXyljpSpLEqUfflkXUy58caR/NxJPPVSJSsqqFWspK1B4iT0SRXiA2f5yfjpBzQyxMw2unMb1tX7WWA70niIR97DTY/IDcOIO5IOIjiA8vtonIWAeN8VkXLXG9dz5RatnoVveaGgWO7L9ohWZqDgap5bBU1tNalTH80D5KkEeJagjY+fwzi16eYOPZ9RMd2qPffWdXsZNO05Mv4aSqdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHSlqZqo46L9vrovILxn8NMeCKrLZCM3Xql+8iqpkj0=;
 b=UJ6x+nGzoE2BeUbELRUQCNOM+QNsjVjIFpiSgfJJ5FEq/ZEaMSliXeDEWXx30GEPvxRuinQOEnYpCORpkLIIOXf8t/nsiJS8AgluWZpD8uhG9zX7iZ+azpAa4jiu2ZclSJonvezfni1iTHAwAJVl8DLxLXYq+C6uItTdrMEuAMk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by PAXPR04MB9022.eurprd04.prod.outlook.com (2603:10a6:102:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:46:17 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 16:46:17 +0000
Message-ID: <ab6082ba-176b-4301-bfda-13a4a27f2024@cherry.de>
Date: Tue, 27 Oct 2026 17:46:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] media: i2c: ov5675: Fix type of xvclk_rate
To: Heiko Stuebner <heiko@sntech.de>, sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20261026101646.2450051-1-heiko@sntech.de>
 <20261026101646.2450051-2-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261026101646.2450051-2-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|PAXPR04MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6dd85d-5d01-46e9-de47-08df3449d1eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|261026121527099003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	CZXz48P34oCSaKRjYQs5BLWVe6GAyRVh8KYXnrsW0ra5LcFMm3pAb44LG7NX1cLCe55i7SQWpPTEV1os9O9TvG5bR4nntJrGXCnkCopqXIoeo8QvDFLrJa2LFuyeTJ+J0j9oD/IH4V6MWp3NSBT0R7XxgHpLmB75UamFH6Cg3KMDtE0aON57KT6W8YyFFQl1U1c0YU0l9RCJSpRbBRIid8S8W098PvTbzLBvGqa/bf6KVE5cl/d3dcMEnWwuVtArTeaRxq5cUZocsdwBy33aODvxY8tn9uGXae+FKVKsaqAz+1wqYmYpukgj+yPnUewsATfpt7tp8M5RA7aoSpm2YKghri/p9HphtokUq/tP/o4BW+w/K2IhzOFpunvA8VK3UjHKHy+uZBAmjsNEWAM3Rdg10fPloUICn4eXvjHWYxiHAWBGAPFLVI6tdzn14XCQikQVwve2ex+tDJr+uPyd/FmlYeYEpxOvheCYCQexs/ixvQtP0cxEVkwyMzRZPY+ihAjj/4ORiOOXPMK6N7xbFioUQ8x1UK5rH0H9HT8mheYh/ezh6FIaz4OCZG5f24FaJ8lKHEmOSfdTrpS5iVOKMqa6bOocRFDya8i0Mac04NHASdOjFr7VOLqLnp018BrvZvjBQaNOvvV2nThdk/PBOG1gybg00voDP/Oebs6hgZs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(261026121527099003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3FGSlRxZjdOMU11bTFLUENoTWZpWlh1cElrazZjZE0ydE9SelR4Ly9ZeUNW?=
 =?utf-8?B?NFZuaFdwL0J5a0IxWDd2Q3RNQ0JtUnh3WTlSOHViK0dvdFNFdTF0WW5LdlF5?=
 =?utf-8?B?cDU1Z2JLcU9vUEVSVk5Rd1AvS01QL0dvYjVxc1VpTVVSMWpPd0d0ODJMeTJX?=
 =?utf-8?B?U3BwaWJIMGZ2MDR3Vms0ZUcrV01HVzZSQW1iRFlRRnBVWmNpQk5xbU83SGo1?=
 =?utf-8?B?Tk9vRmJyNUQya1E2K3pkbGVIOStOaU9hWlRXN3hJWjQ0Q05vQkZRcWhhdkZQ?=
 =?utf-8?B?cktldUx1Y1hkenZHTkdsU0FOTkpLYmxhNFFLT0VMems0dTNOaDFOdmhDdHJN?=
 =?utf-8?B?MTlSZnVSaWJSQ05ZalVERTYzbythMlM1MDV4SjF2eUJ3cGxHbWNFTjlUTDht?=
 =?utf-8?B?SEJiMFlYZ0JXaGZsbktWSzR5cG5QckJIM2xlblZENTc5TW10V3hiYXNxc0hQ?=
 =?utf-8?B?K2xkV29nTEEvSUxoNmlSN1UyL1pUektpZURYSXdycDgwVy9FbVpLZ3FzbmNn?=
 =?utf-8?B?MjlrVHhOSTRyeExXdkN0UUYvYkFlQlM1ZlpOSjRJVVkzc1BiKzE3empOMkVu?=
 =?utf-8?B?Q1NkcUJTOERJN2w2TmtDWHU5OThtaUJsKytqYnhuUkc1TTFyWGVDR3pVNjRZ?=
 =?utf-8?B?V2RPS2k1VWZMK2NBNEpPb25iMENkZDhMbEFFUnZPT0NUMUhyYStGcCsvdHBW?=
 =?utf-8?B?RWNkTDdoVUxQVjVVU2xwTlNIZ0NsUGxEWjFXTXpjSThzcTlNUXIyUzJtcFFo?=
 =?utf-8?B?ZVlid3gwdGVjcVpBMGY2VkZRbHF1bUN3aHNJTklaMG8vY1VZYkZyOTJYdVY5?=
 =?utf-8?B?dVB4dTVDdXhqd3hQMjU0cXVCc1kyN1NrenZ5N0V4b1ltSkZUenZjaE9zckRa?=
 =?utf-8?B?N0hCbitFcGdLMDFXaGpRRW9rbE9lM2VjZEpUS296U29ZODIyQ3BTOUd5aDVE?=
 =?utf-8?B?dTVSVkJOVzRUVk41bSs0S05ObkZZRnR5UVlkUnllQ2k5dHZWZ1RNTGhvVGt0?=
 =?utf-8?B?QjlRM0M2WEZMTVB3S3hKTUdJS041dVY5bTlmY0dObE1ldWZTRElsRXBZeXJK?=
 =?utf-8?B?aUthOXNZVEdJRTFJNUhlWlBhdGVMeGZHMzhUbXM2ZHR1M3lzb3FHSE0ySWVs?=
 =?utf-8?B?K0U4eVB5TTdIR2RGdjFUZVd6b0Z1cTYzWWV0T2JQTG9xL0JNTDE5bVI3VDFS?=
 =?utf-8?B?Zk43U1ZyRU4zWmo1MDUyY0JWTjhJOTVQUU1BU3NQbEdwb0MvQWI0UmFkNmMv?=
 =?utf-8?B?eUIrNlEvQk9YSUFBYmhIRHkxdlQrRkZJSDJzUmVkZzc3VGMraUgzbkdwWHhD?=
 =?utf-8?B?VjN5Q0RaMUcwRU05UXZVeXQ1YVAycHBzUGgrZy9jbDFRWENsVGRzQnFLVEMr?=
 =?utf-8?B?Zkd4WlhGNnFjWWNkVWlvZ3YrQkNONlZub2VkNWJwMUYxaDJ3MHlOZmlNQ3lr?=
 =?utf-8?B?NlFPbDdRYmozMFB1ZW9Nc25zTXowNjdCMEpGaHFiR01LODREL29SdHFCOXFl?=
 =?utf-8?B?dU5JL1J1eTVVR3djamlBODhmZDdsV1VuejgyQ0lOaFczdG5wZXpISVBzSzZE?=
 =?utf-8?B?TEZ4UzZhSHgrT1cvRE5kQUVJeXczN0VsYUszOEpHL0RxVHhWQ21wcEowT1o3?=
 =?utf-8?B?elBiZXFROW0rZDJoUHV5QStEblB1TVRLUFcwdVRxWjAvQnNaWHduV050WnVE?=
 =?utf-8?B?MUp5eGdNWDVRbU0zZXA4N3hhWFF3OFpIVkhSTTMzckFzTmVLMUdhZGlOckUy?=
 =?utf-8?B?UkdNQ3N0czlqL3hWQ2lVOVBnUlNaYlNwYzNCQWNKeDdDY0JqbURVRXdkczFi?=
 =?utf-8?B?Q21zcEl4eVFpVEE1SCtGTXkra1JEV2NKR2VITzhXNE5TNjRkWlFpSmlyaDVi?=
 =?utf-8?B?NXc1WTRsTFdwTnh6QWRjTEdQK1lJSWJlaGRlRnZ1ZDlabkc2dVdWUG1WOE94?=
 =?utf-8?B?clQwTi9sTFVyRnJQOEN0SklocEJxb3Y3a1g1UU5XRUMydUZSLy9rWlhoOCtY?=
 =?utf-8?B?c1VOTzNXeEZMTjdTbFAwT1ZFVUVNM2hwY3lBb3dJL1lQOEpSemNQTSswT3B1?=
 =?utf-8?B?L3IvSlRwTTg3MElPc0MwdFJUWkd2Ti9EMUh0cGRTR2pRRGZjWEpMd0h3cXcv?=
 =?utf-8?B?RW90QndlK3BveUxDQU5TeUJOdTVvM1VlUEpaZlhrM0szdElpbW40Q3M3dUlK?=
 =?utf-8?B?KzZJeTJWVjc2VVVJUG4rbml1QmVFQ1NVVjY2K1I4aGRnTytpQWVUU0FRM3Nn?=
 =?utf-8?B?VFJ2RnlOc3prSHlobTdrK0d1RG4xT3Uvdk1nZWwwYkd4VUlhTWhLVFVGanhX?=
 =?utf-8?B?UkREVzVrOFUzU1Y4L1lxZXpiQTg4WWtMdWdpc3BsNk5NQTJxaHhrdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6dd85d-5d01-46e9-de47-08df3449d1eb
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:46:17.0408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w86qd6QtLi9dTNIV1S6kmbq/H3oEKWbvL2e1l9O5egAK8cd3Y819cFWy8XVzpTt1ZYyqlQWQnzaJTjcBQLhALmBMC5yC65F19K+KZyh2O2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9022

Hi Heiko,

On 10/26/26 11:16 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> clk_get_rate returns an unsigned long, so don't be creative by using
> a different type in the driver.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
