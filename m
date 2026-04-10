Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB7C35B632
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816967; cv=none; b=cqa5eOjiae7SAU4yp7hCxYW8KcRH8YuX/bOODblO3BDbahdEwI2ViyNTql9/XjrQ/0QP7Qh1jR+p/1DWpoBo1GNuJGqL+nd8LElCAZCmOdpQbvuSMyMfFHJbN/9JyfI0la0d4ruy1Kb7l4V651EshATyb5x9Kkg4xcflcnj/7J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816967; c=relaxed/simple;
	bh=GBA2N4ydXrEaNvMl8iLX9vxYXFYzDm5ad4wQk7elsTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDu+51z9H7xhst5FBWQwDDIPHoGSo/FZ/oGntQYiIH7xoOGgfo+1rE7dn8q8PV92YriK2ej0VA6DLgJhngR/rRW2lfj+XM77JPENntJA81VrdFW1Vst3hqkElJGFm5Mq/L28ttb3lwzbdQyJFrEi6GQTgqSyGAxoOcMEioI4Ppw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5nj/9nG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5nj/9nG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775816966; x=1807352966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GBA2N4ydXrEaNvMl8iLX9vxYXFYzDm5ad4wQk7elsTE=;
  b=g5nj/9nGAtaeKMvR7OK1qr7+KX/OMnA2UelUWG4pm0jY5LTLjvf+1+wL
   khoZQNTOcrdQgzPzGJdXmMQfg2+yz74B3T4G4kfPhDK+OgU9ONBCDYkHk
   mV784b0L2OkztFuiqqWli39PGhloHoCZvbrz6dmCO7cb1WsiqhtW9ocZT
   0HzGWAWnEiV/3xD+WXWqRMWPLgejPLwb72wWJGsUQ0jkGSv6LDQm8mxoc
   N6clcR3jqvut2ugKnjlTPlMafShQCtaC4ruHnw4DE7MUNaNiLCEi/gPFT
   HjTUREF+QAq77m18nn+b5fti5hwPdQ5NGT9N6f1pncn05EK8tBqkkxTK4
   Q==;
X-CSE-ConnectionGUID: A3+bDPeoR8eGOWY9JOpnew==
X-CSE-MsgGUID: arQ9FWRRRMy0hOLj13ad/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76955878"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76955878"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 03:29:26 -0700
X-CSE-ConnectionGUID: QXXvMi7qR9OvEgC1PsjHEg==
X-CSE-MsgGUID: up1gmfEnScyqMaIwAehZkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="233975937"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 03:29:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8AFEF120F00;
	Fri, 10 Apr 2026 13:29:34 +0300 (EEST)
Date: Fri, 10 Apr 2026 13:29:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 06/29] media: imx219: Don't update exposure limits
 while setting format
Message-ID: <adjRDpj0HjVN4exx@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-7-sakari.ailus@linux.intel.com>
 <adi4VeDEtQzBCuXy@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adi4VeDEtQzBCuXy@zed>

On Fri, Apr 10, 2026 at 10:44:33AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Apr 08, 2026 at 06:39:15PM +0300, Sakari Ailus wrote:
> > Don't update exposure limits explicitly while setting format. This is
> > already done through the s_ctrl() callback.
> 
> already done through the s_ctrl() callback for the VBLANK control.

I squashed this to the patch that adds LLP and FLL controls.

-- 
Sakari Ailus
