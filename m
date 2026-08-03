Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922F842C4E4
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781081; cv=fail; b=PQUGXaxvjYJTCvSWCBDJpqj3usJ3yYHx41mmk7YgduFLaDhXrbb+muHMDwD96WpZabQUXSuF0OmEAecMwiiJr72RR+h7tD0IgTrIB38j+5uIo7BgC9xzI9FhVcmWF8CPhdz3X3SwAQ9k8pBFEzzpN4uyU9sIEPxlnF8qsl9RYtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781081; c=relaxed/simple;
	bh=5J0sCRzBP0WnLdLTMzGfu5IIz6E17qj+kR5ZkaRDRk4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vq9lIEktuVuJN6e8HnUvKusKJsWjXadCHSg/wsJLbPBzdS7IpS8iCQyGNV2J2RD9jh5cMEfeGWkA6DbcL7whk/u0PklYyKAc717vO7oSc6fsO+6LasfWSNLw/XlNLMc/JngUuIH9/860HS/DNi7AuhgDKGckI7eZSbj4v18Wj2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJ65oWMj; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJ65oWMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785781079; x=1817317079;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5J0sCRzBP0WnLdLTMzGfu5IIz6E17qj+kR5ZkaRDRk4=;
  b=dJ65oWMjQ2SjICY25QvW0UcA8JYMhq8pJXEMqRciKp0Nya8WqcYApICN
   jCl+JJ/NZQbiX9fJAqN0B+SrP/yqbSES1Y/HT+DvBkk9wFR0vds0vmZOT
   jGUgLLeLKQHiRPYjROnv8TokdgybVGqgiDITwwbbJkVrPWDHnlCr66ByP
   zP7fFaCy0n2GiOYBAfhdz8TJd9cd9O4FssT8T7YITAU44Lp3RAd/zLtUX
   kD8HO+glk3wpGSGGN7Gy+bU5hhf0U9HkbyYPU457Y2Sr2xK5/ja9ZzxPe
   EKjefUPfvx0vE03gs6PXVCpBorF+w8u6N6haSArjBfRWA9ylmvUhhqeC8
   g==;
X-CSE-ConnectionGUID: w3L1jWurShW9xsWZ8aHGpA==
X-CSE-MsgGUID: lqGoG/IGQZO5BTQ/vSYtwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85456907"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="85456907"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 11:17:58 -0700
X-CSE-ConnectionGUID: GqAZNGVTRk6sTlEPI//S4Q==
X-CSE-MsgGUID: 6TYspoTqTVKTSifL+lP+rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="257396525"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 11:17:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 11:17:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 11:17:58 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 11:17:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8VZUF/mWV6x3fZDl6155uhmKvWiyEzslLU4j3a+cBhRD+6ehkZ7RyxdrJTiJXfAnCm7c1TDUYJxQBC219xSkph6d0c5Anpq92PIYvY6Dc8FCQ8SjO4NPoewks+wxIbH8shy2f1wtU+TZk12grEiUR/X248dUs/R2Ce31je2BNiAAeLEUcrucC+ANDJgHK1aayiBvwj1mYKwRB13Omko3Hbilawnh6hdW4LDIRWKEAD8jb4EbaBISPph+w1eVMGVtNoxxxl6/oScXTzFMZ5EPi2O5jxBLe/OuhU6dzQhc4T1XalG37O7Td6IYQxeLnQryDs/AoSR8GoRk/cRvxgjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5eNfCvmL0MXJZ76p/ka0cBqA/WMf10NyRWrRoDuzk8=;
 b=feYljVKkBbFwHqbhmXTRwt5G+JqzlT5K23+QqwnPnQj7LMQeaoSdwLBgNVXyZubkS17cHqXxMYi4p/Dek+H/EehydWhwNbm22bhQzKwAnM4X04kZfXhls5xMHkr10aIjzLYxSNVlW6WF5ObXxd2mmDtELDcP0spojyka3CSS+VEKnqDOaSUfcezid9lxLLcrUjFDg1wkbtvxFcXhP7B4RxO3xJfzvnJgshxdkk2opTPyCtHVtOcvL4oqFvD2ZIqJdYnTlHFuqv6N1hZrFtrEf8fQ7zQGJuiF7IMkHKJebIee3ICxIQbHnIHA/ZyTLC7zX2gfbaJLm0DDZeXm2dsswA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 by PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Mon, 3 Aug
 2026 18:17:55 +0000
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43]) by SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 18:17:55 +0000
Message-ID: <d5582dba-d47a-4a0e-bbed-3f2832bddbc6@intel.com>
Date: Mon, 3 Aug 2026 11:17:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: Update Intel cvs and ipu6 driver entries
To: Sakari Ailus <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>
CC: Antti Laakso <antti.laakso@linux.intel.com>, "Sapre, Sarang"
	<sarang.sapre@intel.com>
