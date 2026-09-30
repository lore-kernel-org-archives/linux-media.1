Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA00353A96
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 09:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760789; cv=none; b=WC9NCJpVvVHEU5XVdwSrXXe7Uo2bwXVw3mV2rfMSYmbwkCl3ljWnN2wzYCSl4B8aMI0VWXnopYKreLmsFiDYadb6pm887bjD57bA98wlymY8xDjuJFQOv5YRk5XRDh4pGeTPwIDo69bVPFDisBtCSy1pJaoFxVrpWZRWperq62U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760789; c=relaxed/simple;
	bh=XC89cUmX9D0qEHVQEIkHs3hF/5+20GnAqEQhHwqzA6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcL9nKvUAPjWPrdlXhIi+J4u0A38F2O3ui54qIGEbA8MTjs4+XrUaZeFFWielFVC68LDik8EBsvdPtBm4ZZh+ojrcvxckr3XA2p4uXihoxIgdZ4Djy1yuhb2EBOXLlV6RZRwTQ6jCD82bQ1Z4HClvOpcotVnxsm68PiSLLp40So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Blmebjim; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Blmebjim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790760787; x=1822296787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XC89cUmX9D0qEHVQEIkHs3hF/5+20GnAqEQhHwqzA6U=;
  b=BlmebjimdHLYeJVpTn/k8VBBm9Qa8vsJNVePpWRJ/qNNeFV+z/UobRIB
   ksUQ7GJFFeuf8OYCiZNohNYJGVJNvG73EkWJ3ejs3onmmWFnbMr+p5DRv
   11neP/BiT4ZS34TXyrHIhpj2FtQV0hpkXoauEA9+VVOOdA0RXgbjfvQk3
   NlWKDJa0mpvaR+tf3xhQTI6kbhhhMKQWthe5foxs9XWPJpvp1owo4N3tu
   DF7RfabBhXVCtWq19EaAz+M5RbrzaGNPZ8R9ht7U4puhZInflsTH//q+t
   +JQuFHuFZl+EwFq58y85y794LcouuBMV2a/UcUCMUR/4F30k9kVPrsQyH
   w==;
X-CSE-ConnectionGUID: HwQud7XkTjCsvn6nqQ+oBw==
X-CSE-MsgGUID: 5DjEPEmhSNipYGC6nOXj+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="108981493"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="108981493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:33:07 -0700
X-CSE-ConnectionGUID: xpfyZzisSSSBSXPz1O34GA==
X-CSE-MsgGUID: 7FE76aNHQLOdjF3hSUqKlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="301896412"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.109])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:33:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A1C7811F8A5;
	Wed, 30 Sep 2026 12:33:08 +0300 (EEST)
Date: Wed, 30 Sep 2026 12:33:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Sapre, Sarang" <sarang.sapre@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: Re: [PATCH 2/2] media: ipu6: Warn if the active list isn't empty
 when returning buffers
Message-ID: <arzXVJXoKjE1dLZb@kekkonen.localdomain>
References: <20260929105415.2516142-1-sakari.ailus@linux.intel.com>
 <20260929105415.2516142-3-sakari.ailus@linux.intel.com>
 <arzVKOdobIONAwwB@alaakso-desk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arzVKOdobIONAwwB@alaakso-desk>

Hei Antti,

Thanks for the review.

On Wed, Sep 30, 2026 at 12:23:52PM +0300, Antti Laakso wrote:
> On Tue, Sep 29, 2026 at 01:54:15PM +0300, Sakari Ailus wrote:
> > The ISYS needs a reset when the active buffer list isn't empty. Warn about
> > this.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > index 2608e3b91acb..c9ecda158fd1 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > @@ -423,6 +423,7 @@ static void return_buffers(struct ipu6_isys_queue *aq,
> >  	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> >  	struct ipu6_isys_buffer *ib;
> >  	bool need_reset = false;
> > +	bool first_buf = true;
> >  	unsigned long flags;
> >  
> >  	spin_lock_irqsave(&aq->lock, flags);
> > @@ -448,6 +449,12 @@ static void return_buffers(struct ipu6_isys_queue *aq,
> >  	while (!list_empty(&aq->active)) {
> >  		struct vb2_buffer *vb;
> >  
> > +		if (first_buf) {
> > +			dev_warn(&av->isys->adev->auxdev.dev,
> > +				 "buffer list not empty, needs isys reset\n");
> > +			first_buf = false;
> > +		}
> 
> Could the warning be in the end of the function, in need_reset block. We
> could save one local variable too.

Makes sense; I'll do that for v2.

-- 
Terveisin,

Sakari Ailus
