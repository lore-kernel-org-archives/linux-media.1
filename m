Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF1A3D3D1E
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166667; cv=fail; b=Bv+PwxijDw9H1/Q6Eqj1eXmRmg0R4+LKie6DoUEloSokpJJAxywatIrBa0OcD42rPvoUWrkFrifgHS82iTQ78nf9SEPD9pZA2Ne4FP9Yilqzotybb8ibBJ0D2wcvwSV/hEnsRmILtfhuI/bpu/Gpl4gzTMONmJwgnFwhodm0Yt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166667; c=relaxed/simple;
	bh=melPehJiUIgxV8Ru2Y+R3jHET/JRzKxhfRm/vvTVb9A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fOIznFXqvy9nrchNrtHcdXNPDc4k5a9xlxgEcAtRhMXZq3SqyoQeGH3P+ykJU9JjDozpVpdZvkv1fiNT3KdktCpcjqPT0lnJZAMAnN6Rgl3zUaSGwVt7Q4o+K0qOekmRtwXXLSaNgO5/9fMXF7YnppWmzvc1g9PeMCUXylwsY3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qBphM0yy; arc=fail smtp.client-ip=52.101.53.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qBphM0yy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+aWBj4IyL5AIew2KTHZXg91KNl3gsmbTPRhi3SKZ3MCkTxkr5c5+AhWcC2Tx9aenSsuXL3C/Nig0NaJFO+cPaho88yaIJIgywApI7TrSwK+MErTzjk4Z3TDm+oSW0m4FqcHasAxsqQ/sgIGkHloWxnvNcEGAUEBvlHy+nyqP19/l/ELzXNM6A7l0et/v3p2/npZXE7s8KO005Y9Nqr39WcbWnVBlRlNEUG19acJYVTMG5ZEl2n+sDOVuJzhsNB7RM+VQBd3aaBL0rYarqUVZAQJCuAwUNZ//XwpMuqyhIjEvx/0uH8dokbzqHZ0Tr0/2MzHV3/HHVDkS7hH7SKbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLGbQYoZdHl6NI2gymm83V4fnOKgrngWW+0onBEjSD8=;
 b=sxxVA0pOqi9iFJpcpDSo0DDHPs5CEJLE4/dznbpgLg3uVl8va8ykMwES5zVCWSP9AIJ7F4uLFeUpbTLuaBPc1gTDjzDbmr3fqIwU5Xuh4etxGFFbJ44yTwfz9BZzqAli47yrCJ15fKP9mGR/BDvhf0PufvPlPfxsDvsXOcl4WpWs7gi5xffvr8o7jxI19C/ny92Iy4JvC4/HzEJZZLF4UcWgh8KMXsM26AUqx1NKcfJLNmgsHcSpXRp73NnxRaQREJU41ZnWLlXLlU4JHytUQFqCqjFCWZsYsanbE+l/zAiTFHtH3LP4LP/3Hn26WEPTVsS8llx8OBQ4jsDBN9glbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLGbQYoZdHl6NI2gymm83V4fnOKgrngWW+0onBEjSD8=;
 b=qBphM0yy+9d/msUYB/5YWZnLSq7CC2peG0Emg1jErPVKFGx/f+BMFIPx8ML7M39klhLaZL55VfdDV8Wa5cSjbUv4iLtz7phg8Th5jGMg3QkH4xXgyzYzK5FvI6pHtFLFW7iirKfvOvjHwJEsldApQp54mpwoyWWrAlKeJdpYFL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8692.namprd12.prod.outlook.com (2603:10b6:a03:543::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 08:57:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%3]) with mapi id 15.21.0339.007; Mon, 31 Aug 2026
 08:57:43 +0000
