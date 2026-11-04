Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782817;
	b=ZIsoKBr3OgKCS7msWQm9zrtWBbrzKqOelrskekCvvR6+LnNQdR1EAiYo2ubW5SIOozjn
	 0KZ1hpWdOalf8aitHSmjKkivVcAQOwIMZS0e+DB5PhmI3hWZV+YZX/FuN/i7ot33NazQh
	 wFiPtjpm2XT/zmqZjjUJwjzKqH4Zox33O0qeffuBmaL3JsUajA7l2NxtwMfapaorMl3MQ
	 +Gds8Sa9gPyLydTw9XngizcDgAY+u/m6KZM0KDvTJuUTjlLUO9DkkxAXk/fI62yJUU1wH
	 FHaoaWAkehuLemat/jQuQwWzmLkuYSrnxeFWf3pO4joLBJHLSbVK4grfw4sF16EUHtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782817;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=c1mWAReIxkzAkfPbreyykThnZ8GC+YiVWeAMp/vbi/Y=;
	b=aZST9gUyCm7afOue3oBfzZunm3qa9YE2Y8+p+PpOTtY0SVHFGmlm9gC1TV83cJtKQGNp
	 DMJJaYXle8LhIvtlzdUF6bgvQJE4dlmWKJSopXjE/P7wF/XuVPnDxQMfg3oW4r9RPV/fR
	 5EqJy8oajdfMAlqgCYgWZ83zCKtdcs5idjQLx5V4sA8nRJagIUiIZtLzjHUEnKgp1Z6ol
	 t/PdzxFg6lLiDoaEM3xIUsUdZH5/9HLLk5/nxwvVSHwY4DK7j395D5mD6rkorhC6xiWHD
	 NyFbYFUG5kqKC2looI1OpwiahaHtehXKUVzw+uTKVIUG6QBNsshgM4tbJlwCAwnLtzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bc1OeJc1;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67337606D804
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 09:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67337606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bc1OeJc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793782816; x=1825318816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Vk+rNbh99pI8mbEh+IBqi4OWFKMHYLhyd+nA+FqEgU=;
  b=Bc1OeJc1atO9i20Fnli2YG0Loh2V6YsjmNZAyfdpKP0WXcawzOKgUgHi
   4rtTa841gw2zpD2B7G4eF/RENhbm0Eto1/cODYyCiVquRbYyiIENZcjpb
   Uqm/E+LqEjyYTXzlwNcU+R/pjoZA8IomLA1UzgogurNfHidBfXEhQkowx
   gA3w+z5BKkhxVs78dp0sVwmoJ635VxG/xIYW7XD8mCCt5P3ceKSAoPthQ
   jim44B5acUNDOlVKyiCe+SQW+BDEJTa7S2hG/MNwHvbSNrjuCpu/semOP
   0Q+tqFd7nZBiLuFWWopTsLfa3X97d80YdV7hd0LjIOw4bqje2W0pSVAQM
   g==;
X-CSE-ConnectionGUID: L1OqKbb4TEiWozUIg2jePA==
X-CSE-MsgGUID: X8tcXIRJQqmYKo1kA5zviQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2411514"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2411514"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 01:00:16 -0800
X-CSE-ConnectionGUID: 0bjVK6p6R3a1k7XXVvHkNw==
X-CSE-MsgGUID: dpYvwBtaQ4G5kX2q4i8Nng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6795068"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.19])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 01:00:13 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 68EC711F83D;
	Wed, 04 Nov 2026 11:00:22 +0200 (EET)
Date: Wed, 4 Nov 2026 11:00:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
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
Subject: Re: [RFC PATCH v2 01/12] media: ipu6: Add IPU4P hardware
 identification
Message-ID: <aur0JgcxAVg6ip-h@kekkonen.localdomain>
References: <gq0RPklnWwh54C8bfSPed_4KhUyWsFte_HBmLeiQM49u4LWoUOGyWTNqEQc9WDnHekSmgDrVtHXOJ12brO7eZdIXH7yUJzjGR1V2axZumGY=@proton.me>
 <auouu3gvbMTNIwvv@ashevche-desk.local>
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
In-Reply-To: <auouu3gvbMTNIwvv@ashevche-desk.local>

Hi Andy,

On Tue, Nov 03, 2026 at 08:58:03PM +0200, andriy.shevchenko@linux.intel.com wrote:
> On Sat, Oct 31, 2026 at 12:26:23PM +0000, Ruslan Bay wrote:
> > Add IPU_VERSION_4P and IS_IPU4P() to identify IPU4P hardware.
> > Place IPU4P at BIT(0), shifting the existing version flags up one bit.
> 
> Is Kaby Lake IPU v3 or v4?

Kaby lake has IPU 3, but the CSI-2 receiver is different (CIO2) and
unrelated to the IPU. Also the firmware interface is different enough to
warrant writing a new driver (ipu3-imgu in staging).

-- 
Regards,

Sakari Ailus
