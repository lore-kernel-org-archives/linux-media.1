Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB9234EEF7
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783167383; cv=none; b=dlkVGI/6ftmM9Spr3j/TRkoOWDKzgino8i+51WfwFbNbzqfBkuH2Vn6T6q94MF/jQK5HWusdzkNZSzU+1WkG/ZXu0dFV5+SA1E675CcVzA3EXe0FvgWESoJiMG7S4Fhsk9UXL1tY1eGwLCKUGTj+f/9/VdKgP5PLAc4wdOpZiwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783167383; c=relaxed/simple;
	bh=xhQgV14bcHK6645fVIadpaONbwTTdHdy2ABb7xhAX7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqckYqkaDy27yaUC6n0gXd78ZcVGXEbArDvT62d30OeSF3CEfh5lfKCv4tTWtQLa4NUakb+OylASXhqlsOrht7XPx2S2pajFKvY5fUtUN/EsroOqU2O+2XeuPmcnknMhaxsQdIXColQdxhfgF1ufUfbDgWX4eBLgdwBujaFO+mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQXN2kPT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQXN2kPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783167382; x=1814703382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xhQgV14bcHK6645fVIadpaONbwTTdHdy2ABb7xhAX7g=;
  b=lQXN2kPTYRzc6dC8znw2DJSNOLJSHqgAAcze24h5oWiPTHJfy9UFf368
   5saBeR/f+lCXi4PpaBsfCy/Ovb6raqN1vlvysERZ9XXUpsom/eypgEmrN
   6TOSLxtW2T0HEllQMuBflwEh9T5tHmqtYM/d1YQTQ2+McwNVQSpRVprIY
   ovb0L96ewX4jgpzRx2pBp1ST2CoCGDsNDeHIRz9LXsH0RPYqQwTPHnayy
   z7wD8eKv2oB8xLdD2NSDYZA71wYw2oKOUzMRjOGFbiaK244/GGbut13o9
   f3D9jpoKvX6L2vOeAqzQ4YUPSyFRnPLOpro4sGi/lEbFWan4Ut1GbbOAy
   A==;
X-CSE-ConnectionGUID: GsBmS5V4Tc2hBNnXNoo1ng==
X-CSE-MsgGUID: yLds5aVTQre2xrSzENBmcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87792021"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="87792021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 05:16:21 -0700
X-CSE-ConnectionGUID: mDplI5DRT16nAKOBBqgJig==
X-CSE-MsgGUID: JwYtuPbuQJuIOmWtyDxQQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="257184118"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 05:16:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 50EE8120221;
	Sat, 04 Jul 2026 15:16:13 +0300 (EEST)
Date: Sat, 4 Jul 2026 15:16:13 +0300
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
Subject: Re: [PATCH v6 13/16] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_state_{active,try}
Message-ID: <akj5jZqMtGip7NwC@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-13-sakari.ailus@linux.intel.com>
 <akVHAKPeDNzcqTIV@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akVHAKPeDNzcqTIV@lizhi-Precision-Tower-5810>

On Wed, Jul 01, 2026 at 12:57:36PM -0400, Frank Li wrote:
> On Wed, Jul 01, 2026 at 03:26:30PM +0300, Sakari Ailus wrote:
> > Add v4l2_subdev_call_ci_state_active(), and
> > v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> > take struct v4l2_subdev_client_info pointer as an argument. These ops
> > cannot be called using v4l2_subdev_call_state_active() or
> > v4l2_subdev_call_state_try() as the client_info argument precedes the
> > state argument.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-subdev.h | 95 +++++++++++++++++++++++++++++--------
> >  1 file changed, 74 insertions(+), 21 deletions(-)
> >
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index e08615179e7b..056eaa949786 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1964,6 +1964,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
> >  		__result;						\
> >  	})
> >
> > +#define v4l2_subdev_call_drop_fourth(first, second, third, fourth, rest...) \
> 
> Suppose this macro is internal used. is it better and __ prefix
> 	__v4l2_subdev_call_drop_fourth

I'll do that for v7.

-- 
Sakari Ailus