Message-ID: <8f850762-ffd2-40e5-8693-13ea1f4e448e@amd.com>
Date: Mon, 31 Aug 2026 10:57:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix coding style in dma_resv_get_singleton
To: Haojie Li <lihaojie@kylinos.cn>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260825064815.331653-1-lihaojie@kylinos.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260825064815.331653-1-lihaojie@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: a4fbb6b2-b583-4aee-e634-08df073deb3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	+m/d7/DRrSv4CPsORtO6x29X5RDJleEntjsCzmXARb7X1lXolGS2FYP33F3Ixhi4KtN7vUOPLFeRdoNAb+K5fvv5xKBbWGlhXZ/1jYBnApr4a6u/b/b+n3HRcDjJIBr817OdQZBeerprBW7Qgwc0QCC+5jtKHDNff0w3mpfUfmgosXJB1oM3Y6abVhXcmCuBG71qJcFir5Lumk0q1aui4JSoj4r4WDSCPRGGF9UPIie1riRhtCBNw/PTLPiL91LONOlhcIiTCKW31i7CIB34XOIdXHfoy4HfqMwXhIZynSzfTtQ+WQJ0SmA/PpYRgZY7kvz1LY2IcGVZY3VsWYTKzdjbKXNfGg+uWPNLCUriwaE4OsrMa4qWhaHa/4Q1snXX7hvCwKsawlbxHGbglZO6y+EO47fUOl/j+L7L5mgedRhRWtY+darpiCDNXssgF7HHdd67XwOTTEEzrWQcFe/ZtHo+S9DL5WUX+4LGkUcQ1Gs5qG99DPv6kQnuNhlmVpWI74NUYS2k9hAZSRiYhBsoeXDGMJBfMyR55ScRJS83Vkalqb2hPkHxIffzpKgwyOvSWZ9DARLSynDGaoQDpQWTWwvQrfyw/aqu1SHwCnyphgLJgTswSBCeRq2HRPF1A0wlH7Yvx/pKXsIrei4BwrFOWpeSQsvtimQsy6lWrQ9G4eQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUNpeSsxcFBXVTBIZkwvcDVXcS8yU1NYSk1KSkV0QzRULzZGUUNNUjZsaGZS?=
 =?utf-8?B?SzFVRkd3S1hBYlBIVy9ibGtIa0RiVDRzNVZ4bU9CMjFLOEJQdU1DaHpmQ3Fk?=
 =?utf-8?B?eDM5TGxTcW5mbGU1dENFWjhPZDY5YmdhNU9MUy9TQUFMRGFBbW5DNldSakYy?=
 =?utf-8?B?STlqdTJiaWFMK2xKTEloR2VJT3NhYTBadWZqbXBObnN6a0xmTXRBUTFBbFBS?=
 =?utf-8?B?TVBuZmp1dlVOL2Nsa2JJSm40K0ZSUmJvTjVRT05jc3ExUWpMNGNHdWg3bGxs?=
 =?utf-8?B?Yi9oQTIxSDNSZWFRY1locTZuckpVdm5QVG9raTk3dFJqdmFGNGwrbnVIVUNE?=
 =?utf-8?B?YnloZFppUVNyc3dIbUhhSG1CdDRlU1dIdWtJTnJVR1NwbUEvR05odS9FelJO?=
 =?utf-8?B?d0V1OEkyVzlrUzhhZnArWWY2UzhDQ2NOUXVQZ0hIZHo5TjRjcTkxcCt5SUds?=
 =?utf-8?B?UnBHVTlubUtJQ3ovNkM3THYzVHIxZWhKRGZTMUFyQ1A4aGtBdVNKWjBZa2w0?=
 =?utf-8?B?alB6clRld1hjWFJBRWp5MllSVmVOYjhqZUZacGFrYnJxbWludUR3MjZqOFAw?=
 =?utf-8?B?Q2MxM2ExeFpSNTNaRmFoVndueDRMY1dVLzRmd0IrcFROUFZWSHVoWVBsSmhC?=
 =?utf-8?B?bjRLd2VxRmZwMnVlMVZOaUZCcm9rS1pBZm1Qd3VNajM2VDU3cU1IdHROZ2gz?=
 =?utf-8?B?NjMzbFlEQ3l5SXpaU2tLeTZNNC9hZDZmTGs0bTlDYVBBbWtFSkZqY1dwR2c2?=
 =?utf-8?B?TFlOemt6bkEyZUZQTFlKS0tUZ1VMYXpZcTFVSHp2c1BsN05MYXpTYTNhY2dI?=
 =?utf-8?B?cll6RjNDY0xlNXQweml5eTh4SzRDZ3puMWdQK1V6bUpxZWh6MElKdzBYWWpk?=
 =?utf-8?B?YmkvM1B4clJVZlBRcmxSRDR0dEIvRndwenBNdjQyM2lDMU1JUTYvamdrMDBl?=
 =?utf-8?B?RHhxZXU0NzFCR1FqYnM2MkU3eUl4QWg1cHlZL0c4OUlmL0ViMDQ4d2o4bjJa?=
 =?utf-8?B?NXFWbXEyanFPSzZxOFJWYXlndjdaMXFkWlRrSjNMQTU5UElrSm5YNGFtY3Y4?=
 =?utf-8?B?L3dLM1N2VkRoT085Uk1XS1pyeE8yb29Xbm02ZS9LV2RwaTlMd1o1SFZUUVo5?=
 =?utf-8?B?VENkWnJtSlV1cEVXWFJ4OU9yOGoySTFGUDllV2ZoOFlnNWxPald0V3F2Vzky?=
 =?utf-8?B?bUtrUzRka2Z1N044UmxOZHBkZU5HcDhtd0lIUzFobFYwcmo1NFpESS9zQmhN?=
 =?utf-8?B?U2N3NUFpa2hWemx1dmVPOGhRZGF1R1RsTndHQ1k4WERmMDd2TGV4VWRTVXpI?=
 =?utf-8?B?YUxXLytoQWt2cGx0RkhpQWxCRUhCU1JnN2YyeFhHampWQXJWQXJaVjJCZVhv?=
 =?utf-8?B?RERHb0xUcXZBY3JEZnZjeUN6cUpJTkduNStBeUVTcEtuSXNrZW1MTll4ZUho?=
 =?utf-8?B?M1crczBvSjNMWXFDcjZkZCtkS1dKZmVWYWtOT0MzNHkrbXVjOGtJZ2FrdG5a?=
 =?utf-8?B?Ry83TzVaeVdMR0k2d0dleDN4Um1wbkk4S0UzcUNldk5weWJWR1B4emp5Rmtv?=
 =?utf-8?B?VHl4Y2lPZnZtWjIwa21yL21wZkt4d29pTWxoZzJpMWxSWVR5QlN4dUlLeHBo?=
 =?utf-8?B?TXg5TmlYMG9OcXI1N0t0WWsxanR6WFBQYm1lRUtkV1lKWHFXS05KUmVHWjdk?=
 =?utf-8?B?blhoU3JNSWZncllKdFEvODdXSTQwNXNLN2dkTVBKc1pHY2FBdE9wamp2R3Fi?=
 =?utf-8?B?dmZYRTNkUzZsTi9RUnBsTUZDUFFqVmxESE9yekgrcWx6SnplOGFaT2l4bGxk?=
 =?utf-8?B?ajFwWFNiWUxCRTUrbS9IOUtQajdST2c3aXp4V0ZLQnFUemZ0WFh2ZTk0M0RZ?=
 =?utf-8?B?RlE0YjliWXY2K0N2UWJXNmh4anI4VW1sVkxlbzV5d1RsVkVRd2VMVURBdkZH?=
 =?utf-8?B?QjV6dFozRWwwTWg3aDJqekJnVWs0S1Y2ellQb3R2K2dCbXpVVUFHS0VBSkNa?=
 =?utf-8?B?ZGpwYmdqU2ZsZDlzYnZPWVVSc3hyd1Q5SzFnc2JrSHNuWlVZQStybWFMSlJW?=
 =?utf-8?B?VUg2YWd2T293Q0VYc0NGZHBsTzBLRG5qSFZudkFsekNJMHdaSEE3T3psS1M0?=
 =?utf-8?B?WVR6MWxYSTBMUWlBMFIrSldybFFIUlY3aytJY05OVlNkTzR0UGxieGhaR1JT?=
 =?utf-8?B?RkMrQ2FkVlZ3RkpoVnY5cTdKeVhiOFN4WEorcWMwMUtGR0xNWUZTNndCQ1Q3?=
 =?utf-8?B?LzdRUkY4Zy9lNDJPWVF6ZHZIZy9sK3lEK0V6YTlDdGZkK2tjR21jaEMyZFVN?=
 =?utf-8?Q?IaEEyORXDNHMzFj18T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4fbb6b2-b583-4aee-e634-08df073deb3b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 08:57:43.2679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXx4doaiQqrGbp4tCxy4RXOelA9qd4JsFFEheZVHpwmN1Lqxu3zvT7Z9TxkJH3kl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8692

On 8/25/26 08:48, Haojie Li wrote:
> The conditional "if (r)" following the dma_resv_get_fences() call was
> indented with spaces instead of a tab, violating the kernel coding
> style. Fix it to use a single tab for consistency with the rest of
> the function.
> 
> Signed-off-by: Haojie Li <lihaojie@kylinos.cn>

Reviewed and pushed to drm-misc-next.

Thanks,
Christian.

> ---
>  drivers/dma-buf/dma-resv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 39a92d9f2413..2365a6d8ca15 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -633,7 +633,7 @@ int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
>         int r;
> 
>         r = dma_resv_get_fences(obj, usage, &count, &fences);
> -        if (r)
> +       if (r)
>                 return r;
> 
>         if (count == 0) {
> --
> 2.25.1
> 

