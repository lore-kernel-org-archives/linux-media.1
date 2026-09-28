Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18B44BF944
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 13:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603276; cv=pass; b=b4Eyy46znSf+NGntj09SuerK5nitmt9yzOJgzW3pwTked99UqJn/eAN4mmJjwXvrMqmVn8xiMtE5RpZ4l6jubzRQkN/k9oYCCPHl0PMcf6Uu1KvxanEOvDP/3DjHdpUXGaTxo5L8Z4UmXBzTU5ZHUv1cjA849s1ZTKVQ6PJbFEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603276; c=relaxed/simple;
	bh=vqwrq4AvcZJ2abX6krO6C4SuPYik1iuIHeJAHjg/rEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbFaoTkvQveCuVvyfQZ85DC5BCJOkV0UpCtmSXaSMn3wGxwqsf+zpJEB1UNvcM0ZFLJ8Wj/KaH1CgVxICTb/4EQMvUS6zVSDSHqd6a/rAKAiJNLCYb/KCgB6u14MMSlMpXVuPH08u6WaeLKIjtxOKoRTNJw7KEB3iNMsEnHOjak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=URSdom+1; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="URSdom+1"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6d7e33da780so836647eaf.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790603273; cv=none;
        d=google.com; s=arc-20260327;
        b=gIwULPb2e0Oi3cWtyAwJU6aVZaHnsQGnCEJP+54i2IHxoaTMvxiNaIuvwggtUXg+Xw
         JfE54bs7g7HWq05pt0b7SxGUKykD/5mIyDR6PRRp6xpZgxAC1ltAUl8UraFiOqzD3jH+
         B9ed4VCjoCafzI+p1zNHsrsMcxp1FEqhIQPYrr5DNxBNG81Jek9K239/5J1W7P5DztEt
         zV0nyyIu0evKeAvNi8Lmgbjiujn5adyGEx8vqwiyhZa7ms64kSzhMo9cFpZ7kpKVSaLt
         GnbCCIhdPy9Z2f/ohRiAkYQGvJVW/X8P7CgpO0VH+Wb3gUOmg/VdIANupVLmwcuJMfU6
         RTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dZ9Tkd5ktyo3J81zP2ExpIdndNhoj9/lF2//YUfachQ=;
        fh=L/CoYAR6Hmi1n3LSU9dR4iumv6n2Wb+HO0G4B6ELvq4=;
        b=ZQfTsQ2T4YINdEdU7OW67E2bD+SxkqY2MSPfgPx0zKX8IuO3h9MAYTdBLrnu+QwVvx
         SiCpaH+bqXq15nMnSPzE4N/3Xxe/leibnzT9a5JncJhve0Y0iMjrS2yMg5U74klnpefx
         Z7s1fhAOrhL9i6jU9oQWpxemmjvhfx+AI/Hd0ln7ZthwU5G6wajcm64hHufzhLt3kXTI
         3PBDxESbIoDhn26e6/f3+4BZ/5KnodBZSo/HVIH/10SK7yWfP7jkxL6w5DH+IoPtJYP7
         P1Qml9MshXV/g2V08H61bQFk1FzYfhXCO5dc5qFem46GhUpY9DB/fYmpN7Do5Kmda8qB
         QE1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790603273; x=1791208073; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZ9Tkd5ktyo3J81zP2ExpIdndNhoj9/lF2//YUfachQ=;
        b=URSdom+1yNGeeLBc/n1R3F3hAPY7VAytnggUjiW5JWlTHjpjngAm+FsjTUMS8Wylq+
         kHZr+WGdZsS18Od3Y81p9hs3f1x6LHigcmrEbkBnSjiP/XWzpBmIuCLX/2dn9Axx9t6m
         myZaIVssuhO5AJZ9v+sN4t6zMOB+GM6WlKlLnEuITF017L1CuHDB0MXW5RPVJqtE0Plw
         k+ztNV54xvnVxQOvLMMTG8anDzfzdgQAw0kOEe7n0CHPAW6FWrIYqh/VFFpyeBH1H/l/
         YDrQzrLkAlizSEU5tTKi6jZsLF7cl97kWlaneF0vulqx/egDgmsyU0oC2wq4ejN8cFur
         f3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603273; x=1791208073;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dZ9Tkd5ktyo3J81zP2ExpIdndNhoj9/lF2//YUfachQ=;
        b=I/NUoYWG0OP9thBjzrc+OY8o0lYl1AeKDrA1udu4qjZ4RbeKvmhoPqcFHCJkzBOlw2
         602JpjzOf+9AejM/m3LVMS89uwuGC+q6sHeYsHHNO+E1EKKI65gp5lz2fABSZ4DWNf5J
         nZrb4ahLY8JZfhtZPvN4SpFTcjlC01FZ5Zha6wWj7zRkbdR/Lfn3PbNn0dAjuvPxm7Vm
         JZn+ZNZlcsBQ0WxDl/Qw2nrn85yPSfT/qA46m6w0eyRA4nLxjMtMC9+MgWKceO7gHoxo
         xGKr17Jdh57zlgNSsBYv3B1uNGmYDYVKBaW9qa7u0CK6s+mSxyaSgHEzeSJtJIrlNscj
         ZMdw==
