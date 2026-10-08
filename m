Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CECA48FF8E
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462413; cv=none; b=urk6ZR90CpPUwHXy7RhXjfVjDMbwpE7w3yYCNVnGjw845gNnWFIJQOi+/5B4UZuKvyI1/OtuLueTKbotGxSkJnG5Xvf6JDODDeUDKDRe9XyjNs02uSKPoFYJ+P3ldV8QxquYazVxOG0AJ9OTvgDH26vYUOmu9XtC5Ve3FiiQdoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462413; c=relaxed/simple;
	bh=PUMTXhGffUnR4KsUVaiG/iVl7Snj53MQxFjZnFNcqXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWT5GPrRu6FzLedMXMJBLpGdZp9kIJEqh4OqbUAPlLHVI99KemAIn/QIjTS35atF2eloSqM02OOdf4GTD2ErHxfBNWuN/eVdgh9s5rt4JksnLOYxbIarvTYFsXa5POaGVhrhgHQ+6bdvtQAlCUxGvS8OyjpV1QlHMY2dhCGF6vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkCu3/gO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkCu3/gO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791462408; x=1822998408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PUMTXhGffUnR4KsUVaiG/iVl7Snj53MQxFjZnFNcqXM=;
  b=YkCu3/gOaJzcAFX1fZwpm95eHMApMEwwvboRUOV2NsTH2cO84+USGtkD
   H6xiWmK+Ny4qms0mq1tJnuevuX56sd9WrXI5pWcCLTdvn5noyT5+cYE9N
   vMKDTfYoZvKSHyA2y4k/w8X3ARBTMw9S3mmXYTLTjJt7Dyj/cz/NJ53t8
   QnvqDT9WqNao4Re/afizfnBlX881eQpTxoY/tYTTnpZz4n4M3J/u1iyxq
   fdfvFrUo7tzih6KkwRobPGiddYgQpEOR/2Bb4AKs2tOMmZo9SJqILOyYj
   Asqs5OYCs8cYcltLUNTT/UStQRCnffRQeUiWsPdfrFekwJ/D9AYNmmiWR
   w==;
X-CSE-ConnectionGUID: ao1zY58ERHO9E9vpduv1Ig==
X-CSE-MsgGUID: 2GZtM9QTS62wTXnYSdtRIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="241277"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="241277"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 05:26:47 -0700
X-CSE-ConnectionGUID: zmfrXQaCSmi9vs6w7bLWnw==
X-CSE-MsgGUID: ci7UNc3ZQy6G87YvGyx/eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="480441"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.95])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 05:26:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 575F211FBA6;
	Thu, 08 Oct 2026 15:26:42 +0300 (EEST)
Date: Thu, 8 Oct 2026 15:26:42 +0300
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
Message-ID: <aseMAtCqoVBz7ggH@kekkonen.localdomain>
References: <20261006092950.690101-1-sakari.ailus@linux.intel.com>
 <ae109b76-67f8-456d-a233-796f50cadcb1@kernel.org>
 <asYVi4p-NRWuVxae@kekkonen.localdomain>
 <07ce46a4-a8f7-49fc-8ceb-7276abc0d4ad@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07ce46a4-a8f7-49fc-8ceb-7276abc0d4ad@kernel.org>

Hi Hans,

