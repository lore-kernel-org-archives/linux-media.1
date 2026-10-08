Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE353D669A
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 07:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445887; cv=none; b=YMJ2WcTsY6BXvONVzA2ZfZp4hVwFVPMxXjIm9tIumuIXtOjgXQsNjEFHUOoaBNC3olEQ2w/nwhyYtU0tsPlKbidFp8oPg/vr1cU1Q9bbSqGeCMQ1EuXm36E3U7kwg08OMkuKcChaJL4vAxq+bfqpnydBNDancH9yvg5smfZPyEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445887; c=relaxed/simple;
	bh=0jbqUXF1O8UyfePDXdKwjwfBZ73ehbcrQLDKJkg6U9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4sKHrhQN8VWS2bU7yZ78gYrod0BFh5akQNFUovD1dXM9JkUpsUZkYU+Kc9HVsgSScQyuAV7HPVf3E4QkySAXywiQQ5+qC0i8KykHKKwW54eWNBSZKSItFjmGyCQAjwDxOIPCwmsOIHHdfYdeXXksaGhilA3Q5juqiMcodTYsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=koxY/aDg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="koxY/aDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791445886; x=1822981886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0jbqUXF1O8UyfePDXdKwjwfBZ73ehbcrQLDKJkg6U9Y=;
  b=koxY/aDgdOOYuXOyE995zEQmMlte+cGx60/HpZshRHLMFHTBl0GML9EI
   3GFR0afUiu843E6DycfLJ08Ie752IuwLoKrtSx116OT1rE+CmAYKVEfuZ
   UqG1CrdYVtxn8tTQtm3mreuU4H3CwjwdvdQXSbTMMHWY2yYF0ZVSZQ7WM
   G91+92PzZyFfMwux9kqjbMuTza6J1EsXULS0NMPf/OQ5gR5h+HXJadV2h
   bgQ0nHTR3zLmToxzxmYIibwI9ElA/iFoWARvq3GDAw/BP4L5Tql7EyaLu
   2edak+TNkcIpR7pVM4bC4FrPN+wvOlGfNuysba0Oj4dCmp8hiJiB4dlgL
   Q==;
X-CSE-ConnectionGUID: hsgyFtuURbae/ciYh3IrOw==
X-CSE-MsgGUID: p7HWWLU2RZKen+T5uwpZ9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="123581"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="123581"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 00:51:25 -0700
X-CSE-ConnectionGUID: Tamn9tkYSMOSqaP1DtRsng==
X-CSE-MsgGUID: Q9oBogAKRRyJpzJL6CjBxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="289212"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.95])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 00:51:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4773A121B94;
	Thu, 08 Oct 2026 10:51:18 +0300 (EEST)
Date: Thu, 8 Oct 2026 10:51:18 +0300
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
	Antti Laakso <antti.laakso@linux.intel.com>,
	Dumitru Ceclan <dumitru.ceclan@analog.com>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Quentin Freimanis <quentin@q-lab.dev>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH 2/2] media: maxim-serdes: Disable test pattern generator
 for now
Message-ID: <asdLdp-Jiba_vc2r@kekkonen.localdomain>
References: <20261007204135.782415-1-sakari.ailus@linux.intel.com>
 <20261007204135.782415-3-sakari.ailus@linux.intel.com>
 <a2d805e4-71bb-4e05-9bd2-53d5f439274e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2d805e4-71bb-4e05-9bd2-53d5f439274e@kernel.org>

Hi Hans,

On Thu, Oct 08, 2026 at 08:58:20AM +0200, Hans Verkuil wrote:
> On 07/10/2026 22:41, Sakari Ailus wrote:
> > Disable the test pattern generator that uses the INTERNAL pad flags for
> > now.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/maxim-serdes/max_des.c | 3 +--
> >  drivers/media/i2c/maxim-serdes/max_ser.c | 3 +--
> >  2 files changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c/maxim-serdes/max_des.c
> > index 1cbe4c3a3233..cb43edf7a9ae 100644
> > --- a/drivers/media/i2c/maxim-serdes/max_des.c
> > +++ b/drivers/media/i2c/maxim-serdes/max_des.c
> > @@ -137,8 +137,7 @@ static inline unsigned int max_des_phy_to_pad(struct max_des *des,
> >  
> >  static inline unsigned int max_des_num_pads(struct max_des *des)
> >  {
> > -	return des->info->num_links + des->info->num_phys +
> > -	       (des->ops->set_tpg ? 1 : 0);
> > +	return des->info->num_links + des->info->num_phys;
> 
> I think you need to add a comment here and also in max_ser.c.
> 
> E.g. something like this:
> 
> static inline unsigned int max_des_num_pads(struct max_des *des)
> {
> 	return des->info->num_links + des->info->num_phys;
> 	/*
> 	 * TODO: once MEDIA_PAD_FL_INTERNAL is enabled in the uAPI we
> 	 * can add the TPG pad:
> 	 * return des->info->num_links + des->info->num_phys +
> 	 *       (des->ops->set_tpg ? 1 : 0);
> 	 */
> }
> 
> That way it is actually recorded in the source why the tpg pad is currently
> not added and what to do to add it back.

I'm adding the reverts of the two patches to my metadata series. I can add
a comment here, too, if you wish.

-- 
Regards,

Sakari Ailus
