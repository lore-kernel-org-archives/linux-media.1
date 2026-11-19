Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090324;
	b=FcYwuJnZIMAsIe5m3aQ1lvVRGKi7nFGhEOSmKj/Ufi+3MURA950GtEhoB25gr8KuoKSy
	 m6hwVKVpoxkt1MZPqcnz/Egw3AU1jde0f0wt675wl9lr9svbX4jzMHnKXruSPsCCBFH2b
	 LOJe9laTwAtyyquPETjze2GCgPXRyGOzWP/ovc3SMe/Zcf/ZuSug9GJA+2XfTV9fg+l4H
	 cM7lIaDOlKaUeDPiLtr+3JAzAVTepZaFueecEBHGwl/1qQodz5+ko3EX8uaUIIpqCAdaY
	 BjbyERvILxhKponjoQLbfD24Kk9ORrJnqmsH1f2WVP3xHAy5BAsuTwvm1Km4p9MNZ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090324;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J/aH2sMv0KdZ1mHDgGlbZ8LAJiyxrg8LmBXp3A+DE7o=;
	b=q9krvF6b/CbjsR0QFT0nrxbQl3e/BfswQDRU+0pdjHrL7/HfMzbmwy618pOBaMrIvNfo
	 UtW4iP/JfhjG9jIP8j1F3BX0Ki4RmeHs0BzCMGc2/DGncnUpSK3pUmiaTlyeWTPhD1t6h
	 hml/DbTa6anRY6JeeOKaBIa5joz7Qwd0r7b9mqpUOxJOf0VuZwX2gVenKXrkVpmONic83
	 35za/r1jkEasNbGUXXuBh+PsHhI82/kHxOHl1vI0ptO42huhTJiNTvvqnN67aQMfzIrSh
	 BVXRXH8U8ys71XnI3ZzQ173ho3QV/FbxppB3us7+QBt2jXaxavDhqRKKt7nW7tgc1Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KXrGzAgm;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC6606A326;
	Thu, 19 Nov 2026 12:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44FC6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KXrGzAgm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795090325; x=1826626325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Tp/LLe+nfOYMhD0KzwvJBujBxnHmuF2OB9ZHXLFAWc=;
  b=KXrGzAgmxna1sX/wQ80RvWf2EAhYJ2V9eyCqVfi2h7A69ZhgZDojEZ7d
   pp+CWwJ0Qdx+YkXPS1zoVEReQIwoVJX81lgYB+ySd1r3kzLiVaDBGg7PB
   bWdbKVbnlyCHcVCuaqc9kCHyBTthoTfPuiiGr/91EAAvgHFqYH9O/a45i
   JphJJls6iJmolNKEcMQU4Yw0gqOxlyRyFF7m1/RXsf4hMZRN+IQgELS0S
   QKcvMyMPGozoSCbvDuPM0OhAHo2VxfxVZBS14iA7Kr147B78pgUkeI7/g
   HqddlLrwjLXOHQWCxgZh/D/zss9b4Ly4bct169xwtt0xcwNfMg/+Ai5Hh
   w==;
X-CSE-ConnectionGUID: 708iL1rSTJGqOEbdaPUq4A==
X-CSE-MsgGUID: IWulqV85RUu0O2G9cUH/+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3785668"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3785668"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 04:12:04 -0800
X-CSE-ConnectionGUID: 10Mn+3bNRWaypM3GnRxMNA==
X-CSE-MsgGUID: U/lr4OXrSACy4SlCO1ULqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10413877"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.86])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 04:11:59 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 84148120FF5;
	Thu, 19 Nov 2026 14:11:56 +0200 (EET)
Date: Thu, 19 Nov 2026 14:11:56 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 0/5] media: Add support for Broadcom/RPi BCM2835 ISP
Message-ID: <av7njO6dZNzM9UFi@kekkonen.localdomain>
References: <20261118-b4-vchiq-isp-v7-0-b8c81d193abf@ideasonboard.com>
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
In-Reply-To: <20261118-b4-vchiq-isp-v7-0-b8c81d193abf@ideasonboard.com>

Hi Jai, Hans,

On Wed, Nov 18, 2026 at 11:38:13PM +0530, Jai Luthra wrote:
> Hi Sakari,
> 
> The VCSM-CMA driver (which this series depends on) is now picked by
> Florian in the broadcom drivers/next tree [1].
> 
> If the ISP is okay to be merged by you (and Hans/Mauro), we probably
> need to coordinate so it all ends up in a single tree during the merge
> window.

Is there a chance to have an immutable branch for these? I initially
thought the driver could have been merged via the stblinux tree but the set
also touches other bits where we certainly have changes to in the media
tree.

In any case, for the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus
