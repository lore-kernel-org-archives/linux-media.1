Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732290;
	b=0z3n6Krn9YvwaTrqy3xs1d+zblAecpy8TjV/zZbeF9sGITn+E7I+8LzfcwKyfcKlbIAc
	 tkuf17GXLUob1UFEOe11YnEK4cn+IpaIskgKCWSs62lScSBdNEI7NhSsDBNOuIJNwpNoi
	 0h1QcZi3XctNbhDBpcnTwTepjTpaPEHG3j2CPjwkQ3EJURaPav8OcvJ/LQG7NLeDn2yfS
	 aETNR1A7Ohrv+Djh2kViHolxyKO/QFL/ZiLGAsqmBJGr2CaHgk/Ssp9CE+a7Xf1v+zdWC
	 zQQJCE2sZVKHMxAZ9CIttaEYiQBypc9eCRjx3Gyl+3EbP++4CsrgC6wJWAGAVrWDynQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732290;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=WmyDWGwRMOV/j5xFD4TdhiJwaQJpem2L74rYc3WtCe4=;
	b=vvPxW3uTFFX6oemPQJzzBTbD3fT+zVFG0qZLyIlze215CIxqqDxqJ8STy3idUBfEmbaf
	 XMocr4EGU5Iv+odZqbSKb3IXrCBVF3BljulxU4Fud56oZlKDIT9EQ934bJfLXFzgfX4YR
	 J2zPfKyXQxMW+Par+XiQKdd6CK9mp/mtE6MInD8ar24fiaRe6pRJfqeG/M5sCUjn/6Ods
	 6nioj9Q1Qjzc5lMBDxPL1xzm9JjJGvCBpXzWIbaySu4ciYuB+hUCJ2+CigUnVbX4SwPLT
	 MN/df5IfdeSnGEERShghSsq7MaRz9HVF22r/QfHbIUd/WDeGDJf6ShfSVKi6tIMq6+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VtjQQYlq;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B79606A31B
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 18:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B79606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VtjQQYlq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793732291; x=1825268291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cm2YBRFyYMoR4mhJiGkYhX8+1sQEn1+UzLCgueZ+hDo=;
  b=VtjQQYlq5LkpH6kkgD8sHGpCRSBNd3HezebojpYvbFGX5cGYu0w/q6wA
   3HtjiPhb4uIIMsJmxxxI/7q3mYbPMzZOpE/3ypvu5zdyiQ3zMorVu9Fow
   KV/8gFEgaZYy4vH/aIi7NADu82y5iotxOR1sHO/x+cc/D9nwZ/x3RjyDS
   SYUQv/TUSjy4ghPW9uHesoNEZ5EbC8ftfJp5p7fLuLu2fQmzyLUjqevop
   ZPMgI+r1SznEisMEEd62HC32TIk5IQpIlJCGY7IFNX5tqYxXTzf7MWiW4
   3x+H6zipjGVpn6zrgx5SbAevO98y+AVf3HO08pPf9GK5Wir8mSzYar6Oo
   g==;
X-CSE-ConnectionGUID: OGJxZo8tT2GREPa0SNOSxg==
X-CSE-MsgGUID: nvPrYFmdRUicdg833AyM4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2352270"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2352270"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:58:10 -0800
X-CSE-ConnectionGUID: uY/pDOTwQyu2Szkk3dPEHA==
X-CSE-MsgGUID: T0SCWeG8TG65XmR2CbIOyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6352858"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:58:06 -0800
Date: Tue, 3 Nov 2026 20:58:03 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
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
Message-ID: <auouu3gvbMTNIwvv@ashevche-desk.local>
References: <gq0RPklnWwh54C8bfSPed_4KhUyWsFte_HBmLeiQM49u4LWoUOGyWTNqEQc9WDnHekSmgDrVtHXOJ12brO7eZdIXH7yUJzjGR1V2axZumGY=@proton.me>
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
In-Reply-To: <gq0RPklnWwh54C8bfSPed_4KhUyWsFte_HBmLeiQM49u4LWoUOGyWTNqEQc9WDnHekSmgDrVtHXOJ12brO7eZdIXH7yUJzjGR1V2axZumGY=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 31, 2026 at 12:26:23PM +0000, Ruslan Bay wrote:
> Add IPU_VERSION_4P and IS_IPU4P() to identify IPU4P hardware.
> Place IPU4P at BIT(0), shifting the existing version flags up one bit.

Is Kaby Lake IPU v3 or v4?

-- 
With Best Regards,
Andy Shevchenko


