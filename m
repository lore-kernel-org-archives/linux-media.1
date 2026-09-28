Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904534B44CA
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601325; cv=pass; b=XnFeM5NZZuIjSBrd8kJ4QI0D5JnOYeBFV0mCl3qfCDAQGwmj9ovI9Wl/vnvnXW9ueotlncO6gu+ly5YoKDLB3AqcuE7KPO35aGZ0TB29GkyEI8SRpxL3g5lm8ujLhw9eK6Eu4aECMXRRbk+h1cniiUHWFa6vP8bAcb9cC9xoJ1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601325; c=relaxed/simple;
	bh=1+J6CEcuD/ehR2uQMHAPS7Wf/xRgrfM23BUbghLVVEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyN4f8Y+95soBqx4CbqAl6tpapdvb/8R0ZSwD1Py82kW0tJm6nySPKt2ujDrj3UbDRLZ2MYHIQYYchynUpEiQ4zezOWUl4OrWqTQgfAeU5aLBuACmfI3TU6hq+oh/ESzi5J0Cxhb3fr+986uPTlRwL1LLUA/iAosTB0qrpVnsNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=WmS2MC6s; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WmS2MC6s"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6d9311870f9so303981eaf.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601322; cv=none;
        d=google.com; s=arc-20260327;
        b=kiJOt7ns2JDPKNFdB5uyxd0NbH858cn4p4a68sXBxDraQLfJNmTPU1YT7ZIW6K5K8B
         +fuoB4zyFMH8qRCIQsjvS2bEQ+XfXsqsEpD5CfPdgjF1k1f8OsSEeVr+1OFkG7deI8fW
         y7HcDTvBCdAk2dxql57urITmtZQfs1VLxt3wea9zzuCl4zflueZtaOmV5O1ISsz68Q1V
         xvqPp6l8ghpbCg2z8lHCf3TkDjkUGitdl8Z1vu7EeCYjcw6UU3Boo+vcH2DpN5x22KWK
         pxBM88VL3vzQ1X6C7bllmf9b2iuDo/aQOoZpPbp2wguze6CwiJsOPQJwxeEeGbVNSrcA
         YKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fGgI1r2PIxpAhy+XynqUn+DjOJ88MU8PW7eA+FniYzY=;
        fh=JAQDBrZUG8aFTugeF4UqadQ3LwS2aBuua/cre5/tSgs=;
        b=opez4LIR6nO7JKM0snygEvQDiIzV8J3p0c5IFotAYVTiGdscIIkZ64VKZfDbh1x4U4
         8q1BCl02PJSCjNcoRupp0ox+PHCX+wfQZA2Ecy06sa+bb3tuQaVcEvck6kiYCUEz9nW+
         OlG4qxr5HlHdW5oBMxs3KYSTBl1u0WCRqj7Qab8HWLySU/muV7dpnZCAFWVg6UdbbDH5
         GS+jNsPRRumHUAJOVnyDkQseMklGCFiE+khASHuhJINoj62N30wi58wTOEcC2qeltHLx
         78J9ZyBRgfnn5/vhEe410DWpINFvIrzq5uKZCcBGP4zL5oVqfwHiFWlXpvxlIVwv4lrR
         n3Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790601322; x=1791206122; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGgI1r2PIxpAhy+XynqUn+DjOJ88MU8PW7eA+FniYzY=;
        b=WmS2MC6s/LqSV5ivoex9+OhjYlnXLNcKuBQw5oYX+JqXdvGfq+Ij2+tISbJ75zX3Fz
         EyqbId32xSOyS+DANdOr9PoiR4iUb2XtjC2imRbtNQHFdvsO3jAjPoYIofZDFouNEW5u
         btPbsGNi64c+vzheKOYrR3Z3ht8SUUce5QWsRyCjHSXeDdEr4/O5IJqjrk23LHNUPrcv
         9/RxntCWvkQbPup4kKrtaToM/dJeobxHW/TeiPd9JYg+8yrMv5BB0IoZg490m+v6Ftgm
         eiyQMscMGIsKtx6aOxaDDMfFnJIc4eknRouokMR4hRSBXDQYrKuXHW8FpBnkqqNl2VVe
         WpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601322; x=1791206122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fGgI1r2PIxpAhy+XynqUn+DjOJ88MU8PW7eA+FniYzY=;
        b=1gup8xU6/HLhgt8RgERjoTtzS4XuTit55eTjWkOeE1qXMI4VqUh76f9t4yWtx+K7pV
         huXHU+NdHhSxxvDdT8BRstt19kdd0gf/vtwv6AE8ExbDMUyyrESPQmuBMaMExW76F367
         BS0qFuoJTCxLhj0NjIovRuhiozkreUazeet3LHKscTRAWjclIi6NKlGJyyrAEHewyFMs
         XeSf+jBTSfnnX65iV/HH+Fn+RpfOfYzbUapa7dtl8cUt9HRZ1IUwTF7lG+7CxHqp8ULs
         pp0nv6a3rPXZ/YhZWlJC+yIOXEWcOLr6WEHRNV/X7nA5IErvYgdUXDzPZ2NJC82heDu9
         J4nQ==
X-Forwarded-Encrypted: i=1; AKwUvBxELyGscNoGLxPCUzqMUh4EiJaG/1wrL8/l02FyKGJZZQiuNmOvX4RpM249beOSTruT3Jrl8JoHXftNaA==@vger.kernel.org
X-Gm-Message-State: AFuF++mFYjURYd6BlYO/DBL2d0HLo8T4eeTQkJqj5tNUzOSExMaktbtf
	mgbQ/uzS47j9HeoZgHgbf5BC+XYNinxNGNTi2dyxYCfoMYUfyGXQygQWMmaICV1SoaBj30OFUSG
	9x403oHLpzgYdOODuz7Zk4GZNAaswy6KjG3s7dtnKxA==
