Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C1535A3A4
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776770343; cv=none; b=r/2iSDax37csfvladnbwLgUdtKXQVzZ1hy/NdXiOKHvFJnBu3AQW/TdbngATSPqpZXzBIubq8fVUzILZ0IaQN87VwLz2NQOO2tBivvGhNv6o7eNXDierHAyokdSNUl7POvKAoyecWmQblBo3LqcOYYfL92B7oJCnRYa8QkiFqeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776770343; c=relaxed/simple;
	bh=AktxQy8Gcyptwa/BcJQ2q2D7Vgv8zLiIE3YncRQxHns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhBiP5xQrVVrkj0iCWnJr626waKh1Vup28G+d64GChBppgGgcMUC3Ky1jl7UIe0OeN0kClhc9WMhcoxGaUCEdWr43eL1vNRJBQ12EtQEjgvGHZjfUA4rCWcoDtoRkBECWG6TEyd4Jiczqd/JxdTKGdNufKNKmHwAvszhOt5pTmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KdF9uqBM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KdF9uqBM"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D735078E;
	Tue, 21 Apr 2026 13:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776770243;
	bh=AktxQy8Gcyptwa/BcJQ2q2D7Vgv8zLiIE3YncRQxHns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KdF9uqBM/h4KT/A49L0AGS6j7o4QQ5FGLxBa/7I2reg4kUK2v/WDVsfgGX2q7r68D
	 KIpilrhE+uj6QdarMtVJoANQzA0M76wjDyM34YPI3/FJ3cT5d4/ZeDHCB11tvO8Nq3
	 qHzMUni63k08BvvN8QqS0q0hs3UcT8boDUFmI+F0=
Date: Tue, 21 Apr 2026 14:18:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
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
Subject: Re: [PATCH v4 20/29] media: uapi: Bump the STREAMS bit a little
Message-ID: <20260421111859.GC2315844@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-21-sakari.ailus@linux.intel.com>
 <adjDJdB6rBscZ-lZ@zed>
 <20260416143112.GL1775831@killaraus.ideasonboard.com>
 <aedRGEfS6KHODSXK@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aedRGEfS6KHODSXK@kekkonen.localdomain>

On Tue, Apr 21, 2026 at 01:27:36PM +0300, Sakari Ailus wrote:
> On Thu, Apr 16, 2026 at 05:31:12PM +0300, Laurent Pinchart wrote:
> > On Fri, Apr 10, 2026 at 11:31:06AM +0200, Jacopo Mondi wrote:
> > > On Wed, Apr 08, 2026 at 06:39:29PM +0300, Sakari Ailus wrote:
> > > > Bump the V4L2_SUBDEV_CAP_STREAMS by one bit up, order to avoid confusing
> > > > libcamera with streams that has moved forward from the original libcamera
> > > > implementation. The bit can presumably be taken into use but only after
> > > > the other free bits.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > 
> > > Thanks!
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > 
> > > > ---
> > > >  include/uapi/linux/v4l2-subdev.h | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > > > index 2347e266cf75..6160c3e21436 100644
> > > > --- a/include/uapi/linux/v4l2-subdev.h
> > > > +++ b/include/uapi/linux/v4l2-subdev.h
> > > > @@ -196,8 +196,11 @@ struct v4l2_subdev_capability {
> > > >  /* The v4l2 sub-device video device node is registered in read-only mode. */
> > > >  #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
> > > >
> > > > +/* Reserved, old STREAMS bit libcamera used before API stabilisation. */
> > > > +/* #define V4L2_SUBDEV_CAP_STREAMS_PRELIMINARY	0x00000002 */
> > > 
> > > This should make sure libcamera versions which support the new flag
> > > won't match agains older kernel which use the old value!
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Could we delay merging this patch until we work on implementing the new
> > behaviour in libcamera ?
> 
> I guess we're not in hurry to merge this although I don't see the direct
> connection to libcamera. Are you worried someone could start using this bit
> instead before wget things entirely stabilised? :-)

That's exactly my concern, yes.

> > > > +
> > > >  /* The v4l2 sub-device supports routing and multiplexed streams. */
> > > > -#define V4L2_SUBDEV_CAP_STREAMS			0x00000002
> > > > +#define V4L2_SUBDEV_CAP_STREAMS			0x00000004
> > > >
> > > >  /*
> > > >   * Is the route active? An active route will start when streaming is enabled

-- 
Regards,

Laurent Pinchart
