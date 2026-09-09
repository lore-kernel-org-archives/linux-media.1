Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380DC3B9956
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945583; cv=none; b=i6N402jkmx7SekqdBCkMn/MdKlJqIt7Ho5zbok+HFEy7dvVU6RDbTAYgqP+SQCmpYosVGL5wNkqfHx0LLr1jBTf/GAAuix1MJFO9laxpULtTgeVi5KrifMrQVAf7GuyR59ifeBGz8iN8SXXms6rMwjAwWGzlr7iHmgD+w+z/6eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945583; c=relaxed/simple;
	bh=7FTTpc+LjPR5+L0dSHjeRfj0qZFQSf8uPdeMpCRuCAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3HMEhDEZIEtBw7hDLbGskeSKadb94E6X7A+/GV7gklewD2WoPTFgDMD1icorSx0chlRuri7+k7+hMhw9HnJeYuSBWeIf0BSmDk5fGBEipjhm5hDtFUIeBFMgcWQ1fSOYbZv3RJTRej+XykIRTtoXzpcb65jKi7Dz3D7Bkwd1wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzJYbjiR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzJYbjiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945581; x=1820481581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7FTTpc+LjPR5+L0dSHjeRfj0qZFQSf8uPdeMpCRuCAM=;
  b=EzJYbjiR890fdZeb75lb6ANs4aLd5KonpxkqaHkGvRQfgMODLazpqRlY
   +VE7lHOh0IObVGWS5ujnCIz3Ks/dxrtrFQQFGlNsL9h2ulDdB3mz5SusH
   Vk3YXMEkjmmZxpbxrJt/oc+QKiqjoWN/BL9SuQvw8ZtGUQzBO2Xr9v7xO
   0HONoUMiuft0p3rze8Oqx4g54xfoQOZG5CwcNadrOHPse1lpbjPWuNw0+
   jYQuDJ9g3pWDFV2QaaVgkzzHlSohQsUHksI4AF61E4U1QiNzcMAzl+7yC
   3iuWekUJUiH67xCSl5rMi1ZYGSaQ9ihJX30Zs4jHjFfsG1tu3NF0RVxz2
   A==;
X-CSE-ConnectionGUID: 8+SZEanPSlKFpT8Qp29zrA==
X-CSE-MsgGUID: J28x33gyS4qssauAhBHh1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89395677"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89395677"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:19:40 -0700
X-CSE-ConnectionGUID: aEl2hLHVSqyrSkf3zEL/QA==
X-CSE-MsgGUID: ANbyCL09QKe19nB1tGa6Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="271755771"
Received: from dwoodwor-mobl2.amr.corp.intel.com (HELO alaakso-desk) ([10.125.111.146])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:19:37 -0700
Date: Wed, 9 Sep 2026 12:19:33 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, antti.laakso@intel.com,
	Lixu Zhang <lixu.zhang@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	"Sapre, Sarang" <sarang.sapre@intel.com>
Subject: Re: [PATCH v2 2/3] media: cvs: Use ipu_bridge_get_ipu6()
Message-ID: <aqEkpWRLQFT8nhl7@alaakso-desk>
References: <20260909081953.3089179-1-sakari.ailus@linux.intel.com>
 <20260909081953.3089179-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909081953.3089179-3-sakari.ailus@linux.intel.com>

On Wed, Sep 09, 2026 at 11:19:51AM +0300, Sakari Ailus wrote:
> Instead of going through the PCI device ID table, use
> ipu_bridge_get_ipu6() to obtain a pointer to the IPU PCI device.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>

>  drivers/media/i2c/cvs/core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
> index d4a3b9c3bab1..98cadd58a075 100644
> --- a/drivers/media/i2c/cvs/core.c
> +++ b/drivers/media/i2c/cvs/core.c
> @@ -21,7 +21,6 @@
>  #include <linux/workqueue.h>
>  
>  #include <media/ipu-bridge.h>
> -#include <media/ipu6-pci-table.h>
>  
>  #include "icvs.h"
>  
> @@ -656,14 +655,12 @@ static int cvs_configure_dev_caps(struct icvs *ctx)
>   */
>  static int cvs_core_probe(struct device *dev, struct i2c_client *i2c)
>  {
> -	struct pci_dev *ipu = NULL;
> +	struct pci_dev *ipu;
>  	struct icvs *ctx;
>  	int ret;
>  
>  	/* Locate IPU device */
> -	for (unsigned int i = 0; !ipu && ipu6_pci_tbl[i].vendor; i++)
> -		ipu = pci_get_device(ipu6_pci_tbl[i].vendor,
> -				     ipu6_pci_tbl[i].device, NULL);
> +	ipu = ipu_bridge_get_ipu6();
>  	for (unsigned int i = 0; !ipu && icvs_ipu7_tbl[i].vendor; i++)
>  		ipu = pci_get_device(icvs_ipu7_tbl[i].vendor,
>  				     icvs_ipu7_tbl[i].device, NULL);
> -- 
> 2.47.3
> 
> 