X-Gm-Gg: AYBFou1ouMTdWZ2xwnwTaza58tM8SVui74nglqa98jj2LeiffDdghqGQgaD/BG9DRTB
	JQHuvnK4yudRQ6sWGval1g3HgEyt8o7mfDxWEKccU9cSLNlC7rq6kHqPDduJ1pcxc/tTUfc4cz1
	POKSUF4/dY2IrAzNKWmv9D4mXznZDdAKN0WOtucX0cmP7Cp1fOsjcfrk54+mor10xGiQe8hdXJd
	DwPMYzztSUeVPaZB3t76usY+QUYpe7UScEnT224r70llRZzI4c+ScCD+3FutGz9uvskvUXpxoq2
	mzDdyfYiyaTI9JmO7Nj4dnWw0oMAm5c2vyw7u/zJAmle4UIroU9tQnt4bubd22uV+SoRwaAw53i
	4wgoyBaw/8QOfs7WoT6LmHuswmpTjqQ7DWr1FGF8y4H+yIGn0IL5VLXfhB43zrPevE4iZfMDjyU
	Pc73+O5g==
X-Received: by 2002:a05:6820:80c8:b0:6cd:3fbd:1d63 with SMTP id
 006d021491bc7-6d4414bc5bcmr13187384eaf.77.1790601322241; Mon, 28 Sep 2026
 06:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-5-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-5-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Sep 2026 14:15:05 +0100
X-Gm-Features: AclHuK99UY9stHVhncg5huByX9eFWKgLDpC1O8vPS1rGUFOwjdnON6O_5QMpRf4
Message-ID: <CAPY8ntB6hoUMCr7v6E5soWzh+CDuSsdy_bJPStxk=b8mfEzN5w@mail.gmail.com>
Subject: Re: [PATCH 05/10] media: i2c: ov9282: add refresh of missing ranges
 on a mode change
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> ov9282_update_controls() updates the pixel rate, hblank and vblank, but
> currently misses the exposure range and flash_duration. Both are dependent
> on the line time and therefore the pixel format.

The exposure control is dependent on vblank / frame height, not the line time.

> Refresh both, and commit cur_mode and code in ov9282_set_pad_format()
> before the call so the refresh and any nested s_ctrl see the incoming
> format.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 4c88de1965171..e64d8343c18e9 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -557,6 +557,8 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>  {
>         u32 hblank_min;
>         s64 pixel_rate;
> +       u32 exposure_us;
> +       u32 lpfr;
>         int ret;
>
>         ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
> @@ -577,8 +579,22 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>         if (ret)
>                 return ret;
>
> -       return __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
> -                                       mode->vblank_max, 1, mode->vblank);
> +       ret = __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
> +                                      mode->vblank_max, 1, mode->vblank);
> +       if (ret)
> +               return ret;
> +
> +       lpfr = ov9282->vblank_ctrl->val + mode->height;
> +       ret = __v4l2_ctrl_modify_range(ov9282->exp_ctrl, OV9282_EXPOSURE_MIN,
> +                                      lpfr - OV9282_EXPOSURE_OFFSET,
> +                                      OV9282_EXPOSURE_STEP,
> +                                      OV9282_EXPOSURE_DEFAULT);

I would have expected that this should be handled by the first clause
in ov9282_set_ctrl where if vblank is changed it updates exp_ctrl.
That's how many drivers handle it.

Looking closer they tend to set an explicit vblank on mode change
though, and it is that which triggers the set_ctrl.
There has been previous debate as to whether changing mode should
reset blanking to give a defined frame rate. Memory says that Sakari
was in favour of doing that, but I can't find the thread.
Sashiko also flagged on a previous patchset of mine that if the
previous mode happened to have had vblank adjusted to be the same as
the new default value that the new mode selects, then the control
handler framework won't call set_ctrl(VBLANK), and so the exposure
range (depending on mode height and VBLANK) won't get updated.

All a little messy, so I can be persuaded that there are enough holes
in the current driver that the easiest solution is just to update the
control ranges here if you say that set_ctrl(VBLANK) doesn't get
called in this case.

 Dave

> +       if (ret)
> +               return ret;
> +
> +       exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> +       return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, exposure_us,
> +                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
>  }
>
>  /**
> @@ -855,10 +871,23 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>                 framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
>                 *framefmt = fmt->format;
>         } else {
> +               const struct ov9282_mode *old_mode = ov9282->cur_mode;
> +               u32 old_code = ov9282->code;
> +
> +               /*
> +                * Commit before refreshing the ranges. ov9282_update_controls()
> +                * and the nested ov9282_set_ctrl() calls it triggers derive the
> +                * frame length and the line time from cur_mode and code, so
> +                * they have to describe the incoming format, not the outgoing
> +                * one.
> +                */
> +               ov9282->cur_mode = mode;
> +               ov9282->code = code;
> +
>                 ret = ov9282_update_controls(ov9282, mode, fmt);
> -               if (!ret) {
> -                       ov9282->cur_mode = mode;
> -                       ov9282->code = code;
> +               if (ret) {
> +                       ov9282->cur_mode = old_mode;
> +                       ov9282->code = old_code;
>                 }
>         }
>
>
> --
> 2.53.0
>
>
