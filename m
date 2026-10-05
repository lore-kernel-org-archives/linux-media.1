Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369204CC261
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 16:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216374; cv=pass; b=OQkl4dN5lq/YsozihG9iCxeOevOGsRdLeKOjJmySSnQbPqUaHRgbOft6HJDq6mOzBgLJwhUHsQ5efs/mc7/VhohFipMBuL/8k9A7ORRCG+P6KT7O0n+NuimJs/+0zD8+r9L/cwdm4VjjYb967Sp/W0dmWwR5BHxyEXblCuvQq94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216374; c=relaxed/simple;
	bh=Aq9n+WVXpMtFimt1yOlnQ5XvkLhJlSuqBmqy8/y2ArE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tRnoII8KCE8imXjgGoj4khV6lmwn6OTT0sHKU+1geQCA3sTO+av2Bin1wDr6undjLGM51YRatBCEfAfacAQpveVDoCrjQy1vs36nE6deXnB8sa8+hnwdzSZh2eIrfvcmEEC7C3SoBhyesM7jEgzSWusN9j9D2JP8FQVUBhUXSXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=EOJElG+y; arc=pass smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="EOJElG+y"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-7fcb425fc2bso1484859a34.3
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 09:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791216371; cv=none;
        d=google.com; s=arc-20260327;
        b=ok+5+zGhQO7dWg3dihSf7yssE3SDKsuVu74DmztELF/Qjou/Ta/6fupKEgFC6wg8nz
         DWn7GxiVLWQs5tMdi+i31mzd45O51w7z6wfwcpPQ4vXf8WYX651dd2/Sj9fc1YAFcbDm
         dwfeOAaPE2WTv9IrgjhEu+4tScl8WDj6PzEsg/1+Uv4Q4uXfEjqoOw0ccwhnS0IBkRr6
         ZXqx0QuvymgNr1VabjpnNIxKiEn7EZD/G8tNzL2lmm0BDj7c3CHLn7vk9KAbLk+T22aO
         JfmTHdX45B/TKd8HGaEUO/t+BrL39o2y6QlMuVJm33Bwj0YLXh1o6RXg3KPU8ODMREdy
         TvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iXYOVHIBN9ZC5y6W29Gxv1RB4crN6nX0cmKZsey6SkQ=;
        fh=IYmTmWGrXViLAWXZBPf85AkrkuvMRZSKYhUJpvjGDac=;
        b=OyWKVs1g7PP+RFrh0SKTHdl7nBeAmYeI4iHPb16FmilICcIrgXVeX3WmU8banxDaFQ
         c8rLzw+RPE5FeTsFnioBFa6r6k+tO2Sqz2QiXzUXDWU+gbcVbsMKXcKdeST/adNp62QI
         hz2jmFhRfLKYNwAyXARH+QfzxA2clAmMu+QaAZe7PjYXxYLp0k5EO4C7C4iyqD5TqaXS
         41PiJ4zoa/izt8Y1kPkyLlrwIhHIXdncDNQCFcX/2qb50avVfNisCu1R5DWrx8cIoC33
         iaMAhY9VVZ8akLzkzup0THrl4gYVwfFWerIgHRFpG5VlKk+7713a7YWHBVEfIdj5ehxI
         SJoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791216371; x=1791821171; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXYOVHIBN9ZC5y6W29Gxv1RB4crN6nX0cmKZsey6SkQ=;
        b=EOJElG+yVprPGZmCXozcriPDYo2zSVFppo9EetZIKOE91Gl+9rj5Mekb7USpTYjgP8
         pZK/ZwL8vbXBO7o9KCVGYfxSjHaVkoTPnrQoFnjnzuBTRjXvNLv97JGhix+XIJN7b8Yi
         8RL/HHGU8kTQ+6SpbtUfK3ia09NLV0bRON1zs/UYusGk6QiVsjBWASARbyKvYcpwpdOw
         +jA8EO6psEZClWrl//e1uRpTicttL5s3BUQXAmac9xHeJypInDJYCH2msG9Oub5olWQw
         MQXYOFPVF0LXKKhxVTsejZKFcnmx1Q2G8T3OGQDzNYRsRon7Z3pjABoK3kXQqvCkmTlf
         W5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791216371; x=1791821171;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iXYOVHIBN9ZC5y6W29Gxv1RB4crN6nX0cmKZsey6SkQ=;
        b=x0i+sIcqapbHuSsudrTW4mGAic0HifVojgQXgb+Dca8+Kuem2s7q30CdCLQdbX94O5
         /Kdl7VAW6a5wYDry7Hw6wxILbxhO1e79Vzo86Yu1A2Zt/I/EhBGwGEKXX6aT/BgsAq+A
         WvfSZU7kiFBokBdpl+Ai2tFKWZU4+PvzaqwdzjD1ZdpyKOs9D0ltnBfMPjSvG+IXlIg/
         aj5yll9MI1DPCi2UqiQzJiQAuAWK51l7eDlkEd5gHG3uCJB/cihDy5SohIORBeB+BMfY
         o4czsejGxSGhsjWTSpKzaeu6x54Zvy0pAFiuZSwcgCUZAUn4LHti8NU31A7HWfJdwpj7
         5TTQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1rBcG+197ReoSeOPktL3YgUc1euycAwqnMjJInpQX9smxZ6Wo1levrcvcMJ6lR//T0l5OKKIYCtLTYA==@vger.kernel.org
