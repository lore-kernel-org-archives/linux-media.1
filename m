Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125558;
	b=MHi8nOtOkuqG8dZ1AIqtsY/pYJigIm3II66qZ/NsjdAs32120UErUvqzwZ9cvMesXVDf
	 t+tRqLU48JCCAHVJNJ/6apBVPBLuFPrz8I6lQ36MUBcPZD8QuVYLcBHVobbLSdz0B6yvt
	 PmLxA77ICHgbl0EIUvsA4J3DJcNycJJUeW/6BIqI6GO1Z8yh2MhMeEgyEQmpykuK8khgN
	 0CDfVaG4eXCHRbp9yHQQ+GynhQyetk4XDElwbVG8fk0w8k2DTAHf9zjTqwdBvM1m1MHvN
	 wMaZvXWcP3l6LWu3wx/4EmUXDGMqpYhkskbJM6iSgmTddjFcSxQbJEi5yQZOjxbJJuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125558;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yeYiRz6f/UyRL+tn9oyiwf5F3o8W2ijpulhwBM4jhRQ=;
	b=CjtFTpQcRUnbDYd9Dqzhi5o0uKFoFXCbpTP5E1bzdh9cg0iwxjuX3D+8+MQMo3Ddh+Lm
	 z/dRr4DFwtNSW51uKgzps3HaaG7/mz0lfXsV6Y40e6SwKms1X3gvyj6C+eVWsD7vbEW29
	 OOZfKdEVO8NFwV1n+IBBsb0rlTSzadw15YOu/J5GfxkRh9CnlNOEW+/7glRWwQOiN19Gb
	 9lqGCwJEnvzDfAYJUsdXqdRtMqU5KLdzFl3QvMpR502sQHbbEuZ0GEWsVrJ1Hq6kwKUCC
	 wYsZ3dukOf5gYctPbZjhM7bOMJgnVlmy0Q7mB8wc/5+nXTPdFvCgcQnaR8kPWkDCU2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FItdZ62R;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B5A606A334
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 21:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B5A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FItdZ62R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795125558; x=1826661558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jl4E5HUJu6RKXpQiWQdOmV/sy3lWhU39EQHTI79tY3Q=;
  b=FItdZ62R0nYjr1tZei7FEZ657HJegmmiLMPSDn+lqchfncEKE3g9B1+8
   F5Qarxigcu90/KtWAFM0Qsf+3UqxuNLAwzmNQTWjRi92QBpSTwUQrr6Sn
   vwGR3jS2HT/lP5y9Y+/kyduiuEIsq3ifb2qI2ENO0C2G83UZzBu7ZbSGZ
   375uEcSemS2JvkZ9yKDxoqQzJldguIG6ovzPawD4wjqz6j3lVM0LJg7PC
   4Yxn1/whsR509zxOvodF8QF2fjR2BoS9LCvIi1mqgVdN7+EOdLKxLWo5L
   CYC9V4ajlmOhzksiPJ+5olYNAJKuiDPMmOxxgL29aMu/yTBTsbaaaJQnw
   g==;
X-CSE-ConnectionGUID: fTb9CFAZQT26lceEW33HLg==
X-CSE-MsgGUID: egrdWEfgTNC2qIkJyebBYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3916189"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3916189"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:59:18 -0800
X-CSE-ConnectionGUID: Gn+7sHDRR/KIOZJyRhJ+2w==
X-CSE-MsgGUID: WJdyiAZkR7Chdp2lJxhlbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="11108804"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:59:17 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B0EC9121B5E;
	Thu, 19 Nov 2026 23:59:14 +0200 (EET)
Date: Thu, 19 Nov 2026 23:59:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: diegomancera.dev@gmail.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3] media: em28xx: clear dev->v4l2 when v4l2 init fails
Message-ID: <av9xMqHVghTLOPa4@kekkonen.localdomain>
References: <CALruWrWRWRU84AkDocSnNMSRp+WQD5ic9G_3peE50BvQR5iGBg@mail.gmail.com>
 <20261113145359.65440-1-diegomancera.dev@gmail.com>
 <CALruWrXhXjiw2eVL+YzDXr-mLHT4y0b799PEMH9GZ-pmSHofKA@mail.gmail.com>
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
In-Reply-To: <CALruWrXhXjiw2eVL+YzDXr-mLHT4y0b799PEMH9GZ-pmSHofKA@mail.gmail.com>

Hi Diego,

On Mon, Nov 16, 2026 at 02:31:04PM +0000, diegomancera.dev@gmail.com wrote:
> Hi Mauro and Sakari,
> 
> I noticed my patch [v3] "media: em28xx: clear dev->v4l2 when v4l2 init
> fails" was marked "Not Applicable" in Patchwork, but I could not find
> any comment explaining why. The Media CI checks all passed and the
> syzbot report is still open, so I wanted to ask: is there a problem
> with this approach, or would you prefer a different fix? I am happy to
> rework it if needed.

Commit 0969cc07c1beb9a1ce0ee32d50202402c5a5f05a, which Hans merged some
time ago, indeed contains the change your patch made.

-- 
Regards,

Sakari Ailus
