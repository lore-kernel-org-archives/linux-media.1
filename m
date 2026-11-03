Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738951;
	b=25smzg6kcvmHt//20DogmlA5GDdFpR8ArtUN8NZSwNW/gsiCQS7+XtTsEDxCowVQ/tSk
	 Fm2qX7Z/SCYY2CV35LNqL6tqJ+gA1ZrBZyE0k23ZUrV0l7/hpJXuxfe+3jSi9XqEInmAA
	 6FI8WTqJJymY2ivDTWxa2TrRiRdzOGi0nDyJgqevgWWbx/opMf/k3ZwAXGeBHqt97u6/O
	 KW4rIAGT2RNgxXhTmsLfqj58aVJifsUWlM5qoOzojC6S5Pza/2MAj5PWLyCbFieQWLk/V
	 i48dwnWyop8+W/eV4w3C9GgtG+rfNxZ8wTekll8AazCKMFuCmkTj25FODqeYdSTs6jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738951;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=a1LBtSFDDW+dZd1Ie0BrKFlQ9aP7tXVm4v+Drm1eB60=;
	b=nBXMePtmhP4WoUoIxcpA2dDIbUDUsfW+zg2khizQo2E18n015L+1ehFWGyu/J0oy+vvW
	 rfPoZAdLE/yJYeMbzhPgkzWgh19at6vBNc3GoTiHRuH+3wPFgwIbyUsSkLlAVWYdFMJZp
	 n/sw4TxnsLxvOhHV9AzhSN+TI44iV9XvLGVbJbpXt6qQTUggmuV4O2b1JLE9hLpEI4R43
	 SvgUfHRVgEYca2hxumyRbUzYeajncL14OM1VdYI1SvXSR1qjDJ8qwimxF1DoV/ZyXlhz0
	 qCG4SO2VuMbTBVJFJWt1SMNIVLF4Ii7872u32FSrg/n9C3LYYBrOvQeFRJDo2hl2SBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eSL+j6WB;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D12606A31B
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 20:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D12606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eSL+j6WB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793738951; x=1825274951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ctuk3FQQsAE0OrXfuppyyWSn2H2HRSx9W6Ybfw7LuC4=;
  b=eSL+j6WBv8aJ1uHdFzLmYqfrS6u//5N5Pb89ifmSmcW7yKBtWT2vQr3M
   VcqR5AXCG1tXc9YB5rnZdcAQ14xuovGNLdl0yiwxYirYsmrE86oLQPmbJ
   Zn4plHuSXzxfQEVYCXLwQE/KzqSN1M0a2QqtSraqtfOmB+Aoco5MyN3pN
   GLnICaho6YcpNo2g+znlzaQr/Wx0BxB5xAK3ZtdB8/HLywKi+zyGXwo56
   Bb9gSTNsrwnqdntEauolVd2ZzOivfv7J5DQbG+nxrnFDn0kajnbEiilC3
   5n1DvnKZ8I0RN2Ze7qI7zuVqunrP+1J6XSDUtyJL6APHsDzFlG1Z3N5uh
   Q==;
X-CSE-ConnectionGUID: 4tDSgZ7iQayGUk44oGHdGg==
X-CSE-MsgGUID: iFotYo28T9edKm5nBy8mgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2356338"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2356338"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 12:49:06 -0800
X-CSE-ConnectionGUID: 8zwDuvcXRyypbwT0656k9A==
X-CSE-MsgGUID: urKyUDC1SC6zn3Wb86460g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6619497"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 12:49:03 -0800
Date: Tue, 3 Nov 2026 22:49:00 +0200
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
Subject: Re: [RFC PATCH v2 07/12] media: ipu6: Add IPU4P ISYS firmware
 operations
Message-ID: <aupIvPx8vxLl03zg@ashevche-desk.local>
References: <Jmj6noRGE-pr4vr97B1H6Qt2u2m3wHDQvZF0tOg9fMulZS1SrNHgIFVW-y2bx0wwnnd6FHLIL1oaKmJ9_57yTU_pedSW_Ni9-R8IJUqaoek=@proton.me>
 <aukIRKuHl73rsH9s@kekkonen.localdomain>
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
In-Reply-To: <aukIRKuHl73rsH9s@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 12:01:40AM +0200, Sakari Ailus wrote:
> On Sat, Oct 31, 2026 at 12:35:24PM +0000, Ruslan Bay wrote:

...

> > +	do {
> > +		usleep_range(400, 500);
> > +		ret = ipu6_fw_com_release(fwctx, 0);
> > +		retry--;
> > +	} while (ret && retry);
> 
> 	poll_timeout_us()?

Why? We have a better fit: read_poll_timeout()

> That'd be nice to fix in the original, too. Do we need a IPU4P specific
> variant of this at all?

...

> > +	set->frame_counter = atomic_fetch_inc(&stream->buf_id) % 256;
> 
> & 0xff
> 
> ?

This is awful in any case. This is not atomic strictly speaking.
What is the idea behind?

-- 
With Best Regards,
Andy Shevchenko


