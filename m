Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CADF32A3FE
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932606; cv=pass; b=iaxPZhRhBRmwPUvVrB3NBhM0YHl4vz/xDt1C6ILFdnDxPPX2JYThNa9Y9fk19eZ+Jy5xvWnph5awHPVQ0gdL/DMYx0H5q2rlsQt97co0GXPf/K1X0p1ok11hlreO8waWDtGYr4XgPBMqwJ/HE8+mYEgusfhRvcWtA9ywJHUkgbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932606; c=relaxed/simple;
	bh=RU9WeSvIr0Bek8KpTc6aNmHYOTcDpuX5+ym/4yUtZWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGe3/ds3ESRJWmI7medzYdo3mbE0vgVZgR0+zYR6AzcVwhlkv/asLij/pA+dgMkZPY/2XQmX2eAVKGhcIYdlaNsewdHtNaCKqVLrTkpqWhD89FUUrjejKM5KzdFzqgfdYmGjkuAketDJSE/Kh1ISc4FFUIxbVaTLGzsuB5EVXw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=C7fE+QTZ; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="C7fE+QTZ"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7e0fc8ead7eso49355747b3.2
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 08:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780932604; cv=none;
        d=google.com; s=arc-20240605;
        b=dCPXIMpVriITL9c67MhG140uTuAQClTk1ZsYPSyY7SXw4uWauGFiTcJd+xw0adK+ga
         +3LdaQd/2pkhyRaERmok6gZ1mm4xoED0H9fDppK+R/1FzWJXjC30roTGjXWR1/zVj54E
         Frpke0Dgu+qg67pkxedrNzHAVSUnBfHe86gIFKhuV/ZxAW8+pqOr5uy2YAhfyZUf31NF
         fWwTdWgHJW1/zgNTi4tvipaDkJ0awTfWSpAN0hIX6+UKHkLPgnJJazJqBgCY9hQYTW2s
         zUZgIOeCf/1a5/ITBV4GM9prXFJzpXn6a7UDCiVswjf6MaxpH3Z202ttGgyX5GITzBSK
         +/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nZnr4qHJKRkc27ksTNcwokDqqL+i/SWYFdv/VCh7o3c=;
        fh=wCgf29w5Tfiwiv5ySPc/k82f0CcZCa01Bp13MVBRgUA=;
        b=iExnEgIpDgF85EAehvz3Q3UoRnVhH02L+XieUy7aITrN9/07YATKLWKAxRv8uVLn+w
         QfzVS0Ej3q7+3IyLjNM0PcOzGt/nfjbn1wnyROpVZrq7KkRvb23YlNk1b9pLMrLy7gGY
         mxcOGBf8GRXYwPz6NYKs5eXpNXwPzjzb5LcQaPnD7M3m6VrpgMPt63Z/LMI0xJYVH04L
         4g8YAfjjjGugaaBzOx+LPOYN2Ab/ELDpG3E7IemzUR1L48EysxuDCuCL55HdIm4jaBQf
         WI71gJEhmBKRxcRsjt0z+9w1d8n/ZfEe1wcsRVHCQd67/OUPZGTQrVg6byjU4eIluldo
         i38w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1780932604; x=1781537404; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nZnr4qHJKRkc27ksTNcwokDqqL+i/SWYFdv/VCh7o3c=;
        b=C7fE+QTZqPTvpfLwwiKUkVJwvduhCZtsrmJJfbMTNpOPaQ6a3Ql0t3y2lhnv4+KDzM
         KiUup0PPRSSggzdQfA7AMqn2zxo1oNfTP7EGm9qVv15z/dnawHCmbJfwui/y1ZZczl3D
         Spw6kU6hpEgqU6hkxveTWntqIZA0ZRJY3mYFrPtxLKVMC4eeaMQY5+gDN+4YeT+6b6WB
         JgihAskmydiUvSk4liib2p6TufRy0QloMrcliUsgZIQ+2ThRFH30pefAWMceLjiyC8ba
         OU4fMjGGf0B5w28qWmdrhHEBQltobXl75TERw1iduQ2ph/lP6f1FhUgnnwE40qcl1bRw
         drHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780932604; x=1781537404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZnr4qHJKRkc27ksTNcwokDqqL+i/SWYFdv/VCh7o3c=;
        b=hYSNTfjVcqPrTm55ACwcQHlGACC4aq3OGW08t+9xsUhvyPt2tVIW+q9y9Boz39fsmN
         4vCcQxeysehNEVNycMw3WUYzNBnstL0+/bpj2FWdiNTrl69GmFpe7GZgCS+To8SWW3of
         9/fIOUiI2kwECDBiipkPx+i/HDoQSCoL+ak5ykjBsrJofDlnCd0GB0OaUOBw82WHJeo7
         wg3JWSS7yZ+2i03pO7EKi4u9qRAigCZVnfT1cozjfDFqfglSU066eFvNgDO5oTLVoPy2
         PbuJv4mziS0960UcKpGLbms29gbAg3NrZanIPkyMtuKDyCOyinhSm3TbfPbuSmoZAAFH
         j19w==
