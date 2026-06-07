Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9675B31A807;
	Sun,  7 Jun 2026 20:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780864852; cv=none; b=AEa6sYQDcp/OmxAU5nOzdQvEAz++f6nEcXtpK3fhrPvER0ByJYCzuSxEsjpOl785FtGOEcelCiE1TWNst5c37h0MMvYt0OPNix+G/tu4cff/x5I2A7/vK9DO/OTCux1OIVaOk8OU9GeDr9jqAY/KDe+Xnrw1qlnnbJ6n7NodSgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780864852; c=relaxed/simple;
	bh=MCuCaxMm5fMgv7sJ6bd5b6Hof7oEz4cFEWX8cd5Eyzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BudUaTOSnPhCqHViBYO/PBcY3Bq6uDxIJ2uwC03Q2a9EjKxW3dB2Unx+c2Y7RiRw5WyN4mBPzOQgKoftI4OsuFf3dDixudRsTekQfGJf6wClc7Xfv7/I/qo87QMhOwg15fmFYP5j53T+r4Zg+VsRrBdYbZ8nCHUjnCkD4KFUpPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=No0q3k66; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="No0q3k66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780864852; x=1812400852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MCuCaxMm5fMgv7sJ6bd5b6Hof7oEz4cFEWX8cd5Eyzo=;
  b=No0q3k6666Sw/ySGXLzhoV39i+JTUOT4VKi7Vpzbzs2EbFvk4swu12so
   XECWDKGH/RzX/Ezhm/dWEE99CdJ7mzFTGR5i9Y2bCigTcEiFMkT4diY8c
   1xarRSfOubrd6fjJ14ac+R9i1MLjzyBil4eGdsZE7imi16oyZI9RTNuFS
   K0FOEa8kVD1j+AREPWDFbChWEqhT20jsAomEJiv61XoPfF7ZZdOmJu/k0
   Z4hkzsToi2HZt6WS9CoLZs/YxXxJE1yTeFzAOkdWku4FUJCHTPcEZBML5
   ftetszv7XgzgyMI4rdYc4cy/kr6ffakNzhsrofXB4rwBZl8SBJQ/fF0M3
   A==;
X-CSE-ConnectionGUID: ed/HFqPaTha7yWqQB5EQZw==
X-CSE-MsgGUID: rsi72iNQQamRogkY3z6BzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="104264939"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="104264939"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 13:40:51 -0700
X-CSE-ConnectionGUID: 5WEovMhkQZKhlD82Jaosow==
X-CSE-MsgGUID: aqow19rXQCK4uUnAC1n9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="250278836"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.101])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 13:40:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9973B11F894;
	Sun, 07 Jun 2026 23:40:46 +0300 (EEST)
Date: Sun, 7 Jun 2026 23:40:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com, hao.yao@intel.com,
	jimmy.su@intel.com, jason.z.chen@intel.com, ribalda@chromium.org,
	kees@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: intel: ipu-bridge: add sentinel to
 ivsc_acpi_ids
Message-ID: <aiXXTkvSyWfUIVt7@kekkonen.localdomain>
References: <20260607130853.55980-1-dennylin0707@gmail.com>
 <20260607130853.55980-2-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607130853.55980-2-dennylin0707@gmail.com>

Hi Hungyu,

On Sun, Jun 07, 2026 at 01:08:52PM +0000, Hungyu Lin wrote:
> Add a terminating empty entry to ivsc_acpi_ids[].
> 
> The table currently contains only valid ACPI IDs. Add a
> terminating entry to follow the common convention used by
> device ID tables.
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index fc6608e33de4..471a449f11f6 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -168,6 +168,7 @@ static const struct acpi_device_id ivsc_acpi_ids[] = {
>  	{ "INTC1095" },
>  	{ "INTC100A" },
>  	{ "INTC10CF" },
> +	{}

There's no need to add a sentinel entry to the array as the code working on
it relies on its length for the boundary check (not its contents).

>  };
>  
>  static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)

-- 
Regards,

Sakari Ailus
