Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17043C9438
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 14:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483398; cv=pass; b=A7XfwtcY8L6JeXUnAq6aTbs2gI/cEbF9JkhhlPWCkXA2hDGUPJOBpcywko3+GVybn8ENJZ/n/KjmGkJZCdKYfowl2UosFQgwESii5pjGMFuHXRbq6h2BlnrN4kF9fohuQNzJwRcXM/Zo24Szttl4O/VmBcyyW4JFUeV6vz8Heh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483398; c=relaxed/simple;
	bh=15/+SywPQsJQghdy0lHJz8wGdQwZPe4GOXiZDdhxSII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhkMCCtPFGRxmbC4VOFLfnKBZO58K0nas+nADkDXTuhIm+bIB/LhDIQ9WlZKtyWBULU8VTxn4VAeLH2EQLaKFwxWbVHQ7sn2Qnwiqc2suy8ELF8hfyvmEgV3vGkK9BCRkDIMskG48uqLOs7tMngakbPUzeEwmcwxx2h3ZP3Tmnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dcLYwy0D; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dcLYwy0D"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6eeso34858646d6.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 07:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483393; cv=none;
        d=google.com; s=arc-20260327;
        b=aR6V1OhqBg4NUgBXDfOlzPEHENWirXCFRXUDTtCOlcxq40g1/MtgQZCiCLRkWdxy81
         +exPh1uRZ4RhXSxAFrfEQl94GypyATrbGmn8hhF678pjLjrGgclIgc5uFEE1xwgFhLav
         6N1yYEfJGhDv8tUWQzTU3WooPrv8+O2PhF2T2SS8S8CbpwApQMKAKWk7kuwtWjKvW0V7
         68Kn3tLDldCpsn3Pile9PcxLX+iPk3yF8eDuRvIIQBo051bnTdUDZ8zatHcUjNk7wfH0
         jkg04db2ITGt0byIuG7t6y9OxMKteF/MgX+MjCBAm5qzysTAqQxw4sP5vI/1yyFzMAwP
         LA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rID0m9JFEu6NHI6Fa/R4Mit9IJeM2Yeqh/iWfm9iBds=;
        fh=yZN97dKW7rvgETgvK55cddCMkmcb7Xu+GqQYJgxDsXw=;
        b=Tz9Uwji/TzxM+lxDH9L3WJY6g/fb2XXH5PuIjGNgkx5fHBa2yI3f+DSqdvzVYUDz0y
         nymI9GeCQJC/IDTSyDdyzB4LsA5S/ur/uhs77hAl7AGz9lZ/uyy6RHbcNbqn7tlrY70f
         7pfZpPMsqsLkEFPDSnWK8Gc3qx3f3Wkf9Bcq6qDKNEKNcCnovESP9/qsuPtSGoAZX+hf
         ebFOc/CeDMt2HgELX5YgO1x6A4BRf6BdkSt4r/CIgHrguYsLsMMxxDsSA4IWaVM2rr+O
         ljpuXiHra7MM0rbXz3B6prlhH1xUXhwR15X0uvBcC1muko7ivb6VgwdjiLHT8cXxWAps
         DNJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789483393; x=1790088193; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rID0m9JFEu6NHI6Fa/R4Mit9IJeM2Yeqh/iWfm9iBds=;
        b=dcLYwy0Dj6xYUFzGAacOg5WoiZ4eBVMxfgWLiPhp4x/xGzIuN/aCL3LClzw9VgImjJ
         qEN0nskYTZ2kkdLcUeHbFIwZsqQ/JoczfTQaDz+y8Ki2IEOJQDogv/RZuuJRM0nUDVnY
         X7Ho16jgb6Xzw6cr229UxDJTG7qYYz7+cx5MxY79A4klE0Iiz0buqG/rLCnWGLAcquA6
         XNcNGX1w/ahJBz9Xh8qa2MpWTp2YYkp7xpIBznTkJ36LdEND7Z3ET+oURVYr7vsQPdVX
         fxp0bUU0rEAE9FYtUaK38GVDDrjMEmCcjDvuu0AbOdUbVoonxVjoluDA7WQsdwBi6nU+
         vX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483393; x=1790088193;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rID0m9JFEu6NHI6Fa/R4Mit9IJeM2Yeqh/iWfm9iBds=;
        b=m/5MWHyU6ywqrt9rD0wzA2MrCKVE4DsRknAxt0qM/21/3AVSGsXWNuDDksYUF+srsF
         kY40ODcRJUEXqIvNodSEgAHdB289V05iTuxhlHfWUmmQRGYyTJlSMjAvTjEXjdMZM73n
         phhr+zYMxLQsRWW3uJz28kC+Wv76SGuhpaSYa1Kv0T3wNAqoyJwqUAV5WrX80lcLBHKk
         Wx/ynYV/vJLNk3/VZC2mRObZzAb0kGR62eEBJjzVP15rq1K5dqjaB3dqiqzuqa20gTyd
         SUJOB6EYSr6ZoRMJzueIIUsjnMkhkqfFzqh2Rwf3SBiPjztboB2955nDYZUjPNeTD/UO
         bXrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIPLEQdA7tDprDS9FJht0Xo6ugpr1xPX0aHjHrLr8Iwn+8GMgiaQ8KZtCyUEedXiqBEGWOSQ8IH13r6Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lL54/XOqaJaQ9SR2bRlTO7Q7mc8M6GLw+xSjw8lGeoJuHG2/pv
	c9oQlW+eP7A71EwDJwF157lZlSy9RpAGuU/tPTOlZfBw2JUCdL1XJ7XvoXvjXBSlm0xhfQacDO5
	zTXI4DN1L/1MvZZ70bfiBH6ONthMqVKBOL8apCPidyg==
