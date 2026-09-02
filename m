Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE514A484E
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362047; cv=none; b=PfruGcF070kTxRQ/4GNfkefkXiLicfUIi4N2DEKZ1nhNkrhzl+yxOtFCLjDIVmUlu7mxqPoEtdfse7AXL66K2ouBuxAbdquiUeupeL4JNGk38qnPPh5QsIHxNCP4ejZNFjrjt9K/dCHp1+jXM8OwJffAUtXUEV+/ggFhmrzxSaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362047; c=relaxed/simple;
	bh=14ttvmWE/yGyKHP7d5w5DYSdObAjS8J1/b1xHE6STMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uonZNn4qq9mk3lP0awZFr5d4S1L/TNCkVafpoXAfuKjr5tbmFmHRvqmzWvt7sW/RXmgIGdOabuKvCfkbMIUynoH0Ed7q/pLMOB1nicEy4DiBgZF5iwGeSjd4x7fhZfAwCWeG6Ffu5KABetgCcKWo7B4ELDh9RxlaX3A5Wfo8R7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dORlqv42; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dORlqv42"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB02419C;
	Wed,  2 Sep 2026 17:12:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788361952;
	bh=14ttvmWE/yGyKHP7d5w5DYSdObAjS8J1/b1xHE6STMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dORlqv42QyDz/LhliDK6ibrZHRci0twWp2WoWMsjLIvyTrPTLnTqIjPIrP2xw12He
	 cbUnDkEYOM0A1fZ2+qOnb/L/tNPpssV6rSTlAfkfzDOiLo+KaeWcFPQs2wfnRdrprj
	 OKWosSNqMalKqrVAOREGDDTPucTqvmOIwV8AAGXo=
Date: Wed, 2 Sep 2026 18:14:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [RFC PATCH] media: ti: cal: Deprecate non-MC API usage
Message-ID: <20260902151401.GB287496@killaraus.ideasonboard.com>
References: <20260723111903.742283-1-laurent.pinchart@ideasonboard.com>
 <2d3f854c-0731-4405-b77e-13929049ca67@ideasonboard.com>
 <20260902122454.GA335893@killaraus.ideasonboard.com>
 <561ff30f-6119-4698-a719-139bf279ea10@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <561ff30f-6119-4698-a719-139bf279ea10@ti.com>

On Wed, Sep 02, 2026 at 08:23:16PM +0530, Yemike Abhilash Chandra wrote:
> Hi Laurent,
> Thanks for the patch.
> 
> On 02/09/26 17:54, Laurent Pinchart wrote:
> > Yemike, are you fine with this patch ?
> > 
> 
> Yes, I apologize for missing this.

No worries. Thanks for the reply.

> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> 
> Thanks and regards,
> Yemike Abhilash Chandra
> 
> > On Tue, Jul 28, 2026 at 03:26:47PM +0300, Tomi Valkeinen wrote:
> >> On 23/07/2026 14:19, Laurent Pinchart wrote:
> >>> The MC API was introduced in the CAL driver more than five years ago in
> >>> commit 38e89e790fe2 ("media: ti-vpe: cal: Implement media controller
> >>> centric API") as a disabled by default option. Five years later, it's
> >>> time to give users another nudge to move to the MC API. Deprecate non-MC
> >>> API usage by printing a warning at probe time, and defaulting to the MC
> >>> API. The legacy API can still be selected through the mc_api module
> >>> parameter.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>>    drivers/media/platform/ti/Kconfig   | 11 -----------
> >>>    drivers/media/platform/ti/cal/cal.c | 10 +++-------
> >>>    2 files changed, 3 insertions(+), 18 deletions(-)
> >>
> >> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
