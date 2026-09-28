Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24AF4E5348
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606456; cv=pass; b=lbkokt6ofRoAly1SP+3y7EUA+Se0k6dCB1u7y4+KYy/pN2NZt53+/NrcOFdvcqZLQWcl9VXPpa/zHdncH0BUXzUhiM+5B6OzaBnCj5rBtil1+lUKhMJ/N4RtXXeevp+5x5s+LAFPsrEb/bdJFzk7n2m/TPrDNSGAy4GWj+j7XVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606456; c=relaxed/simple;
	bh=ldD2fa67mapbYYu+SZJnf3dE+3WmwT+bGXU+ZwC8Umk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Byd3tbW8lujOHo4VoNlge3Ghz3SNc8zVExAauxD4tuuUpXR6wz9OVL5pNG9s2vgfAKUgpzp7YE6b/vVshs/ae8UTEuisVx3xw8Lka6C/3/Itd67qttcQrN6krLaKc4CSnVWH3Zha0FPoJ50m3d06jgDmCPlAb1oa4V4B17XeBOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=agodPeeu; arc=pass smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="agodPeeu"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d83e2833feso448453eaf.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790606438; cv=none;
        d=google.com; s=arc-20260327;
        b=Er8TPZcvyDjxLPOE6G+z4Qk26bOMjVfxtJ7T8nCh0LWf2dEH8X1IwuKjlINeBHOz8O
         8gUIP2pJTDoytI2nJv28H3bDeEncJa5zedl7Hp84yShNksOI8GkNMKwQ+nuDnRQSxTN/
         n4pW9uzM3dQa5c8A7qvGdmzdiMbWg7ee1a1acK9yzNxtO8aS+wj9klT3go8jn9A6n7XZ
         FRDWh5dWuX8NAyPcucI6HsSqu2j8gtEgc6PiAKADRtH6jap3d12oEF2kfMhyjTGWzYSz
         CNNSFv49f+t9wLHuMEqRM2Y8x5OJOvuVpEQje8Mq6S1P/Z+hZIa+4E8iiGwuShKq853c
         FpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q0ZwnoVCJmZG/LA7PJZST5OEnax8A7GI8o3LmLdDinc=;
        fh=uoMQUsxYsxifJ+p/ZWCBGLnFOZdrsQVMCcXbUUzWQWI=;
        b=p4qb5dPgQKtwlsAArK+P+z8gvjjJyd0p9ao2ErbKCgWYG00X/13jyLcDFnp8uKGTcb
         H9+91kObwDlXebf0y+ZWwnDrPxWaqjwAssSx5u+0TL0Q8G391Un5qtlYkgE+UC9u95lY
         kkIokeABcDhxRmHVMKu25IfOCgcW1qBHFdYoh+HzLaB3OShuVCioEi74ZjA+DNNjehLx
         ies1TGg5eLs7420YXTNLghy1MSoQlgcKXBBsHeTKWRzJ3CpZL1RDAUtsIlXSrKIs2k5e
         7dbH6dLuAVfMcOjsS5sjgQglycwBZPCcHdNlMvvA1N5YG71dDD/kHXQ2YSUpDv8rEQuF
         Ykuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790606438; x=1791211238; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0ZwnoVCJmZG/LA7PJZST5OEnax8A7GI8o3LmLdDinc=;
        b=agodPeeuYg6JrmLatBu6HkWIVwi5dweX82Ya0EonqcyhxYlmkFPbs9L/wzjX8e0E4W
         NXA+Z1o/yyhQ9sWQfQTAzgnpcptGThHX8HYsUtKy8KpQkrXTFlnVzoyUfrvzH9GLTKfa
         V8Ks7mdAyyLLJCTXmQQZUGFkfxXXjtQYEwbQ9hSIS9lt7XkDh44l5pqx3frRZyuxcPGE
         XGo8UzONR9JOTStXUV5BLzRdCOreD6Tz/FAGJ8P5GL5M2HigWGp3TxG4B33rfLN07jxd
         0cdcwmy2vX5mbR1dyRh1znz7uwTzGzfk7aE7E2qcjfkuZ+8sczOwmhzEy4jO2LJzWpH6
         adOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606438; x=1791211238;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q0ZwnoVCJmZG/LA7PJZST5OEnax8A7GI8o3LmLdDinc=;
        b=NGp1op7YTCBtRHjwPrLu3fk3RSs45krf21ak9tMpK16i3MWiRxybPn9nS3d1Zzaevt
         qzyub6M63Z2SAQ4xPI2kLQLvt7OiMLVApdMhpw3bbG9C+5dgPiSfdm0RCJZVIEcDrqoN
         XShIbdrstaMAw7y76M4l9ZPfu0Ka3gZQE3g7NBHbPOHdDuPFkjCX8rDnu/RUnnFTaK7G
         jlkJKJz2+F5yf9tRff4DGFjkZIwyqDjUna5HZo4sdH/cnhdZSt1YMBMQnPAwIjmjqUma
         uw9VKeQTkIg5risRFyUbKsTbPsrv7KXAL6xVt1LwCm3slIu7VgcyjxNaZr3kXLu231NM
         g1Aw==