X-Gm-Message-State: AOJu0YyGPvNtYaHHNDU4tzef3hOkvU48YwwD4vaHbx3msvWlfhdtmlKt
	Xxiun6pmkhhc8W28A/rI1X2rUK1kznQcXiw086NBkF7r3KOp4aZiS8fac/aa1/If/oWaub88PlL
	LEJqWR7iMSoVrZPl3dF7WGT8FnepzXKbULYVPF5USWg==
X-Gm-Gg: Acq92OETdHqKu/2Yibshim31FDyOepZzUTqPiiKqHTFd36KiDtX61+7SYYUE1NkWuTC
	Unqn3bW51f8EvppiuhBoCdZykbIPhWpmxTBcufD2mTKE0QQgkWBh2R8Cn7czBJjGzMU982Q97eY
	6Fk3aOUzITfubmggRwT+tYohNvbUYaJqWmoUsm4RRdA6FK/FPWckTqSOdN4GmUMky/ujU5VOjs1
	a5TTDHT2IpGs+EHoS/TKmSUa+ykMfbbPX4HhU1t6KmpduyXOg4gppX1Y1dRNV1ynfJF13wCiEhB
	HJKriwQnnhLQ0gyYmcqvZGSi6YFaiBAzxnXV/SGRxxecFOUHtu0CluSioRZ51NYgNZTOx1t3qgr
	c+KPVWYjaLd5RrhfEpeFBFr2AemZnOwkofuQ=
X-Received: by 2002:a05:690c:6706:b0:7db:bff4:f086 with SMTP id
 00721157ae682-7ed0c32cd8amr147193487b3.12.1780932603976; Mon, 08 Jun 2026
 08:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260607215356.842932-3-sakari.ailus@linux.intel.com>
In-Reply-To: <20260607215356.842932-3-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 8 Jun 2026 16:29:46 +0100
X-Gm-Features: AVVi8CeJDRDrMbqvWQ-ksjYj6aizyBK5pwz61YOQ8wmhWCDT52cVH-bD6xMRcNs
Message-ID: <CAPY8ntDvpP8Nuc2VFOFgp+5HSDNWmJCika5in=pjZJVry=J7RQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] media: imx219: Scale the vblank limits according
 to rate_factor
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Rishikesh Donadkar <r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Sun, 7 Jun 2026 at 22:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> The limits for vertical blanking (and frame length in pixels) is related
> to the properties of the hardware, it's not in half-line units the driver
> uses. Multiply the vertical blanking limits by the rate_factor to satisty
> hardware requirements.

Whilst that would be a logical interpretation, it doesn't match with
how the hardware performs, nor the docs.

The datasheet for register FRM_LENGTH_A 0x160 says
frame_length_lines
BINNING_MODE = 0,1,2
Unit: 1Lines
BINNING_MODE = 3
Units: 2Lines

That's not units of 2 lines for active lines only, that is units of 2
lines for ALL lines.

I have tested it, and the sensor works fine with FRM_LENGTH_A being
0x278 in the 1640x1232 mode, and 0x100 in 640x480 modes with all the
tests I've thrown at it. Drop them any lower and it does stall or give
corrupt horizontal lines.
(Please note that the sensor extends the frame length automatically to
accommodate the exposure time requested, so do ensure the exposure
time doesn't interact with the frame length if you're testing).

This patch drops the maximum frame rate from 81.07 to 79.07fps in
1640x1232 (2.5%), and 200.1 to 188.39fps in 640x480 (6%) for no good
reason that I can see.
Unless anyone can produce a genuine situation where they see the
sensor behave incorrectly with the old setup, I'll be very sad to see
this merged.

  Dave

> Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 223d3753cc93..d8fe7db18b6c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -878,14 +878,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>
>         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +               unsigned int rate_factor = imx219_get_rate_factor(state);
>                 int exposure_max;
>                 int exposure_def;
>                 int llp_min;
>                 int pixel_rate;
>
>                 /* Update limits and set FPS to default */
> -               ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> -                                              IMX219_FLL_MAX - mode->height, 1,
> +               ret = __v4l2_ctrl_modify_range(imx219->vblank,
> +                                              IMX219_VBLANK_MIN * rate_factor,
> +                                              (IMX219_FLL_MAX - mode->height) *
> +                                              rate_factor, rate_factor,
>                                                mode->fll_def - mode->height);
>                 if (ret)
>                         return ret;
> @@ -928,8 +931,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                         return ret;
>
>                 /* Scale the pixel rate based on the mode specific factor */
> -               pixel_rate = imx219_get_pixel_rate(imx219) *
> -                            imx219_get_rate_factor(state);
> +               pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
>                 ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
>                                                pixel_rate, 1, pixel_rate);
>                 if (ret)
> --
> 2.47.3
>