X-Gm-Message-State: AFuF++mqGYSQlFcMb1N3vhsjsYuZCVmRO1lBW35iT8EJYhtFCYs5r7tb
	Kqdjub3QNKHz79TGLeaOXrRDmvcX18CQCsHFFeLM+URvFBJbZIpdnhUAAiDyagUTazTVHxxUcE1
	+y1jja5r/jxVUAWOn9hAJcE+K2P5obdIKcy2mjiMiGQ==
X-Gm-Gg: AYBFou0JQP/pByalMFNi3ZOq0K4j+sKYGL7jbRqdnzUbVVkbGcFOKco2ayTiIAr52ur
	swdjyBObH9KQQnw+xCZKpin89mCtZZcmdBw+fZCh14pQFVW115HXMRPcPJA26AsirJxojLFMhiM
	RwTzuaXwc1JJekSJsOeokC1zhRY92W2Ep4Xrsj9cqjYiZ3pUsm8NMHpCPwYNMSWPbcHCzbN/FxF
	oiUN2Bs3bSs2ORQIiJoGavlEwdTCXDgQ5pnUnsRnymik37JoNusDH7y3pk95HVRvzLWQdIpxyKk
	6hBxKOYu5e1JIuFxlYVSEljjfVNbcbFStAOMlkxS6aEVcpra3mj2M7jX5z36ubdJBBOrCBT7hW0
	zRZzUxwfwhcU39+CPTby8R8CdoqwNGqP6OK2EZsAvObG4JtF2BUgNk93PTFJQhXBtLZJuxN1x
X-Received: by 2002:a05:6820:4df8:b0:6c0:6199:8274 with SMTP id
 006d021491bc7-6df34a77d53mr9550307eaf.63.1791216370746; Mon, 05 Oct 2026
 09:06:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-9-f520af59df1b@linux.dev> <CAPY8ntAk1z-BuftZufd-qPwP9fDf9NQ0nwJn8XMV6pGKLfrFKA@mail.gmail.com>
 <arpyD2CjxOqwQvx8@bombadil> <CAPY8ntAMUwemmB+LLOS=WGozvBSyXoYrpWDdyGeyjHQ6Y6sh0Q@mail.gmail.com>
 <arrVt-0ctw1cXkkW@bombadil> <CAPY8ntC1SEr3seqcAWchZ8A9nSqWp-FZow7v=o-oL8CcQgMaNQ@mail.gmail.com>
 <asO1sIZC8rOyhSnu@bombadil>