X-Gm-Gg: AYBFou3ARHqePAWK0mbY9vC9f7TXjw+Z/P4Ehd160RTv3QJZwqp7CFKpZsm0Gnj3lT6
	GHfd6v5hcLTkvi5nEcUe8CkfMnIJZSSP/iqbaPofaKvjf3FyX3uwy6oc2lzwhnVkEh92+Z2hiu+
	wf2K4SLnFKJ2gdTBXmD2Qj+oigR6llkfFFvdpzkIpfGs8Z3x+qvVPDQ/D1Q0Pmw/rLQCd+tP0wF
	Kpbf5gNHAeywFDvzXDqGMO1XJ+6zM2qM1qZR7mPQcHkuNSuc8Fl5p3w/bvuTfEk1HfJbuuCXGCX
	BOtLk55l4Y+hF3fI160GdcxrbinRjVsGRWzdbt76TZKXN29eSvU64uQFDOww4muMH+TvKUP0NgK
	I4BJtgKP+UUPo/w9X3nfpNjmvHUqVZMHWUatpFDXOX9OoSYO5S096VGE1h0IXSFDfUQAhJVtb
X-Received: by 2002:a05:6214:b63:b0:90e:8cd4:30da with SMTP id
 6a1803df08f44-9122e55ceacmr123209306d6.18.1789483393372; Tue, 15 Sep 2026
 07:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-7-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-7-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Sep 2026 15:42:54 +0100
X-Gm-Features: AcwNN1W1SjWSkd5yJqtH0RgT6TBJ1Go9MLnuWlo9YYy7VousLlRm-tuvUaXNS28
Message-ID: <CAPY8ntABqjqzt9jJLiOpgH7yjpk5GZzhx9rKicd+-Dh-ewZ54A@mail.gmail.com>
Subject: Re: [PATCH 07/10] media: i2c: ov9282: drop redundant vblank field
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> The ov9282 main struct has a dedicated vblank field which was only used
> to duplicate the value of the vblank v4l2 control.
>
> Therefore drop this struct field.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 632184e76b9bd..28f8b05b4c09e 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -193,7 +193,6 @@ struct ov9282_mode {
>   * @again_ctrl: Pointer to analog gain control
>   * @pixel_rate: Pointer to pixel rate control
>   * @flash_duration: Pointer to flash duration control
> - * @vblank: Vertical blanking in lines
>   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
>   * @cur_mode: Pointer to current selected sensor mode
>   * @code: Mbus code currently selected
> @@ -216,7 +215,6 @@ struct ov9282 {
>         };
>         struct v4l2_ctrl *pixel_rate;
>         struct v4l2_ctrl *flash_duration;
> -       u32 vblank;
>         bool noncontinuous_clock;
>         const struct ov9282_mode *cur_mode;
>         u32 code;
> @@ -646,17 +644,13 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>
>         switch (ctrl->id) {
>         case V4L2_CID_VBLANK:
> -               ov9282->vblank = ov9282->vblank_ctrl->val;
> -
> +               lpfr = ctrl->val + ov9282->cur_mode->height;
>                 dev_dbg(ov9282->dev, "Received vblank %u, new lpfr %u",
> -                       ov9282->vblank,
> -                       ov9282->vblank + ov9282->cur_mode->height);
> +                       ctrl->val, lpfr);
>
>                 ret = __v4l2_ctrl_modify_range(ov9282->exp_ctrl,
>                                                OV9282_EXPOSURE_MIN,
> -                                              ov9282->vblank +
> -                                              ov9282->cur_mode->height -
> -                                              OV9282_EXPOSURE_OFFSET,
> +                                              lpfr - OV9282_EXPOSURE_OFFSET,
>                                                1, OV9282_EXPOSURE_DEFAULT);
>                 if (ret)
>                         return ret;
> @@ -704,7 +698,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                 ret = ov9282_update_exp_gain(ov9282, exposure, analog_gain);
>                 break;
>         case V4L2_CID_VBLANK:
> -               lpfr = ov9282->vblank + ov9282->cur_mode->height;
> +               lpfr = ctrl->val + ov9282->cur_mode->height;
>                 ret = cci_write(ov9282->regmap, OV9282_REG_LPFR, lpfr, NULL);
>                 break;
>         case V4L2_CID_HFLIP:
> @@ -1412,7 +1406,6 @@ static int ov9282_probe(struct i2c_client *client)
>         /* Set default mode to first mode */
>         ov9282->cur_mode = &supported_modes[DEFAULT_MODE];
>         ov9282->code = MEDIA_BUS_FMT_Y10_1X10;
> -       ov9282->vblank = ov9282->cur_mode->vblank;
>
>         ret = ov9282_init_controls(ov9282);
>         if (ret) {
>
> --
> 2.53.0
>
>
