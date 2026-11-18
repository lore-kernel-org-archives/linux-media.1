Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999739;
	b=Khu59Vs5Y52FFrHBet38IrwQoE1PjxhcylAaTYHOEBvvVZsZpGhQIF/CGSIi+COLiUdd
	 RAntRK8gg/vuHVuvJV3lCAL7HZMQR2txi/gZLqgijTcBREOFAyfYkHKX7y0yLLfl9yXSw
	 8tL/YJpGQFVzyn/xiXdloxI0Ysynh+O3gEgU45CWWfANcNKlIVSoJ3KxV86Q8dAshPJfg
	 T0VHLc0Cu0+sOx0yR7fo4swYeNcjtXyiPGGrL1zoMyrCKzeF30rLAoooTuvyNB2zGz3GC
	 jMbiqcr2lE6OkZfmTBQzQPC4c2q5l/rUWTFZxnmGDAjCV7mBJK09ev8jgM1eLv8hCpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999739;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iHQaawlG9NYW1VlhBRBvJ4Ovu+2ivyZzcGZvkzyB+yM=;
	b=16ixHax2mcQcJ8Hvkcxrnw81Pw8dGvLFj2h9BSU5fRvnR58GtgPxYJ6vlWcoL2wS3uvr
	 vCg6gd3NHKmEamtTHUIoH44q6oL42NKNmpkE6UkKZO3ON7maz1Km+5Grn7OzjIYd/+uRj
	 aXTGEdL0RWAsxabtnhLcUi0xLkWlMDN/+1KWr+Jio0KU7UXX0/H//jITP65JjvigbsLis
	 KHJNbEdJMuUOiwvXHs2xYxdHYu8vFot5AH4Zz3SN65ruyyt3Oe3cnCTIvnRGzZz03a0cn
	 hySP5PHrwQaA6+ZN5teD//tF0irtmHHr2J8ZF6zlnZ7OF58/rKLFriunITUxoPQx5vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iA0dqRwa;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D462606A31C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 11:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D462606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iA0dqRwa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794999738; x=1826535738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nn/XTr1YRCgmJ2Yomq9VnoAGMRH49mXWARI5f7cRVqk=;
  b=iA0dqRwaLI/dnRrpVzLGUQvW5XN7AUIhxOLigOrKjo0TMFBoovmGrSxh
   +1QXnwLGkPKGsC80U8tekLW8pEJhDgtDsl0VzOWks3OCDeySe1wUjx9iP
   DxSrMNqUZpqrhCfiVSXMlhsg+vHXjy4x3x5KEzLz4UgzgGI5Jfy9C8ZhR
   ZkqwQxCYdqJ1G64Sdjyfxb/uyZrwBSzZGJENb4eyrAv7/LHYcLHptjCN4
   CFv3/qKuZThPJCk0HGYMlYC6NMEjYYJXvU5o7m+UCHgnKdkYNIyif2mnG
   sOa2q19dcjlSLTMj3svkDSjOUQn7UfgL2OftxKxLAQz7/H5zkR5UDBcLF
   w==;
X-CSE-ConnectionGUID: 8yCHI090SciBBQuIl7FrYg==
X-CSE-MsgGUID: jZuNaOlSRpuzinjZsGMMdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3692291"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3692291"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:02:17 -0800
X-CSE-ConnectionGUID: uWIl3VGmT6Gl0BokofVSNA==
X-CSE-MsgGUID: ku8mxDNBQIOOKO4NEV2Xug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10356419"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:02:11 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2792D121B71;
	Wed, 18 Nov 2026 13:02:09 +0200 (EET)
Date: Wed, 18 Nov 2026 13:02:09 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
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
	" Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v12 30/86] media: Documentation: Add binning and
 sub-sampling controls