X-Forwarded-Encrypted: i=1; AKwUvByfYj/cijBYe5O2Q34dohAUsyajmfji3yJgxbV7hYFlphNElsrozp4YvT4ASlqtj5xb21E+pp7ESaqdDA==@vger.kernel.org
X-Gm-Message-State: AFuF++k2E5eg2tCTfuDn33F9hTh1+gmXK+zwHQoQBnZ8OOLLyiXIi+uj
	2G/dUGynuMz+JbIZkY61+dmQs+hk68F5Q602ktNADKBrsaymd9FYLs9BQfEK5XL6tr+tq4FexWG
	vkkThBORSeWkpHixzOOHqR9ZPoGHJG0jQa7IKXHuAog==
X-Gm-Gg: AYBFou2LuazZLJFBlxelHZlIntI6q43l0y1yOmerpBMihYKg3EtqIS6o8U8LY9vV451
	rA64px4rTW5Toxx7p6Hg28OqqPzAbo+ZOmn6zL/zCR5WUhfRCRs3sBTB0RdF3sqA5Bfv5vWiQWo
	8LmuKBHfGyZI39yU+AElbn9XaJGvOASVSIiWiaHuGjB8Nt+4bI2SrPmBKFhARA8xAgyRbVLr3Cd
	ZCXSnPbE3qyT0rNs3Twjdy8YuFq2c0j/nuYVhZFoK4ciorwt9QUn/2hhK/D09VYJ+i/SJdhFNjg
	W3kZGLsXhgbVMt4WxleriTf6RJWv0bIGJCD/2XoHynxh5YNaqpB8GbVkt7bWIeJovEJW38ae/jh
	4cZlLFpVHL3htrj+6mifnO6UBSpV+Oqdkdv90J7ZEWea8/O+wpSNB2mwygNAq54UzOApeZ80=
X-Received: by 2002:a05:6820:151d:b0:6cd:3fdb:fa68 with SMTP id
 006d021491bc7-6d441c7d0f9mr11694546eaf.83.1790606438190; Mon, 28 Sep 2026
 07:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-9-f520af59df1b@linux.dev> <CAPY8ntAk1z-BuftZufd-qPwP9fDf9NQ0nwJn8XMV6pGKLfrFKA@mail.gmail.com>
 <arpyD2CjxOqwQvx8@bombadil>
