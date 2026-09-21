Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9DD48E0DE
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988248; cv=pass; b=dQMJ39wQM/7c22YlBXueXISnEcltZcKVo/4PIpyi3ZngefHzCKPhconj7z5qA1evNevcNAl1vSzTYWW/MOVMMaQaAOHNOrL8F7VpVFUvHyxB9hukaPyLmLWfWt81xvFOBwI8oBYjl0dP4s1rehkF4dEud+ZS2bRnJ/vd4rP/kt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988248; c=relaxed/simple;
	bh=2YqGWEM24uy7np2YwKU+JbPx7JWQTuv7sQJqsslQWSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCyVA8LNKGFMYQXmtb2V3bHtSMEpu7KV3Famg+7CoI5+nROls1BFio4a0vV1NXLoIP/jf5HbBH/Mwa5/Ey78EeFh7489pNvb96WG7KtURf3tJykoEtdMy00Z0CZUncCnYFr8f/DbYjSQyNK29bPC6aO40tDn+BBuntrD0bkiqWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GImPozUK; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GImPozUK"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc88a9b9so1852747fac.2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 03:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789988244; cv=none;
        d=google.com; s=arc-20260327;
        b=FmoexX8g2Dyn41nk0sHNSRoMlqiwtbgUH9MnA1SvBwOnZXhbgA/Hk3vCMU6a7jE8vk
         TQVaoMZRWC3XDB+V/DXihejbSoMc87c00uJupm+ZJxUM7P4CnV42+Y95NaWUBI7h2Q8r
         FNYI+UxAlX+VeDafO5um/TyaeEtdQueioKI3ISGFFYEz1ZBcHWcIo/s6uSMHTthmH5R4
         Ksilao2oI6fIvnS/hnAEljS/PYpYY8wh+E+eKB4fSKWLoqM6fL+dm1UM80JlPQhEINBl
         7ONiLb3QQC0yHf3ygVn87EQgxrD6QbhmNsMBt7QkZK+1Vs1UnqNq5k7JP5vbsoVvrACV
         qfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LBhk5jQ1W6FxPEqvvYJ2qMylA4myMd+YHjAINZTgvCU=;
        fh=Tc+HSKboTT28DF5BEOG0meExlHUr+plKJdffcsNNc8w=;
        b=BfZCiov+hiyasfbEXT/5K9AjAJFg4/LjCbWL9nV0A5KzKj2E6iYLrO5p23Lq5OW7jL
         U2TkTp9VA71TLnzCn6/62sdiF76eKtVLxeo0DLJkasMKNEOYn0VauaqLJ25Weq0qKNLz
         2c+kCFlRJSvOlWBOWAeZm+s+xfjgTUJmqjR/q4m/9zIuwDjRFe9sBqSWB5efJCz7WJIy
         cUXJZ00VP1iIkHwGxthbkxckuaFCkwSEYgsDOV/TYe0eM0tzMYhoj2w/5F3TzQMRZK+E
         02qTr+hLOw240c4REZiVquR9So3+mz2QcdpcY7sva5CN8XUu4sWCsQcbvAukWNTb6KU4
         rhkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789988244; x=1790593044; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBhk5jQ1W6FxPEqvvYJ2qMylA4myMd+YHjAINZTgvCU=;
        b=GImPozUK6hronzmMRPu6Faqqh1t9f1JVKm6u9VYIM7QANcSGB5sHSJUmeSaNmvhF2o
         LoDQweiI5/sI5XdrA4NlpcGcd3NP0eKQ6yq6CdgSS+t9W1PiEZYpDkU9mRMGLaMzs5qK
         Up5LnRpr5+e6NQQ4XjWr9EJUyrnG3bWPcV81CFIJOt0wwgZGLzQS4jD0/8cyxQ2Jo/Xo
         t61llYqm1eF7eZA/nFM0pq7qiL+teYVCGqGDJQpH/0gM5+kS7bHalzzOiiM+oD+H8gKt
         u5chlw1o5uYEgyzgtB3S18R3GPJ3oiYQy6d0GRrtHTd1AD+cGMniqRFekK7U5A0ccUCq
         Lqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988244; x=1790593044;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LBhk5jQ1W6FxPEqvvYJ2qMylA4myMd+YHjAINZTgvCU=;
        b=H/fEvA5iUvrgho5Rg+dJ+K20d49a+ZVhnrhaulw3YXSAjuqJZycKn4IV/7ahIuK1S3
         TVaza+gKJdneCDYZOyrmKUyTlWPs1X52uCG+y2Qb3BfnFuu1JlCv9qReeDB6ZM3U6WFl
         bRFqYFvMRlsgfwwQTis5rkVXKB1oYUs92RTs06hEhT4VWWSK8nOsBIVTNH7zbWPhOzEQ
         sVPz7SKjs2Hai8JjuruOePKXrOnhNEaLQn8AHQ0kRUJsDveypWrTPXO+WZ8KTRkx2ul3
         9tbirVqLj+XTx76eN3pmcS1qjx38mmNzYCC6uNNJfefCm3dbTPK9BabDM0ghmowwH4Ol
         bIoQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6R/jzwQ+7ooxDaisIPHFECdZbz9HU8+cCiFrI1DbAJlYyFQAh8vn7x2Xl4XL2LSDe9nLNKGEeIaNsRw==@vger.kernel.org