On Wed, Oct 07, 2026 at 12:14:46PM +0200, Hans Verkuil wrote:
> On 07/10/2026 11:48, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Wed, Oct 07, 2026 at 11:43:35AM +0200, Hans Verkuil wrote:
> >> On 06/10/2026 11:29, Sakari Ailus wrote:
> >>> Internal pads should only be accessible to file handles with
> >>> V4L2_SUBDEV_CLIENT_CAP_STREAMS flag set. Return an error otherwise.
> >>>
> >>> Fixes: 49cdf56876d3 ("media: mc: Add INTERNAL pad flag")
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>  drivers/media/v4l2-core/v4l2-subdev.c | 7 ++++++-
> >>>  1 file changed, 6 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> index a07d77e584c3..7cb5a40f0f8c 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> @@ -854,8 +854,13 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >>>  	case VIDIOC_SUBDEV_G_FMT: {
> >>>  		struct v4l2_subdev_format *format = arg;
> >>>  
> >>> -		if (!client_supports_streams)
> >>> +		if (!client_supports_streams) {
> >>> +			if (format->pad < sd->entity.num_pads &&
> >>> +			    sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_INTERNAL)
> >>> +				return -EINVAL;
> >>> +
> >>>  			format->stream = 0;
> >>> +		}
> >>>  
> >>>  		memset(format->reserved, 0, sizeof(format->reserved));
> >>>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> >>>
> >>
> >> There is no documentation that I can find that says that MEDIA_PAD_FL_INTERNAL is only available
> >> if V4L2_SUBDEV_CLIENT_CAP_STREAMS is set.
> >>
> >> I think this needs some more thought: if internal pads are only available if that cap is set,
> >> then I expect that a lot more ioctls will need this check. In that case the check should become
> >> a helper function.
> >>
> >> But how does this affect e.g. G_TOPOLOGY or ENUM_LINKS? If the cap is not set, should internal
> >> pads still be reported?
> > 
> > We don't have client capabilities on MC side, at least not right now. The
> > INTERNAL pads are intended to be used in very special circumstances and for
> > that we do have sub-device capability flags. They were introduced in this
> > cycle and if we allow wider access to them now, there could be issues
> > blocking that as the interface they expose isn't intended to be used
> > without these capability flags.
> 
> So are the internal pads exposed or not through these MC ioctls? That's not clear
> to me. It's not documented either.

The pads naturally are exposed via MC, like any other pads. Neither the
sink nor source pad documentation discusses whether the pads are
user-visible so I don't thin this explicitly needs to be specified for
internal pads either.

> 
> > 
> > I'll rework this to apply to the rest of the pad-related IOCTLs.
> > 
> >>
> >> And you need checks in v4l2-compliance, ensuring that trying to access internal pads without
> >> that cap will indeed fail.
> > 
> > I can add that.
> > 
> >>
> >> Ideally you would like to have this emulated in vimc as well.
> >>
> >> In other words, I think this needs more work, both in the core and w.r.t. documentation.
> > 
> > The INTERNAL pad flag was introduced as the Maxim serdes driver needed it
> > and we thought it's fine to merge it early; the bulk of the documentation
> > resides in the depths of my metadata series.
> > 
> 
> Ah, that's not something I was aware of (or may have been aware of, but forgotten). Adding
> a new uAPI requires a lot more care: proper documentation, v4l2-compliance tests, if at all
> possible emulation support in one of the test drivers.

Note that the maxim-serdes driver does not expose any functionality that
would depend on the internal pads solely; it requires streams API
enablement that is behind another kernel change. It is thus very, very
unlikely to cause any issues. On the other hand, no functionality is
disabled by the other two patches I posted to hide the INTERNAL flag from
the userspace.

An example of the contrary, though, is fairly recently merged STREAMS
capability flag, which in its current state cannot be taken into use --
we'll have to use another bit, as enabling this flag now will break
libcamera. The problem here is that the flag is changing the behaviour of
existing interfaces but at the time of the introduction of the flag it
wasn't exactly specified how the existing interfaces would be affected.

> 
> Neither was it reviewed by the media maintainers (me or Mauro). I'm really not happy about
> that. uAPI changes have to be reviewed by the media maintainers.
> 
> Before rc1 is released you must have a patch series ready (and reviewed by me) adding proper
> documentation, fixing issues like the one addressed in this patch, and a patch for
> v4l2-compliance.
> 
> Ideally also a patch to emulate this in the test driver (probably vimc), but that will
> likely take more time.
> 
> If it is not properly documented etc., then I might decide to revert this driver + uAPI
> change in 7.4-rcX.
> 
> As media committer it is your responsibility to ensure that the media maintainers have
> reviewed uAPI changes and are OK with it. That clearly didn't happen here.

In retrospect, I agree I should have explictly asked you before merging the
patch. My apologies for that. Still, versions of the patch have been out
for review for more than three years and while the previous version you've
commented is v6 (in 2023), there have been six more versions for review
where you've been cc'd and additional 15 versions of the maxim-serdes
driver patchset containing the same patch (where you haven't been cc'd
though).

My hope is that we'd get the metadata series, which contains multi-stream
support on which work has been done for more than a decade now, merged in
7.5 (or at least not much later than that), with userspace support in
libcamera which Jai has been working on. I'll post a new version of that
once we have rc1.

-- 
Kind regards,

Sakari Ailus
