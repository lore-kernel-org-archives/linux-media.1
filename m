Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7940175A84
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827507; cv=none; b=H74IiB3zD7Dk4XDt+jUFXzp1M61qqOgyeRGM/JC+NAxzB/mRfLbu2ErqBfDGyElgyyl+MtjDhQuAyW+RMmUAoR8TgPp+jbUPE98tktB8lXDe5thpuayxfARfkENvf04KubEDGcpqf5Nnz4WfVdr5bL9mZ517lqDfC+UgfWklIQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827507; c=relaxed/simple;
	bh=Ejj5yAP3NNrEQFnoRbdP3kMb84OLbx3S2u5Z5H1cN18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEPO3llWU4fmtLUPgYjE1Lj8FoH83A1XvlRQ/xH2dj4F76XAAzkTM1edsgtogKDYyCn/YkDVfPR3U4rXLFHruLkB6Bn3ZHkXcspF7PVO8qDrhJYkhgH5xTJc+Ugemnqg/jYeCHScV7UxL69wlebgoVkLiSaVqA+AJQn0M95jepw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tkKX/zO4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tkKX/zO4"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AF71236;
	Fri, 10 Apr 2026 15:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775827407;
	bh=Ejj5yAP3NNrEQFnoRbdP3kMb84OLbx3S2u5Z5H1cN18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tkKX/zO4cXftip8TvSvEEQoWz73bjEJ0JnIk2vMFCKzsLJ/r/UTSEM8q5pJ+aIkTu
	 66qgtTzbAeewaeqVaENKzxADpXDgoDOFqnTKKvq9LKUpDuCo7FsGiiUigyA8oYx8dd
	 FaeW2oOzxAYE6uy1PuwE2bDwzvJ4lzkQtHYBX6E0=
Date: Fri, 10 Apr 2026 15:24:54 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 21/29] media: mc: Don't care about unsettable flags in
 MEDIA_IOC_LINK_SETUP
Message-ID: <adj5rhRYZINXm-zs@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-22-sakari.ailus@linux.intel.com>
 <adjPiWt-UFsf0h7h@zed>
 <adjzmjukGeTesBYr@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adjzmjukGeTesBYr@kekkonen.localdomain>

Hi Sakari

On Fri, Apr 10, 2026 at 03:56:58PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> Thanks for the review.
>
> On Fri, Apr 10, 2026 at 12:31:58PM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Wed, Apr 08, 2026 at 06:39:30PM +0300, Sakari Ailus wrote:
> > > The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
> > > flags that are set by the driver are correctly set as the driver expects.
> >
> > I would
> >
> > The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
> > flags that are not configurable are not modified by userspace.
>
> Sounds good.
>
> >
> > > This poses a problem for adding new flags as programs could not work with
> > > links that have unknown flags even when the use of these flags wouldn't
> > > affect the program.
> > >
> > > Ignore the non-settable link flags.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/mc/mc-entity.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > index 717569bd1a8c..287eded356bb 100644
> > > --- a/drivers/media/mc/mc-entity.c
> > > +++ b/drivers/media/mc/mc-entity.c
> > > @@ -1319,7 +1319,7 @@ static int __media_entity_setup_link_notify(struct media_link *link, u32 flags)
> > >
> > >  int __media_entity_setup_link(struct media_link *link, u32 flags)
> >
> > Let me get this right: "link" comes from userspace. "flags" are the
> > flags set by driver when creating the link, right ?
>
> It's the other way around; this is called via MEDIA_IOC_SETUP_LINK IOCTL.
>

Ah
static long media_device_setup_link(struct media_device *mdev, void *arg)
{
   struct media_link_desc *linkd = arg;

   ...

   return __media_entity_setup_link(link, linkd->flags);
}

I've read it the other way around

> >
> > >  {
> > > -	const u32 mask = MEDIA_LNK_FL_ENABLED;
> > > +	const u32 settable_flags = MEDIA_LNK_FL_ENABLED;
> > >  	struct media_device *mdev;
> > >  	struct media_pad *source, *sink;
> > >  	int ret = -EBUSY;
> > > @@ -1327,9 +1327,9 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
> > >  	if (link == NULL)
> > >  		return -EINVAL;
> > >
> > > -	/* The non-modifiable link flags must not be modified. */
> > > -	if ((link->flags & ~mask) != (flags & ~mask))
> > > -		return -EINVAL;
> > > +	/* Only allow changing user-settable flags. */
> > > +	flags &= settable_flags;
> > > +	flags |= link->flags & ~settable_flags;
> > >
> > >  	if (link->flags & MEDIA_LNK_FL_IMMUTABLE)
> >
> > If my above understanding is correct and if you drop the above check,
> > doesn't this mean userspace can now clear MEDIA_LNK_FL_IMMUTABLE ?
> >
> > Should link->flags be replaced by "flags" here ?
>
> The intent here is to drop whatever non-settable flags the user provided
> and replace them with what is set on the link.
>
> >
> > >  		return link->flags == flags ? 0 : -EINVAL;
> >
> > And this should probably be changed as well. Unfortunately, if we
> > want to allow userspace to ignore the forthcoming MEDIA_LNK_FL_VALIDATE_LATE
> > flag I guess we need to make it an exception (which is not great, I know).
> >
> > Hope I got it right...
> >

I didn't

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
> --
> Regards,
>
> Sakari Ailus
>
