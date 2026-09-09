Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED418572688
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 14:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963878; cv=none; b=GR1Vln3N3Ehryk31Q6gFj98a62TZbHux4vlgkDqEbkazOi9MKeZZ+G8lcQAFcKQSRAqh8k0elfcYUkjpa362Zm+Q2fB8/Qy8ceYtBkKwLTU5Ysk7rPMkDz0x7tgn+Pplsg41IDNxQ5kim7uY/5K1yIy9rUOo7xn0yk4K8Ihbn7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963878; c=relaxed/simple;
	bh=OOIQYJ/OXNsnN4udePKbSVoXdPLTSnXaXkarWkKucFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBgayQcj5TubcOSzwFPz2HnzzDYGR96Lr/xRSSRuPm3xWKueZoB9Nl9WYeRsUvwseEnGIEg/VsD29rZc8ljO7iy4r+r0GeuNYsdqwRwCbNri2eOIVwjwkfldyJeapmXHYiZyFalYN8hYk2DX6YS7onboiy/hP2YtZ2NCM8fO5Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FWPx6Pcq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FWPx6Pcq"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 888264B0;
	Wed,  9 Sep 2026 16:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788963777;
	bh=OOIQYJ/OXNsnN4udePKbSVoXdPLTSnXaXkarWkKucFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FWPx6PcqksLXqikTI2KyOxRCrAHe4uytaLTPqKBdNro7odMYdM3/zcweD1OeIVsBy
	 SnmCEtLz0Dq2KYQywOggGhpFaVmJAZ+dM+97Vs8m1sFw2qw39MRgtMcDUwtmxwBtGu
	 Kur5J8b+NZGx9cqsigq9T1OZxSdU8NiOhp8XglSM=
Message-ID: <8d0b9f51-7833-4c70-a9ac-7a4c355bf97b@ideasonboard.com>
Date: Wed, 9 Sep 2026 15:24:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: cvs: Use ipu_bridge_get_ipu6()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: antti.laakso@intel.com, Lixu Zhang <lixu.zhang@intel.com>,
 Miguel Vadillo <miguel.vadillo@intel.com>, Hans de Goede <hansg@kernel.org>,
 "Sapre, Sarang" <sarang.sapre@intel.com>
References: <20260909081953.3089179-1-sakari.ailus@linux.intel.com>
 <20260909081953.3089179-3-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260909081953.3089179-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari

On 09/09/2026 09:19, Sakari Ailus wrote:
> Instead of going through the PCI device ID table, use
> ipu_bridge_get_ipu6() to obtain a pointer to the IPU PCI device.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>   drivers/media/i2c/cvs/core.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
> index d4a3b9c3bab1..98cadd58a075 100644
> --- a/drivers/media/i2c/cvs/core.c
> +++ b/drivers/media/i2c/cvs/core.c
> @@ -21,7 +21,6 @@
>   #include <linux/workqueue.h>
>   
>   #include <media/ipu-bridge.h>
> -#include <media/ipu6-pci-table.h>
>   
>   #include "icvs.h"
>   
> @@ -656,14 +655,12 @@ static int cvs_configure_dev_caps(struct icvs *ctx)
>    */
>   static int cvs_core_probe(struct device *dev, struct i2c_client *i2c)
>   {
> -	struct pci_dev *ipu = NULL;
> +	struct pci_dev *ipu;
>   	struct icvs *ctx;
>   	int ret;
>   
>   	/* Locate IPU device */
> -	for (unsigned int i = 0; !ipu && ipu6_pci_tbl[i].vendor; i++)
> -		ipu = pci_get_device(ipu6_pci_tbl[i].vendor,
> -				     ipu6_pci_tbl[i].device, NULL);
> +	ipu = ipu_bridge_get_ipu6();
>   	for (unsigned int i = 0; !ipu && icvs_ipu7_tbl[i].vendor; i++)
>   		ipu = pci_get_device(icvs_ipu7_tbl[i].vendor,
>   				     icvs_ipu7_tbl[i].device, NULL);