X-Forwarded-Encrypted: i=1; AKwUvBxfC/u0PptDu0pte2xbcIKVGIfOKg2O/MW1/zaw8FWi8Wbmh9xMnNEgCn3WpX5/uOCJZwQOZBQxAD0aHg==@vger.kernel.org
X-Gm-Message-State: AFuF++nEGtHmfBV4Tj9/gM6T/EGMEm6Ae+pghYApFsn/RamF04aeAtUM
	VquDNUr/dpxykr0CwXmSYTcHQ1KiIMEo5vkICI273wwDaRmaaFryhErKl67YSsWb0dVCGwpBd5t
	5MDT+i3aC19Wb2c2pcdGxWlT3M15622avL9PfCESy+YDM5MolIUA+rVk=
X-Gm-Gg: AYBFou0HQKCZnjJH6ky2AORcAPk3daDXNjNAAWWQ9wjswAjpWp5ruY2wE5FgkxibpT2
	ewGpTZNAyGA4PyQIrO+oOy/H5Jfl9zGgQ5O273Z+/CFGVMIxzf4gSMHxqrxcO2riLQfCf/KwkJr
	0WsE4QAZ/8ktpvdEsxytb/hazau8QMcha+s6Inq6D7qFF5UEMZsfbCkawX/bQHXBaDKypkKMP/9
	BkheuPGb/p4nAdRwm4fEkr550FFKw2TnxLafzc32rSP0J9uHdKOKOG9HI+wujQvyaYCg0qeiD9E
	IpCCdXLBBG1tc17eef2tCLesS5jAc4GKSAR64ViL690m5FrDllqQECnF/Xt/fYeIpmXq8OXBVx8
	XiUFf8mRRWb8YjXz7kMwGG52Zx/5NcbinrCXZmrcwftCQnfIK6EByLoE8z4TjXfsKkrVfQ4E=
X-Received: by 2002:a05:6820:4b8b:b0:6c7:af50:b2f2 with SMTP id
 006d021491bc7-6d43ff69b7dmr12278487eaf.45.1790603272980; Mon, 28 Sep 2026
 06:47:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-9-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-9-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Sep 2026 14:47:36 +0100
