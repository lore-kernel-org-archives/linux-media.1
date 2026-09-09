Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BDA582B88
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963890; cv=none; b=TvIllg2UYu10jqq4cqA4gjyCrnfFANPlEQbSt14qPAt+A0djfCue++FZaa/sCT7VaWrNY+MCWXPOgdub259eqwdkLzusTCWcRlway8W9Fv2b5fBndjTFWXmjUPtp4Qz04r92XIwIc1/RhB7hVkf1vN14ORi9MTKN7qI/ZRjSSYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963890; c=relaxed/simple;
	bh=TVZfLIIGbN6JiA2jXiKwIvDbxtQswEbB6GP3royC02s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkrQc7M1HxlQJsJsyleXTo8rxKNY+z3fWA0sEPVQYBDiThAEYkMMER2x2sqdrXqe7BApM25aYoBBE84D846Ii59XePAahWX5Q+7vl4S0matBlL/EE9e526R/qAS9rFQyOM0SX+dzlthtsFelxBU7n/yzFDjmDb7P8cQAAuANwKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dSoWvQa4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dSoWvQa4"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45B9F4B0;
	Wed,  9 Sep 2026 16:23:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788963791;
	bh=TVZfLIIGbN6JiA2jXiKwIvDbxtQswEbB6GP3royC02s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dSoWvQa4wuBE5MVgT7Z1TUlbcLpFVh7odeGYyjK3ixbdh0PN9brT/i/w+sFbUFHaQ
	 O1fGSxIlVbtBplAZ/RcPmK+zLpZh4rbELU/ILjm9R483xSc+NGjqt36KjwJ5mQgya2
	 bOzpHAGWTvS/Gk9zgfY3EywSPYUPlqFnpGFYRJfs=
Message-ID: <b447495c-3635-49d3-a5d2-34396cbf4fcd@ideasonboard.com>
Date: Wed, 9 Sep 2026 15:24:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: ivsc: Use ipu_bridge_get_ipu6()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: antti.laakso@intel.com, Lixu Zhang <lixu.zhang@intel.com>,
 Miguel Vadillo <miguel.vadillo@intel.com>, Hans de Goede <hansg@kernel.org>,
 "Sapre, Sarang" <sarang.sapre@intel.com>
References: <20260909081953.3089179-1-sakari.ailus@linux.intel.com>
 <20260909081953.3089179-4-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260909081953.3089179-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi sakari

On 09/09/2026 09:19, Sakari Ailus wrote:
> Instead of going through the PCI device ID table, use
> ipu_bridge_get_ipu6() to obtain a pointer to the IPU PCI device.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>   drivers/media/pci/intel/ivsc/mei_csi.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
> index c2917e156345..d4256415a829 100644
> --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> @@ -27,7 +27,6 @@
>   #include <linux/workqueue.h>
>   
>   #include <media/ipu-bridge.h>
> -#include <media/ipu6-pci-table.h>
>   #include <media/v4l2-async.h>
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-fwnode.h>
> @@ -644,13 +643,9 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
>   	struct device *dev = &cldev->dev;
>   	struct pci_dev *ipu;
>   	struct mei_csi *csi;
> -	unsigned int i;
>   	int ret;
>   
> -	for (i = 0, ipu = NULL; !ipu && ipu6_pci_tbl[i].vendor; i++)
> -		ipu = pci_get_device(ipu6_pci_tbl[i].vendor,
> -				     ipu6_pci_tbl[i].device, NULL);
> -
> +	ipu = ipu_bridge_get_ipu6();
>   	if (!ipu)
>   		return -ENODEV;
>   

