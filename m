Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652508;
	b=AA/coDsYJGrUjYZi4plYIeGp7Yj8Sf0FuKo1txvTEyd8Xjd/4DoGPJLW6O+5nAjLXR6J
	 iwPbrL1LdqT74hTQSbl+QnvHJ189HSkJj4GTZky37mFlPrSZ5RJcDOQq5qxB2BnNCq8wM
	 SWH0HKlKWRvTuW5mFh5nMSuEr+/3pWfaHtSI87IKGC7Hv1mTW/kwr47edMymPFjJG0Utk
	 g1MYXvOL9lp1+RHt9lepvvMMEl9EbJ5y9hOYpgv7Jg3DgemkaFW1SeIqUXf2xjKmKnjnP
	 tJDb+DfT1A4uyq/jmohuohoiCBY5LaVpXdopSNPYH/0iGjBOL1mJ9mXKiAw+q9ExeLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652508;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=orDiWVPg3s/qHmM+0MZZ6JbAC6hD7atHU3NbfMRFSRc=;
	b=oaMVXLn0mkqhdy0x7TGFKLLk9SBv6e9ZIeAHR8kMuDWZR6BEcL+sKyIQm6BuRQQAhi8N
	 c9KFP/cMNutua2hQCndy2ZsPz121jf53mBEFFKJGPn8T7Sjk9hnbObGvoacuO3WDvyss7
	 WeETbVeZSrfEdwRpXuY2hAcgZR3EKBk6xTCiHxRoYfgFWdchHuqYk5E5Gz77TcEfs80z9
	 4f78INIAH7Guz4HxnAthKEIELtegrYQ2EkyE3+YkzKNm4RpKyQGEP6Wnrt3ldb31L2o8f
	 a4u5n9PwCHkPPQHIr1HsVtnl0DBTKP7kKbV2HbI8UPgfIPsnbogIFaIztpDeFSpsvpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQ+SWmyI;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0841C606A32D
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 20:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0841C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQ+SWmyI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793652508; x=1825188508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yn6AcCvG/ZcOCw+mFBXHxRXi/MCP9k94dFnfF9+qFmI=;
  b=cQ+SWmyIMaQ89c7rI+ozRd5bA4zZzIcSeqMzkDsT4f4fdoJhQ4qjko7J
   nsbcNCzbgAUn/UM6EL0cEv5Yy0ArUgQToMELt5go+jAQJel/Rbshm3mbT
   r9VIfO5SRa8wEbm2oCeNWi+z561prCarHBYBMaQuMN7LnwZwpakl3L4LR
   Y6khzYo7cVxXLsqvB2ekK5BFNr9dljWnATzprJSk1WRNgpJkAIVB2kX+j
   4UTaf3kixGHApHqM0JHpOlhsHP7qwseZ5opMegMb+sYloBEBihNm/TRYK
   RocW4diT78VX5pzCJNFR3dmO/1aAbJrkDgOId2xH8t2WPpnGxoZ8rY/eA
   A==;
X-CSE-ConnectionGUID: SFT48lEdQ9Cc9e+F/d7b0g==
X-CSE-MsgGUID: 8Z2f2dNfScqezRuuIxEjfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2241377"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2241377"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 12:48:28 -0800
X-CSE-ConnectionGUID: bvytLjWHSmy+MzvMu2yROg==
X-CSE-MsgGUID: jGUVndB4TEKHr19rXtMlKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6566128"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 12:48:25 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 76E5E11FADE;
	Mon, 02 Nov 2026 22:48:33 +0200 (EET)
Date: Mon, 2 Nov 2026 22:48:33 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 00/12] media: ipu6: Add support for IPU4P hardware
Message-ID: <auj3IU5FC2lejqa7@kekkonen.localdomain>
References: <2MQDQgaaKZ4HAu3U6zhMj_Muf_H8tsVGLh_CSXM_kxcTL51pE14U9-brGqLYwPPJfDXHog_jWWWOTgToPYLMVZN-KW80t9sDIlEw1uwg-FA=@proton.me>
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
In-Reply-To: <2MQDQgaaKZ4HAu3U6zhMj_Muf_H8tsVGLh_CSXM_kxcTL51pE14U9-brGqLYwPPJfDXHog_jWWWOTgToPYLMVZN-KW80t9sDIlEw1uwg-FA=@proton.me>

Hi Ruslan,

On Sat, Oct 31, 2026 at 12:18:19PM +0000, Ruslan Bay wrote:
> This series adds IPU4P support to the upstream IPU6/IPU7 driver.
> The IPU4 family includes IPU4 (Apollo Lake) and IPU4P (Ice Lake);
> this series supports IPU4P only.
> 
> Most of the groundwork was done by Antti Laakso in the IPU7 support
> series [1]. I added the IPU4P-specific parts, using Intel's downstream
> driver as a reference [2]. The code mostly generated using AI.
> 
> Image capture was tested on a Surface Pro 7 (i5-1035G4) with
> both the front OV5693 and rear OV8865 cameras. Test logs: [3]
> 
> Thanks to the linux-surface community and the libcamera developers for
> testing the downstream driver and sharing their findings.

Please use git send-email to send further versions of the set if any --
threading is broken in this version. No need to send a new version just for
that though.

-- 
Kind regards,

Sakari Ailus
