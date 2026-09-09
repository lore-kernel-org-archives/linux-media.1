Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C593C8717
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945665; cv=none; b=X2Bcnkp57nyB4gXhBdKl20rdAonl/Ggc+y4iuRGEBOHUSsWCYecJ35PDLf654rj/6w7vu5EqHhFBD9mHo0bREMaF5hbXMmBwVaDUUKU+tNsjuqWkzldllRSOUFgtzwtvxetlRL2hbnlUgnJ6q+uc1F1vVIdwteMg0rEr38Qk6+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945665; c=relaxed/simple;
	bh=Kvj0DCFxxvRyETrgAkknm3aiFq4bNNppTouPZgJup1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHN1PWX5uaoN/gyiuysynEUXVZ8KRlMscUnsCS3KIClgfQjBVbMuA93Ee7QUO8mzaJZqT3OeM/jFhG4MhvHMHqGLkcVmbk0SOuR/nkUlTPGmIwbfMO2Crd3ZA7MmGPgnzQhvHEe7aUsCj/ua4s4434LuGyKWVkVZp1BzPs/W2DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7x/UtHr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7x/UtHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945662; x=1820481662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kvj0DCFxxvRyETrgAkknm3aiFq4bNNppTouPZgJup1Q=;
  b=j7x/UtHrgUrH1C8KxfaMttKgUIuW/uwcorPkEedK1mKHBNIrdQf5gxPV
   z6ZTzaSZzXfkFoUKyPR4JZLcPJj7oV1p47kaNqwg+MXye8cylLQaz1m2X
   52hqUgqxl93MUuR/rm6dNpFiONYs3fjb2aHds651PXr3DpsIZbZOGJVb2
   OvuJNp2QmCnDeCEfrlOkzh+T8OLXmMiwjKjaiR6gcMkNyD9L7cPFOYCpP
   QDGezY9lIaYWX8Xs3bePhDLKiMC43L0qSdwVe9zUf4lOSPlQD4emynRpq
   iHmVsrx2HDlulmzXn8cn+JMr3YTwMe6Kdgssr1FzPUHCgzHS1RLElHHB3
   g==;
X-CSE-ConnectionGUID: IqNJA1wPTIeOKDrU7zWZhQ==
X-CSE-MsgGUID: 0uGnPgncT1iUO1x1pbYcyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93232310"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93232310"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:21:00 -0700
X-CSE-ConnectionGUID: +HxRBdc+R+u711TCIgXvaw==
X-CSE-MsgGUID: pfjxO7q4SYWbB0m6ghwtYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="276494601"
Received: from dwoodwor-mobl2.amr.corp.intel.com (HELO alaakso-desk) ([10.125.111.146])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:20:57 -0700
Date: Wed, 9 Sep 2026 12:20:53 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, antti.laakso@intel.com,
	Lixu Zhang <lixu.zhang@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	"Sapre, Sarang" <sarang.sapre@intel.com>
Subject: Re: [PATCH v2 3/3] media: ivsc: Use ipu_bridge_get_ipu6()
Message-ID: <aqEk9djgtRmOT68a@alaakso-desk>
References: <20260909081953.3089179-1-sakari.ailus@linux.intel.com>
 <20260909081953.3089179-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909081953.3089179-4-sakari.ailus@linux.intel.com>

On Wed, Sep 09, 2026 at 11:19:52AM +0300, Sakari Ailus wrote:
> Instead of going through the PCI device ID table, use
> ipu_bridge_get_ipu6() to obtain a pointer to the IPU PCI device.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>

>  drivers/media/pci/intel/ivsc/mei_csi.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
> index c2917e156345..d4256415a829 100644
> --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> @@ -27,7 +27,6 @@
>  #include <linux/workqueue.h>
>  
>  #include <media/ipu-bridge.h>
> -#include <media/ipu6-pci-table.h>
>  #include <media/v4l2-async.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
> @@ -644,13 +643,9 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
>  	struct device *dev = &cldev->dev;
>  	struct pci_dev *ipu;
>  	struct mei_csi *csi;
> -	unsigned int i;
>  	int ret;
>  
> -	for (i = 0, ipu = NULL; !ipu && ipu6_pci_tbl[i].vendor; i++)
> -		ipu = pci_get_device(ipu6_pci_tbl[i].vendor,
> -				     ipu6_pci_tbl[i].device, NULL);
> -
> +	ipu = ipu_bridge_get_ipu6();
>  	if (!ipu)
>  		return -ENODEV;
>  
> -- 
> 2.47.3
> 
> 
