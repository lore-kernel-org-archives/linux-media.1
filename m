Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A905E419FBC
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551618; cv=none; b=PVopVEYDiRIG6lsYgjytkVxCjWpajD46JjTnlan6yjRHlqBqhZgdp3YtNkhyf7/HUVXQt/cB36Sa/1/QmIof+Kgm6DSfpqIxkS4jT3iPPVglBA2koXP2uHMZl4vLJcrgx3DERxkAJDnBZ5Ca3yroxsnWeU2FhnSgtu0PHjOvKCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551618; c=relaxed/simple;
	bh=QiU+/g2UreGuHCo1KjLawpDLh+3aTzgB7h1niiC4EXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApkrP2rrzod+vYm7XLdu+qttfHWPzHgq6Ko43oTWh3MQsMPq9bDV84gWLRBNMOxC0twjljkmoE+UgWge7JqFDYu25qPU1GiMKzqEMjfk5KTNcYf4BMdxfsw7zM7TPBi1bHq/SOGHlcvmZPCd7NgOP/0UqzhvaEO9XdTZsysSax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SzIka2s6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SzIka2s6"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91E4F161;
	Mon, 20 Jul 2026 14:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784551554;
	bh=QiU+/g2UreGuHCo1KjLawpDLh+3aTzgB7h1niiC4EXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SzIka2s67PhtiTHoW1GYKQb26ql1ZY4xPkMTQG8bHSwNKmKbEd0GZdS2pUaDAvrwX
	 bO46KRzPKBAIZRz3ywZg5hIEw9BxNrngt/0Q7uK1Q6/DldKWkIA66R/+cgjrVP4r2f
	 G1/in5CncrmwC/96iEmFvAJ8pdP+ZvwzEW8+v/28=
Date: Mon, 20 Jul 2026 15:46:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
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
Message-ID: <20260720124651.GA9442@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-13-sakari.ailus@linux.intel.com>
 <20260720084553.GD3679@killaraus.ideasonboard.com>
 <al3hi3-oTj1CCxaD@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <al3hi3-oTj1CCxaD@kekkonen.localdomain>

On Mon, Jul 20, 2026 at 11:51:23AM +0300, Sakari Ailus wrote:
> On Mon, Jul 20, 2026 at 11:45:53AM +0300, Laurent Pinchart wrote:
> > On Wed, Jul 01, 2026 at 03:26:30PM +0300, Sakari Ailus wrote:
> > > Add v4l2_subdev_call_ci_state_active(), and
> > > v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> > > take struct v4l2_subdev_client_info pointer as an argument. These ops
> > > cannot be called using v4l2_subdev_call_state_active() or
> > > v4l2_subdev_call_state_try() as the client_info argument precedes the
> > > state argument.
> > 
> > Is there a reason why the state argument can't go first ? This patch
> > then wouldn't be needed.
> 
> The client capabilities are constant as is the sub-device itself (at least
> in terms of this call) whereas the callback operates on the state, followed
> by its arguments. That is a more natural order of arguments IMO.

At the cost of lots of complexity when calling operations. Is it worth
it ?

-- 
Regards,

Laurent Pinchart