X-Gm-Message-State: AFuF++kWntu3VSvZ0dMjqE/KLbn6rSMXsxJ4I6zSDdWdkN6BObRcVMad
	DSaQwvRmN/qgXsgzpgpUHswp2NAo/PwmmQGQgIJ7Wb0JGlYZi23RKgjuGkZnw5LFqsNecW/Ub/f
	H0UvcBbpJth+pewkhOWFP8wf+pKRfx73lXk1RLQ99K0vWOfXDusEHF3PMaA==
X-Gm-Gg: AYBFou3aqOMHkWhg6o3nuNVLOEY/k3EF90U5WpgePMUDVp+WwIcreMOQnjavEfCGXWE
	BJKnloJAN+XhWOnm1iHtVRUoigN8CeTu8u8VTejf6VF84b9xYTZMX3CUwcFmM8DHELWXURoh8MH
	BsfwT+ZfizdFEjnaTvxyNq1ErECTg/opvYHZDtJT7eaLOe5chPjoZqXdP96WMKct+4VMMk3vAG8
	AGu2lWBNPy8Iz8xY5eP/dEtKYlPnACNbG4xKI//3Pg4U6M3U1C0hgVmGivf8P6lITP5NqtpoWFz
	N4PSzLQx+s7OAboteQybKIDxMu+i64zF5ks8/nZWHQJ1kP0V4Nrt/ejHZmb+rVLqfrxfhY4Rcdj
	YhwpF0YF3uNjvT75ljElAAXlfAv/6L/3WChOdzmeHdVHdv5Hjv8lbbVHtegEW8QThTUM+nmxiIN
	3IedU/TP4=
X-Received: by 2002:a05:6871:54d:b0:475:e235:905 with SMTP id
 586e51a60fabf-486e7e85a59mr9458422fac.35.1789988244191; Mon, 21 Sep 2026
 03:57:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921082609.30830-1-lsa.uz@pm.me> <178998112223.1723501.7946524742858282804@ping.linuxembedded.co.uk>
In-Reply-To: <178998112223.1723501.7946524742858282804@ping.linuxembedded.co.uk>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 21 Sep 2026 11:57:07 +0100
X-Gm-Features: AcwNN1UOdexpZHpKcWRgF6CJJdbQlVa0OBupsN4xyic0XlFv1XRTSJ7eErCPyYo
Message-ID: <CAPY8ntCLhQH+8nT4jGxnOEWNhnn3=ESPnkip-6Y=zfkaHP5gvw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov13858: add horizontal and vertical flip controls
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sergey Lebedev <lsa.uz@pm.me>, linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sergey and Kieran

