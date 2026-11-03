Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716140;
	b=4ZI10BRGhkqAlm7Z6Qc4RUW0N1hfXmq+864bkpdD8U25+pJxBgWKmbhrhH16QmpwsamT
	 b1BSFA1XDlv6tl2b4udYkLHy3WcL3Dm9B/BjHdiVeV6FVKTp0QO6Po3pn4F3q5rcdT12O
	 +3V2Ed523eNiddjck3261bAHagF+kPW1X6zCDoNJvK6gt5bX45up768C7n4Tkyl/Iy9sk
	 bjvSRupGnEnqxBPg43vyAO3bxFcb6Y6CZuOroc+vnYrwG1+ijoZssFgnngmFSYw+mp2ED
	 xSMrbeMFZwGPwyGJ2gNDGXoC+clFghKnYqGvSKuHa8T8xi16LJkKVsi6qoCtXiD562g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716140;
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
	bh=yjYWp03nmDNyr/Ev8uafsPlTCtY7Y8v88e112MbEFHQ=;
	b=zGDtPvMFo/ESTvXilyAlVN4V5nMJ8abmYr8CnbJZ3qn5dIjaOh2HSo+gBcj44kjY+uWV
	 Aj31ZdUXzpf3uwmiZyRx/DJWxL+Uj3OW5j4PNL60N00qzE+RO2AAvqv+SGO6pbMOP/m2F
	 QYYwuYTbrapv8iJLXwjdXSOCYKiV7viVSL0nHLn8lSxS4GyyNtgrhBRFt/Joi4dt/0KSM
	 BOC0XbB/3d7gZ2N3/rnKdbbHeKd3TNphiC90PzQDe+OZ0wn8DEU8OLQt5erRnDaNv+rJ7
	 jtp2uyLWTtKhSO748q7ED35iMX9nZ3/nQRyuNfIm1ugXwygk2Jn12qCKCAq1j25+8qQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherry.de;
	spf=pass smtp.mailfrom=cherry.de;
	dkim=pass header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=d4y2SrwB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.58
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAECB606A324
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 14:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAECB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=d4y2SrwB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpZZRjAw8sSdAfeiLyg5O17T49ZPo4kn01uTJoTJhhWiy82ohkZdH+Zh8TEjp9cSdYEIUfoUjgkHqdIoEe/XULnKqxGD8oyEBuvBSsS5sVGqIRNXZuc8jpKiSQKnGuf7qZfy9KBwtYzkWC9+5gvclD784XN8b3LpDxOK6Idsek5eC7bMPUp0uK/bTx0D8cUZs8ZyGVRGHpmCwn6KdGiqtIOt7cXpt4BOC7ZRRReD2LXWp/JMJxGan3EKTw3nWYES+vMmcsDV3mwheqhYgWQg8xseXTULtV7hVHfiDpLp1p8KIX29ZlvD8NF4SgrIpuwJFnrV83YH8k+sjEEzx0j9MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjYWp03nmDNyr/Ev8uafsPlTCtY7Y8v88e112MbEFHQ=;
 b=LXhvWbLYexJGbIZHhTxCez+Rv9Ig9T1tZH/J5//8isPptcm8M1gQNKjssy7+ivNfiC7EKoPLov12+ntflOOnlp5ZYVIXWbP7uc6yxlZ/uc8ABRnGpFafyQXECdZhlyVJyCg5Y7CjNXQiWsQA9SbPMUfX9ioOKd+FMqT+T5b8Jg2xe9nxN0Sav8ZT2Z95qFzRNGXDT4CBOeFqKAxchsJ6hqnBVv6K48LqfjfXIjAx8oD+ohzL33ZOID5/S4vQYaaxKd3/HVjwS9GuCqmhzbnme10sqCgMZanF/ClmK4AJyOs+PBZn9JmRbx8bQRktWVh5dThGdRBDcmbCLnLzLd8+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjYWp03nmDNyr/Ev8uafsPlTCtY7Y8v88e112MbEFHQ=;
 b=d4y2SrwByTWuWyWBMd6cdh1iQT9/4TwOizuPgQwXTjKVp6pIus15tIEcflcbvIWbZzI500ubWgKu/J3fL4shaKcpU4OcQuryT7ZWNuwlojbfLi40a3ZVdoID+w6tyV10MuVRwFPvp7/8GIF/Wvu1T+MNwutHyK4k1zVPLwRoUys=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by BESPR04MB12561.eurprd04.prod.outlook.com (2603:10a6:b10:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 14:28:54 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 14:28:54 +0000
Message-ID: <d098affc-0964-471e-af9e-958d2340a6b2@cherry.de>
Date: Tue, 3 Nov 2026 15:28:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] media: i2c: ov5675: Handle PLLs using actual register
 descriptions