References: <20260803163922.58692-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: "Vadillo, Miguel" <miguel.vadillo@intel.com>
In-Reply-To: <20260803163922.58692-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:303:8e::11) To SJ2PR11MB8568.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8568:EE_|PH7PR11MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fae96aa-cf2b-49a5-e7fe-08def18b8a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4b0qEjfR98OkHwtP7BPBaU6GY1C+JsJN/nAtqOj+UJ6g6uwBStxugWKCMRL+ym1Abqh26d6+hHTmF0i0oo8BbOTxWLG/BRv5UHX2hlqU0jg1K1FIh3R24T0Oj6nuEHEVVuBjQdA1847NG4HwYSdTScAn9nfFrSRpxzYAQ58g6pf4/SgYD4tn2Ptz491WK962bOCBl5Qk4iFbf92z5yIDAXI2zsmHlM8KS5CVB0aEvg7Lzi8kUKKdmOy2TooG1PMeDabrk7X1cNI24oq0p6ro0ogroxm3Id07rdXfRmGXCf5Z+HzE8XgHx1C+3Lnl7VgwIHqn7esnJVw1IjQEjcQau4OwcSXg67KzR+WTwc+CcB/z4qsWvdsDmk3N7TaKAuDcCN0qeHuXCMnX8lBO+Qk5SRu9t6eJoY83TGXqv2WRB8GuNH5Uhn3QJlMdoDTnIbGE5tINkFRuyRwR8+LwVKxxfI01eWruAPMiEscD/SehchPZFHU/SOTfmR0mFuEbBf302dzxBVK13sB7e29ESaC8rN1o0MDCo56KCNg8vKHjIQe/WKTzQTv3VnaZQoe1SWYXudjc75Lgp1TiB+1jlBskCtGEDQcRyVzU035FKVTeqqur6bh0fbkiQucAQLIGPAASkxkQCUgbGe7X2paVPr4VcLHbybmS0DLgIu9ls7aiwzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8568.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjNPSTFqczkzbkpoQUFoRkM5VEF2bGI5eHZkdFdXMTYwdjZCaSt4NEV0bzJs?=
 =?utf-8?B?eXhkTVNOZGdKWDRxWUNuT3FnbFJIbTJibTBCdXU3MW1iNk5jZ1pWQXBJK0pi?=
 =?utf-8?B?aVZFNjBDbmhIUy96Q1NxeS9UK3VHZ2VZcW1vWTcxRmNJY3o3RjdzL2IwMi96?=
 =?utf-8?B?VUlKYkZGbmpOM25xL2d1VVUweDFzc3RmSUQ3aVZ1b1BZNGZjeC9TeThLOTF2?=
 =?utf-8?B?ZGhOYmFwYTRkQ1dodEFOOHNrdmxlODc1VDQ0WWRSTmJ6SXRLOGJFaVJ3KzFE?=
 =?utf-8?B?RXphWm03eHAzS3F0c2xZZG1WRWM0S2lZbkg5N21TcVF6TWlkczNQeC9tZm9r?=
 =?utf-8?B?R2krZGRuZHdaQjRUWkE3d1NHaDI0dGhYbmNZMkJHUmlYcDROZlNiNHpmQkI3?=
 =?utf-8?B?c052NUhhOGZzSUNOZnhydUdJSXdkWld1VS9uZVNkWDRWcXFGK2JvcFhxakF5?=
 =?utf-8?B?MnRtSysrSDRodWE5WkRPemVQZWhWWTRDK2NueXQxdFgydWE1SURFNE5OZVJL?=
 =?utf-8?B?dHkwcklVR3pxbmJSc2lnYUtaQ00wODZmTnY3bkVYNUdNM0t0ZXQ1SXZST2VE?=
 =?utf-8?B?WE1ZRnd1cUZkMUR4cTRwcytsVVE2UExIMmtpc0ZyMmkxQ0RNOStuakdFVTgr?=
 =?utf-8?B?bDFUUW85YzNZaXY5ZExHRDBhQzVySG9zd1VkSmlkTlpTZ0ZodS9INUpsVGdJ?=
 =?utf-8?B?VFUrTzJMczY2VzBXQjV2UFlJTHRDTXFabmJlWjJobXNtNDZheTdub2h2TXho?=
 =?utf-8?B?UnJ6SjdFVkd6c0VQTzc4bGM2NXM1YW1lZFRHWThsc0ZhVENzVG9kM1JpeTZ5?=
 =?utf-8?B?cEtyMXpNOGZnTG9oVTNDZkZVSE1tWXpqOXZrRzVUdW5JQ0ZhSmRtcGUvRzNR?=
 =?utf-8?B?SkxTK3FBNlNLN1lndDNid2lIbjJhRmF4VzcrbXBhd3AxYm9ZcDRjNk1FbVYr?=
 =?utf-8?B?NzkyYnBtYStBTGdvaWJLK2hOZlA5L2RxRTNqaTJFeE0vcFZPd3NKa1ZZWlBM?=
 =?utf-8?B?L3BOV1o1dm1pdWtpamdUdmFJbnlGb2xKUVV6VWN4ai9DUXNOQUxqQkpmYmVT?=
 =?utf-8?B?QnhOMnFidGRIbU4zYTRTTE9uMGxoZkx5eGF5dUp5UjlVZTFLNlZNaEJLQnJr?=
 =?utf-8?B?N1JOeHVDbzFIRTBHYUlES1J3VTVnQjJubjF6STFLbFZmbzVkUDVNa0ZvdDZy?=
 =?utf-8?B?cU1FTHNrMlJ4ZDdlS1J6bWNLWTBMVFB6a2ZzZndaUWh3c2ZUSWFiYmtzUStY?=
 =?utf-8?B?S28vVWtjRWpZYldIL2MrWmRiRGFZUGE2UktJV2lJMzM3eWdxdkFBak1Sd1VC?=
 =?utf-8?B?UkpuUzRIcGxxL0cvNzdBNWRhczcvMmtxSDZ1RnRlYmoxT3gyY01WaE9HL1lr?=
 =?utf-8?B?WVVzT0ZVRng1TmR5ZzhBK1JZNmFrR0pNT2JYRDhYMlpXUXgzenZadUtYUURQ?=
 =?utf-8?B?UzNwMzJta1Y2NjBBSXE1NlJSZUtLazdqdnNKdTBOMUtEck1RcG85anFUV21B?=
 =?utf-8?B?b3ljR3h0VXFpZzNOZ2ZzRHJZdjF2MUFyNkg3RGpNenlvVEtSck8rSUt0bHY0?=
 =?utf-8?B?V0xQRTdickdEdGxWVHBXbTBEZ0lEVStENmNlMlNBaTRpb3FCZ1VDRnBEdG1u?=
 =?utf-8?B?ZWtjL1VDSE9vTFZrcjFtbG05Mm95c3ZyQWhrcDRCa3A5cU10dFVaLzJKYUIz?=
 =?utf-8?B?QmtrcTdLWlVoU3BJNUVWKytwRjNtSTBZMFJ2dXRncWovekJQdFkvemQ2d21P?=
 =?utf-8?B?NE9wM3Y2bDVDaXhrY0I3dmh3RnJ0ZEJLZ2s5TTNUQnphRkQwNmU3YU03RzFo?=
 =?utf-8?B?NG0wWUxoS0NYV2RnejZNaWtZblFSTjF3cG9KT1RFUVVGRnZ0Y2xxZzJFK0Zq?=
 =?utf-8?B?RHJkU2RWQ09odytaRWZBVmo3em5GUDNWNmxJQXZTUytlbTVsYVptRkd4SllC?=
 =?utf-8?B?NzNnMVpWSVZuMzBXbVJHVXZjajZnSFJuVzk4VFZ3d3QzNm8xd2MwNnFpeSsy?=
 =?utf-8?B?cnl3eEpHN1pzUnhFSHJnaWd4Z0J4c0ZGTERhRFJraVNFeEFsY3RycGZnSkds?=
 =?utf-8?B?SG9FOXc3T0lzSmppd3RLelBVME1BYS9PMllXRTJhZ1JhWFF0ZUN0T0hWRFRX?=
 =?utf-8?B?blg5OE51R3BocW4veXJJSEN6MjZ4VE4ycHFwdGN1NysxbEgrRVk0bnJxZVdH?=
 =?utf-8?B?VGNxMVp1WUxWaXBITjFGM3lIWjdTOWt2NzRPNkIyS3J2U1JMY3g3TXRiMnUx?=
 =?utf-8?B?czIvYzBWbjhjNlZYbXo3ME9qV3RvanhZaEEyY1dmSmZlNHQveFRCL1VKSVc1?=
 =?utf-8?B?NSt4NCtiWGxTTkQ2RXdiUVNjNUlRbkdjOU9yTEptZEM5cVZXbnFhbG9nTEMy?=
 =?utf-8?Q?HEoHAmY0a9uYJ7rI=3D?=
