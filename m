Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C543B3CAA51;
	Wed, 15 Jul 2026 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103826; cv=none; b=fgBj1c82TxowUMUKdsz/PIdFFV6KXggFDfsuleZjBSKCH6wamzckzCIcwBszL8YexBAw4p2YjV2cF5rsATdTdnZLrnVl1XujRxavON1/Q5aS1DkcdtwX5CRoKJYkjaPhxMX0Bx48ZIdNbQmTD7UEU32VpdqbRBsDeVkIRjbRDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103826; c=relaxed/simple;
	bh=58wwpJyXBYb4qLcHty67VmeNVnmtgaRdIOq2l4Yy/jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q20cuSyhSeTNNgZw3dp+RnqHY1Y0L7f+/y3M14t9DEvYXjBna54niDY7jxmj3wf6SUPKPftf7fqSafFTmtVOvmuI4joLBqG9pbrTP8uEirkPJtMorJM10Ru2bjZHKXNs52Eu4FOqsJ6SOENl++a/aKFlH1RpLOllU8y3ognFnsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIxVIsRp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIxVIsRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784103824; x=1815639824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=58wwpJyXBYb4qLcHty67VmeNVnmtgaRdIOq2l4Yy/jk=;
  b=ZIxVIsRpNYDh6exapFt7IJqJEsGxsNCdwXwMaLumNo2kWuU+1c7GbQnE
   c7OgzEjMx2H+0DTrQoVby5nM30CEg1317R+vAWbYLiJxScgEMJIg2MN0b
   3bkxmxg5bpNENIVvdvX0O4etxViH3y5U3m1B4UOU850ZQrtUXm+hpmxeM
   CnkanooG7QtaErLyUB7mYkoV5P9vAKl9I6KKFOqhZlzgvtbTI9UUjBBYq
   zzi6mqdNxGDiv2XRws3svet+1ksQjjcalGIEKaBDTRBkLuZMqF0NpyXKz
   axp7DpU09Uj3XbMpE9K7b8UE+an49+xFdobAJlXSQ7CAulPOMwJBmOUuq
   A==;
X-CSE-ConnectionGUID: 26ql2AB8S/e5MaGiKCMtlg==
X-CSE-MsgGUID: 1+d+PXXDSo6T1K43S6QCvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84776478"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84776478"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 01:23:44 -0700
X-CSE-ConnectionGUID: 8TlHg0ObTY6EKxAjFYIyGw==
X-CSE-MsgGUID: CyqyiYACSrm4o1a4whwQBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="249736599"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.106])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 01:23:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3F23B11FA5C;
	Wed, 15 Jul 2026 11:23:42 +0300 (EEST)
Date: Wed, 15 Jul 2026 11:23:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] media: ipu3-cio2: disable MSI on probe failure and remove
Message-ID: <aldDjnZ33ljackNd@kekkonen.localdomain>
References: <20260715075607.62277-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715075607.62277-1-mhun512@gmail.com>

Hi Myeonghun,

Thank you for the patch.

On Wed, Jul 15, 2026 at 04:56:07PM +0900, Myeonghun Pak wrote:
> cio2_pci_probe() enables MSI with pci_enable_msi() but pci_disable_msi() is
> never called, so MSI is left enabled on the probe error paths and on normal
> removal in cio2_pci_remove().
> 
> The IRQ is requested with devm_request_irq() and freed by devres only after
> remove() (or a failed probe) returns, so a plain pci_disable_msi() in
> remove() would tear the MSI vector down before free_irq() runs. Register it
> with devm_add_action_or_reset() right after pci_enable_msi() instead: devres
> releases in reverse order, so the IRQ is freed before MSI is disabled, on
> every error path and on remove.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 986b9afd7c..3f738ca681 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1654,6 +1654,13 @@ static void cio2_queues_exit(struct cio2_device *cio2)
>  
>  /**************** PCI interface ****************/
>  
> +static void cio2_disable_msi(void *data)
> +{
> +	struct pci_dev *pci_dev = data;
> +
> +	pci_disable_msi(pci_dev);
> +}
> +
>  static int cio2_pci_probe(struct pci_dev *pci_dev,
>  			  const struct pci_device_id *id)
>  {
> @@ -1707,6 +1714,10 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  		return r;
>  	}
>  
> +	r = devm_add_action_or_reset(dev, cio2_disable_msi, pci_dev);

I think I'd do this without using devm_*().

Alternatively, pcim_enable_msi() could be nice. There would probably be
other similar functions that could benefit from similar wrappers so that
might be best kept separate in any case, also for backporting reasons.

> +	if (r)
> +		return r;
> +
>  	r = cio2_fbpt_init_dummy(cio2);
>  	if (r)
>  		return r;

-- 
Kind regards,

Sakari Ailus
