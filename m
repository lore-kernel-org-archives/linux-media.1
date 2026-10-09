Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C64C9DFD
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 10:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543568; cv=none; b=g8rAgv1XGkXRB5Xtg8WkHbJSow+AJYGD1VfxXXZVSkg2atQk1KKe5VPuiGwIhlyWhrcRcOXFnCPYBlcZvUGNDi9TwNvkNGN1vzLklQ6I3reNFV28kj7P0SLgKOZ4MgKkvbg52j5clnRpDyB/eh+qI9dY31AtoNRXgYNuTvhorWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543568; c=relaxed/simple;
	bh=3Wf+oMX/VfmI/Z1Rrm4K+nyK6xtJvYyvqK1jhYz2u+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6S1IgQPWs88o9DGRTxS935OuZDgbIDbvJEIGcYQ8qGUDPpDnnX9v0ftMEZ/9A78Oo8Ze5PTeMhZs9Tm/crfGZTCGDOJ/3DAiFuWFwTyMf9zR+9FheH91SuanWNdl6huyse+ffTS7wWNCHa3EkREKsUIIYJDeD9dvFz3hfeEL8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWbEf8Au; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWbEf8Au"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791543552; x=1823079552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Wf+oMX/VfmI/Z1Rrm4K+nyK6xtJvYyvqK1jhYz2u+0=;
  b=dWbEf8AuDVk9Wtbz4BfR2kim9tEGoq2/LvgNL6CGly3UvGjgS7F/M8dT
   5FWxv4zAXofV9Xc3GsfG5SsBlNjnznavNMddizUxuJzKnFqQySxYDNfAz
   VxQJaXRSzxBCSszGzc19TdXe6uFQMM2cQ6vTIe2sZtPZ+HzYXTaPKFq4l
   K9jIlL4XtCigsa4coBzrWsdl0Iv7Pug01Uq28WgENDJNXTvK+p4DAitpN
   vMU5uRwnPGYCSWlOpkWmhO7fJ9oPwh+RKbLhloMH09QTvBOImD6NOYcbe
   oDmzn6AfaNMpISE6YuQ5dVnNyKjwACo90alq5gdnGFEhM4OOgClOXSr0R
   g==;
X-CSE-ConnectionGUID: /mdzBlIVTrqG8yLccOcnKw==
X-CSE-MsgGUID: JY7vdzOGRJSD5Ls2PGahwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="342049"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="342049"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 03:59:10 -0700
X-CSE-ConnectionGUID: ihTDOOi/SHeN+F70ZDysgw==
X-CSE-MsgGUID: kalX8OfkRA+YJymLIIQBXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="298308"
Received: from rpolaka-mobl.amr.corp.intel.com (HELO alaakso-desk) ([10.125.109.76])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 03:59:08 -0700
Date: Fri, 9 Oct 2026 13:59:04 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: Re: [PATCH 3/5] media: ipu6: Prevent starting streaming if ISYS
 needs reset
Message-ID: <asjI-C0a13tS567g@alaakso-desk>
References: <20261008085247.798156-1-sakari.ailus@linux.intel.com>
 <20261008085247.798156-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008085247.798156-4-sakari.ailus@linux.intel.com>

On Thu, Oct 08, 2026 at 11:52:45AM +0300, Sakari Ailus wrote:
> Fail starting streaming whenever ISYS needs to be reset to resume normal
> operation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> index 6596833e95d4..978acbd72e63 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> @@ -481,6 +481,11 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
>  		av->vdev.name, ipu6_isys_get_frame_width(av),
>  		ipu6_isys_get_frame_height(av), pfmt->css_pixelformat);
>  
> +	scoped_guard(mutex, &av->isys->mutex) {
> +		if (av->isys->need_reset)
> +			return -EIO;

Shouldn't this goto out_return_buffers path as well?

> +	}
> +
>  	remote_pad = media_pad_remote_pad_unique(&av->pad);
>  	if (IS_ERR(remote_pad)) {
>  		dev_dbg(dev, "failed to get remote pad\n");
> -- 
> 2.47.3
> 