On Mon, 21 Sept 2026 at 10:02, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Sergey Lebedev (2026-09-21 09:26:14)
> > The driver programs OV13858_REG_FORMAT1 (0x3820) from its mode tables and
> > never exposes the readout direction, so a module mounted rotated cannot be
> > corrected.
> >
> > The Microsoft Surface Pro 11 for Business (Intel) mounts this sensor upside
> > down, and ipu-bridge now says so - b238116ccd4b ("media: ipu-bridge: Add
> > upside-down quirk for Surface Pro 11"). libcamera reads that rotation and
> > tries to compensate with sensor flips, finds neither control, and falls
> > back to Rot0, so the quirk on its own names a rotation nothing can undo.
> >
> > ov13b10 has the same two controls, but it is a different part and its bit
> > assignments do not carry over. There is no public datasheet for this one,
> > so these were found by experiment on a single sample: single bits written
> > over i2c mid-stream, each captured frame correlated against the flipped
> > baseline. Of every bit in 0x3820 through 0x3823 exactly two move the
> > image: 0x3820 BIT(4) set flips vertically, and BIT(3) cleared mirrors
> > horizontally. 0x3821, where the mirror sits on several other OmniVision
> > parts, has no effect here.

Intel's ipu6 driver for ov13858 confirms this -
https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov13858_intel.c

> > Verified through the controls against a static scene, as correlation with
> > the flipped reference and, as a control, with the unflipped one:
> >
> >   vflip  +0.994 / +0.629    hflip  +0.973 / -0.141    both  +0.975 / -0.178
>
> What do these numbers mean ?
>
> Flips are 100% flips. They're not 90% flipped... or 90% correlated to
> something which might be flipped.
>
>
> > The mirror bit is active low and every mode table already sets it, so the
> > defaults write back what the mode list just wrote.
> > __v4l2_ctrl_handler_setup() runs after that list and before MODE_SELECT,
> > so the read-modify-write here sees the value the mode just programmed.
> >
> > The Bayer order at the output does not change with either flip: per-channel
> > means over the four states agree to 0.2 counts in 70, and all four frames
>
> What does this mean ? (what's 0.2?)
>
> > demosaic correctly against one fixed pattern. Unlike imx219 and imx258,
> > whose flips select a different media bus code, these controls therefore do
> > not need V4L2_CTRL_FLAG_MODIFY_LAYOUT.

Just as a note, if the driver supported get_selection then the crop
should move by one pixel in the relevant direction with the flips.

Moving the crop to preserve the Bayer order isn't that unusual in
sensors now (most of the Sony Starvis and Starvis2 sensors do this, as
do some OnSemi sensors I'm aware of), so it's not really worth stating
in the commit text.

> It sounds like ... you've found the right bits to handle flips. That's
> great.
>
> But please just use a human to verify, and skip the almost maybe
> probablys.
>
> A flip is either flipped or it isn't. A 95% correlation that something
> might be flipped, probably, maybe ... isn't quite the same as "Oh look  I
> can see it's mirrored and I'm 100% certain of this because I'm a real
> person and I can tell when I look at something from left to right or
> right to left."
>
> If we know this flips correctly - lets say so clearly.
>
> > Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> > ---
> >  drivers/media/i2c/ov13858.c | 44 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
> > index de2b79a9a0..1bf21ffbc7 100644
> > --- a/drivers/media/i2c/ov13858.c
> > +++ b/drivers/media/i2c/ov13858.c
> > @@ -76,6 +76,15 @@
> >  #define OV13858_DGTL_GAIN_DEFAULT      1024    /* Default gain = 1 X */
> >  #define OV13858_DGTL_GAIN_STEP         1       /* Each step = 1/1024 */
> >
> > +/*
> > + * Readout direction. Neither flip changes the Bayer order at the output, so
> > + * no window offset compensation is needed. The mirror bit is active low: the
> > + * value the mode tables program already has it set.
> > + */
> > +#define OV13858_REG_FORMAT1            0x3820
> > +#define OV13858_FORMAT1_VFLIP          BIT(4)
> > +#define OV13858_FORMAT1_HFLIP_N                BIT(3)
> > +
> >  /* Test Pattern Control */
> >  #define OV13858_REG_TEST_PATTERN       0x4503
> >  #define OV13858_TEST_PATTERN_ENABLE    BIT(7)
> > @@ -1042,6 +1051,8 @@ struct ov13858 {
> >         struct v4l2_ctrl *vblank;
> >         struct v4l2_ctrl *hblank;
> >         struct v4l2_ctrl *exposure;
> > +       struct v4l2_ctrl *hflip;
> > +       struct v4l2_ctrl *vflip;
> >
> >         /* Current mode */
> >         const struct ov13858_mode *cur_mode;
> > @@ -1208,6 +1219,30 @@ static int ov13858_enable_test_pattern(struct ov13858 *ov13858, u32 pattern)
> >                                  OV13858_REG_VALUE_08BIT, val);
> >  }
> >
> > +static int ov13858_update_flips(struct ov13858 *ov13858)
> > +{
> > +       u32 val;
> > +       int ret;
> > +
> > +       ret = ov13858_read_reg(ov13858, OV13858_REG_FORMAT1,
> > +                              OV13858_REG_VALUE_08BIT, &val);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (ov13858->vflip->val)
> > +               val |= OV13858_FORMAT1_VFLIP;
> > +       else
> > +               val &= ~OV13858_FORMAT1_VFLIP;
> > +
> > +       if (ov13858->hflip->val)
> > +               val &= ~OV13858_FORMAT1_HFLIP_N;
> > +       else
> > +               val |= OV13858_FORMAT1_HFLIP_N;
>
> Why is VFLIP set to flip, and HFLIP set to not flip. This sounds very
> odd to me.

It's not uncommon with Omnivision sensors. OV5647 is the same.

> > +
> > +       return ov13858_write_reg(ov13858, OV13858_REG_FORMAT1,
> > +                                OV13858_REG_VALUE_08BIT, val);
> > +}
> > +
> >  static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >         struct ov13858 *ov13858 = container_of(ctrl->handler,
> > @@ -1254,6 +1289,10 @@ static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
> >                                         ov13858->cur_mode->height
> >                                           + ctrl->val);
> >                 break;
> > +       case V4L2_CID_HFLIP:
> > +       case V4L2_CID_VFLIP:
> > +               ret = ov13858_update_flips(ov13858);
> > +               break;

One thought which may not be answerable without a datasheet. Many
sensors will produce invalid frame/frames if flips are changed whilst
streaming, and others may lock up. Do you need to grab/release the
control at set_stream?

> >         case V4L2_CID_TEST_PATTERN:
> >                 ret = ov13858_enable_test_pattern(ov13858, ctrl->val);
> >                 break;
> > @@ -1619,6 +1658,11 @@ static int ov13858_init_controls(struct ov13858 *ov13858)
> >                           OV13858_DGTL_GAIN_MIN, OV13858_DGTL_GAIN_MAX,
> >                           OV13858_DGTL_GAIN_STEP, OV13858_DGTL_GAIN_DEFAULT);
> >
> > +       ov13858->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov13858_ctrl_ops,
> > +                                          V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +       ov13858->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov13858_ctrl_ops,
> > +                                          V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +

Use a control cluster so that you only call the s_ctrl function once
even if both are present in a S_EXT_CTRLS call? See imx290 or imx214.

  Dave

> >         v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov13858_ctrl_ops,
> >                                      V4L2_CID_TEST_PATTERN,
> >                                      ARRAY_SIZE(ov13858_test_pattern_menu) - 1,
> > --
> > 2.54.0 (Apple Git-157)
> >
> >
>
