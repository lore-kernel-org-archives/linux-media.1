Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556932;
	b=qvSe67RlrDRS7qp00+gtR5c4axE76k2QDpq2p/eEo6MLCXCyJZcZXRVUnpAYDLPFmPj7
	 lwJ+pKObpuIyQHERKTDeQ9nKQRkxzqviiqJxH+tUGwqgRdLhZPTn/Q17zrz8qOKWg49vm
	 JsYizGY5J3BaS9Tb2ukg4TTbYeSqmRKE/I3DySsl66FWaBF72JVcn2BgU6SRPzo21Gl+i
	 1L2Gx2YVWqn1I13hyjx+nYMZ+Pqcje0gl5rSDUJ2L61y4EfLFQFVE29JSUS/aSZouMTew
	 cpCAbDTCJOc5HhXQPimgesYYxMktUkUyxWiMepad+Q/tb35/UIsqu2p+Lrg57EfI2HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556932;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SI9myodxI5op0bUXyzvYvOe/rf6XxHe1YW4cLjTNo0Q=;
	b=UdcP/avlAKxNJnsbp2lagZ91mGwRhkoSZDChKZ8MsbtzK9kicfvYWGsgDqH/BqvqKPFR
	 ENN5D2GKvt+uTk8gm+S4rn3gOew3zPbosKUVtl0Otpr5D8XrNYLKmob4dYFd16XhvQbcF
	 4uP4dCDPJlsTNz1uOvE0xfsx3/zNJA/J3v/5/6K55GbhkAxv+JZzVjoWwJ1uUH3PmxMwV
	 aYBfkavb8Kiko8rcVTAZPbDSpavAlKORdQ7P0MpBF70XmRR8QYDCQxlIbBicj+OyZ0iiz
	 KRRsFHIBqwLY3rRDwzqJCNwZg5C3M5WANH7aJexmISms4/E8wCCz8rP8tZtcXidJcAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qo2efBzw;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE5D606A327
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE5D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qo2efBzw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794556932; x=1826092932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rLSF8axmvi3l+Zos9Vkpw3r07c1KVLw2WhSpllqv/GM=;
  b=Qo2efBzwuCtZ6iHradPJlMIXDX2iTsztGLBsI6FPtB1vN3hYtaMqDgYV
   E847DeGyHVE9WVaG47sorgTdfpaxJ3lK+AYcBLcBejBz6ufv1DqITAcmX
   Gz7CAhcGBvElt9ZnQv2B9wO/wCdoaBxTPlMZZJhG5atX9PI5y6Z/cbx5w
   zocD5gzhrev/RdXzn0FZXncUenQxAUvbTcDTPgyqi1eg4Tzhe3eVPBLju
   o/rCgUtGnWN/XjnaC2hbQKQmGG51zjltM6XrNUMqWYJxBL1XVlNP/Q9Ct
   zvYFceUdJZR9dLJHqLBCiSGzHCnPCu/+d2F/lwNGNBuFSbjOgyv1Y22A9
   A==;
X-CSE-ConnectionGUID: IIq97t/aQdSvnIgy090CAA==
X-CSE-MsgGUID: MizK3D9wQ0axATY75IU9MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3382737"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3382737"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 00:02:11 -0800
X-CSE-ConnectionGUID: 4gXQtmqNRg2wO/lHGt0PXw==
X-CSE-MsgGUID: agmRawXtREOWbe+ZhG7VdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8717321"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk) ([10.245.246.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 00:02:10 -0800
Date: Fri, 13 Nov 2026 10:02:05 +0200
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl
Subject: Re: [PATCH 1/1] MAINTAINERS: ipu6: Change Antti's R: line to M:
Message-ID: <avbD_WatwnDNZtEk@alaakso-desk>
References: <20261109114657.2262-1-sakari.ailus@linux.intel.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109114657.2262-1-sakari.ailus@linux.intel.com>

On Mon, Nov 09, 2026 at 01:46:57PM +0200, Sakari Ailus wrote:
> Make Antti a maintainer of the IPU6 driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..e13bca12b6ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13541,7 +13541,7 @@ F:	drivers/staging/media/ipu3/
>  
>  INTEL IPU6 INPUT SYSTEM DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:	Antti Laakso <antti.laakso@linux.intel.com>
> +M:	Antti Laakso <antti.laakso@linux.intel.com>

Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>

>  R:	"Sapre, Sarang" <sarang.sapre@intel.com>
>  R:	Divyamani Tripathi <divyamani.tripathi@intel.com>
>  R:	Manik Bajpai <manik.bajpai@intel.com>
> 
> -- 
> 2.47.3
> 
