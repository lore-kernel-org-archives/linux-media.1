Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F391D39F188
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366555; cv=none; b=qqEDmqDOOaGGXb6gynCneJ6KRJTc8/PIMWcg5G4iqBCbh6XJukUZTZUyMTNbQo05mWyxNz634ybm7Sn58+leK5VPBGEspSYSRr2XXbW98PZwZzWgcXaFX721iVAJUJNQCNuTiFHi/JI747AHUVlz1yySKivaNbU0TxB8uVUEAOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366555; c=relaxed/simple;
	bh=UgXOFd48yIZXsCp5LlvzoQXH0FSfIOlVsfP0qGib4qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBHWcVX501KcCi/AWn7OP7XccPG6oti1EBikxDJdKMTgazkmnn6ajf/CVwGwGJMXpib6dHmmWZyRfsujb/mgSQ+sogr2lFaBnMgpickkxh5K90bOF6pNUiFmEfKPbOID/OBamc/nMq5E7SnoYaYft7XKJL0HT1udTkB9z0NKkj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E60I0IyE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E60I0IyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791366545; x=1822902545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UgXOFd48yIZXsCp5LlvzoQXH0FSfIOlVsfP0qGib4qU=;
  b=E60I0IyE6uLdYKL8wEJ3POG6/0r3D55OYqYeLUgq2cVfFb3cVhbfDEde
   bjBKwzI07FauIFnbr/OBhFcKaXuU5E+B9leVVOue7MCkilCSRhz0VGtDs
   KDxvOx4RCRAEsn3hES0ljk8n0h8FE2LGUsWZ5t84NAVGS5tASUHna+RVk
   EOIqDgr0McGrOCzJGuc0OgmM9zJa9dqq2YMQ7AE+6c/Y8e9uF6sIvhrjH
   DnDHeW4e1URzIMa9t+Tk4/03Vz/PU1ZrILXXy7KOEz2ehuWZxHhqEmRE1
   P7T5s1bDv+AbLco0G7ofq9H850mriG/M5ToFvwJ3+iQpMHYOidENI9trV
   w==;
X-CSE-ConnectionGUID: ydBBT2Q1SPyAXNUxP1TAbw==
X-CSE-MsgGUID: A8wkcOWfRRmUshNAlRR57Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="5003"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="5003"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:49:04 -0700
X-CSE-ConnectionGUID: Ldnu/quQQkqGaleg77o2Bg==
X-CSE-MsgGUID: kM7r9bO/Qv6feIw7R/vMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285489886"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.216])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:48:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2FC8A11F8AB;
	Wed, 07 Oct 2026 12:48:59 +0300 (EEST)
Date: Wed, 7 Oct 2026 12:48:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>
Subject: Re: [PATCH 1/1] media: subdev: Make get_fmt on INTERNAL pads without
 STREAMS an error
Message-ID: <asYVi4p-NRWuVxae@kekkonen.localdomain>
References: <20261006092950.690101-1-sakari.ailus@linux.intel.com>
 <ae109b76-67f8-456d-a233-796f50cadcb1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae109b76-67f8-456d-a233-796f50cadcb1@kernel.org>

Hi Hans,

On Wed, Oct 07, 2026 at 11:43:35AM +0200, Hans Verkuil wrote:
> On 06/10/2026 11:29, Sakari Ailus wrote:
> > Internal pads should only be accessible to file handles with
> > V4L2_SUBDEV_CLIENT_CAP_STREAMS flag set. Return an error otherwise.
> > 
> > Fixes: 49cdf56876d3 ("media: mc: Add INTERNAL pad flag")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index a07d77e584c3..7cb5a40f0f8c 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -854,8 +854,13 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  	case VIDIOC_SUBDEV_G_FMT: {
> >  		struct v4l2_subdev_format *format = arg;
> >  
> > -		if (!client_supports_streams)
> > +		if (!client_supports_streams) {
> > +			if (format->pad < sd->entity.num_pads &&
> > +			    sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_INTERNAL)
> > +				return -EINVAL;
> > +
> >  			format->stream = 0;
> > +		}
> >  
> >  		memset(format->reserved, 0, sizeof(format->reserved));
> >  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> > 
> 
> There is no documentation that I can find that says that MEDIA_PAD_FL_INTERNAL is only available
> if V4L2_SUBDEV_CLIENT_CAP_STREAMS is set.
> 
> I think this needs some more thought: if internal pads are only available if that cap is set,
> then I expect that a lot more ioctls will need this check. In that case the check should become
> a helper function.
> 
> But how does this affect e.g. G_TOPOLOGY or ENUM_LINKS? If the cap is not set, should internal
> pads still be reported?

We don't have client capabilities on MC side, at least not right now. The
INTERNAL pads are intended to be used in very special circumstances and for
that we do have sub-device capability flags. They were introduced in this
cycle and if we allow wider access to them now, there could be issues
blocking that as the interface they expose isn't intended to be used
without these capability flags.

I'll rework this to apply to the rest of the pad-related IOCTLs.

> 
> And you need checks in v4l2-compliance, ensuring that trying to access internal pads without
> that cap will indeed fail.

I can add that.

> 
> Ideally you would like to have this emulated in vimc as well.
> 
> In other words, I think this needs more work, both in the core and w.r.t. documentation.

The INTERNAL pad flag was introduced as the Maxim serdes driver needed it
and we thought it's fine to merge it early; the bulk of the documentation
resides in the depths of my metadata series.

-- 
Kind regards,

Sakari Ailus
