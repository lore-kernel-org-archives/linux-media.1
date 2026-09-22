Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037BF433049
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068610; cv=fail; b=uRatCw+yNw/0M9eS8b8WlpXeB384cugyJj7TJ2lqKYL9e1OdwFmjI5qLfnKH5xm0LegkLXamVmzxvvyLceyp8jDMCYZI+AizyOfWBK3Bk72CR+t+lUKEuoyIlqLbr1BS97dw058Cqd6K1Im4v3rTW3zsRPilQz5DaF81o6Z5m1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068610; c=relaxed/simple;
	bh=ovrCpPXlNHB9GIyVBxo5RLQ92dq9V7e61gFIHPMpwRk=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=aIQkEeuq/B+SSLd/z5hdVnRwia7dPgfQo/syi3O1yKhFM2PVqxXJr5whiqqRMwzlbAbp28MXqAkC5uLkr1oH/PAz4R/uUIjeb3FqPDcUzTWBbAO6E117L33ulIsdig+4zzC6UDypiflOCzlzw1V+SH+0Mn0OtxQiOetyUynGD+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJIOIdUG; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJIOIdUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790068608; x=1821604608;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ovrCpPXlNHB9GIyVBxo5RLQ92dq9V7e61gFIHPMpwRk=;
  b=SJIOIdUGqnoreuQ4WbDU4QrhK8rxNa5MaKiE8PZEfHIg5/Fj4r0L5lvf
   uY2tEYvRlb67VkaN20DYJhUPp8+ULpywlqL4gGTNIoEUczqdhsYczkTUy
   PNfdJN5sWj4lE//k/5zmwhVZ6WXWfj8d5u3rmFSF7Mf/FcsfASut4WuSE
   F3SGt8hK7BRXHk8RcYG5pEvlL3/EBb5yucINCgt6wBPE7jsII1r7sBXLv
   nDbnBx/M1HDRmqeXL6v3UHqLy98WpRLcUa4zOxxtGnKODlSCrnE4ev2tH
   7yiiyqLV9tFb661F7DnpxjVk0UVmN5FaO1xiOvxaNpcPN6IsGJqq9qxp/
   Q==;
