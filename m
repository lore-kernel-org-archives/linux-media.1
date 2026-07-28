Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF4D435ABE;
	Tue, 28 Jul 2026 13:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785245808; cv=none; b=bpdr24dNPM7HkEYDA5PDt9SNH9LVma/ufjVbOd9hXJY5txFWjSYg0bUuznp7QTB5iWNORLdLYZGW49jt/BNlOUswAr/E/vKv2PEqZGF98jxr/+/uecLmHl2wReXpVNciRLeEnc9p64lvQOtcj0zfTbB1fJIqMQIPp/zst1a3/yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785245808; c=relaxed/simple;
	bh=2WJ3sFsb+BV9OHt83kfTwRJadsv0DzZZWxcALcwjQjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1cS78hs42/v/OvTbQ7pNi5k0tRQsRnpCjG5R3R7bdfj1Kqk2Q+rWEsf6ct6jQI04pnMv/lHwzMQUKZY0fQx+7WVedjwPDcyETH/vruTCWyNZ1awQrQmQPtMGdXHiyKRvNqGF7G+9nHCuRg+Myq0xDN8y6F9GByc6B/bCejZ7eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3rllCCU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3rllCCU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785245803; x=1816781803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2WJ3sFsb+BV9OHt83kfTwRJadsv0DzZZWxcALcwjQjc=;
  b=C3rllCCUybx/qbuLiGWhJz0OpohOzTrBt4GZyQW72Nwdm2iyQwBzwXlD
   3pbZjmnjQyMYI1xs9vWfvKdxwl3YIx3HZnFC9vfxzFcuHuGO695q/zcPp
   eSqI1b529lIq5u1pSyUoo1Ao7+7n+nPgINz8zgwMNq+TDRbL/OKwjeCST
   9jj96iK0GJ3xIv7DD8RfUH3RvgQcYzMDFwSNGbcoPxT8CpRFg2U4FKaGW
   Kf4jBd7quJutPMm+V90udO7l8n1hHE9EEf6W2Uj0ij6Yz/0G8qV4qVMN1
   ge53LHHuVPqah19UcLvC2qhYI8Ua+tokB8ArHFCegWIk9VRjHkRjuHMfZ
   A==;
X-CSE-ConnectionGUID: nfas7s6LQ1uBxA4Z0SL48g==
X-CSE-MsgGUID: yc9maN7NRgemxTJaEAYh5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="111374461"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="111374461"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 06:36:41 -0700
X-CSE-ConnectionGUID: HS7nxjpcSRO5VjlnZarg7w==
X-CSE-MsgGUID: Mlk0RHd6SUCl/7/WSaSlBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="256355661"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 06:36:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E7E57121BFD;
	Tue, 28 Jul 2026 16:36:38 +0300 (EEST)
Date: Tue, 28 Jul 2026 16:36:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	jai.luthra@linux.dev, mchehab@kernel.org, mripard@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	r-donadkar@ti.com, devarsht@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH 0/2] Support RAW12 bayer formats
Message-ID: <amiwZi8OxcybX0zO@kekkonen.localdomain>
References: <20260625151756.221096-1-y-abhilashchandra@ti.com>
 <178429421685.1426769.3663231526402032657@freya>
 <amhMIbajTSSuAcQ_@kekkonen.localdomain>
 <178522144079.4139729.4172706447226166553@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178522144079.4139729.4172706447226166553@freya>

Hi Jai,

On Tue, Jul 28, 2026 at 12:20:40PM +0530, Jai Luthra wrote:
> Hi Sakari,
> 
> Quoting Sakari Ailus (2026-07-28 11:58:49)
> > Hi Jai,
> > 
> > On Fri, Jul 17, 2026 at 06:46:56PM +0530, Jai Luthra wrote:
> > > Hi Abhilash,
> > > 
> > > Quoting Yemike Abhilash Chandra (2026-06-25 20:47:54)
> > > > Hi,
> > > > 
> > > > This small series adds support for RAW12 bayer formats in the j721e-csi2rx
> > > > and cdns-csi2rx.
> > > > 
> > > > Testing details: Tested on j722s-evm with v3link + IMX390 downstream driver
> > > > Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/805ec4662b60ad925e979d55a9515f89
> > > > Testing Branch: https://github.com/Yemike-Abhilash-Chandra/linux/tree/RAW12
> > > > 
> > > > Jai Luthra (2):
> > > >   media: ti: j721e-csi2rx: Support RAW12 bayer formats
> > > >   media: cadence: csi2rx: Support RAW12 bayer formats
> > > > 
> > > 
> > > Thanks for the posting these, LGTM.
> > > 
> > > Sakari, 
> > >     could you please apply this if it looks good to you too?
> > 
> > Is that an A-b: or R-b:? :-)
> > 
> 
> Ah I wasn't sure if those tags could apply given I was the original author
> of these. But if one is necessary you can add:

Ah, I missed that. In this case it's not needed.

> 
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

-- 
Regards,

Sakari Ailus