X-Exchange-RoutingPolicyChecked: AGK5+tn+CaSbdG3RfVB4WNlnVz/XCCt5caRRFwy7NoLpj/Rkyej52WILkC05t6MAKRwqr6+5DrM2FU8QtW+0y5+715P0RV2+VqP+x9ihvEZXc/pGSZPc7riAQZHYBu79rLpKoIyxGbQGWjR2Y54MgXNknQK1DQWG4eEX1+UM8ea5bMBxiGTj4UuWLEo9AXjZivN8GDXlAfqk2CqvcT+peiu9n5EgGwW7ckUg3jS8D5bxjSxnyeJftm+V8peCNmUY/NFSv3z37t26JZoATbFkIY0y9JTG2UfA1Bk7P+VsH2YyzmzepU8z3yceRx38EBznJVvZgYKM3chdl2EcIMsGCQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fae96aa-cf2b-49a5-e7fe-08def18b8a16
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8568.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 18:17:55.5241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgNSukwiMEBz8QzzWGCbmSnqVmEMFFLpCE1ZSZSUS1ltNktSFG+Z1LbFVJCeQopu9Z0MG8Hdt8aE0/2oaC1fUR/2L2O6ISKzBKiu4S57KAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
X-OriginatorOrg: intel.com

On 8/3/26 9:39 AM, Sakari Ailus wrote:
> Add Antti and Sarang as reviewers for a set of Intel ipu6 drivers, Antti
> as a reviewer of the cvs driver and myself as a maintainter to the cvs
> driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   MAINTAINERS | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index febe918d6316..88de4216d7d4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12944,6 +12944,8 @@ F:	drivers/scsi/isci/
>   
>   INTEL COMPUTER VISION SENSING (CVS) DRIVER
>   M:	Miguel Vadillo <miguel.vadillo@intel.com>
> +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> +R:	Antti Laakso <antti.laakso@linux.intel.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	drivers/media/i2c/cvs/
> @@ -13153,6 +13155,8 @@ F:	drivers/staging/media/ipu3/
>   
>   INTEL IPU6 INPUT SYSTEM DRIVER
>   M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> +R:	Antti Laakso <antti.laakso@linux.intel.com>
> +R:	"Sapre, Sarang" <sarang.sapre@intel.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   T:	git git://linuxtv.org/media.git

LGTM

Reviewed-by: Miguel Vadillo <miguel.vadillo@intel.com>

--
Regards,
Miguel