X-CSE-ConnectionGUID: mcPY5NTPRdq0O2AR5kheqQ==
X-CSE-MsgGUID: skzmXaB/SXm5jj/Apjg8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116176223"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="116176223"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:16:47 -0700
X-CSE-ConnectionGUID: uWFLEtulRvCMiu/9tVGojw==
X-CSE-MsgGUID: jv12zQUTRbWXTqyAP6qxcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="281113294"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:16:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 02:16:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 02:16:46 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 02:16:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sx3Tf0zJdP0qtuESCzAZciVApBAhixFSnGtQuQ8v6pM+wEusfxGDqrjCmToRS2eF8ZNbpbWBlnBuTLE6ZehK28Z0Ff+gYdU/mJbixS1tPUz9PvFewZUtY1wRk+2VlcNuxdXUGsPH8uy7r6jiT4E7mNsGCajV0vv8OkLloVRi2qWaMVqrcEyzWM7s13gx2WJEBLtaQ2nn1orrx/hqzfOpiKgHLD63MgRUKoL3ooEvM0NwrOYwvSlBYVuNVnHD69NZIfKKOW2qQHMrNOyr2Kcxdr1FrARnMQ1qVLFPkOA9u0J6n6ZKHsWriTXHZ1nLQXGwYgtNXFhjc8wUBrFnlKuEmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIT6/fAWCqZZe6c+4tc1Q6x7GKmlriR8ir+zCBafUjQ=;
 b=lYIi2UXE3lHaxfzIF79hrl6k3Kc9U7+FwztnBeUkGnWjPZxnG0XpzGqzqQQmWjvMM6J+mPriGeDtHM2DwwQBm7hQr1BBIvbpziLL3ImZzM7/l9yPyVOZiOmvXQCMrTD+otqoNcmYOLw7GA/JtemqH7260Xz7HoFZmcuUOUyv3ga155KHYZlIij1kiBBRiqAVRqNX8Kmy/kXuN/LlAgVr4DU3EkehMLuBa8/lE5Z8OagZZXq2PZ/Xbtg5462uY0qizVtOybar6jZZXmvjxxbOPD2rvxAnwSsfj70Zwikm8pyuoJa/rNuCOAutH6CGBfiKr9hsRdkDfj0Z9I4VaaNmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7677.namprd11.prod.outlook.com (2603:10b6:208:3fd::5)
 by BN9PR11MB5225.namprd11.prod.outlook.com (2603:10b6:408:132::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 09:16:44 +0000
Received: from IA1PR11MB7677.namprd11.prod.outlook.com
 ([fe80::d8e5:e930:6a48:871e]) by IA1PR11MB7677.namprd11.prod.outlook.com
 ([fe80::d8e5:e930:6a48:871e%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 09:16:44 +0000
Date: Tue, 22 Sep 2026 14:46:34 +0530
From: Manik Bajpai <manik.bajpai@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>, "Yu, Ong Hock"
	<ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Antti Laakso
	<antti.laakso@linux.intel.com>, "Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: Re: [PATCH v2 20/21] media: ipu6: Don't track power status, rely on
 runtime PM
In-Reply-To: <20260917113923.59004-21-sakari.ailus@linux.intel.com>
Message-ID: <43468f29-3ff2-bbc5-42ee-05437d29ccd8@intel.com>
References: <20260917113923.59004-1-sakari.ailus@linux.intel.com> <20260917113923.59004-21-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="US-ASCII"
X-ClientProxiedBy: SI2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:194::20) To IA1PR11MB7677.namprd11.prod.outlook.com
 (2603:10b6:208:3fd::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7677:EE_|BN9PR11MB5225:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ee6fdc-b2c5-44dd-c278-08df188a3829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: ZVwDC1KKGOisZXBMbHkRrI/3YkSr/CJMjCjINrGiCWX+EshFsb8oWrH9m4mk/rX5p6jI3iAfYewPb1TNuffFbsxHfTpnHeTsTi78CfdANJWB/KT4YtwPU3HQpFoVF0wSFuJUyRoX17QCvloov3HPAqnHLHPrv/KlXOZGvYkb/XovqgAHXRkYo4TCMyH8JMtP3zjlwK4ubQ6ecY3skrZoskLoE96qOXEBs7yu1gqUsJ30uppQpjdOt5eED6dC7mvfDKAPEIjh1628kUCjkdC9IbxsYQW21PwkP/obykk0itAoWJ8h7/f/EyTw+2q7vWMLV25JhZNLeS6miPaxKLK4zQ4V54R5Ny76iPekESPr5zPSbXF3e5OospFuGeE52Ikp52B+4p+AWCrpIgdgm0kkO2F8nOVB1DTQ/dj+PFZ3Q6wleD1RkGb/Ey+C7LgnL22aw4PKIUV+NuRgmjk+v54O202yJkMHR4sCb5LD3E0E/SBqJiOVMi58QJckRZLifPr6reZsG5n0BJI3Pz9wPerHu4/8DzHlwGdW7/uQXE6krTqMCoIZuxWKY4Gtaa4YJ64n1h4EwQTYXTnAj2fvdEvQAg9Y9TDY/njsMuh+rab1m2XbwQ2mZHUDAh23D3U05J2zMWFaj+pHe59gGqFkl6xfJuik4zACabQrrTEAOIYSaWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NCCmO3mWdek069HQ14gkkJzg+F9WXlvu1mrc3Pm10ZqGOsUq+rgKVxyqZ4FG?=
 =?us-ascii?Q?daf47X2RE+oDIKmYZ3KSzC9oAY3jXijPKIh5fdvNmNOWm6TPH0WYiOYzYnWr?=
 =?us-ascii?Q?NqhV8zw9Z5t7ENn28ZwnpgBHcG4Vnm8/XGL8GZKMiX6nvd9VDvQBqGvZQfLm?=
 =?us-ascii?Q?tYsMEhbvy8A8FypdxusNghwhNyfWa3HQuXPgXV4iNHfk7NR3ojRSGEqYQkGE?=
 =?us-ascii?Q?3//ZcZeR1KfIWuV+dw+SO5fUMrQTVYC2Oo4UiMyQk5Cp4WJOpEbCQsW22m5m?=
 =?us-ascii?Q?1xmYXbfqp0RL6pyc4eeCMCMwJSA4HqCqo60Qp8A7NtskRf2bAcOrUKXpsuNn?=
 =?us-ascii?Q?Ww+zJ28nVK0aBTsD+yrwPKxRVCqF/yxBSdiOsORi7CdqqqwogUdNENzmED2p?=
 =?us-ascii?Q?1qlWDAjnq2yaty5ASoco5QB2NYIxgAo7GqTlfJdOtV9ikTuqN2Cz4o27J6x8?=
 =?us-ascii?Q?+64gycmUPemF7Qr62XzX9SfRWRcfjehT+3FMcq7qkiLuhyzm9NqRz27aj4uM?=
 =?us-ascii?Q?fjqDSx157dvPW2SEnslFXhdeweiTDApni128tI3vqVP5fgqzRO1RG6HkDNHf?=
 =?us-ascii?Q?2zyio9MD4s17aZUh1cZJ7n4B/ZzerdZoHLXnvgx52MG0T86TVcqqZJnDv+CN?=
 =?us-ascii?Q?z7hvuh2CcawwoQ5v3OwoRxZ2pb6ZvWTcsDAa5Bn78ablDRCxY6ckeQ5L9xI6?=
 =?us-ascii?Q?O1uQSBNeswckCRxRBdFAHd3BrM0hQqmOGRd3QcuxDvFdfOm4LVmt91MuXOYT?=
 =?us-ascii?Q?/HQJyc3mvh50Qo8n+jSQHNqLR4yJgMcG38oIxC1+p9thDGgv5EmjCwJD8To0?=
 =?us-ascii?Q?baRva6gkFzzoZweSvJ6jiTyyMlLppGqlMGMD8QNWc9qU+zA1KETl8oYeHYeT?=
 =?us-ascii?Q?jRMO4Tnn7iCEzKZEmqnuJLldgB5MeDdupPDrBmJRD8TwRMnfyx1jIQAK7NDf?=
 =?us-ascii?Q?hG8wUEefj3qmDv/mG5rBoEAyr7Kz8QzlwC0LczUaYVA45mPNOv7vio05N9vk?=
 =?us-ascii?Q?6tqVOITbOeCCC0LKs+VtyFIwyFzgtOkEhYNfMu+0RVQgm+tNXhB4fN2BvYZt?=
 =?us-ascii?Q?qHdvVNOjheau5dL/OCuHCvn316AG80B9M/Auf/RtJmm1ETkwL0RliCGV6PbG?=
 =?us-ascii?Q?MAD6Dii3LFxatRosVX+7Cv4XlbsyJ4HVegibzPe4Mg9fumeL/A0X1hXE4aMI?=
 =?us-ascii?Q?bg95dWLdhJkoZz1gTmVXE5nemH3iKuiRKXsEjyT1mRKUWe6WAmlZQCIInDQP?=
 =?us-ascii?Q?lnFXeUOIe/lnitA8UEM6N2fDuILMafEiuVXOLoRYWMDsxT57InABJY5OX9Zx?=
 =?us-ascii?Q?0tu4DFYgDozXibFPzKcnPa2gQv1Jp5cHAUxBKBqmvrSnuuutojcmktaY9kNP?=
 =?us-ascii?Q?GziabuQ3L7Uu/u+e6qBuhrt2qxOGIDuNu3UUfpmqMkz8ZhZ1FYOuj/T0VLxO?=
 =?us-ascii?Q?z8hAOmShbq1H7srYfb1BfM9i+T7IRjLkhY28tLCOIiC7Qao0KN6HLjBl19tj?=
 =?us-ascii?Q?8lffZTE6gI7RVClRpcw4ccVp9/XaMGxrtXTDCle0755wj2rKzHyZzdKthUGl?=
 =?us-ascii?Q?5KWGon8zqVe9XytyjhEaKzHpSEMQSsSXPE6w6U2/yRGk1NGyhxHzLK7XJXQ5?=
 =?us-ascii?Q?ozF18F9N2Vc/pfTyaOQZhcFcCj10lxO0AgS8Wznd53HLNO7/gZQKtUREOiXV?=
 =?us-ascii?Q?bLLtUFqpxNqrXG9Yr/pbhnicEYHcwigRjq1hwkfC6xHqsH5q8Dz3u3gqxNVp?=
 =?us-ascii?Q?H+7ZihOpwQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2MQ5Z2bkQ+i08Z08tQERYFWV6raMZANAEM+flPUUH+M+czBFwUu44p1stEajqNwNIkBgG4qOxOtPjl4RbWxzZ0EKOSO/rtD1D8+T/LKPqAkMpETatKbAj+CglJ9WlL4HlqbhB9VOcerA2rL2qkE1ntiHE8K1kMZ2eoVXTEyeeiSTHn0l9ywKA5iJgBCy8rHfYrcCvRTl0s3PSw3FVNuvsux2czxBAT9CY+x4+9U4J5jMjJRS4bhhP7cNTtgdORyOsLt5AEcCkQSF7GVJMYXeviQRgzZ4b3xqFr/gICsqy5oWP31eSM64QT+l4jzQFtQiVEvAvXC/ypcyg8IISsWAGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ee6fdc-b2c5-44dd-c278-08df188a3829
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 09:16:44.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nOW9yVXZAWptKlV3FdO1GhtaEKvp6DHBhjO6eN63qwdPjeY7JVQUTuE3nP9r4vLG1QIeXnYpXTcSA8+4mywYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5225
X-OriginatorOrg: intel.com

Hi Sakari,
          I am hacing issues in applying this patch. Please scroll down 
for seeing the issue

On Thu, 17 Sep 2026, Sakari Ailus wrote:

> Rely on runtime PM suspending and resuming the device and so remove
> tracking of power state. Also remove the power_lock spinlock that
> serialised firmware initialisation and cleanup with the ISR. This is no
> longer necessary as the ISR now runs when the device is in RPM_ACTIVE
> state.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 21 +++++++--------------
>  drivers/media/pci/intel/ipu6/ipu6-isys.c    | 16 ----------------
>  drivers/media/pci/intel/ipu6/ipu6-isys.h    |  5 -----
>  drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 20 ++++++++++++--------
>  4 files changed, 19 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
> index 0214d7105fbe..f4f1cf7c86d2 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
> @@ -7,6 +7,7 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
>  
> @@ -131,7 +132,6 @@ static int ipu6_fw_isys_close(struct ipu6_isys *isys)
>  {
>  	struct device *dev = &isys->adev->auxdev.dev;
>  	int retry = IPU6_ISYS_CLOSE_RETRY;
> -	unsigned long flags;
>  	void *fwctx;
>  	int ret;
>  
> @@ -141,11 +141,9 @@ static int ipu6_fw_isys_close(struct ipu6_isys *isys)
>  	 * to SP icache.
>  	 * spinlock to wait the interrupt handler to be finished
>  	 */
> -	spin_lock_irqsave(&isys->power_lock, flags);
>  	ret = ipu6_fw_com_close(isys->fwctx);
>  	fwctx = isys->fwctx;
>  	isys->fwctx = NULL;
> -	spin_unlock_irqrestore(&isys->power_lock, flags);
>  	if (ret)
>  		dev_err(dev, "Device close failure: %d\n", ret);
>  
> @@ -158,9 +156,7 @@ static int ipu6_fw_isys_close(struct ipu6_isys *isys)
>  
>  	if (ret) {
>  		dev_err(dev, "Device release time out %d\n", ret);
> -		spin_lock_irqsave(&isys->power_lock, flags);
>  		isys->fwctx = fwctx;
> -		spin_unlock_irqrestore(&isys->power_lock, flags);
>  	}
>  
>  	return ret;
> @@ -531,9 +527,6 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
>  	u32 index;
>  	u64 ts;
>  
> -	if (!isys->fwctx)
> -		return 1;
> -
>  	resp = ipu6_fw_isys_get_resp(isys);
>  	if (!resp)
>  		return 1;
> @@ -699,12 +692,11 @@ irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev)
>  	void __iomem *base = isys->pdata->base;
>  	u32 status_sw, status_csi;
>  	u32 ctrl0_status, ctrl0_clear;
> +	int pm_status;
>  
> -	spin_lock(&isys->power_lock);
> -	if (!isys->power) {
> -		spin_unlock(&isys->power_lock);
> -		return IRQ_NONE;
> -	}
> +	pm_status = pm_runtime_get_if_active(&adev->auxdev.dev);
> +	if (!pm_status)
> +		return 0;
>  
>  	ctrl0_status = isys->pdata->ipdata->csi2.ctrl0_irq_status;
>  	ctrl0_clear = isys->pdata->ipdata->csi2.ctrl0_irq_clear;
> @@ -749,7 +741,8 @@ irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev)
>  
>  	writel(ISYS_UNISPART_IRQS, base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
>  
> -	spin_unlock(&isys->power_lock);
> +	if (pm_status > 0)
> +		pm_runtime_put(&adev->auxdev.dev);
>  
>  	return IRQ_HANDLED;
>  }
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index fc6e87e9764b..60f5f9ea2910 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> @@ -759,7 +759,6 @@ static int isys_runtime_pm_resume(struct device *dev)
>  	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
>  	const struct ipu6_isys_internal_pdata *ipdata = isys->pdata->ipdata;
>  	struct ipu6_device *isp = adev->isp;
> -	unsigned long flags;
>  	int ret;
>  
>  	ret = ipu6_mmu_hw_init(adev->mmu);
> @@ -772,10 +771,6 @@ static int isys_runtime_pm_resume(struct device *dev)
>  	if (ret)
>  		goto err_mmu_hw_cleanup;
>  
> -	spin_lock_irqsave(&isys->power_lock, flags);
> -	isys->power = 1;
> -	spin_unlock_irqrestore(&isys->power_lock, flags);
> -
>  	if (IS_IPU7(isp)) {
>  		ipu7_isys_setup_hw(isys);
>  	} else {
> @@ -806,10 +801,6 @@ static int isys_runtime_pm_resume(struct device *dev)
>  	if (!ret)
>  		return 0;
>  
> -	spin_lock_irqsave(&isys->power_lock, flags);
> -	isys->power = 0;
> -	spin_unlock_irqrestore(&isys->power_lock, flags);
> -
>  	isys->phy_termcal_val = 0;
>  	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
>  
> @@ -827,7 +818,6 @@ static int isys_runtime_pm_suspend(struct device *dev)
>  	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
>  	struct ipu6_isys *isys = dev_get_drvdata(dev);
>  	struct ipu6_device *isp = adev->isp;
> -	unsigned long flags;
>  	int ret = 0;
>  
>  	isys->adev->auxdrv_data->fw_ops->close(isys);
> @@ -836,10 +826,6 @@ static int isys_runtime_pm_suspend(struct device *dev)
>  		ret = -EIO;
>  	}
>  
> -	spin_lock_irqsave(&isys->power_lock, flags);
> -	isys->power = 0;
> -	spin_unlock_irqrestore(&isys->power_lock, flags);
> -
>  	isys->phy_termcal_val = 0;
>  	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
>  
> @@ -1016,8 +1002,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
>  	isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
>  
>  	spin_lock_init(&isys->streams_lock);
> -	spin_lock_init(&isys->power_lock);
> -	isys->power = 0;
>  	isys->phy_termcal_val = 0;
>  
>  	mutex_init(&isys->mutex);
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> index 4991078c18b2..2af20f56a965 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> @@ -80,9 +80,6 @@ struct sensor_async_sd {
>   * @media_dev: Media device
>   * @v4l2_dev: V4L2 device
>   * @adev: ISYS bus device
> - * @power: Is ISYS powered on or not?
> - * @isr_bits: Which bits does the ISR handle?
> - * @power_lock: Serialise access to power (power state in general)
>   * @csi2_rx_ctrl_cached: cached shared value between all CSI2 receivers
>   * @streams_lock: serialise access to streams
>   * @streams: streams per firmware stream ID
> @@ -99,8 +96,6 @@ struct ipu6_isys {
>  	struct v4l2_device v4l2_dev;
>  	struct ipu6_bus_device *adev;
>  
> -	int power;
> -	spinlock_t power_lock;
>  	u32 isr_csi2_bits;
>  	u32 csi2_rx_ctrl_cached;
>  	spinlock_t streams_lock;
> diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> index 50219b210ae9..0876cc54faa7 100644
> --- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/cleanup.h>
>  #include <linux/cacheflush.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "ipu6-bus.h"
>  #include "ipu6-dma.h"
> @@ -552,9 +553,6 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
>  	unsigned long flags;
>  	u64 ts;
>  
> -	if (!isys->fwctx)
> -		return 1;
> -
>  	resp = ipu7_fw_isys_get_resp(isys);
>  	if (!resp)
>  		return 1;
> @@ -752,11 +750,11 @@ irqreturn_t ipu7_isys_isr(struct ipu6_bus_device *adev)
>  	void __iomem *base = isys->pdata->base;
>  	u32 status_sw, status_csi;
>  	u32 csi_offset, sw_offset;
> +	int pm_status;
>  
> -	guard(spinlock)(&isys->power_lock);
> -
> -	if (!isys->power)
> -		return IRQ_NONE;
> +	pm_status = pm_runtime_get_if_active(&adev->auxdev.dev);
> +	if (!pm_status)
> +		return 0;
>  
>  	csi_offset = IPU7_IS_IO_CSI2_LEGACY_IRQ_CTRL_BASE;
>  	sw_offset = IPU7_IS_UC_CTRL_BASE;
> @@ -764,8 +762,11 @@ irqreturn_t ipu7_isys_isr(struct ipu6_bus_device *adev)
>  	status_csi = readl(base + csi_offset + IPU7_IRQ_CTL_STATUS);
>  	status_sw = readl(base + sw_offset + IPU7_TO_SW_IRQ_CNTL_STATUS);
>  
> -	if (!status_csi && !status_sw)
> +	if (!status_csi && !status_sw) {
> +		if (pm_status > 0)
> +			pm_runtime_put(&adev->auxdev.dev);
>  		return IRQ_NONE;
> +	}
>  
>  	do {
>  		writel(status_sw, base + sw_offset + IPU7_TO_SW_IRQ_CNTL_CLEAR);
> @@ -788,5 +789,8 @@ irqreturn_t ipu7_isys_isr(struct ipu6_bus_device *adev)
>  	writel(IPU7_IS_UC_TO_SW_IRQ_MASK,
>  	       base + sw_offset + IPU7_TO_SW_IRQ_CNTL_MASK_N);
>  
> +	if (pm_status > 0)
> +		pm_runtime_put(&adev->auxdev.dev);
> +
>  	return IRQ_HANDLED;
>  }
> -- 
> 2.47.3
> 
> 
Result of "patch -p1 --dry-run" in pine

checking file drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
checking file drivers/media/pci/intel/ipu6/ipu6-isys.c
checking file drivers/media/pci/intel/ipu6/ipu6-isys.h
checking file drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
Hunk #1 FAILED at 5.
Hunk #2 succeeded at 551 (offset -1 lines).
Hunk #3 succeeded at 748 (offset -1 lines).
Hunk #4 succeeded at 760 (offset -1 lines).
Hunk #5 succeeded at 787 (offset -1 lines).
1 out of 5 hunks FAILED


My current tree looks like this:-

intel@pepper:~/s-ailus/linux-ipu6$ git log --pretty --oneline -25
a67d0bc689db (HEAD -> ipu6) media: ipu6: Move firmware init/cleanup to RPM callbacks
7a11adbbf11c media: ipu6: Serialise access to stream pointers by isys stream_lock
25b80e93ebca media: ipu6: Drop {get,put}_streams_opened()
ae57b074bbf9 media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
6640c40b9185 media: ipu6: Rework watermark setting
27cc9d1434f7 media: ipu6: Rework watermark calculation
bba5324133c7 media: ipu6: Avoid accessing av->streams before streaming
8fe5d941938e media: ipu6: Collect enabled stream IDs
f0144bcba9b1 media: ipu6: Remove nr_queues and nr_streaming fields in ipu6_isys_stream
4e23a8cadad1 media: ipu6: Add lockdep checks for CSI-2 streaming enable and disable
d5d977d60cae media: ipu6: Start streaming once all streams have started, stop when not
6987e506fe88 media: ipu6: Collect IPU streams into CSI-2 receiver sub-device context
ac8bcb8026c7 media: ipu6: Get watermark configuration directly from ipdata
4132a4c2835f media: ipu6: Clean up link frequency calculation
64c42c31525e media: ipu6: Always request a capture ack
3395c33b5160 media: ipu6: Rename misnamed out_free_watermark label in video init
6dbd34bdaf4e media: ipu6: Stream number on CSI-2 receiver source pads is always 0
5ec55ec5646e media: ipu6: Move streaming control to CSI-2 receiver driver
3e3070330170 media: ipu6: Fix releasing resources at failing streamon
8fa3385b6db1 (origin/ipu6) media: ipu6: Enable ipu7 and ipu7.5
09db11b21d85 media: ipu6: Add ipu7.5 mmu initialization data
553f8433c5d9 media: ipu6: Add ipu7.5 buttress support
8d8cd6c357e9 media: ipu6: Set model name for ipu7
0951f102d6c8 media: ipu6: Map ipu7 firmware
58c4286583cb media: ipu6: Move isys fw mapping to pci_probe