Message-ID: <av2FscJ7JJ-JuzXu@kekkonen.localdomain>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
 <20260409201501.975242-31-sakari.ailus@linux.intel.com>
 <177929435413.2341049.9256551425193410552@selene>
 <178894548965.11722.1572509771464197490@freya>
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
In-Reply-To: <178894548965.11722.1572509771464197490@freya>

Hi Jai,

On Wed, Sep 09, 2026 at 02:48:09PM +0530, Jai Luthra wrote:
> Hi Sakari,
> 
> + Laurent
> 
> Quoting Jai Luthra (2026-05-20 21:55:54)
> > Quoting Sakari Ailus (2026-04-09 22:14:05)
> > > Document the binning and scaling controls (V4L2_CID_BINNING and
> > 
> > nit: s/scaling/sub-sampling
> > 
> > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > 
> 
> Sorry for bringing this up again, after providing my ack months ago.
> 
> > > V4L2_CID_SUBSAMPLING_{HORIZONTAL,VERTICAL}) in the common raw sensor
> > > model.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >  .../media/v4l/subdev-config-model.rst         | 20 ++++++++++++++-----
> > >  1 file changed, 15 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > index 0fb01bf6c825..fb6d8a1bcac7 100644
> > > --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > @@ -144,8 +144,12 @@ separately horizontally and vertically.
> > >  
> > >  The combined effect of binning and sub-sampling is configured using the
> > >  ``V4L2_SEL_TGT_COMPOSE`` rectangle, relative to the analogue crop rectangle, on
> > > -(pad, stream) pair 1/0. The driver implementation determines how to configure
> > > -binning and sub-sampling to achieve the desired size.
> > > +(pad, stream) pair 1/0. It depends on the driver which of these operations are
> > > +being used to achieve the resulting size. Binning and sub-sampling are also
> > > +directly configured using :ref:`V4L2_CID_BINNING_FACTORS
> > > +<image_source_control_binning_factors>` and
> > > +:ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and V4L2_CID_SUBSAMPLING_VERTICAL
> > > +<image_source_control_subsampling>` controls on drivers that support them.
> > >  
> > >  The digital crop operation takes place after binning and sub-sampling. It is
> > >  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> > > @@ -216,9 +220,15 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> > >        - \-
> > >        - X
> > >        - Binning and sub-sampling. This rectangle is relative to the
> > > -        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
> > > -        combination of binning and sub-sampling is configured using this
> > > -        selection target.
> > > +        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). Binning is
> > > +        configured using the :ref:`V4L2_CID_BINNING_FACTORS
> > > +        <image_source_control_binning_factors>` control and sub-sampling is configured
> > > +        using the :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
> > > +        V4L2_CID_SUBSAMPLING_VERTICAL <image_source_control_subsampling>`
> > > +        controls on drivers that support these controls. To configure binning
> > > +        and sub-sampling on drivers that do not support these controls, the
> > > +        selection rectangle may be changed directly to configure the combined
> > > +        effect on the image size.
> 
> While discussing the libcamera design to support binning and sub-sampling
> using the new model, I realized that drivers have two different ways to
> configure binning and subsampling, listed below:
> 
>     1. Use the CID_BINNING_FACTORS and CID_SUBSAMPLING_HORIZONTAL/VERTICAL
>        controls, and reflect the final resolution through the compose
>        rectangle as read-only
>     2. Allow writes to the compose rectangle directly, without a clear
>        split between binning and sub-sampling
> 
> Pre-ADC there is usually only binning and skipping possible from what I've
> seen. And arbitrary Post-ADC scaling can be handled by the compose
> rectangle on the the source pad.
> 
> So do we really need to allow the second way of userspace configuring the
> image pad's compose rectangle directly?

Thanks for the review.

I think this was written before adding the two controls. I'll change the
COMPOSE rectangle synopsis as (and make it unmodifiable):

      - Binning and sub-sampling. This rectangle is relative to the
        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
        combination of binning and sub-sampling is expressed with this selection
        target.

-- 
Regards,

Sakari Ailus
