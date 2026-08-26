Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCAD3F825B
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787746148; cv=none; b=LkfU1clkbmO2HQTAz0ZI4+PdorcZKgyVMYcpMr67y2e94i5q78pZXoFLinVUq28nCIeWzxtH08aPTPWOXIbJuTOMVC65FjEdn/SjGoLc4yi38Gq72jUmemngQX6wN0INeZo8ch+T+4fcVp93AftVMSu56Zo1KFpv0Brt030nKP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787746148; c=relaxed/simple;
	bh=duG7hY2G5DuRpqInzklAM9MIPrPLlSB2Ww6mPOJMPbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0tNYuGbaTLQJc/208o+BjC7hIZWk7IQlfdkps50HuIf5rnRDfe2PP6jyBgnYQ/CYFh6KIcw3NT8SaIFya2NUnpbrefEGKWCHxRo+FO2QUoZJXwgVnWmpgNA+eyTRazS67bFxWWxxQSbygid8/NAm73p2nusMaO10F6DOP6U8sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSnlb8Ch; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSnlb8Ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787746142; x=1819282142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=duG7hY2G5DuRpqInzklAM9MIPrPLlSB2Ww6mPOJMPbU=;
  b=OSnlb8ChTdxlt1Td/V47cR5st26yy+Lwpi3rrNz9E4aTKWnxjxPKBoE5
   VOdq11ChPbEB+CemM8sEJBzTZSyGU/p8B4k30iJNMcEa/tBgmFHJKzrgG
   2rh5QhDUtnmeFh2u9Q8/zp7PIJ1M+MI61VXfrrldbw/5gDQz7G4sduwWI
   pzC7craWGVNAiC01FEBu9zVsW2FZxUpSZKkF3mqaZNJliKVi1axHPDwiP
   +FTJm1SLQspamkIUV2vnFQYPMQHD//mzqcOAo4iMat3qpyEHM1R9d2Yg5
   tqzdm2NFd6iceIbmuQPzNDMPPSf+FtO0nARy/X2qhMhTr7IpK+i3P63uH
   Q==;
X-CSE-ConnectionGUID: H/F3naJYTju/9R5Jd0N0Mg==
X-CSE-MsgGUID: 0RqM5m4IS7SIEKuJwl7ZhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="87167528"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="87167528"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 05:08:59 -0700
X-CSE-ConnectionGUID: +pIxi8JpT++PQlyKbh2EyA==
X-CSE-MsgGUID: Shgi2WkFQaKQMtiLGjeYNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="271060573"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.215])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 05:08:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 518FD121BDA;
	Wed, 26 Aug 2026 15:09:08 +0300 (EEST)
Date: Wed, 26 Aug 2026 15:09:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 18/29] media: bcm2835-unicam: Remove frame descriptor
 workaround
Message-ID: <ao7XZDSq706ZVP9L@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-19-sakari.ailus@linux.intel.com>
 <aoyzNT-ILKHt8Vw0@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoyzNT-ILKHt8Vw0@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Aug 24, 2026 at 05:10:13PM -0400, Frank Li wrote:
> On Mon, Aug 24, 2026 at 03:14:40PM +0300, Sakari Ailus wrote:
> > As the v4l2_subdev_get_frame_desc() either returns a frame descriptor or
> > returns an error, remove the workaround for drivers that didn't implement
> > the get_frame_desc() pad op. Also handle v4l2_subdev_get_frame_desc()
> > errors.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/platform/broadcom/bcm2835-unicam.c  | 26 +++++++++----------
> >  1 file changed, 12 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > index 2322d3df3915..ba613966c333 100644
> > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -918,8 +918,8 @@ static int unicam_get_image_vc_dt(struct unicam_device *unicam,
> >  	return -EINVAL;
> >  }
> >
> > -static void unicam_start_rx(struct unicam_device *unicam,
> > -			    struct v4l2_subdev_state *state)
> > +static int unicam_start_rx(struct unicam_device *unicam,
> > +			   struct v4l2_subdev_state *state)
> >  {
> >  	struct unicam_node *node = &unicam->node[UNICAM_IMAGE_NODE];
> >  	const struct unicam_format_info *fmtinfo;
> > @@ -933,7 +933,11 @@ static void unicam_start_rx(struct unicam_device *unicam,
> >  	fmtinfo = unicam_find_format_by_code(fmt->code,
> >  					     UNICAM_SD_PAD_SOURCE_IMAGE);
> >  	if (WARN_ON(!fmtinfo))
> > -		return;
> > +		return -EINVAL;
> > +
> > +	ret = unicam_get_image_vc_dt(unicam, state, &vc, &dt);
> > +	if (ret)
> > +		return ret;
> >
> >  	/*
> >  	 * Enable lane clocks. The register is structured as follows:
> > @@ -1090,16 +1094,6 @@ static void unicam_start_rx(struct unicam_device *unicam,
> >  	unicam_wr_dma_addr(node, node->cur_frm);
> >  	unicam_set_packing_config(unicam, fmtinfo);
> >
> > -	ret = unicam_get_image_vc_dt(unicam, state, &vc, &dt);
> > -	if (ret) {
> > -		/*
> > -		 * If the source doesn't support frame descriptors, default to
> > -		 * VC 0 and use the DT corresponding to the format.
> > -		 */
> > -		vc = 0;
> > -		dt = fmtinfo->csi_dt;
> > -	}
> > -
> 
> look likes vc=0, dt=0 change in patch 17 should be in this patch?

It seems like that, yes. The compilers aren't smart enough to figure out
they're not used when not set.

-- 
Sakari Ailus