X-Gm-Features: AclHuK8pf6-cx8P7G1yInVrVxs_aGDLokGG09KZxdH-V88I3QFPMTofnHPAuxCw
Message-ID: <CAPY8ntAk1z-BuftZufd-qPwP9fDf9NQ0nwJn8XMV6pGKLfrFKA@mail.gmail.com>
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

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> When updating the flash_duration range ensure the ceiling is at least as
> long as the exposure time is. This may cause the calculated
> flash_duration register value to be rounded up.
>
> This is done by introducing a new
> ov9282_update_ctrl_range_flash_duration() function and using them
> wherever possible.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 47 +++++++++++++++++++++++++++-------------------
>  1 file changed, 28 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index f728709fcf0a6..be38ecfad8c82 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -541,6 +541,29 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
>                                 NSEC_PER_USEC);
>  }
>
> +/**
> + * ov9282_update_ctrl_range_flash_duration() - Update flash_duration control range
> + * @ov9282: pointer to ov9282 device
> + *
> + * This may round up the ceiling to the microseconds representation of the
> + * next flash_duration register value to make sure one can illuminate the whole
> + * exposure time long.
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int ov9282_update_ctrl_range_flash_duration(struct ov9282 *ov9282)
> +{
> +       u32 exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> +       u32 fd_max = ov9282_us_to_flash_duration(ov9282, exposure_us);
> +       u32 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max);
> +
> +       if (fd_max_us < exposure_us)
> +               fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max + 1);

Reading the driver for how it handles flash duration, it all gets a
bit convoluted. I see part of it comes from the units being usecs
whilst natively it is in lines, but we've got this slightly odd calc
and adding 1, and rounding in try_ctrl to get closest to the absolute
value.
Seeing as this is the max flash_duration, is it actually limited by
the exposure, or by the frame duration? The difference between those
is a minimum of 25 lines (OV9282_EXPOSURE_OFFSET), which I think gives
you up to another 9usecs to play with. That covers any of this
rounding stuff. You can afford to always round that one down and never
clip the range below the exposure time.

There is reference in the docs to a different behaviour if "the
vertical blanking period is long", but with a bit to set to give
stable behaviour (0x3017 bit 1).

You've far more experience with how this sensor handles the strobe
outputs though.

  Dave

> +
> +       return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, fd_max_us,
> +                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +}
> +
>  /**
>   * ov9282_update_controls() - Update control ranges based on streaming mode
>   * @ov9282: pointer to ov9282 device
> @@ -555,7 +578,6 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>  {
>         u32 hblank_min;
>         s64 pixel_rate;
> -       u32 exposure_us;
>         u32 lpfr;
>         int ret;
>
> @@ -590,9 +612,7 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>         if (ret)
>                 return ret;
>
> -       exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> -       return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, exposure_us,
> -                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +       return ov9282_update_ctrl_range_flash_duration(ov9282);
>  }
>
>  /**
> @@ -605,11 +625,9 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>   */
>  static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>  {
> -       u32 exposure_us = ov9282_exposure_to_us(ov9282, exposure);
>         int ret, ret_hold;
>
> -       dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
> -               exposure, exposure_us, gain);
> +       dev_dbg(ov9282->dev, "Set exp %u, analog gain %u", exposure, gain);
>
>         ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
>         if (ret)
> @@ -623,9 +641,7 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>         if (ret)
>                 goto error_release_group_hold;
>
> -       ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
> -                                      0, exposure_us, 1,
> -                                      OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +       ret = ov9282_update_ctrl_range_flash_duration(ov9282);
>
>  error_release_group_hold:
>         ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
> @@ -660,11 +676,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                  * Ensure the flash duration range is also updated on powered
>                  * down sensors.
>                  */
> -               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> -                                              ov9282_exposure_to_us(ov9282,
> -                                                                    ctrl->val),
> -                                              1,
> -                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +               ret = ov9282_update_ctrl_range_flash_duration(ov9282);
>                 if (ret)
>                         return ret;
>                 break;
> @@ -674,10 +686,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                  * duration. Therefore recalculate the flash duration range
>                  * here.
>                  */
> -               exposure = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> -               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> -                                              exposure, 1,
> -                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +               ret = ov9282_update_ctrl_range_flash_duration(ov9282);
>                 if (ret)
>                         return ret;
>                 break;
>
> --
> 2.53.0
>
>
