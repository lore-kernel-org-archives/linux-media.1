Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616086;
	b=VEHE/bLojzgQRkJkd7yCO2S38VVAYtgCCVt1aqv/XKvbdC2N+sPAbY61ZPTlXPrUsmSO
	 9o3O6NpExlm3cmV6eXzpaYcZXz2EZD8/MepSR+OXegi8ls2yOVNVH43pBf1Jvk2g3LG40
	 g4DniwNlps/LkyW+v1mZteTPgdFT1Ug+Fy/XjC1wPjqCOAH2ruHcreUG4wtZA+l6wPJ9Y
	 kuh2F4s3yHsmBjCBQAJDm0q4vn5l4OvqriDUZBWSn3eCC/BAJTL8zbHtbbDksiJS2o/7y
	 krxCuB5+eB8ZpgnGDJCh8jLh0xWxE+vLMjhut33lg2y0W2342a/bIaGEqfM4pDztOUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616086;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=XwSPYCXxplWmbhq6NLBfe41SiMXBMbzYNG3O+EbjRvI=;
	b=u8CDTh1RjYJrWfldf/zoaeLtctwykZffYllfRL6PizQm8vUdFKc3c11+p3Hd3SdZfk4D
	 j9JslDUtJrt780S9mvy2XUvo6RtaLbvkBy9G58CABDykF6QOXzzA7P7C/0JLltojGCElG
	 tGtx0cKkAKKHa3mmy16zLZQ6/g+kOGq6L1ExO+Kfq8wdKKZTyBw1ILWy5Wnvy8O24uBmF
	 POIe0gC0Fa1f5Whu/009YbsRuAfHPaRt3HjKsEnAOnJSLoDLtqmEzZcAAbuc1lLGP/U02
	 leI0op0xYoQ5hQoQhXb2ndoRAZxmWPcftbq2nYR3MZlQ/0r4LnE6squ5oIUupHi2aTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MKG+PAAM;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90A4606A332
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90A4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MKG+PAAM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793616086; x=1825152086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TfM099kuzotFx98+kPT5eAK1bBOyX/btyg47Zpee2rU=;
  b=MKG+PAAMCGhD5uR7zf55U/TRWNLmnKzS0IU52TyuIhoFXCtVeyVZdJi+
   vr7pHkm21KgQ6YzTtyQEU3Et6lX2UcmArhynhhqU0thFnbjmuLBoM1cL9
   ka/4KVA+pdtet3KMsEWFfFMfSNAr+R/S4BloJMVQDGF2JPCLHNlyWMPEu
   ny5oclIeXX4nhXHd2pUWgqhXiiT+lspvDQVt61BibMRIw67WmKZ1n7Ya2
   FlP+Fc+I8J60hFl1AMAihKh8bEOvFTTfITMAWCEujkhHfXartAWMOWfWl
   obAeQ2y9oUWIggwNwUnx3Ur39XJ/qOWYdzJAiAjU5Ctna7BS9mN3eI19M
   w==;
X-CSE-ConnectionGUID: IkOlkAboSTq2CqTeJpiwog==
X-CSE-MsgGUID: eVtEG1laS720+rJ9u6guMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2196939"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2196939"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 02:41:25 -0800
X-CSE-ConnectionGUID: NbRobPQdSjG0vseeaTwpFw==
X-CSE-MsgGUID: +ToXUzYfRemN/sJfmE5aeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5911670"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 02:41:24 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CF301121B6E;
	Mon, 02 Nov 2026 12:41:32 +0200 (EET)
Date: Mon, 2 Nov 2026 12:41:32 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 00/29] Rework frame descriptors
Message-ID: <auho3AhQFFaV5tNr@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <CAD++jLkj_3HNY-k5gJZjYX82KWgmk1_EDCQqHcozWynkjTLCeg@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkj_3HNY-k5gJZjYX82KWgmk1_EDCQqHcozWynkjTLCeg@mail.gmail.com>

Hi Linus,

On Mon, Nov 02, 2026 at 10:14:52AM +0100, Linus Walleij wrote:
> Hi Sakari,
> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > This smallish set makes frame descriptors dynamically allocated and
> > implements a single-entry frame descriptor based on the device's format,
> > using a new helper called v4l2_subdev_get_frame_desc().
> 
> The smallish set has grown ;)
> 

Yes, it started with just a few patches. There's no easy way to limit what
requires changing though, so this is the result...

> Do you think you could rebase this for v7.4-rc1 and post soon, I think
> with the fixes you reported it should be ripe for merge by now, so
> I'm eager to review and ACK the stuff.
> 
> There will be bugs but I think they are best resolved in the -rc phase
> where people can test it in linux-next on hardware.

I'll post a new version soon, likely on the next week.

-- 
Regards,

Sakari Ailus