In-Reply-To: <arpyD2CjxOqwQvx8@bombadil>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Sep 2026 15:40:21 +0100
X-Gm-Features: AclHuK9e7rINYi58GfEZcfio9OhaSay14yeTxdVGAsFt5ahGRuY3qWJ9jvP7sZs
Message-ID: <CAPY8ntAMUwemmB+LLOS=WGozvBSyXoYrpWDdyGeyjHQ6Y6sh0Q@mail.gmail.com>
Subject: Re: [PATCH 09/10] media: i2c: ov9282: fix flash duration control range
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 15:23, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> Hi Dave,
>
> thanks for your feedback! Greatly appreciated!
>
> On Mon, Sep 28, 2026 at 02:47:36PM +0100, Dave Stevenson wrote:
> > Hi Richard
> >
> > On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> > <richard.leitner@linux.dev> wrote:
> > >
> > > When updating the flash_duration range ensure the ceiling is at least as
> > > long as the exposure time is. This may cause the calculated
> > > flash_duration register value to be rounded up.
> > >
> > > This is done by introducing a new
> > > ov9282_update_ctrl_range_flash_duration() function and using them
> > > wherever possible.
> > >
> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > ---
> > >  drivers/media/i2c/ov9282.c | 47 +++++++++++++++++++++++++++-------------------
> > >  1 file changed, 28 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > index f728709fcf0a6..be38ecfad8c82 100644
> > > --- a/drivers/media/i2c/ov9282.c
> > > +++ b/drivers/media/i2c/ov9282.c
> > > @@ -541,6 +541,29 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> > >                                 NSEC_PER_USEC);
> > >  }
> > >
> > > +/**
> > > + * ov9282_update_ctrl_range_flash_duration() - Update flash_duration control range
> > > + * @ov9282: pointer to ov9282 device
> > > + *
> > > + * This may round up the ceiling to the microseconds representation of the
> > > + * next flash_duration register value to make sure one can illuminate the whole
> > > + * exposure time long.
> > > + *
> > > + * Return: 0 if successful, error code otherwise.
> > > + */
> > > +static int ov9282_update_ctrl_range_flash_duration(struct ov9282 *ov9282)
> > > +{
> > > +       u32 exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> > > +       u32 fd_max = ov9282_us_to_flash_duration(ov9282, exposure_us);
> > > +       u32 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max);
> > > +
> > > +       if (fd_max_us < exposure_us)
> > > +               fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max + 1);
> >
> > Reading the driver for how it handles flash duration, it all gets a
> > bit convoluted. I see part of it comes from the units being usecs
> > whilst natively it is in lines, but we've got this slightly odd calc
> > and adding 1, and rounding in try_ctrl to get closest to the absolute
> > value.
>
> That's true. I'm also not happy with this back-and-forth conversion between
> u/n-secs and lines. From a V4l2 API user perspective I'd love to have
> all "timing related" controls in the same unit (likely usecs). I was
> already playing around with that approach, but as this would break the
> current exporsure property I have not sent those patches...
>
> If you have any "mainline-acceptable" idea on how to do that I would
> definitely love to hear it ;-)

