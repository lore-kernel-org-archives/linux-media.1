Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCBE1D8E01
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783167097; cv=none; b=OV2eHb12Fo0O1h+Qj3O1XuQQBcqC85LMMm180gSVevN8C7rsSjb4455K54CH5HpjVM4IwY0t6SXzHxDRgcCySHFAaoycmAWVSviIE3IIL9q4+TVZVTWoTKRW7VT5DkI+VOvFByfhEflqixZpHul/Cl+6J7bkhG/T415FkBosfCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783167097; c=relaxed/simple;
	bh=KcYiN9ZEmCuUrhWeYhksRMf2UeX5nnpi6ToG1BuBdIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bi4tJU4g2m86m9rNM7ywpH96c4tuqaoAqqtLomAad45DzVsn7juSFdz24td9llrjBaT0PKJMg6WNYyY6RI03rPgh6zaXihU2FdQpk8/t91XpgMqaRXHfievGdUuZUS6p7sfrHElOaR79w/QMrttWRlKj1ivLdzqKp1pRqoF/Kd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwHZioDm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwHZioDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783167095; x=1814703095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KcYiN9ZEmCuUrhWeYhksRMf2UeX5nnpi6ToG1BuBdIk=;
  b=jwHZioDmQYjDR5zB1NokpJOYvOc7Kfmt5tEca+Zyl1XZgMYYmyHxBXRS
   ndOZoGytgvORBpkJ72rIrY2vDl+pz6Yo7uZxoZaZT+M4XeFQMZjiyMcG6
   Pu77IUk+Oq5B+F6zIyOJhDSEpm0RzoCC8cupKeuCI7rkai89NRC7n3OJf
   UeVQRv54MAvDWFJDxNi13pN0cXNw51M8IrZnzdAL9HiAACoH2ZzX0WgrK
   LLQCoiXQwbSM7yu9XJRn2L86ZxBB9rPO/B1PfYTXU4OiibECEb3+MzGuC
   8rMfibYWZjb59jSSTZTECjd2R5SRUxoJ+KmCGhXLuPSI3HyPpWLdEa3qi
   g==;
X-CSE-ConnectionGUID: Tk8iT681RFalJvfkyot5nA==
X-CSE-MsgGUID: /+oyzzw2Qniu5yKAHQH8Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="106675328"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="106675328"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 05:11:35 -0700
X-CSE-ConnectionGUID: lqGhGszXR0Ss625NAu3M6w==
X-CSE-MsgGUID: swQhxLoMSXuec3DKCYVLCQ==
X-ExtLoop1: 1
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 05:11:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 47558120221;
	Sat, 04 Jul 2026 15:11:28 +0300 (EEST)
Date: Sat, 4 Jul 2026 15:11:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
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
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v6 08/16] media: v4l2-subdev: Move op check to sub-device
 op wrappers
Message-ID: <akj4cGpjTo_p5HiH@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-8-sakari.ailus@linux.intel.com>
 <akVCXOP8Nwsv8Ji2@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akVCXOP8Nwsv8Ji2@lizhi-Precision-Tower-5810>

Hi Frank,

Thank you for the review.

On Wed, Jul 01, 2026 at 12:37:48PM -0400, Frank Li wrote:
> On Wed, Jul 01, 2026 at 03:26:25PM +0300, Sakari Ailus wrote:
> > +	return do_subdev_call(sd,
> > +			      ({
> > +				      int ret = check_which(fie->which);
> > +				      if (!ret)
> > +					      ret = check_pad(sd, fie->pad);
> > +				      if (!ret)
> > +					      ret = check_state(sd, state, fie->which,
> > +								fie->pad, fie->stream);
> > +				      ret;
> > +			      }), pad, enum_frame_interval, state, fie);
> 
> look like similar with above check logic, can you use helper funciton
> or macro to reduce duplicate and easy to read.

The resulting helper appears very use case specific but it still fits to
three IOCTLs. I'll do that for v7.

-- 
Regards,

Sakari Ailus
