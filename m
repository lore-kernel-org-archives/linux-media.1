Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E84766B2
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760240; cv=none; b=VyGMPbdblK/Ondl2Gu63zGqUnruh4up9h9iZYojzx8d5eSKy/fn4KoC0IpfxsYcu9NooGlAuWMRm4Go+x4Y+8c8nc+mtzg5E5taqfAH4eOcQnAdQRRTb4IrDrF8hq6obGFEJHHpaJN/UwBKyrRiiDWOsjTsa9IuLuLY5WoZVq7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760240; c=relaxed/simple;
	bh=PvOIaFlte4QutlBe2bYoSTJaO+lLtQDx6E5m8A+UQ3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7sL9MGX3Bk/1FpKUsj9dgEpPfZNmGjnzYajYN3hVBy1x2bk3+Nsndm7QimrVGZIxWXOWCe9ZO9dMjffcWNJ87tt89MuGXZtn3NhSo/cGDP5knEg4KUN6+TtbI7r5rveEfPanEV47amwJkK5Ra5NXK1UorPjvYeaDjO67m4GAjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/KicbtC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/KicbtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790760239; x=1822296239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PvOIaFlte4QutlBe2bYoSTJaO+lLtQDx6E5m8A+UQ3o=;
  b=d/KicbtCSi32VuHVmEQAkka0LT5Mv5+phRF9illl6Kdl8J1IR/cGCkP4
   8Fb1E/S0bRX4A/cK/iwMRO9pPEhNAReoSS/RPlXSrejwCoDfXQtlhsKaj
   Gh+ImBLxpfu+XGMXco4jiUG3iJHZ8XBVqiKKSpZcLG8p23h0QmygIQDBN
   RQTNQcqX1gH7naPZU2Io74uuQpFzOHjYxWmZbJD4h0h2PbP+GKSKT7sgI
   ATwtkqL5372YlWqK0yWItt8cNSEkhJfiRpIo66zjmPs7mSoPKSvNHwCKJ
   5AaZR85pf7UULqUxUzoyQCkUg+1fXtahX8S98iVWTUmTV8poRV9RtpBCC
   A==;
X-CSE-ConnectionGUID: C0K9nxUmTSiqz+NB610pFg==
X-CSE-MsgGUID: foP4crW/Quq+Shz653fIUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90258636"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90258636"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:23:59 -0700
X-CSE-ConnectionGUID: nyIWo1YTQR2vUxAYyJIYhQ==
X-CSE-MsgGUID: ThZk8uKFQzeOP5Bhr2XceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275191399"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO alaakso-desk) ([10.125.111.150])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:23:56 -0700
Date: Wed, 30 Sep 2026 12:23:52 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Sapre, Sarang" <sarang.sapre@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: Re: [PATCH 2/2] media: ipu6: Warn if the active list isn't empty
 when returning buffers
Message-ID: <arzVKOdobIONAwwB@alaakso-desk>
References: <20260929105415.2516142-1-sakari.ailus@linux.intel.com>
 <20260929105415.2516142-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929105415.2516142-3-sakari.ailus@linux.intel.com>

On Tue, Sep 29, 2026 at 01:54:15PM +0300, Sakari Ailus wrote:
> The ISYS needs a reset when the active buffer list isn't empty. Warn about
> this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> index 2608e3b91acb..c9ecda158fd1 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> @@ -423,6 +423,7 @@ static void return_buffers(struct ipu6_isys_queue *aq,
>  	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
>  	struct ipu6_isys_buffer *ib;
>  	bool need_reset = false;
> +	bool first_buf = true;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&aq->lock, flags);
> @@ -448,6 +449,12 @@ static void return_buffers(struct ipu6_isys_queue *aq,
>  	while (!list_empty(&aq->active)) {
>  		struct vb2_buffer *vb;
>  
> +		if (first_buf) {
> +			dev_warn(&av->isys->adev->auxdev.dev,
> +				 "buffer list not empty, needs isys reset\n");
> +			first_buf = false;
> +		}

Could the warning be in the end of the function, in need_reset block. We
could save one local variable too.

> +
>  		ib = list_first_entry(&aq->active, struct ipu6_isys_buffer,
>  				      head);
>  		vb = ipu6_isys_buffer_to_vb2_buffer(ib);
> -- 
> 2.47.3
> 