In-Reply-To: <asO1sIZC8rOyhSnu@bombadil>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 5 Oct 2026 17:05:54 +0100
X-Gm-Features: AclHuK8iEACOzxyne6yAjoVoTGdSzWQb6lh-WlVBlMti3keDCEYJo8j4rsyZRHE
Message-ID: <CAPY8ntC5oO2hdzbKsFpu+SqMetUKLM8HRP_fVc7VBreZYXAz_w@mail.gmail.com>
Subject: Re: [PATCH 09/10] media: i2c: ov9282: fix flash duration control range
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Mon, 5 Oct 2026 at 15:46, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> On Tue, Sep 29, 2026 at 03:06:51PM +0100, Dave Stevenson wrote:
> > On Mon, 28 Sept 2026 at 22:08, Richard Leitner
> > <richard.leitner@linux.dev> wrote:
> > >
> > > On Mon, Sep 28, 2026 at 03:40:21PM +0100, Dave Stevenson wrote:
> > > > On Mon, 28 Sept 2026 at 15:23, Richard Leitner
> > > > <richard.leitner@linux.dev> wrote:
> > > > >
> > > > > Hi Dave,
> > > > >
> > > > > thanks for your feedback! Greatly appreciated!
> > > > >
> > > > > On Mon, Sep 28, 2026 at 02:47:36PM +0100, Dave Stevenson wrote:
> > > > > > Hi Richard
> > > > > >
> > > > > > On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> > > > > > <richard.leitner@linux.dev> wrote:
> > > > > > >
> > > > > > > When updating the flash_duration range ensure the ceiling is at least as
> > > > > > > long as the exposure time is. This may cause the calculated
> > > > > > > flash_duration register value to be rounded up.
> > > > > > >
> > > > > > > This is done by introducing a new
> > > > > > > ov9282_update_ctrl_range_flash_duration() function and using them
> > > > > > > wherever possible.
> > > > > > >
> > > > > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > > > > ---
> > > > > > >  drivers/media/i2c/ov9282.c | 47 +++++++++++++++++++++++++++-------------------
> > > > > > >  1 file changed, 28 insertions(+), 19 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > > > > > index f728709fcf0a6..be38ecfad8c82 100644
> > > > > > > --- a/drivers/media/i2c/ov9282.c
> > > > > > > +++ b/drivers/media/i2c/ov9282.c
> > > > > > > @@ -541,6 +541,29 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> > > > > > >                                 NSEC_PER_USEC);
> > > > > > >  }
> > > > > > >
> > > > > > > +/**
> > > > > > > + * ov9282_update_ctrl_range_flash_duration() - Update flash_duration control range
> > > > > > > + * @ov9282: pointer to ov9282 device
> > > > > > > + *
> > > > > > > + * This may round up the ceiling to the microseconds representation of the
> > > > > > > + * next flash_duration register value to make sure one can illuminate the whole
> > > > > > > + * exposure time long.
> > > > > > > + *
> > > > > > > + * Return: 0 if successful, error code otherwise.
> > > > > > > + */
> > > > > > > +static int ov9282_update_ctrl_range_flash_duration(struct ov9282 *ov9282)
> > > > > > > +{
> > > > > > > +       u32 exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> > > > > > > +       u32 fd_max = ov9282_us_to_flash_duration(ov9282, exposure_us);
> > > > > > > +       u32 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max);
> > > > > > > +
> > > > > > > +       if (fd_max_us < exposure_us)
> > > > > > > +               fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max + 1);
> > > > > >
> > > > > > Reading the driver for how it handles flash duration, it all gets a
> > > > > > bit convoluted. I see part of it comes from the units being usecs
> > > > > > whilst natively it is in lines, but we've got this slightly odd calc
> > > > > > and adding 1, and rounding in try_ctrl to get closest to the absolute
> > > > > > value.
> > > > >
> > > > > That's true. I'm also not happy with this back-and-forth conversion between
> > > > > u/n-secs and lines. From a V4l2 API user perspective I'd love to have
> > > > > all "timing related" controls in the same unit (likely usecs). I was
> > > > > already playing around with that approach, but as this would break the
> > > > > current exporsure property I have not sent those patches...
> > > > >
> > > > > If you have any "mainline-acceptable" idea on how to do that I would
> > > > > definitely love to hear it ;-)
> > > >
> > > > Sadly I think that there is a need for some of the back and forth in
> > > > conversions :-(
> > > >
> > > > > > Seeing as this is the max flash_duration, is it actually limited by
> > > > > > the exposure, or by the frame duration? The difference between those
> > > > > > is a minimum of 25 lines (OV9282_EXPOSURE_OFFSET), which I think gives
> > > > > > you up to another 9usecs to play with. That covers any of this
> > > > > > rounding stuff. You can afford to always round that one down and never
> > > > > > clip the range below the exposure time.
> > > > >
> > > > > From a hardware perspective this isn't limited at all AFAICT. But from a
> > > > > "use-case" perspective a flash_duration (with a flash offset=0, which is
> > > > > the hard-coded default case in this driver currently) longer than the
> > > > > exposure time makes no sense, as it does not have any effect on the image.
> > > > >
> > > > > With this patch I want to make sure to be able to illuminate the frame
> > > > > during the complete exposure time, but keep the maximum as short as
> > > > > possible. So I was comparing/aiming this at the exposure time, not the
> > > > > frame duration.
> > > > >
> > > > > As the frame duration is OV9282_EXPOSURE_OFFSET longer than the exposure
> > > > > time: Would a "turned-on flash" during those 25 lines have any impact on
> > > > > the frames brightness in your opinion?
> > > > > I haven't explicitely tested/measured this with hardware, but I guess
> > > > > this does not have any impact?
> > > >
> > > > No, as this is a global shutter sensor I wouldn't expect the flash to
> > > > impact the image if a connected flash was on for more lines than the
> > > > exposure.
> > > >
> > > > > Or do you mean when calculating against the frame duration the +/-1
> > > > > stuff can be dropped and the code would be easier to read?
> > > >
> > > > Yes, I'm suggesting the driver handles the range of values that the
> > > > hardware can support correctly. Whether that helps for your image
> > > > quality requirements is a different question.
> > > > The driver can pass the buck with at least some of the rounding issues
> > > > to userspace, which potentially has use-case specific knowledge. And
> > > > it simplifies the driver in the process.
> > >
> > > Talking about "range of values that the hardware can support": AFAICT
> > > the strobe duration is (from a sensor hardware point of view) not
> > > limited by the frame duration. At least I found nothing on this in the
> > > datasheet and a quick test on hardware also showed no correlation.
> >
> > Interesting. So if you set it to a 1 second strobe pulse when
> > streaming at 60fps, what behaviour do you get?
>
> I haven't tested the 1 second strobe explicitely. But the strobe in my
> case is always on for the configured time. No matter if it exceeds the
> frame time/trigger. After the configured strobe_duration passed it goes
> low until the next trigger happens.
>
> Maybe the following visualization helps:
>
>
> strobe duration < frame time:
>                   __         __         __         __
>                  |  |       |  |       |  |       |  |
> strobe signal   _|  |_______|  |_______|  |_______|  |_____
> strobe trigger   ^          ^          ^          ^
>
>
> frame time < strobe duration < 2x frame time:
>                   _____________         _____________
>                  |             |       |             |
> strobe signal   _|             |_______|             |_____
> strobe trigger   ^          ^          ^          ^
>
>
> 2x frame time < strobe duration < 3x frame time:
>                   ________________________         ________
>                  |                        |       |
> strobe signal   _|                        |_______|
> strobe trigger   ^          ^          ^          ^
>
> Therefore I would strongly suggest to set the maximum strobe duration to
> be in every case shorter than the "frame time".
>
> For the reasons discussed earlier it the maximum strobe duration should
> be the same or longer than the actual exposure time.
>
> What's your take on this Dave? Or Sakari?

Seeing as the behaviour is logical, personally I'd go with allowing
whatever strobe period (up to the register max), and leave it up to
userspace to keep the period below the exposure time if that is what
is desired for the use case.

  Dave

> thanks & regards;rl
>
> > It triggers at the relevant point on one (random) frame, holds the
> > strobe line active for the 1sec, deasserts the strobe line, and then
> > waits for the relevant trigger point of the next frame to repeat the
> > cycle?
> >
> > > So IMHO the real maximum flash duration range the sensor can support is
> > > the maximum strobe_frame_span register value.
> > >
> > > I'm not saying this makes any sense from a use-case perspective, but if
> > > we require the driver to support the hardware's maximum values wouldn't
> > > that be the correct approach?
> >
> > I don't believe there are any defined *requirements* for how a driver
> > should behave with regard to flash timings beyond that in the control
> > docs [1], and that doesn't list any constraints.
> > If this sensor does behave all the way up to the maximum
> > strobe_frame_span register value, then I probably would go for that.
> > Other than having to convert into usecs on mode change based on pixel
> > rate, it at least saves recomputing it as any other controls change.
> >
> > Sakari - what's your view?
> >
> >   Dave
> >
> > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-flash.html
> >
> > > Or am I misunderstanding something?
> > >
> > > regards;rl
> > >
> > > >
> > > > > Sorry If misunderstood your feedback somehow.
> > > > >
> > > > > >
> > > > > > There is reference in the docs to a different behaviour if "the
> > > > > > vertical blanking period is long", but with a bit to set to give
> > > > > > stable behaviour (0x3017 bit 1).
> > > > >
> > > > > I've read that paragraph in the datasheet, yes. But as this was not
> > > > > affecting my use-case I haven't included this in this series or my
> > > > > downstream kernel. Do you think it's worth adding support for this? Do
> > > > > you know of any reports complaining about this power saving feature?
> > > >
> > > > It only matters if you allow flash duration to be significantly
> > > > greater than the exposure time, which I was effectively proposing.
> > > >
> > > >   Dave
> > > >
> > >
> > > [... snip ...]
