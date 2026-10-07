Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0343C475320
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364214; cv=none; b=N5Do2at67amzz6emqUBUBp4chc9+kc+u36VVyTvdS0yiQL6LD1xD8ZBmMP0XMBIQo6mI3YStJeVzbGl8sYpHz7gJK5ZR5lnJRDQR7jiCy6NW+Qb6OsFa8hQuk+qWS5Z6hYZ62qkoi2dRxSKeuaxqclq/qZNi3uEQ6uzDQmVHtdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364214; c=relaxed/simple;
	bh=q0UziRZqW94ieBwOChj5gSikraGNtSCf+f7NtRF2D98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJE7SiI9y4Su2KqxpgyIAo2/gXoAkFBURjygh8RiHvd5zObLDMMnrqy+e1pzPhR+C9U8BMb32wZQCh3iiWD5fKJxBWWSs2G89Ry5ZljBQ6EGqaQYM6vcAnazuS/16sJ8JCadg1X8wP8bQwlskDB8596tCR/IQJ9lQxFcA9CSUvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFCdjMv9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFCdjMv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791364163; x=1822900163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q0UziRZqW94ieBwOChj5gSikraGNtSCf+f7NtRF2D98=;
  b=lFCdjMv9WlQjK7vXjOCaBB0LMJaIHie0/D2tO0fiUTt4KrqzarDk0SPX
   7YJh8PxshQQcjzfxSLYYMvTaepJw8+SY5Nw7Mubdq6VTRQ1iU+z6DI8Sw
   InFZ+QyCRwtQpGldQJWNXFvTk6fLydJ+zmxXJh5W1Ce991S4JySlYW7dF
   xPiJHVrhmaXf9KBtnqz+37VuNXeHpi1UxX+YEb7sNOpGYKuHbU0h3zX8F
   wiwNMwWAhmhij2uCJlTkDczuilxbDKxFCzh2WyLQ9jKXEWWiR5b0o3Wiv
   WwI04khSdsd2Lw3P4j3P/Tem438c9f/elnhNMpvPyKBeG2Li/xorURm5V
   w==;
X-CSE-ConnectionGUID: uXhIgIPdT9m77Dk3RoTgbg==
X-CSE-MsgGUID: bMHub+sWTsevCQ+Og9+O5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="17840"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="17840"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:09:18 -0700
X-CSE-ConnectionGUID: 7tlJYz3aQt+IpvypfhyXtA==
X-CSE-MsgGUID: 72ZDD2fgQY612Kx/3evLFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="1506272"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.216])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:09:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C58B3121786;
	Wed, 07 Oct 2026 12:09:15 +0300 (EEST)
Date: Wed, 7 Oct 2026 12:09:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, linux-media@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
	senozhatsky@chromium.org, claus.stovgaard@gmail.com,
	andriy.shevchenko@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: RFC: Intel IPU4 driver proof of concept
Message-ID: <asYMOwB0gyuOE-oy@kekkonen.localdomain>
References: <20230727071558.1148653-11-bingbu.cao@intel.com>
 <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com>
 <83426573-8c4b-ec20-6916-2917aa06954f@redhat.com>
 <e136389011517dbc65b30f6bf0b1a9c49ab4e599.camel@gmail.com>
 <6f37f978-4898-473e-b774-7965d25bf27b@proton.me>
 <jsjMql5IQTMsAgViwR9vrMG4CZ1hVx9JMN4wbc0E98BvUP-TRpgtYalrmzQeor4UHRCbLg3bBeeZcaWrTujAMrf0G8q8NyQrd4o954ZayKA=@proton.me>
 <aeXaMGExmtpNcUFS@alaakso-DESK>
 <aedlbUANNY6QvZ_mrVqU9aH15j76MKgYxxwkpmayED7tFEDztNQN8A-vDuLUIRpb9At6QpBp4gg9RAOA6gvD-LpCOUpFm8aVDJ5IK87tpPg=@proton.me>
 <20261006203458.GA627926@killaraus.ideasonboard.com>
 <mKyj1gXs1gPaeoh99kk23kkFW88Mx1IxSuC1zNaBUKwiIPPOEJ7gKjFjqe50x7jIKFNol0J8HFRnbb28_sDCKQTQXCgRlhAV7i2Gc8-NCQk=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mKyj1gXs1gPaeoh99kk23kkFW88Mx1IxSuC1zNaBUKwiIPPOEJ7gKjFjqe50x7jIKFNol0J8HFRnbb28_sDCKQTQXCgRlhAV7i2Gc8-NCQk=@proton.me>

Hi Ruslan,

On Wed, Oct 07, 2026 at 07:57:17AM +0000, Ruslan Bay wrote:
> > This isn't a patchset. See Documentation/process/submitting-patches.rst
> > for documentation on the patch submission process.
> 
> Sorry, I forgot to mention that this is only a proof of concept, not
> the final patchset.
> 
> This is my first time contributing to the upstream kernel, please
> let me know if there are any issues with the PoC or anything else I
> should approach differently. I'd appreciate any review feedback.
> 
> I'm still working on the patchset, and there are a couple of things I
> need to sort out. In particular, I'm not sure whether some of the
> module parameters I've added are appropriate for upstream, and there
> are also some details around the new definitions that need cleanup.

It'd be good to understand when these should be used and why. In general,
if there's something hardware specific that isn't obtainable from BIOS,
then we need to put most likely to ipu-bridge as properties in software
nodes. Are there boards where streaming doesn't work without this
configuration?

But feel free to send these for review. There's more to discuss than the
module parameters.

-- 
Kind regards,

Sakari Ailus
