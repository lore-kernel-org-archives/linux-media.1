Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162298;
	b=eW2FIMzuJghz/C38z5ug9BBywG8aVcbo56Qz0+Z+70yJku1x3SnwRgkWJ1qAgfugw7/G
	 H1H+jeNH1Tl+3jX/M89oy+dMvFFjMVPenIy0tKFRVbrCW0gbdkenhlHClFckPyTEQb09A
	 k79IVr2LKCv15gVBVO1RHa+NFqHawwHaLu6K4HDuf50BVQ56P90Z8D9mxgIJFPzhrL1Cm
	 W5WlWk+w4WmNCxXmhOfcbhfTflZIf6Z3kqYLO792UEqVCgWREGr7sPG8p4+7D6KlFDp2P
	 kuAQY0MQTRk5RjUeEYxbku4svOCNBYFeHvrvr0ezsELMBJ+SeUsTMEgZECufSERl94A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162298;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IuE/CYAL1FbnoD4zbYWf7saJ5EnI0ZWBM5WZd/Z0fs0=;
	b=1Rd7x6lInSFhYUnDuBR9JngL1ANYbabDIy6IktMlYoqjjriDRnG/qSSGx/u6LM03WL+h
	 alAbrlkt+5esKna6WJ2XE3thHC7g7dvwkUGnqrIaz/TKTl463wKMoDe3byY+LeuyQPR6E
	 MikmBWm7NxE7fAdxHBVqBdm3tF8oq+bOlEPUlFRZfBBCM2PzZfzaS1S/D74rK0pvWmitz
	 L19OYHz9Bh/naJdZ0Ova5MnGmKWcIUlIxBopk4QLktzO3uRq8O52xO/8tFjR75WMkJ24p
	 ws8FHVazbTP/vfrVSNGUrv05lHB8nUrgnLvoa5HY5n4f7uqBPdKO0MKu74E2R0EUfQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DLSPCMRG;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09E9606A320;
	Fri, 20 Nov 2026 08:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09E9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DLSPCMRG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795162298; x=1826698298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yL5JIdyLQz2yWxdFDHxur4VqIri3JfpDyqStz2wh/3M=;
  b=DLSPCMRG3PrmyfdqiitXaDIw9BpVZY/jwDAio28pOumPT+yAEy+kv/Zw
   ZJIPjPTNG7bMJcb7Y23y6F/fPmGM/dmpvSPtPpLH8S6v/eFL5dadKCxsE
   nY7ybrfDye1qpIGalgrGQoh8GvOLx6UnD6rD0vL/gRPBFqtswVukqkBzr
   7rno+3rd5wBrAjwZvPEkRi0l5Vh8ukxIZFHYiEdi8CVTNkLZPcP/twjT3
   vTBEbogEvu6yNjIYswMi9rIavyJPX90tMvhiNDevNyh8QKb1rf8tl6FTg
   WEVrAcHVc2qBR51m3yKcUGOBF9E4rUfvdWRMWl7dxn/VGA/AWX9gt0V+t
   w==;
X-CSE-ConnectionGUID: 5B0jWtmETDObmCHLEKsP/w==
X-CSE-MsgGUID: 6tmTtk0lT1iMRbWsJp3XNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3937327"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3937327"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 00:11:37 -0800
X-CSE-ConnectionGUID: 7AWm/HcFSMmPky4/wrM4+w==
X-CSE-MsgGUID: yh52nU22Qj2rDqRVkF0Bpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10548735"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.253])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 00:11:35 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 56A28121B8F;
	Fri, 20 Nov 2026 10:11:33 +0200 (EET)
Date: Fri, 20 Nov 2026 10:11:33 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "jai.luthra" <jai.luthra@ideasonboard.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 09/15] media: i2c: os05b10: Add H/V flip support
Message-ID: <awAAtT8qt9RwuCTb@kekkonen.localdomain>
References: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
 <20261030104806.1223991-10-tarang.raval@siliconsignals.io>
 <auiDLo73gQgslsvL@kekkonen.localdomain>
 <PN3P287MB18299C133C2D2A56237D85828B782@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
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
In-Reply-To: <PN3P287MB18299C133C2D2A56237D85828B782@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang,

On Fri, Nov 20, 2026 at 07:47:58AM +0000, Tarang Raval wrote:
> Hi Sakari,
> 
> Apologies for the delayed reply. I was on leave during the Diwali holidays.
> 
> > On Fri, Oct 30, 2026 at 04:17:58PM +0530, Tarang Raval wrote:
> > > Add HFLIP and VFLIP controls, lock them while streaming, and update
> > > the reported Bayer format based on the flip state.
> > >
> > > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> > > ---
> 
> ...
> 
> > > +static u32 os05b10_get_format_code(struct os05b10 *os05b10)
> > > +{
> > > +     static const u32 codes[2][2] = {
> > > +             { MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
> > > +             { MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
> > > +     };
> > > +
> > > +     return codes[os05b10->vflip->val][os05b10->hflip->val];
> >
> > Note that accessing the control values requires holding the handler's mutex
> > here. That's not the case when called from enum_mbus_code() I think.
> 
> I checked this, and the handler's mutex is held in all three callers.
> 
> The driver sets sd.state_lock = handler.lock before calling
> v4l2_subdev_init_finalize() (this has been there since the initial driver
> patch). With that set, __v4l2_subdev_state_alloc() makes every state
> (active and per-file-handle TRY) use the handler's mutex:
> 
>     if (sd->state_lock)
>             state->lock = sd->state_lock;
> 
> The callers then lock that state:
> 
>  - enum_mbus_code(): subdev_do_ioctl_lock() calls
>    v4l2_subdev_lock_state(state) before subdev_do_ioctl(), which calls
>    the op, and unlocks it afterwards.
>  - init_state(): __v4l2_subdev_state_alloc() calls
>    v4l2_subdev_lock_state(state) around ->init_state().
>  - set_ctrl(): called with the handler's mutex held by the control core.
> 
> So the control values are read under the handler's lock and no extra
> locking is needed in os05b10_get_format_code(). Please let me know if I
> missed a path where the state is not locked.

Ack, thanks for checking!

Can you post a fixup patch to the issue in the second-last patch that I can
squash to it? (I'd just print the frequency in Hz, there's no reason to use
MHz here.)

-- 
Regards,

Sakari Ailus
