Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E36C3914E4;
	Tue, 31 Mar 2026 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951411; cv=none; b=YEwWhED9CyjxLVXnshQGG8Q7eCMXk5ZMnYGv7ZYMtnzA+68gaRAzUFRM1S/+iCqFyuwgxZF5RJDBvhWSIfUHww/3qwz16ID6mzJL+N0rFPB6FHF8rYfPcegJFxo1ytT6tNJU8u0p060hmrJQ4yRmTeR5g+1MF9fKrfQKdn3Q3LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951411; c=relaxed/simple;
	bh=0pJ4Ue7Kr3c3WvgvgaqpPWCVEKf1ySkyA0/BfrVeEVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bhy+CoQMFMpC8Ub+ZX94VjUr2hsYyr8o0VU2zZMXBGoNy3LoebPos4Yv8qclKmzZWiGZoXKS1R2VEks1kdxIb9V6P4pdUThsdFfTULR+Q2eHEGwmcEmGmBSH2TBQ29lrpaCuafAEVJnlkP9zmKLfACR4IxAY1Qo68BjXD/bbl9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sdDK+pmj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sdDK+pmj"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93BB11E5A;
	Tue, 31 Mar 2026 12:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774951323;
	bh=0pJ4Ue7Kr3c3WvgvgaqpPWCVEKf1ySkyA0/BfrVeEVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sdDK+pmj0SnaQxrQOpPAOEetM9KAtl6XTlXnUAFbjzm6244cd2+hbJLzhQFWqi/F3
	 ot754cZ+rZT9/ZT+f293xcT2Ey4jEOyGb4chYESbWcxkXLhOj+Cw7JIMC8hNDH6mZO
	 UZ/VJKTY+dqKa7O97sZ8BHY7PVpL91rx20FM1dPw=
Date: Tue, 31 Mar 2026 12:03:22 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH 10/14] media: rzg2l-cru: Manually track active slot number
Message-ID: <acubeMB6k88yLqlD@zed>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-10-3b7d0430f538@ideasonboard.com>
 <CA+V-a8vsxUtw4__mrNFWg+BJxKcomzgs4pMwWo=2rhip+zZ2ZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vsxUtw4__mrNFWg+BJxKcomzgs4pMwWo=2rhip+zZ2ZA@mail.gmail.com>

Hi Prabhakar

On Tue, Mar 31, 2026 at 09:30:02AM +0100, Lad, Prabhakar wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Fri, Mar 27, 2026 at 5:27 PM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
> >
> > From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> >
> > The CRU cycles over the hardware slots where the destination address for
> > the next frame has to be programmed.
> >
> > The RZ/G2L version of the IP has a register that tells which is the
> > last used slot by the hardware but, unfortunately, such register is not
> > available on RZ/G3E and RZ/V2H(P).
> >
> > The driver currently compares the value of the AMnMADRSL/H register
> > which report "the memory address which the current video data was
> > written to" and compares it with the address programmed in the slots.
> >
> > This heuristic requires a bit of book keeping and proper locking. As the
> > driver handles the FrameEnd interrupt, it's way easier to keep track
> > of the slot that has been used by ourselves with a driver variable.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> >  .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  7 +++--
> >  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 35 ++++------------------
> >  2 files changed, 10 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index b46696a0012b..bc66b0c8c15e 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -108,6 +108,7 @@ struct rzg2l_cru_info {
> >   * @vdev:              V4L2 video device associated with CRU
> >   * @v4l2_dev:          V4L2 device
> >   * @num_buf:           Holds the current number of buffers enabled
> > + *
> stray change.
>

As replied to Tommaso, all the other comments have a blank line that
match the one in the structure's members declarations.

> >   * @svc_channel:       SVC0/1/2/3 to use for RZ/G3E
> >   * @notifier:          V4L2 asynchronous subdevs notifier
> >   *
> > @@ -117,9 +118,10 @@ struct rzg2l_cru_info {
> >   * @mdev_lock:         protects the count, notifier and csi members
> >   * @pad:               media pad for the video device entity
> >   *
> > - * @hw_lock:           protects the slot counter, hardware programming of
> > - *                     slot addresses and the @buf_addr[] list
> > + * @hw_lock:           protects the @active_slot counter, hardware programming
> > + *                     of slot addresses and the @buf_addr[] list
> >   * @buf_addr:          Memory addresses where current video data is written
> > + * @active_slot:       The slot in use
> >   *
> >   * @lock:              protects @queue
> >   * @queue:             vb2 buffers queue
> > @@ -160,6 +162,7 @@ struct rzg2l_cru_dev {
> >
> >         spinlock_t hw_lock;
> >         dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
> > +       unsigned int active_slot;
> >
> >         struct mutex lock;
> >         struct vb2_queue queue;
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 9406a089ec9f..17e0153052e1 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -637,31 +637,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
> >         return IRQ_RETVAL(handled);
> >  }
> >
> > -static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
> > -{
> > -       u64 amnmadrs;
> > -       int slot;
> > -
> > -       /*
> > -        * When AMnMADRSL is read, AMnMADRSH of the higher-order
> > -        * address also latches the address.
> > -        *
> > -        * AMnMADRSH must be read after AMnMADRSL has been read.
> > -        */
> > -       amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
> > -       amnmadrs |= (u64)rzg2l_cru_read(cru, AMnMADRSH) << 32;
> > -
> > -       /* Ensure amnmadrs is within this buffer range */
> > -       for (slot = 0; slot < cru->num_buf; slot++) {
> > -               if (amnmadrs >= cru->buf_addr[slot] &&
> > -                   amnmadrs < cru->buf_addr[slot] + cru->format.sizeimage)
> > -                       return slot;
> > -       }
> > -
> > -       dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
> > -       return -EINVAL;
> > -}
> > -
> >  irqreturn_t rzg3e_cru_irq(int irq, void *data)
> >  {
> >         struct rzg2l_cru_dev *cru = data;
> > @@ -693,9 +668,8 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
> >                 return IRQ_HANDLED;
> >         }
> >
> > -       slot = rzg3e_cru_get_current_slot(cru);
> > -       if (slot < 0)
> > -               return IRQ_HANDLED;
> > +       slot = cru->active_slot;
> > +       cru->active_slot = (cru->active_slot + 1) % cru->num_buf;
> >
> >         dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> >         cru->buf_addr[slot] = 0;
> > @@ -762,6 +736,9 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
> >                 goto assert_aresetn;
> >         }
> >
> > +       cru->active_slot = 0;
> > +       cru->sequence = 0;
> > +
> >         /* Allocate scratch buffer */
> >         cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
> >                                           &cru->scratch_phys, GFP_KERNEL);
> > @@ -772,8 +749,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
> >                 goto assert_presetn;
> >         }
> >
> > -       cru->sequence = 0;
> > -
> Maybe we can move cru->active_slot assignment here and keep
> cru->sequence assignment as is. With that fixed,
>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I can do that

Thanks
  j

>
> Cheers,
> Prabhakar
>
> >         ret = rzg2l_cru_set_stream(cru, 1);
> >         if (ret) {
> >                 return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
> >
> > --
> > 2.53.0
> >
> >
