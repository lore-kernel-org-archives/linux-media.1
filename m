Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C11030F816
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775145019; cv=none; b=cV/NShmXAOYfKzAtC5ApvGxh5uqb/IrqYdl/jeXVNKC72C+OZIIvuVsyBjAa0FJ/AiW+03R3jZDbvsj76lDb/OGNEU9sQxPKFHtAaft0+6n8gH0xqrRFBF1okFiem6HGIO/yzdIudHoi5nwD3SbycAjX0IuIMJXBGHQVelWtCfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775145019; c=relaxed/simple;
	bh=ezc/4hh5J1zXDafSBFN/a5nsvpBrFY8YXaPulR+ho3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pW2WXXOIClzwtycPH02q7eF6k+QkgHYQ02n36ZoJSWs6iIJ9SVe1rmJNA9MEusVhX5slJa88uHQL9iFJhqeAYaSpKWHTKuWLm9wVv7ZsLiZWOL0LttQcimwxgwLzp4cSxvkdAbLVjJSOWXnODirlhkxMBbwiQKScbSb8d4YzI1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BadsjDOP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BadsjDOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775145018; x=1806681018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ezc/4hh5J1zXDafSBFN/a5nsvpBrFY8YXaPulR+ho3Q=;
  b=BadsjDOPVmdJhqMeuKUQIIMlXuF1lIJBwr4zO1CoRRV33YCssiHHKxvB
   7yYC81H2/ZvFecOhK+q0UmA+P+TT3WIrpBPZ3giuCrSdDIG3Ncw47z2mq
   nCThyOVBK2DKi9C3xOOB76KD2i/I0DFZ1AJtgWJwhiG+6qYrDyv04vzB+
   2hK7bmCDdNIN55RbAP1ys1SeruIjhWq8FtrgxPipkZtAIb1q/YXuCRd71
   328AfOPYE2wwIRdPeLon3kyep0LqwBu6AgUlp3WKWrh6mjcSteDksirZb
   Lrr2vpKiacZdO+qFRe5ygehBQTxVRj4ncAtsbtVwRvVzKZ3qW0unqPmeX
   w==;
X-CSE-ConnectionGUID: cOzjpjtWRTekvJk091FNuQ==
X-CSE-MsgGUID: g7P4TgY0RXCvICqRcieQNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="63757069"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="63757069"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 08:50:17 -0700
X-CSE-ConnectionGUID: HYk35xS2Skeb9ydhBkFiGg==
X-CSE-MsgGUID: XpHBEYwvQFmBxrpizFXSig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="220358473"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.118])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 08:50:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 94CAF11FBE3;
	Thu, 02 Apr 2026 18:50:19 +0300 (EEST)
Date: Thu, 2 Apr 2026 18:50:19 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 02/14] media: v4l2-subdev: Allow accessing routes with
 STREAMS client capability
Message-ID: <ac6QO-X9W9mqkmDz@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-3-sakari.ailus@linux.intel.com>
 <0c759f9d-409a-47ad-ab37-0005f3ced257@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c759f9d-409a-47ad-ab37-0005f3ced257@nxp.com>

Hi Mirela,

On Sun, Feb 15, 2026 at 04:18:19PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 2/11/26 11:09, Sakari Ailus wrote:
> > Disable access to routes when the STREAMS client capability bit isn't set.
> > Routes aren't relevant otherwise anyway.
> > 
> > Signed-off-by: Sakari Ailus<sakari.ailus@linux.intel.com>
> Reviewed-by <mirela.rabulea@nxp.com>

Let me know if you meant something else than:

Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

-- 
Sakari Ailus
