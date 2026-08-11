Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0528F2236F7;
	Tue, 11 Aug 2026 07:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432937; cv=none; b=lg5habLDUIdjgrKb+Ke8cwzkkVWBGTjGIJGHmP43ZEzI3XrAOANkxVmdhM5qLXgcpYgif+e91XDdO+JVJ3xmYBWLFPOMJhYBj2dDASEjC84fdonh+QISW6gov9FgiKmdaMxgzqYXYzmHjE7I6vyjZC34wqnU3VDbMJ7v0Zr14ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432937; c=relaxed/simple;
	bh=JLlU5oRnkgR8aVxl8ygkmQroc0IwK5osiTm0HDhbWFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yj+e+3M+qJcQWBUce7FvkPWsyRleCmoBc2f0RNxpTUnv5x5a41i6MF5stfJqIEjRXruKkLikVBtsBue7w3+hTQCjEILRRvSTm089h+Lss2oEEd184DwrHDNgfpc8ps8cmhy2UsOcpls8e6uHlKsgTQ2vXN52kl1Wwt02/bnwKYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORVluBW6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORVluBW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786432936; x=1817968936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JLlU5oRnkgR8aVxl8ygkmQroc0IwK5osiTm0HDhbWFs=;
  b=ORVluBW6Q7O04vz+2Ebi3ZSi2xbBwvtMqAvj+vLu9556AsCUY9Vkj8U0
   wJCC+FnmQDYilbusMLcympm8EqCGTqL+e91FYSUn0tIHv/bOOT3yr2h4U
   w/NMqcaXo+OI0i6Rwt+tp8o0T0JEWOV7Moub52q1r44wIH6weWzPrdf7M
   DqAO6gro26EJgCny8NArHc/gZuMV8J7VsyKDyTNJD0DPEHhXVH7RsXWqh
   GCeaomtZ7ypF53CONIaLE6doiMRMDcVFWzBfJ/MBkBBAhClN6mfcJjfON
   uKuCAKwZ2GXJUuJyJ+QwMe7SMs753SIeUTRYZi8fWZcB0ZH6XNKqRrsj8
   A==;
X-CSE-ConnectionGUID: yWCND920QG6t+gMkP4FOCQ==
X-CSE-MsgGUID: oMCTLGTTQn6iny/DU0YLHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86891842"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="86891842"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 00:22:15 -0700
X-CSE-ConnectionGUID: Je+aLChNQ2uDNY9JCowjBQ==
X-CSE-MsgGUID: YYg3NeKKTYeL/DtAULIMxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="301480452"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.215])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 00:22:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 853C511FC6D;
	Tue, 11 Aug 2026 10:22:11 +0300 (EEST)
Date: Tue, 11 Aug 2026 10:22:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?utf-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: Re: [PATCH] media: ov5640: select the MIPI lane mode from the
 endpoint lane count
Message-ID: <anrNowQWOaCkh4W1@kekkonen.localdomain>
References: <20260811-ov5640-1lane-v1-v1-1-79699457ce13@gmail.com>
 <anq5HzmP33fqWYEO@kekkonen.localdomain>
 <CAPwA33LJsSr3w_Vfc6wd7VXNBW2fjrn2zaVxDGB_RfJ-FRrdHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPwA33LJsSr3w_Vfc6wd7VXNBW2fjrn2zaVxDGB_RfJ-FRrdHg@mail.gmail.com>

Hi Jason,

On Tue, Aug 11, 2026 at 03:18:01PM +0800, 楊智成 wrote:
> Hi Sakari,
> 
> Thanks for the review.
> 
> > I guess there wouldn't be harm from backporting either.
> 
> Agreed, switched to a plain stable Cc.
> 
> > How about:
> >
> >         ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
> >                                on ? 0x5 | ep.bus.mipi_csi2.num_data_lanes << 5 :
> >                                0x40);
> 
> Nicer, thanks - applied, with the lane count in a local variable to
> stay within 80 columns.

There's no need for a local variable, the above remains within 80 columns.

-- 
Sakari Ailus
