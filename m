Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FB6314A73
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536318; cv=none; b=gyViYgTMe7vhzQcY7trl93oBw9SrQjcrJzuiBUx1soO1dKIMKkT8lQp5WrWn5mNpWC83HYXu3sht0gvS7seiarz3BGob5V37cAcLl2rCRYOVudoREK4FsSP/p3XdP2vNFLPm0PrMLnwr5eVt4RbHqn0m9ROin6L7kqTxYRNWxIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536318; c=relaxed/simple;
	bh=zefJbOGzVbg/EmjxUahFHxpKtNY/nceTbZ9DQmfR6IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0gtu9C/47em7piHVt3vMbeIuasNdltTYMSnGn4w3vOP8s+5p4/Cumotcd2ee3BaqOA7MhHYDhlDZOYhbcBoR5Qnz6He+XCTjP6NJwwpdTmK5obiwbIJPezlkVmZZbrLxtrZgv6R5tHeeWf+msXBDf8WJ/BbXzTrfO9bRgzQGT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RHlPu5nL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RHlPu5nL"
Received: from killaraus.ideasonboard.com (85-76-78-183-nat.elisa-mobile.fi [85.76.78.183])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C733D289;
	Mon, 20 Jul 2026 10:30:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784536257;
	bh=zefJbOGzVbg/EmjxUahFHxpKtNY/nceTbZ9DQmfR6IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RHlPu5nLeg19KyOauFCwC1ACBRPz0ZpDiKnVn+LLmOVNJbE6pwGRQPliof300hSTO
	 11CcG1r4+lSsUcI5kQ86ZweZWKHdXvoMxdfLGzyswP+c0fqBqylPlHtbiJHznUclPP
	 /ns0tDXd4WPIh9utHif8LkfvfYkhpFpXgp2QePdM=
Date: Mon, 20 Jul 2026 11:31:53 +0300
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
Subject: Re: [PATCH v6 07/16] media: v4l2-subdev: Move subdev client
 capabilities into a new struct
Message-ID: <20260720083153.GC3679@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-7-sakari.ailus@linux.intel.com>
 <20260720063556.GD2208631@killaraus.ideasonboard.com>
 <al3MWLt9yQOAftm0@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <al3MWLt9yQOAftm0@kekkonen.localdomain>

On Mon, Jul 20, 2026 at 10:20:56AM +0300, Sakari Ailus wrote:
> On Mon, Jul 20, 2026 at 09:35:56AM +0300, Laurent Pinchart wrote:
> > On Wed, Jul 01, 2026 at 03:26:24PM +0300, Sakari Ailus wrote:
> > > Add struct v4l2_subdev_client_info to hold sub-device client capability
> > > bits that used to be stored in the client_caps field of struct
> > > v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
> > > pad operation callbacks for capability information. The main reason why
> > > this is a new struct instead of a u64 field is that modifying the callback
> > > arguments requires touching almost every sub-device driver and that is
> > > desirable to avoid in the future, should more than the client capability bits
> > > need to be known to the callbacks.
> > > 
> > > To be squashed to the previous patch.
> > 
> > It looks like you forgot to take my review comments from v5 into
> > account.
> 
> I'll drop that line for v7. I thought I already removed them all but this
> one was left.

There was also at least one other comment you agreed with in v5.

-- 
Regards,

Laurent Pinchart
