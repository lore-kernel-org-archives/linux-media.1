Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011052.outbound.protection.outlook.com [40.107.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA9A42B30B;
	Fri, 14 Aug 2026 07:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694372; cv=fail; b=hy3eqekwftqArys+bag/7wBFt/kX6zip7LnzQb4MDWnq2SsmxuSl8y/UT1XPyo/2gF7WigynPzcHyKzflOYknCTMu2IieJ/dmvyC7xN5eNBYFf226EMIBCJxkEvYwe9CdODV7hm4VVoW19l9fcRO9lmQLY4SM75l9H3+oORrTDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694372; c=relaxed/simple;
	bh=4vSJOM4Jk/LnRhMHB8hQmewClb0q6Xf81XtkbWs5e7s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l2IMtGXiq9Ld8t1sIjTd15WrTq8OLxsTjN+G2aEatjFiMeX49eeBOp5xZhhMA4sfUH5wVPcoBftGMrcq5EmVZ2H1bxDaJo5tP5cWXB1w3P0QV4MHf60lXRksACPIKJBMgq8wQarlo/oJtr24oy4Th8EL4WzDNvtZTdFVQfqDsDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ui0LQmxe; arc=fail smtp.client-ip=40.107.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ui0LQmxe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhC86SMEnErZiwGlZo2sdesR/dShpakfWBE22YDltnHp1C8a8mA++N79DDssJHxGE6tfPST29FFUfHXDObPX3GOu1NetXTtMga+8rwkmfXxfN9Kwz0k6/DrjGodyNF8bN3czH1dnGzvdEJ1UOOOxp8LFlWDJtdpiRxKMc5ChPWZcMjlRLNLTpQ/9F20rfV7uLNU0pqeHmR7v0Tqu9qG+Xh6nG0QfsEr5D/IIQz0aY2tG+0RNR0fGdOj+WL520CEMakP0warbeGnMxmdMPoxX3VzJgXR7rTxmaoYSFWX43KkRKwKF7wy5ZiLz7Sh8fvylzhYHYvQ0KuAtVvzq3XvlFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MW5GM2DBGUxMIXBVysW0y7oQYSIHs0SYufMsc4uuRoo=;
 b=iXC1G+1grsECEf3iwUCv5XpUkbbSwbuqq/i7mtHqXeeNUpUF3h4Ofym7cEL1h0bJi29kqWb2vKiQ4oW1KxSwbxuCBxX7JoCjSDFXz+GNoq8KLS0oG22KSt3ifhLi9WS54cGYaJ28Hkk5hR6bXQgr0eANrt9fmZaH9BtmHmuin4kqoaWcy4WLMaSiZPgi4VVoPKK/8Lr/cK8BTeJxBw/QDfbWWT/h2p6di5n0fJns/dm/YMEGDSpXWwFljbcWRVivbBq/thQQyiZ56rxQXMS4LEZeBemSC/EF9/mEbSXPaoYSwHvKtXJ4LlnQPplrs2dHpUW/aQtYdACBB8Db9hM2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MW5GM2DBGUxMIXBVysW0y7oQYSIHs0SYufMsc4uuRoo=;
 b=ui0LQmxesdD+xym+V+JTTMdOa1kq+PiV/iAZWrLY/sAzIVJR1Zz+XgHIdgr/MZr2plooyBT2twz3JqGFd2qWsEpEoFE6FoIfIgn7EPPSdgh0/AAluRBKQFtaAWsns+YpGkpiz/+kH3sdpnzDyRQ/bpYy4dBHD+vEDpfq7/YVz8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB5610.namprd12.prod.outlook.com (2603:10b6:a03:423::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 07:59:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0292.024; Fri, 14 Aug 2026
 07:59:27 +0000
Message-ID: <0cde1787-fe35-4832-9a28-6313e006fe38@amd.com>
Date: Fri, 14 Aug 2026 09:59:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] accel/amdxdna: honour the SYNC_BO range
To: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>, Lizhi Hou <lizhi.hou@amd.com>
Cc: Min Ma <mamin506@gmail.com>, Oded Gabbay <ogabbay@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Max Zhen <max.zhen@amd.com>,
 Sonal Santan <sonal.santan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260811231351.1011244-1-taimuraz@kaitmazov.com>
 <ee663474-5de0-4ffe-8ac1-1dcdff5dbc28@amd.com>
 <224dd281-da48-84b3-a048-016b51aa0362@amd.com>
 <a505f9e5-b416-43e9-934d-c5c29b8a70e9@amd.com>
 <9420bbe5-46a3-84be-eae8-596bc42bddac@amd.com>
 <20260813182905.124248-1-taimuraz@kaitmazov.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260813182905.124248-1-taimuraz@kaitmazov.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR18CA0022.namprd18.prod.outlook.com
 (2603:10b6:208:23c::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB5610:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f97123-d704-443b-79f8-08def9d9f64f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|11063799006|5023799004|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	cMeOwI/9jIqGomK1Cgik19/EdCw+9DOlGoZpABixNubQJq1aNLxTn/mTo9ESSug38eSA+QjmiKv8+sYQwivsHp9UXxG0aPZ1zNgQaXYBpl0fmDuhT3v9AxaT228eGJpFewSdec3tBO3+HDO4Yg/HKZdc01HgpUQfs0x70eSKoG8qWboZo3jD9mCovl8HmrsmurwZ7sfqOaHZ5mliXwWYZP9Tm77YwIodKppVeQQSfRkGR6Su0+3ht4bzoQmo/jMALBWwbbAqb254KuCmFZVxj5rh75vN3Wy5i7a6fY/QYvgM1c/3cyCXFbb/FhJIpACu+j91d8dajKHz5CZb2oNotdoW8U9wFx0I0Us1ZgSR6XMrh6oGBff+bYC6NeBkzV2Lflfs0y+V56m8TyCihhwGlpkUYPTndnuWo4TPwVUgdCxVIEPwAFPW3z5X0DnOrN1yGZGts1Pa7oMOBQiBgjb9n+PhsPOHZkRYbbT8TIlE5c3ekM2MUEPPrkOTDMnA6w3PpAoAw/w3Gil8Ia407+g1uuHYT8ghS/+nMxzhDIMV/RvWcF1ItML2GKeQPFuMVVZp6NZggxwg/xKK9BYm8SGmrHfv6/KdVb2TguuvsGjnXrHU+Z7qLzSb1fvW8NY7Fb/dAzJB9xFcM/t/jcomoft/kZxl9Cym5Sut//ZZTMiTZmw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUNZNTBEQ2RiMHlhTERFdTZONmd5MGRCaEtzYS9jSi9GWXBUQ2U0SEkwN0V0?=
 =?utf-8?B?Znpkd1REWkZmWHF3MWJNcDdhblB2RkNaazZRQ1pUcjkzNXZLek1FZ0pSZVRW?=
 =?utf-8?B?Nld1WUlrWkl5Z2RWZTR5aUtDSjNxMjRpZW9zMHhreGE5SHZNaXhhUVk1WUxL?=
 =?utf-8?B?M1VuYTVmcm51cUJpcTMzSkdTZW50b2ozc3dwRngzeCtuMmZIZjBtNmd6UjVI?=
 =?utf-8?B?eWRjNyt2dExHb0txcWF1ZkY2QjBxeU5EY0VsbFU5VXBPREVRNFdwTUpsR1M1?=
 =?utf-8?B?cWdUbzJOR1dudnExblU2ZXVObUIzNDNEQ3JDV0JtcGVZTGZMamd2NFJOem9W?=
 =?utf-8?B?YUVtWDdxQmRSOGpncW1acXRiV2dqdVF6NFFxTVZQYWY1dG51dFRyUWpsMUEw?=
 =?utf-8?B?OU03YVhQeUJsZEpCc3laVUl3bHp3Ym9ObkxZbkkzL1JvYnBtdWtrZXdVRmtR?=
 =?utf-8?B?M2RaU1dvQXdmcUloUS9YT01tUDFoT3hySnV5cGhuWWVmbURheVBKbUNlbGRK?=
 =?utf-8?B?Ri8wTjQ0TzVteSsyYlpDSEtNbmhUSjRSWGo5WWRmU1NaUmRFR2pPeU4xbmRK?=
 =?utf-8?B?VnF1LzFaelBGZFlmcnlHK2dLNU1tOUZVWGJ3MjJ3cGRma24yeG9ZU05nOWVM?=
 =?utf-8?B?SUNRS1R2MCt3b0daY1MraWZOdyt1NytIUit0S0tnaTd1cXk1bEk1WTdkbUcx?=
 =?utf-8?B?VFN0OW5RQ2p2c2Z5amVTZ0JGdVAzMXdPT1BYaUt2bGpGbFpoNzV6cHJQaHM4?=
 =?utf-8?B?RlJGcC9ZNTIvM3ZiS010VmtEWnNRNWoxZXJFUU12NXBtMUdoSVpiRER1V0hR?=
 =?utf-8?B?VkNRckFITXgwd2c2MGpKK0tZQnpCMHhzR3pqaUx0ZXpCMVNMaHUxSFRybTZh?=
 =?utf-8?B?Y3oya0IvV3pBMktDSE1Ta3ZjL1l2bWMrd1crU2hYL2xNQ0RDNUd4V2V3dWNk?=
 =?utf-8?B?Y25rdUx6elNXV0FndzNzMlYxWGg3WDM4UHh6amhVQ0VGWUdaVDE5TWcvdldq?=
 =?utf-8?B?MVJ6ZlNhWHNwWHpjcEZ4a040OTFPeW5YTksvTGdUc2xieVpRSmdPNzVlamtn?=
 =?utf-8?B?VnZ2Um9HNk5wbUkwT0cwUmZOd1dQTElaVHhwajRQSHF5ZHMzTlZZU2lkc0kz?=
 =?utf-8?B?NFVhUjhpNVBFQm9xVEUwTVdZL0tsVnlpVGVHL2g0VGtrdGRxVG5OaEJ2aGRB?=
 =?utf-8?B?YURsczFZb1BwTFpKTTluZ2ZDd2ZpQjRuSDNnYnNOdDJkSWlBNnU3dVJpaldQ?=
 =?utf-8?B?UUcycFpwOHA5NUk5RW1nbVRjVXpsQVIzMHR1RVJnYlN6T0ZPSkw0K3Flc2V5?=
 =?utf-8?B?eWtnaTZaaFYvU015UDlmZGFMM2V5aWhtL3lYYTJQalY5bk42YUNJNkVKaDIx?=
 =?utf-8?B?ajU2T1U1NDYwd1h6cm1Bem00MUVOT3FwdjlJbE1zUUN6MnkwNmdsV1o2SDVM?=
 =?utf-8?B?ZWVrVmtEVXpFaStpemltQUc1dVVJNmNIYkNzbWZiYlFzaVhsMlExZmVXLzU1?=
 =?utf-8?B?L1dmdGtOQkdISUtrbE8vbFNtUEkyVWF3T05OaFY1elFLQ1dURFNIdVI5UU1R?=
 =?utf-8?B?M2RyaktySVhaNUpvSzg0QnhCMmIzTUFBVlMxUThYZS9zd3ByUTkxbXpNN0FP?=
 =?utf-8?B?SGxGZkFhTHdkVHNDQ3V4M2VCRDdyQ2NNQ1c3WU4xTEEwWXpuVnAzN3pFME9l?=
 =?utf-8?B?emRLRDQyZmN6V0M1bXd1T0VZZVN5TUhRSFF5UHZhYXNTSThGMjdrOFZ2YkZC?=
 =?utf-8?B?OVE3Ykl4d3RucVpQTkZuc1J3NThyOFBPSXh2RDdTaDdJZjBYTWpYTHpXYXRi?=
 =?utf-8?B?WW1DMElNN2craHdVQ2JqQ3JCdGFWS2J6bUgzUDVybkZvdnpQK29sWXJ4Uk1T?=
 =?utf-8?B?MVY1a0d3VlJKaFNsUkVKNVptMUJmbE56bTQxQlFQYm9qdGw5d1BJdU1YRE04?=
 =?utf-8?B?Um81V1R2UStsQUZSNHNJV0ZMdmp2R29yN0YrcTM3T2tZMXY1REdvdk12R0ha?=
 =?utf-8?B?NHRYZDhzaW9JRHl1SzlLUXJ1Q25iMjJOUkJCU3ZHYy9GTjJnek4rd0w3cFhH?=
 =?utf-8?B?N2w3WFpmWXlVK3luWUt4ckxoNTJnbEN2MktZLzlIUm1yRlFOY1JjcFl4NTBR?=
 =?utf-8?B?NWtsVmllZEIxVm13OVV4aFRhQVB2L1lCY1JUWUIrNjdVZi96bDJhMnY2YlpH?=
 =?utf-8?B?c3NZMEdBazE0TnBXWFFDUWdsM2g2SVNFSkQ3TjVkL04vMU5YMFMvc0tTOHBi?=
 =?utf-8?B?VWRNZTdoSHVPbUsvU3dKU29pcmhoN0RqV3o3Q0NjUFZPOWwrTHV4RTRzZklz?=
 =?utf-8?Q?3y8bnN7VrCjuRSO4bN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f97123-d704-443b-79f8-08def9d9f64f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:59:27.2256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Boe/u11zYbO0WJPyoWsp4t2QojjX8/9OY6wrvGDj0SXxXdmki6lK/L8uee4SDztu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5610

On 8/13/26 20:29, Taimuraz Kaitmazov wrote:
> On 8/13/26 09:44, Christian König wrote:
>> An alternative would be to use DMA_BUF_IOCTL_SYNC from userspace
> 
> Tried it against amdgpu, imported into amdxdna: stale on all 20 runs, no
> better than no sync at all. SYNC_BO on the same buffer is clean on all
> 20.

That is expected, as I said this is for the case when a device which can't snoop the CPU cache exports a buffer.

> Which leaves me no legal way to import a buffer the CPU also reads. Is
> there one I'm missing, or should a device like this just not import?

Yes, exactly that.

For the case where a device which can't snoop imports a buffer we simply don't have an interface at all.

In other words amdxdna can export a buffer which others drivers import, but if the xdna HW is not capable of snooping the CPU cache it is not possible for the driver to provide an import functionality.

Regards,
Christian.
