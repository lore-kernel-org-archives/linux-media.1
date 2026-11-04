Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795295;
	b=Lx5YbNEJ1oC6d2nOGmdSHV49qAZ42qxMDciQPEtKop5oxnMqhjj/x6T6sAnrziiwkeNM
	 pHSI7pVrM4qQP1HhOwFEoQlOS4m3QgfXjp8t4aM2LxTStcL6yI99e+Z/YjiBsfRRQL3Id
	 zp5yBC+Mkd8y5vbBBA06RxBpZzFwzkBeZx2zw2oWaQWyW2WRKPJ6ioP7J102xQhXrGVfM
	 RtL8XKgy43Fiy6rvPAABzkXMFD0jhjIOO4lH89aVpQ9XJP8sGqJyZNsELc6WyQq5nX4gK
	 EoLZGJBIUVM/AjASmYLweOPpgn//urOYSVBGTiA9J0ptCQFyi4mYiOTRLECcPe723Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795295;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=krhc7PtQiM50MSPlOX9YnUqkUhdpGOzGmN8UWtWfgAQ=;
	b=niJQeEiyZqqXJ5q0dPeoKhGgcvomw2ACWTQu0V4bnU4mWkgnHJf8AfwdLD6DZgtOvEan
	 EfirEQkig+hK8l9sAdxNd7CZPTQS/B1K5src9I4vhyULxVRx8DRqLfJxyO0Jq1duYUqae
	 Uaw3fQOG/kuNlG1Qg0mi7xLR21hcpj2tXyMdPZsH/ScA5TvJkXGN26k8XV9qq9T/YdavN
	 brjWPdBy/kvJ2il8eXH0iqYJq5F+gXDN4chNOwjrK4kvtd160Eq+ZPNd92QFheYwvsSKS
	 TfAs8kcuAmff4JXhZRlEarN0QdUXGSvD9v3lqobsm7gBPTqR8ql6UwZ1+FEhOuAUhEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e+eip4Ut;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7E1606A326
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 12:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B7E1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e+eip4Ut
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793795295; x=1825331295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=utXHoIUoRfrM/Lbi3Ec+DoUj7LBT6z9NYqxcrrPXpSc=;
  b=e+eip4UtgA1nxTVNlfbwsRMd5PlOwmwAHZqBxIka3TGL7EeYMX12XvpZ
   RSLI6Bx7c5NMpfgGNRzTQJbdiYM4Vrz2u7R9CcD8TYhPoligu76N/PWkC
   AXwGSQ4LazK3AT2iuCBRIPFehmaHZvd6tjYHft1yl5LwOYkxJtiZP5xdw
   e9Hw3LDpy/ZLGWGVgm7iyECaJvcwNsKOZHg6NBbusjLevdRAafLMfhJ3J
   lSVxHwq9/9AWbLWqDyb+5IY+2rv8JXDZC1EzFLC2cvA4WOrK/5jP0285U
   OMXaL3hzXJry4w5s+k/P2rQmxUl4OeTSp19I9p3IlooHptTmTbkY4cUYH
   w==;
X-CSE-ConnectionGUID: IVIfrf+cT++8K6DK6XX+5g==
X-CSE-MsgGUID: XPHlDt0kRwKSBBDRqiVGxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2650293"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2650293"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:28:15 -0800
X-CSE-ConnectionGUID: IELhnaRdQCmSZnwnDLTwYQ==
X-CSE-MsgGUID: zv0jFi6FRBuWZMZMurMWNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7025107"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:28:11 -0800
Date: Wed, 4 Nov 2026 14:28:09 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ruslan Bay <ruslanbey@proton.me>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 12/12] media: ipu6: Enable IPU4P PCI device
Message-ID: <ausk2Z-rXqAOifCK@ashevche-desk.local>
References: <-VmuiglzUKRQZr-LsGrxgUOui_lD6A5MFZSUaqydvel67SrRKztah31JBIbpXna3-DHv20o_UoRPGoRRaM8JylV21MwjO-VMYJk-TuSCD34=@proton.me>
 <aury3n59VFnmKprr@ashevche-desk.local>
 <aur4CH6Fs-N85xVM@kekkonen.localdomain>
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
In-Reply-To: <aur4CH6Fs-N85xVM@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 11:16:56AM +0200, Sakari Ailus wrote:
> On Wed, Nov 04, 2026 at 10:54:54AM +0200, andriy.shevchenko@linux.intel.com wrote:
> > On Sat, Oct 31, 2026 at 12:39:09PM +0000, Ruslan Bay wrote:

...

> > >  	help
> > > -	  This is the driver for 6th, 7th and 8th Gen Intel Image
> > > -	  Processing Units, found in Intel SoCs since Tiger lake and used
> > > -	  for capturing images and video from camera sensors.
> > > +	  This is the driver for Intel IPU4P, IPU6, IPU7 and IPU8 image
> > > +	  processing units, used for capturing images and video from camera
> > > +	  sensors.
> > 
> > Make the text user-friendly, almost nobody understands this cryptic text. It's
> > unuseful. On top it's inflexible to the further possible expansion. Compare to:
> > 
> > 	  This is the driver for Intel image processing units,
> > 	  used for capturing images and video from camera sensors
> > 	  on the following devices:
> > 	  - Ice Lake, ... Lake (IPU4P)
> > 	  - Tiger Lake, ... Lake (...)
> > 	  - ... Lake (...)
> > 
> > As you may see the user who is going to buy a laptop may have a clue
> > of the Ice Lake and other code names and zero understanding what the heck
> > IPUxxx means.
> 
> I guess also the original could be improved; Tiger lake doesn't necessarily
> say much to the layperson anymore. I'll post a patch, IPU4P support can be
> added on top.

Thanks! I will wait for that update myself as all those IPUxxx is a spell to me
which I have no understanding about!

-- 
With Best Regards,
Andy Shevchenko


