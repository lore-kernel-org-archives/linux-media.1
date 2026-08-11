Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7783941A4F5
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786437544; cv=none; b=cS4zi+X+g3mrZEO4AWy7Pwd7C9xbURAl/TAAtoI67yp+gcNzEbTvvDt4WAzxXzw+wZ7rlPKoefTNxdH4GA9ZXyt/OJOehdRTbyYtJYHd6HfcwrNU2ewi+YvrbHiJHEXmTueFIMbkIlhw0MYetd+/UbSm7CiHcnMiefEYXn6psw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786437544; c=relaxed/simple;
	bh=syqT7P59cOpbBoF+9malbFKFOrw3l2kwwr/daq0ZsBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6g9USsF7TyeZUlwiUvKBx+A0wcsox0f3Q46MJ6SKNly503+arcFDBz/Ybb6Fdmz9H/BiBv8G+z5uIpSprsHiHLFV3UlJ1LQ86SQNMX95xc7xPVVckTunwiZg9Lc2O4Ifvg2bGvz3gXYBUwTt49l0J9Gj87rFFm0nj3XETnbEiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VlOOM3nY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VlOOM3nY"
Received: from killaraus.ideasonboard.com (unknown [83.245.238.164])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1571DA25;
	Tue, 11 Aug 2026 10:37:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786437464;
	bh=syqT7P59cOpbBoF+9malbFKFOrw3l2kwwr/daq0ZsBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VlOOM3nYYvbywYpSKVRzkLdUgBIG5OBYupxz+pO2bMo38S8BFfHjNOA36Tv/bIWDr
	 xJPAEJ0qXOf8qneZbX7P5Gfg/jX0jJ/szDHG/sjxew2UHBKHvbm5bq06HSf9R/FBL/
	 f5Y5O7L+siQf7l91NFm0GiD52t2r8egalAnJq9J4=
Date: Tue, 11 Aug 2026 11:38:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
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
Subject: Re: [PATCH v7 11/14] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_state_{active,try}
Message-ID: <20260811083854.GA3120099@killaraus.ideasonboard.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-12-sakari.ailus@linux.intel.com>
 <65b0c3ab-ae76-49ec-824a-b9d882c28a5c@kernel.org>
 <20260810153207.GC3011310@killaraus.ideasonboard.com>
 <anrNQN93dT51kM3s@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <anrNQN93dT51kM3s@kekkonen.localdomain>

On Tue, Aug 11, 2026 at 10:20:32AM +0300, Sakari Ailus wrote:
> On Mon, Aug 10, 2026 at 06:32:07PM +0300, Laurent Pinchart wrote:
> > On Mon, Aug 10, 2026 at 04:12:31PM +0200, Hans Verkuil wrote:
> > > On 07/08/2026 14:24, Sakari Ailus wrote:
> > > > Add v4l2_subdev_call_ci_state_active(), and
> > > > v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> > > > take struct v4l2_subdev_client_info pointer as an argument. These ops
> > > > cannot be called using v4l2_subdev_call_state_active() or
> > > > v4l2_subdev_call_state_try() as the client_info argument precedes the
> > > > state argument.
> > > 
> > > So if we have to jump through all these hoops just because the client_info
> > > pointer precedes the state pointer in the pad op argument list, wouldn't it
> > > be better to swap the order? For example by moving the client_info pointer
> > > as the last argument?
> > > 
> > > Honestly, these macros are getting really hard to follow, and I'm not sure
> > > it is worth it just to keep the client_info before the state pointer. Yes, that's
> > > the logical order, but at the price of some very hard to read defines.
> > > 
> > > Or am I missing something?
> > 
> > Those are exactly the points I raised in the review of v6 :-)
> 
> And my answer then was that I prefer some additional complexity on the
> framework side -- where we have a single implementation of this -- over
> pushing less than ideal APIs to all the drivers.

I'm not convinced, but I won't make that a blocker if it's only me.

> To give some idea, we currently have about 200 drivers implementing the
> set_fmt() pad op.

Does the order of arguments really matter for drivers implementing those
operations ?

> I also expect the number of pad ops where we need client
> info will grow over time, making this quite a bit more visible in the
> drivers than the scope (set_fmt, get_selection and set_selection)
> introduced in this set.

-- 
Regards,

Laurent Pinchart