Sadly I think that there is a need for some of the back and forth in
conversions :-(

> > Seeing as this is the max flash_duration, is it actually limited by
> > the exposure, or by the frame duration? The difference between those
> > is a minimum of 25 lines (OV9282_EXPOSURE_OFFSET), which I think gives
> > you up to another 9usecs to play with. That covers any of this
> > rounding stuff. You can afford to always round that one down and never
> > clip the range below the exposure time.
>
> From a hardware perspective this isn't limited at all AFAICT. But from a
> "use-case" perspective a flash_duration (with a flash offset=0, which is
> the hard-coded default case in this driver currently) longer than the
> exposure time makes no sense, as it does not have any effect on the image.
>
> With this patch I want to make sure to be able to illuminate the frame
> during the complete exposure time, but keep the maximum as short as
> possible. So I was comparing/aiming this at the exposure time, not the
> frame duration.
>
> As the frame duration is OV9282_EXPOSURE_OFFSET longer than the exposure
> time: Would a "turned-on flash" during those 25 lines have any impact on
> the frames brightness in your opinion?
> I haven't explicitely tested/measured this with hardware, but I guess
> this does not have any impact?

No, as this is a global shutter sensor I wouldn't expect the flash to
impact the image if a connected flash was on for more lines than the
exposure.

> Or do you mean when calculating against the frame duration the +/-1
> stuff can be dropped and the code would be easier to read?

Yes, I'm suggesting the driver handles the range of values that the
hardware can support correctly. Whether that helps for your image
quality requirements is a different question.
The driver can pass the buck with at least some of the rounding issues
to userspace, which potentially has use-case specific knowledge. And
it simplifies the driver in the process.

> Sorry If misunderstood your feedback somehow.
>
> >
> > There is reference in the docs to a different behaviour if "the
> > vertical blanking period is long", but with a bit to set to give
> > stable behaviour (0x3017 bit 1).
>
> I've read that paragraph in the datasheet, yes. But as this was not
> affecting my use-case I haven't included this in this series or my
> downstream kernel. Do you think it's worth adding support for this? Do
> you know of any reports complaining about this power saving feature?

It only matters if you allow flash duration to be significantly
greater than the exposure time, which I was effectively proposing.

  Dave

> thanks!
>
> regards;rl
>
> >
> > You've far more experience with how this sensor handles the strobe
> > outputs though.
> >
> >   Dave
> >
> > > +
> > > +       return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, fd_max_us,
> > > +                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > > +}
> > > +
> > >  /**
> > >   * ov9282_update_controls() - Update control ranges based on streaming mode
> > >   * @ov9282: pointer to ov9282 device
> > > @@ -555,7 +578,6 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> > >  {
> > >         u32 hblank_min;
> > >         s64 pixel_rate;
> > > -       u32 exposure_us;
> > >         u32 lpfr;
> > >         int ret;
> > >
> > > @@ -590,9 +612,7 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> > >         if (ret)
> > >                 return ret;
> > >
> > > -       exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> > > -       return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, exposure_us,
> > > -                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > > +       return ov9282_update_ctrl_range_flash_duration(ov9282);
> > >  }
> > >
> > >  /**
> > > @@ -605,11 +625,9 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> > >   */
> > >  static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> > >  {
> > > -       u32 exposure_us = ov9282_exposure_to_us(ov9282, exposure);
> > >         int ret, ret_hold;
> > >
> > > -       dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
> > > -               exposure, exposure_us, gain);
> > > +       dev_dbg(ov9282->dev, "Set exp %u, analog gain %u", exposure, gain);
> > >
> > >         ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
> > >         if (ret)
> > > @@ -623,9 +641,7 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> > >         if (ret)
> > >                 goto error_release_group_hold;
> > >
> > > -       ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
> > > -                                      0, exposure_us, 1,
> > > -                                      OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > > +       ret = ov9282_update_ctrl_range_flash_duration(ov9282);
> > >
> > >  error_release_group_hold:
> > >         ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
> > > @@ -660,11 +676,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> > >                  * Ensure the flash duration range is also updated on powered
> > >                  * down sensors.
> > >                  */
> > > -               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> > > -                                              ov9282_exposure_to_us(ov9282,
> > > -                                                                    ctrl->val),
> > > -                                              1,
> > > -                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > > +               ret = ov9282_update_ctrl_range_flash_duration(ov9282);
> > >                 if (ret)
> > >                         return ret;
> > >                 break;
> > > @@ -674,10 +686,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> > >                  * duration. Therefore recalculate the flash duration range
> > >                  * here.
> > >                  */
> > > -               exposure = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> > > -               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> > > -                                              exposure, 1,
> > > -                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > > +               ret = ov9282_update_ctrl_range_flash_duration(ov9282);
> > >                 if (ret)
> > >                         return ret;
> > >                 break;
> > >
> > > --
> > > 2.53.0
> > >
> > >