To: Heiko Stuebner <heiko@sntech.de>, sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20261026101646.2450051-1-heiko@sntech.de>
 <20261026101646.2450051-5-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261026101646.2450051-5-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0048.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::37) To PA3PR04MB11153.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|BESPR04MB12561:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f51051e-a472-42bc-7d51-08df39b6c999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|10067099003|22082099003|261102123227099003|18002099003|3023799007|56012099006|5023799004|4143699003|261022105027099003|261021123027099003|261026140227099003|11063799006|261026121527099003|261022075727099003|261009223027099003|261028144727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	gpuc4rvLvanMUEXrv6f3J+X1obqDr3LBFMVbQbEY2rqR+7GKfH/SWNmzq9wHsSl21pgG7f5Tf/xfYsUufThIXH8ZLlus/52MBh6kvPuB4hCmeuj6nduWfwE7zxwzuE+boMN8/dJa7Ndx8CsXK9o5mlvzJEJXdbaNs+kHcaSCemahqCAdEP+yE7QtRFi4jtN+X6r9mrgcjnkgdeUaIOlfLucUgehR7Jq5VcrejZvkoqdTSLTn27Qe4jQpe/wJkEnmZ6aJnE9+Lm0/aAQZR93GT1S9yEwLpw+SbZHiOjpxKU1v9aLJvVRD9cpKhUqnUYTta3xv09GKRGrdTBRejZH94zct8YW8yh4moIEbYkbxtu1IyOJkRUJULGv2YrwnQcX8113rY2qDJ/9/Nx478esc6yuqq0NmPxUug7LzTaBNR1SAQKoG9IXrwUxNFA1KHFg4Quuch0VfDo4L2YB7Bw7rpi0OgWoNow2WYFWWXssILBRuUL3uPTIy5yUlPE1B3we557FtB0ux49lM49JwG+oR8Awtt0PgwMqkmHn2zB2lW0bFN7YZWr8cI0QlHPMPXNzF/Q4mWJCn32Xs859JfpfIwcGASJzX/pnsGCpSXH27+nQG4jxCtzKQPI4nuoKpfVzxlWcsbuY/EtI4jd9vwnYMU2wuPIOQc0nWoE6fIKADSt8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(261102123227099003)(18002099003)(3023799007)(56012099006)(5023799004)(4143699003)(261022105027099003)(261021123027099003)(261026140227099003)(11063799006)(261026121527099003)(261022075727099003)(261009223027099003)(261028144727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckV2b0FJVDhYOWRVZHl1eS9keDNFMExJS3BWMFFOMEljQkNwRlczNFhHQk81?=
 =?utf-8?B?U3A5ZnJyNXFsSHpBM216M25LWVBpM0Q5bkZaZk5rUzBUa0lSZHFCV2djN2lX?=
 =?utf-8?B?Y0YyWGxHckphbEpXS0dvem5BMThaVE1Cck43aHNiUzEvR2x2cVpSODd6Wits?=
 =?utf-8?B?c3djY3VFVVlDeDJkZ3pKaEdxRVlCenBiRGhPVFFBdUI2eVZQbm9uRXV1UWhm?=
 =?utf-8?B?K2xoUnd3THI1LytVZXpRZ29kL2JscEFLVTZmRzRBMys5Y1U1bDJzOGdRUzBi?=
 =?utf-8?B?dlBJOG5xZG5kQUI3U2Q5VkRPdGtaQ3lCZnBZYy9kZDRMQ0lXWE1MQXg4b09P?=
 =?utf-8?B?SUNDWXJmN09Mc1ZrNHNvbmJlcndIeEZCWFRQajBNcEZsNy95VngvNXp5UnBU?=
 =?utf-8?B?T1l2a29TdXNCWjBmUzg0L2krSWliV0M2U2tZYVlQTjAyalJadWRiOUdVczNL?=
 =?utf-8?B?ZUplVWhGOExxNHhlMkNac1JFTDllaXYxVFZTbURLc21qSG1TQVAxdnUxYW1T?=
 =?utf-8?B?czFPVG5jWjhRSTJLUk14eDBnMUQ4V21VdDdVNWQxelcyR1FVOXNDeVBXYzlY?=
 =?utf-8?B?bFJDMkJLcGp4OGwwdlExaFRRRFR5NUdad2lUUi9WakVtMW4yem1LOGl6a0Jk?=
 =?utf-8?B?NTQ5ellxTzhzaTJ3S0VCbGd1VEtndXRvZXNZV3J0L1BBR0htUGpETHNrZHVt?=
 =?utf-8?B?US9UVGVRajlYZWwyRHJER0NmOGxGMk1SREgzZnM3bXJtZ1dJbUpnbm9CTVJG?=
 =?utf-8?B?RXdzQ2FiaUdaNGEzWDdqM2tvTHdSVHhQOVQxeEhDd3lWRXdXaVNzNjgzNUpi?=
 =?utf-8?B?djJ5ZDdFRmw0Y1Y0dTZPZ0FqZGtHMERNZ3dhNnJVdklHTlMveUF6aEdOKzUz?=
 =?utf-8?B?YjJ0VjNlcjFuanJNWHk4djRqQ3ZxZStxT3hQUllQdHF4YWRNZEcya2k4MDkr?=
 =?utf-8?B?V1ZCZk1LaTIvSnk5am1DZ0pjeXNLZ1VxSkg5OW5xTXpkZFBPQms0SGhEU095?=
 =?utf-8?B?U3diR1FocVNYTFIxWGNDM3hVVUpWSEQ0bmo1cThWUWRzZGtlM3hXQ3AwemNM?=
 =?utf-8?B?ZFdIWElQYnhEbTdJd0ZubDVFZFcvUWtURlJWY25SMEpjOFZvdU9GV2lCY1hs?=
 =?utf-8?B?VlRjclB2dzZKZ2lsTis1Rk5kR1dUUnQyc1Brd29EcDdEcHRtam9Bb21YL3hs?=
 =?utf-8?B?dkJuL2M2YjBvYmdZSkpscHpoZ1J3Nm5rWkhtTHNXa012MGRKZVBDQXR5NE5w?=
 =?utf-8?B?WGZpdHVOSXhLWTBsaXI5Y0xnL01YSlJMQ0pxa29OODdRREpydndWblQ2Ykpx?=
 =?utf-8?B?UWFuc1cyOFh3ZFY2WDgxeGNuellVVU82RW8yeFRkRERWK2RBbnRLb28waGtW?=
 =?utf-8?B?NVQzTWxVb2pZMStaSnd0UTJpajZCQW1WcUxMOWJwT1RmMDZ6NEZnTXpUVHFL?=
 =?utf-8?B?VitybU13WFRNc0U3VFgxQTZkV01OWDQ5UWFwaXVSVkRqSUFUS1drREFZUkZW?=
 =?utf-8?B?NytJdzVGQUdodk44dXJ3dlgycEtRQVgzR3k2VTgxZ3VDeUs0QXFmVG5TaUc2?=
 =?utf-8?B?Vkp1MlFQUlFvRFg4SFAzZCtIUEhqb0Jkdi80bWxwS1ZaWnVIUGlnczRqZmM3?=
 =?utf-8?B?UU1YRmkxamhtaEFSajdta1VDdnhhdXd6QkxQSlRla3VVK09CK2FKUmorTGpo?=
 =?utf-8?B?RnJUYUkyam1ycmwvK09nNnN2alBxakN6V1VLQjAvUkd4SUxhbUVyOXZOa2Ju?=
 =?utf-8?B?RDZidUowNm00d2NsUHd6bk5BQnQ4Q2tDNnVkNHBGV1hUR0lFTStrRXRxdGNV?=
 =?utf-8?B?cTkzUWQ0WDBjcEtmOWpjVjNMMWVDbU53RURWcGZuREZjaXhoWVdicTA2ZUd1?=
 =?utf-8?B?ck51T3E0OFVSWDNLRzdrSzMyTGJYbFdpQkx5S21sWmRTYnZzd1doSTZ4WnJm?=
 =?utf-8?B?M08xMkc0WXkwZVhUb3dOZ0VvN0NEV285K1lLUThZbHZrcE8yR3hRVXhyR0VG?=
 =?utf-8?B?aVhrQ1YwYWxqNU44S0s1YnQ2UGtFVklGWVU4VUVTaEt5WFFlNTRGRDNIanVu?=
 =?utf-8?B?VGNiK2tYUWJlYnVmRnduN2JhcnBXbE1PUDlxM2pmMS9RTEt0YXV5ek9zZ3dK?=
 =?utf-8?B?QlA0ODJjMkRDbTZFSE42WU9Ua3RxK1c4Q0g1Y0tBVVZJb1g1Sk9sWGhxU29M?=
 =?utf-8?B?RlpHQmRqVVpzbStvOHRFTG90cmxERi85TFdBRjlOdkt5QmhRMlljSnNHaERk?=
 =?utf-8?B?M25BVEpBTlUzS09oTXQ5YkZwZ0h6cExCOG9hRFpSMDUxNW4yTlZnNHZjaC9G?=
 =?utf-8?B?ZkpaWEJIMGdwZ05HaWxQeDhaYkdvRllIeHIwZW5FVFh1TzJYRUFkUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f51051e-a472-42bc-7d51-08df39b6c999
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:28:54.0238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKSAPl5+pFXGzchFFoleJpaTT3jru4Ik0RE9dAKRUurLgMy72MThVtKYltUWhd3ALyrBYbxjavK9o9iE1aVsu5PXcdQqaJiRiBPxeAkCIZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB12561

Hi Heiko,

On 10/26/26 11:16 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The datasheet actually describes the clock tree, so we can set PLL rates
> using actual code and not via an opaque register write list.
> 
> This allows the easily add additional rates for different input clocks
> in the future.
> 
> With the old hard values + the default values in the other registers,
> I was able to verify that the previous settings result in the correct
> 900MHz MIPI-PHY rate, 112MHz MIPI PCLK and 90MHz SCLK when following
> the clock diagram in the manual and re-calculating the rates from that.
> (Exact values are 902.4MHz, 112.8MHz, 91.2MHz, coming from the 19.2MHz)
> 
> A caveat is that the datasheet is not fully consistent between the
> graphical clock diagram and the register description - with the diagram
> showing another selector between both PLLs, not mentioned in the register
> description.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   drivers/media/i2c/ov5675.c | 287 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 271 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 1a0ee12912ca..d5d90d911e7f 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -34,6 +34,42 @@
>   #define OV5675_REG_SOFTWARE_RST		0x0103
>   #define OV5675_SOFTWARE_RST		BIT(0)
>   
> +#define OV5675_REG_PLL_CTRL0		0x300
> +#define OV5675_PLL1_PREDIV(v)		((v) & GENMASK(2, 0))
> +#define OV5675_REG_PLL_CTRL1		0x301
> +#define OV5675_PLL1_MUL_H(v)		(((v) & GENMASK(9, 8)) >> 8)
> +#define OV5675_REG_PLL_CTRL2		0x302
> +#define OV5675_PLL1_MUL_L(v)		((v) & GENMASK(7, 0))
> +
> +/* datasheet calls this sometimes MIPI_DIV[1:0], but mostly DIVPX[3:0] */
> +#define OV5675_REG_PLL_CTRL3		0x303
> +#define OV5675_PLL1_DIVPX(v)		(((v) - 1) & GENMASK(1, 0))
> +> +/* datasheet uses both [0] and [1:0] as range */
> +#define OV5675_REG_PLL_CTRL4		0x304
> +#define OV5675_PLL1_PIX_BITDIV(v)	((v - 4) & BIT(0))

issue: Missing parentheses around v.

> +#define OV5675_REG_PLL_CTRL5		0x305
> +#define OV5675_PLL1_SYS_BITDIV(v)	((v - 4) & BIT(0))

issue: Missing parentheses around v.
issue: wrong mask. datasheet says it's bit[1:0]. (and you don't explain 
if that's on purpose as with OV5675_PLL1_PIX_BITDIV or OV5675_PLL1_DIVPX).

> +
> +#define OV5675_REG_PLL_CTRL6		0x306

issue: there's not CTRL6, it's CTRL7 and it's at offset 0x307.

> +#define OV5675_PLL1_PREDIVP(v)		((v - 1) & BIT(0))

issue: Missing parentheses around v.

> +
> +#define OV5675_REG_PLL_CTRLB		0x30b
> +#define OV5675_PLL2_PREDIV(v)		((v) & GENMASK(2, 0))

issue: wrong mask. datasheet says it's bit[0].

> +#define OV5675_REG_PLL_CTRLC		0x30c
> +#define OV5675_PLL2_MUL_H(v)		(((v) & GENMASK(9, 8)) >> 8)
> +#define OV5675_REG_PLL_CTRLD		0x30d
> +#define OV5675_PLL2_MUL_L(v)		((v) & GENMASK(7, 0))
> +#define OV5675_REG_PLL_CTRLF		0x30f
> +#define OV5675_PLL2_SA1_DIV(v)		((v - 5) & GENMASK(1, 0))

issue: Missing parentheses around v.
issue: wrong mask. datasheet says it's bit[3:0].

> +#define OV5675_REG_PLL_CTRL12		0x312
> +#define OV5675_PLL2_PREDIVP_MASK	BIT(4)
> +#define OV5675_PLL2_PREDIVP(v)		((((v) - 1) << 4) & BIT(4))
> +
> +#define OV5675_REG_CLOCK_SEL		0x3020
> +#define OV5675_PCLK_SEL_MASK		BIT(3)
> +#define OV5675_PCLK_SEL(v)		((((v) - 1) << 3) & BIT(3))
> +

suggestion: Any chance I can convince you to use field_get and 
field_prep for all the above?

That should give us:

#define OV5675_PLL2_MUL_H(v)   field_get(GENMASK(9, 8), (v))
#define OV5675_PCLK_SEL(v)     field_prep(OV5675_PCLK_SEL_MASK, (v) - 1)

I believe? That should avoid forgetting to mask or shift stuff.

>   /* vertical-timings from sensor */
>   #define OV5675_REG_VTS			0x380e
>   #define OV5675_VTS_30FPS		0x07e4
> @@ -82,6 +118,74 @@
>   
>   #define to_ov5675(_sd)			container_of(_sd, struct ov5675, sd)
>   
> +/*
> + * PLL1 Clock Tree:
> + *
> + * +-< EXTCLK
> + * |
> + * +-+ pll_predivp (0x307 [0]), partly labelled prediv0

"special" value here too with 0=1 and 1=2.

> + *   |
> + *   +-+ pll_prediv (0x300 [2:0], special values:
> + *     |              0: 1, 1: 1.5, 2: 2, 3: 2.5, 4: 3, 5: 4, 6: 6, 7: 8)
> + *     +-+ pll_multiplier (0x301 [1:0], 0x302 [7:0])
> + *       |
> + *       +-+ pll_divpx (0x303 [3:0]), partly labelled mipi_div

special value here too because the divider is 1+the value stored in the 
register.

> + *       | |
> + *       | +-> PHY_SCLK
> + *       | |
> + *       | +-+ pll_pix_bitdiv (0x304 [0], special values: 0: 4, 1: 5)
> + *       |   |
> + *       |   +-+ pclk_div (0x3020 [3])

special value here too with 0=1, 1=2.

> + *       |     |
> + *       |     +-> PCLK
> + *       |
> + *       +-+ pll_sys_bitdiv (0x305 [0], special values: 0: 4, 1: 5)
> + */
> +
> +struct ov5675_pll1_config {
> +	unsigned int pll_predivp;
> +	unsigned int pll_prediv;
> +	unsigned int pll_multiplier;
> +	unsigned int pll_divpx;
> +	unsigned int pll_pix_bitdiv;
> +	unsigned int pll_sys_bitdiv;
> +	unsigned int pclk_div;
> +};
> +
> +/*
> + * PLL2 Clock Tree:
> + *
> + * +-< EXTCLK
> + * |
> + * +-+ pll_predivp (0x312 [4]), partly labelled prediv0
> + *   |
> + *   +-+ pll_prediv (0x30b [2:0], special values:
> + *     |              0: 1, 1: 1.5, 2: 2, 3: 2.5, 4: 3, 5: 4, 6: 6, 7: 8)
> + *     +-+ pll_mul (0x30c [1:0], 0x30d [7:0])
> + *       |
> + *       +-+ dac_div (0x312 [3:0])
> + *       | |
> + *       | +-> DAC_CLK
> + *       |
> + *       +-+ pll_sa1_div (0x30f [3:0])
> + *         |
> + *         + (pll graph specifies selector, not in register description)

sugesstion: Still mention it in any case, there's a mux between 
pll_sys_bitdiv and pll_sa1_div in register 0x3660 bit[4].

question: I'm curious now, what's the value of the mux? Wondering if we 
use PLL2 at all (the init sequence doesn't set it, and since it's not 
defined in the register description, we don't know its reset value either).

question: there's an additional divider after the mux before it becomes 
SCLK, in register 0x3106[3:2] (the register description specifies that 
as "sclk_sel" but the tree clock implies it's divider 1/2/4 so no clue 
what to make of it (the reset value according to the datasheet is 0b01). 
What about it?

> + *         |
> + *         +-> SCLK
> + */
> +
> +struct ov5675_pll2_config {
> +	unsigned int pll_predivp;
> +	unsigned int pll_prediv;
> +	unsigned int pll_multiplier;
> +	unsigned int pll_sa1_div;
> +};
> +
> +struct ov5675_pll_configs {
> +	const struct ov5675_pll1_config *pll1_config;
> +	const struct ov5675_pll2_config *pll2_config;
> +};
> +
>   static const char * const ov5675_supply_names[] = {
>   	"avdd",		/* Analog power */
>   	"dovdd",	/* Digital I/O power */
> @@ -105,7 +209,7 @@ struct ov5675_reg_list {
>   };
>   
>   struct ov5675_link_freq_config {
> -	const struct ov5675_reg_list reg_list;
> +	const struct ov5675_pll_configs **pll_configs;
>   };
>   
>   struct ov5675_mode {
> @@ -142,11 +246,31 @@ static const unsigned long supported_xvclk_rates[] = {
>   	[OV5675_XVCLK_19_2] = 19200000,
>   };
>   
> -static const struct ov5675_reg mipi_data_rate_900mbps[] = {
> -	{0x0300, 0x04},
> -	{0x0302, 0x8d},
> -	{0x0303, 0x00},
> -	{0x030d, 0x26},
> +/* PLL Targets: PHY_SCLK = 900 MHz, PCLK = 112.5 MHz, SCLK = 90 MHz */
> +static const struct ov5675_pll1_config ov5675_pll1_config_900mbps_19_2mhz = {
> +	.pll_predivp = 1,
> +	.pll_prediv = 4,
> +	.pll_multiplier = 141,
> +	.pll_divpx = 1,
> +	.pll_pix_bitdiv = 4,
> +	.pll_sys_bitdiv = 5,
> +	.pclk_div = 2,
> +};
> +
> +static const struct ov5675_pll2_config ov5675_pll2_config_900mbps_19_2mhz = {
> +	.pll_predivp = 1,
> +	.pll_prediv = 0,
> +	.pll_multiplier = 38,
> +	.pll_sa1_div = 8,
> +};
> +

praise: I very much like that the order of the declaration of members 
matches the order of the clock dividers and multipliers (top to bottom 
is left to right in the schematics), that makes things easier to follow, 
thanks for doing that!

> +static const struct ov5675_pll_configs ov5675_pll_configs_900mbps_19_2mhz = {
> +	.pll1_config = &ov5675_pll1_config_900mbps_19_2mhz,
> +	.pll2_config = &ov5675_pll2_config_900mbps_19_2mhz,
> +};
> +
> +static const struct ov5675_pll_configs *ov5675_pll_configs_900mbps[] = {
> +	[OV5675_XVCLK_19_2] = &ov5675_pll_configs_900mbps_19_2mhz,
>   };
>   

suggestion: I find it tiring to have to go through so many levels of 
indirection to get to the actual value. How about having them declared 
directly in ov5675_pll_configs_900mbps? They are anyway specific to the 
link frequency (requesting 900MHz PHY SCLK, I'm assuming this is linked 
to the requested link frequency?).

Something like:

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index e2434afd33fd1..b9026f58c70fc 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -182,8 +182,8 @@ struct ov5675_pll2_config {
  };

  struct ov5675_pll_configs {
-	const struct ov5675_pll1_config *pll1_config;
-	const struct ov5675_pll2_config *pll2_config;
+	const struct ov5675_pll1_config pll1_config;
+	const struct ov5675_pll2_config pll2_config;
  };

  static const char * const ov5675_supply_names[] = {
@@ -209,7 +209,7 @@ struct ov5675_reg_list {
  };

  struct ov5675_link_freq_config {
-	const struct ov5675_pll_configs **pll_configs;
+	const struct ov5675_pll_configs *pll_configs;
  };

  struct ov5675_mode {
@@ -249,53 +249,41 @@ static const unsigned long supported_xvclk_rates[] = {
  };

  /* PLL Targets: PHY_SCLK = 900 MHz, PCLK = 112.5 MHz, SCLK = 90 MHz */
-static const struct ov5675_pll1_config 
ov5675_pll1_config_900mbps_19_2mhz = {
-	.pll_predivp = 1,
-	.pll_prediv = 4,
-	.pll_multiplier = 141,
-	.pll_divpx = 1,
-	.pll_pix_bitdiv = 4,
-	.pll_sys_bitdiv = 5,
-	.pclk_div = 2,
-};
-
-static const struct ov5675_pll2_config 
ov5675_pll2_config_900mbps_19_2mhz = {
-	.pll_predivp = 1,
-	.pll_prediv = 0,
-	.pll_multiplier = 38,
-	.pll_sa1_div = 8,
-};
-
-static const struct ov5675_pll_configs 
ov5675_pll_configs_900mbps_19_2mhz = {
-	.pll1_config = &ov5675_pll1_config_900mbps_19_2mhz,
-	.pll2_config = &ov5675_pll2_config_900mbps_19_2mhz,
-};
-
-static const struct ov5675_pll1_config 
ov5675_pll1_config_900mbps_24_0mhz = {
-	.pll_predivp = 1,
-	.pll_prediv = 5,
-	.pll_multiplier = 150,
-	.pll_divpx = 1,
-	.pll_pix_bitdiv = 4,
-	.pll_sys_bitdiv = 5,
-	.pclk_div = 2,
-};
-
-static const struct ov5675_pll2_config 
ov5675_pll2_config_900mbps_24_0mhz = {
-	.pll_predivp = 1,
-	.pll_prediv = 0,
-	.pll_multiplier = 30,
-	.pll_sa1_div = 8,
-};
-
-static const struct ov5675_pll_configs 
ov5675_pll_configs_900mbps_24_0mhz = {
-	.pll1_config = &ov5675_pll1_config_900mbps_24_0mhz,
-	.pll2_config = &ov5675_pll2_config_900mbps_24_0mhz,
-};
-
-static const struct ov5675_pll_configs *ov5675_pll_configs_900mbps[] = {
-	[OV5675_XVCLK_19_2] = &ov5675_pll_configs_900mbps_19_2mhz,
-	[OV5675_XVCLK_24_0] = &ov5675_pll_configs_900mbps_24_0mhz,
+static const struct ov5675_pll_configs ov5675_pll_configs_900mbps[] = {
+	[OV5675_XVCLK_19_2] = {
+		.pll1_config = {
+			.pll_predivp = 1,
+			.pll_prediv = 4,
+			.pll_multiplier = 141,
+			.pll_divpx = 1,
+			.pll_pix_bitdiv = 4,
+			.pll_sys_bitdiv = 5,
+			.pclk_div = 2,
+		},
+		.pll2_config = {
+			.pll_predivp = 1,
+			.pll_prediv = 0,
+			.pll_multiplier = 38,
+			.pll_sa1_div = 8,
+		},
+	},
+	[OV5675_XVCLK_24_0] = {
+		.pll1_config = {
+			.pll_predivp = 1,
+			.pll_prediv = 5,
+			.pll_multiplier = 150,
+			.pll_divpx = 1,
+			.pll_pix_bitdiv = 4,
+			.pll_sys_bitdiv = 5,
+			.pclk_div = 2,
+		},
+		.pll2_config = {
+			.pll_predivp = 1,
+			.pll_prediv = 0,
+			.pll_multiplier = 30,
+			.pll_sa1_div = 8,
+		},
+	},
  };

  static const struct ov5675_reg mode_2592x1944_regs[] = {
@@ -1182,13 +1170,13 @@ static int ov5675_set_pll_rates(struct ov5675 
*ov5675,
  {
  	int ret;

-	ret = ov5675_set_pll1_rate(ov5675, configs->pll1_config);
+	ret = ov5675_set_pll1_rate(ov5675, &configs->pll1_config);
  	if (ret) {
  		dev_err(ov5675->dev, "failed to set PLL1 config\n");
  		return ret;
  	}

-	ret = ov5675_set_pll2_rate(ov5675, configs->pll2_config);
+	ret = ov5675_set_pll2_rate(ov5675, &configs->pll2_config);
  	if (ret) {
  		dev_err(ov5675->dev, "failed to set PLL2 config\n");
  		return ret;
@@ -1213,7 +1201,7 @@ static int ov5675_start_streaming(struct ov5675 
*ov5675)

  	link_freq_index = ov5675->cur_mode->link_freq_index;

-	pll_configs = 
link_freq_configs[link_freq_index].pll_configs[ov5675->pll_config_index];
+	pll_configs = 
&link_freq_configs[link_freq_index].pll_configs[ov5675->pll_config_index];
  	ret = ov5675_set_pll_rates(ov5675, pll_configs);
  	if (ret)
  		return ret;

Maybe? (only build tested).

>   static const struct ov5675_reg mode_2592x1944_regs[] = {
> @@ -469,10 +593,7 @@ static const s64 link_freq_menu_items[] = {
>   
>   static const struct ov5675_link_freq_config link_freq_configs[] = {
>   	[OV5675_LINK_FREQ_900MBPS] = {
> -		.reg_list = {
> -			.num_of_regs = ARRAY_SIZE(mipi_data_rate_900mbps),
> -			.regs = mipi_data_rate_900mbps,
> -		}
> +		.pll_configs = ov5675_pll_configs_900mbps,
>   	}
>   };
>   
> @@ -513,6 +634,7 @@ struct ov5675 {
>   	unsigned long xvclk_rate;
>   	struct gpio_desc *reset_gpio;
>   	struct regulator_bulk_data supplies[OV5675_NUM_SUPPLIES];
> +	int pll_config_index;
>   
>   	/* V4L2 Controls */
>   	struct v4l2_ctrl *link_freq;
> @@ -595,6 +717,22 @@ static int ov5675_write_reg(struct ov5675 *ov5675, u16 reg, u16 len, u32 val)
>   	return 0;
>   }
>   
> +static int ov5675_update_reg_bits(struct ov5675 *ov5675, u16 reg, u16 len,
> +				  u8 mask, u8 bits)

question: Why u8 when the read and write functions expect a u32?

> +{
> +	u32 val = 0;
> +	int ret;
> +
> +	ret = ov5675_read_reg(ov5675, reg, len, &val);
> +	if (ret)
> +		return ret;
> +
> +	val &= ~mask;
> +	val |= bits;

issue: Please mask bits as well otherwise we may overflow (you can take 
the cci_update_bits implementation as a reference).

> +
> +	return ov5675_write_reg(ov5675, reg, len, val);
> +}
> +

suggestion: FYI, there's cci_update_bits() now that is available for 
v4l2 device, c.f. 273f52f3cbec ("media: i2c: ov9282: Convert to CCI 
register access helpers") which should help you not have to reimplement 
yet another update_bits function. It's unrelated to adding support for a 
new clock frequency, so feel free to ignore this. Using that API, you 
could also simplify the handling of multi-register values (e.g. for 
OV5675_PLL[12]_MUL_[HL]) into a single cci_write() call.

>   static int ov5675_write_reg_list(struct ov5675 *ov5675,
>   				 const struct ov5675_reg_list *r_list)
>   {
> @@ -919,9 +1057,125 @@ static int ov5675_init_module(struct ov5675 *ov5675)
>   	return 0;
>   }
>   
> +static int ov5675_set_pll1_rate(struct ov5675 *ov5675,
> +				const struct ov5675_pll1_config *config)
> +{
> +	int ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL0,
> +			       OV5675_REG_VALUE_08BIT,
> +			       OV5675_PLL1_PREDIV(config->pll_prediv));

issue: incorrect logic. pll_prediv is an unsigned long member, and the 
macro simply removes one (1) from it, this definitely does not match 
what the datasheet says about the register values meaning 
1/1.5/2/2.5/3/4/6/8. Just define a constant for each value and set 
pll_prediv to that value? Please document this in the struct as well, so 
we know the value of that particular member shouldn't be used verbatim 
in the clock frequency computation.

> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL1,
> +			       OV5675_REG_VALUE_08BIT,
> +			       OV5675_PLL1_MUL_H(config->pll_multiplier));
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL2,
> +			       OV5675_REG_VALUE_08BIT,
> +			       OV5675_PLL1_MUL_L(config->pll_multiplier));
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL3,
> +			       OV5675_REG_VALUE_08BIT,
> +			       OV5675_PLL1_DIVPX(config->pll_divpx));
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL4,
> +			       OV5675_REG_VALUE_08BIT,
> +			       OV5675_PLL1_PIX_BITDIV(config->pll_pix_bitdiv));
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL5,
> +			       OV5675_REG_VALUE_08BIT,
> +			       OV5675_PLL1_SYS_BITDIV(config->pll_sys_bitdiv));
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRL6,
> +			       OV5675_REG_VALUE_08BIT,
> +			       OV5675_PLL1_PREDIVP(config->pll_predivp));
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_update_reg_bits(ov5675, OV5675_REG_CLOCK_SEL,
> +				     OV5675_REG_VALUE_08BIT,
> +				     OV5675_PCLK_SEL_MASK,
> +				     OV5675_PCLK_SEL(config->pclk_div));
> +	if (ret)
> +		return ret;
> +
> +	return 0;

nitpick: Last function call can be used directly as return to avoid the 
last four lines (applicable to other functions in this patch but won't 
repeat it).

> +}
> +
> +
> +static int ov5675_set_pll2_rate(struct ov5675 *ov5675,
> +				const struct ov5675_pll2_config *config)
> +{
> +	int ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRLB,
> +			       OV5675_REG_VALUE_08BIT,
> +			       OV5675_PLL2_PREDIV(config->pll_prediv));
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRLC,
> +			       OV5675_REG_VALUE_08BIT,
> +			       OV5675_PLL2_MUL_H(config->pll_multiplier));
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRLD,
> +			       OV5675_REG_VALUE_08BIT,
> +			       OV5675_PLL2_MUL_L(config->pll_multiplier));
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_PLL_CTRLF,
> +			       OV5675_REG_VALUE_08BIT,
> +			       OV5675_PLL2_SA1_DIV(config->pll_sa1_div));
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_update_reg_bits(ov5675, OV5675_REG_PLL_CTRL12,
> +				     OV5675_REG_VALUE_08BIT,
> +				     OV5675_PLL2_PREDIVP_MASK,
> +				     OV5675_PLL2_PREDIVP(config->pll_predivp));
> +

issue: incorrect logic. pll_prediv is an unsigned long member, and the 
macro simply removes one (1) from it, this definitely does not match 
what the datasheet says about the register values meaning 
1/1.5/2/2.5/3/4/6/8. Just define a constant for each value and set 
pll_prediv to that value? Considering that 19.2MHz, 24MHz and 6MHz all 
set that value to 0, another option is to hardcode it for now without 
implementing the actual logic? Please document this in the struct as 
well, so we know the value of that particular member shouldn't be used 
verbatim in the clock frequency computation.

> +	return 0;

issue: Why are you ignoring the ret value here suddenly?

> +}
> +
> +static int ov5675_set_pll_rates(struct ov5675 *ov5675,
> +				const struct ov5675_pll_configs *configs)
> +{
> +	int ret;
> +
> +	ret = ov5675_set_pll1_rate(ov5675, configs->pll1_config);
> +	if (ret) {
> +		dev_err(ov5675->dev, "failed to set PLL1 config\n");
> +		return ret;
> +	}
> +
> +	ret = ov5675_set_pll2_rate(ov5675, configs->pll2_config);
> +	if (ret) {
> +		dev_err(ov5675->dev, "failed to set PLL2 config\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int ov5675_start_streaming(struct ov5675 *ov5675)
>   {
>   	const struct ov5675_reg_list *reg_list;
> +	const struct ov5675_pll_configs *pll_configs;

nitpick: Reorder so longest line is first.

Cheers,
Quentin
