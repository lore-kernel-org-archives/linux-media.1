Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2D742E004
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823276; cv=none; b=jKtuTFOCoYHLFHVUn3rlmk2jl0lXooeuFIzI6tZgT5BwK91BUcGxKfNTdFEqZNfKHjgNFocgypzsvswcQsugzi1Fc5W6wMFMHMBYNIhrbfKrhvWxUMFA1xnhXXVy4kw0+XaCaDMuPyGjZDFP/g+jaS+e0ph4xSflC/DHiP5jCao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823276; c=relaxed/simple;
	bh=YU7Zne3EyaIJSLsTzRxh40kEZkX4veTB1/9HNek3r3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bt/pJ36zyMmPFNuPfZbs8ZsIbekMVJscrhX0dX8ShDNl9VfEHNlCTDjyN783ajxJPE+7z5ZEgmKwDAXeH+ozJGRJk+Cg9I0IPeQYfaeQw0xtUzN6t/UhbqwxxXXQd4ZL/bQ1cddCH4FPt03Fkc9vhbqXsFy7ZJWaMkH4vcK2Se8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kuflg29K; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kuflg29K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787823272; x=1819359272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YU7Zne3EyaIJSLsTzRxh40kEZkX4veTB1/9HNek3r3c=;
  b=Kuflg29KJfQJ1v0cnUfvnz5fO38edcmI5emEJQoTal6zzVEg0o+WH3oG
   ghWUuILOsLJKN+6n6NkFMvPUPndSZWpeMaMOdxcRegMI0TMaY2tpUsn95
   psCH28Y2xFbSL1Ujtp9WF8UYACbn/GFkzDF1YfoO/zFhlv1lfPdOBt9x8
   kN5kb2/sHPh8Qg5wj2bb58hdacCXAjsJcCjIgTlMgQdX6HHGR+7zhBYcG
   dgdCrNWwius1RNFriHS/n6dCCyKy74rOncQipvJDauJ/L1smU0bk/DYlc
   xR0dgCxTfXHFeunIR1SS6YVJ6laXcUJCSI/1JNRkhEQbXx2FI1PUCSlBK
   A==;
X-CSE-ConnectionGUID: h2WOQunVSmmXXptcIWPDSg==
X-CSE-MsgGUID: lRLia6ooTQOUhVYvYp0gRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88441879"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88441879"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 02:34:29 -0700
X-CSE-ConnectionGUID: 1uXlA36TTteAM12CH9pIpw==
X-CSE-MsgGUID: eX6D96UDTUK5OVGcoJvgeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="263547916"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.174])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 02:34:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 34925121BE2;
	Thu, 27 Aug 2026 12:34:24 +0300 (EEST)
Date: Thu, 27 Aug 2026 12:34:24 +0300
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
Subject: Re: [PATCH v3 01/29] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <apAEoMX0kDFYgQvc@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-2-sakari.ailus@linux.intel.com>
 <CAD++jLkMt3ztAHZta58coseqnjpHxLys1sjcR0fRmtC=-m97hA@mail.gmail.com>
 <ao_6cyEi6P3R3Z6D@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao_6cyEi6P3R3Z6D@kekkonen.localdomain>

On Thu, Aug 27, 2026 at 11:51:00AM +0300, Sakari Ailus wrote:
> Good question. The pixel codes are indeed called codes, not formats in this
> context, but the struct name contains "fmt" which implies size as well as
> other information could be included but there isn't any.
> 
> Instead I think I'd call this media_bus_code_info in fact.

Of course the MEDIA_BUS_FMT_* macros then use FMT again. We can't do this
consistently anymore as it's all in the UAPI. :-o

-- 
Sakari Ailus
