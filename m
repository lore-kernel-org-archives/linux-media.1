Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793285020;
	b=a1Nsfau93v21BgzW25qfcuVZspXR1BcDZTEV2EEshbSNcTSieuF3opBMNamkxUNZAK59
	 No024xHBjikIZyxnX5sbAdUDYqhXyoc8ty2PgLR9b5SHZoUGv4KJ1ztJanQA0A4J7iy28
	 28GAS7Dv/eSjTDK7PF+7xbDvVsvnpPJ+RAG3DaBdHug0RpN3CVno7quqJdJF00lWaeIut
	 BQ84Xp7VkSVC5xX7+jNX/rQMwQKq3Ri9n0fEeHHL5BsVDUT9uENt5jq2jgkvU+jYNXrki
	 6e6ByMpH/v5K42r2f/hYmwgSfdJVUq8az0v12VYEb5eJ5EYBwqODsT/4giBxxgKXynQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z145znUTSRyPKtFzUaXDyFLwmD4HnEY3Xx0IIr8udHg=;
	b=BlpFtsgx+7OYvigcl0W/Z0CJ2NYQcbLTC62J0bun/XJLJFL9meZ0kaz2rc33XdC3YynN
	 uMD7vyd6IyeyjGK5Bwl1r27YAyaB/fLLDw4t/MYSeQLOKpD9aXHsKlIdHTNHVPPgeIVvw
	 8wXiWL4xxXesQ9xOeuD9LrhTv1Pvplqa7sq2Jln3y7u9sWR53p7RqHkDjJB6SvmBH2M7c
	 nxkW1QALFtmSL8Rwji4M2sYEA0ZTjAhZnCxAc8r5Rv5SIXpRXfDKOgrcPZbYixAJbPN1g
	 n4ADPvBZAB3PxoGcUSSnNqd9TmL0VGO7RWSSjE6WnGBtCyJWLpFByKbdIxJy4U5Dh0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LGEsOJ3Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F1D606A31A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F1D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LGEsOJ3Q
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-7037daaa820so1029071eaf.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793285019; cv=none;
        d=google.com; s=arc-20260327;
        b=ngbE3D4/+KmgoWr9x96ZP5ojGIOryW74uCYQatUdHkuneBxvdthlNa9sBu4qX9Dtyx
         kX5l+vu3jtoHiTSD53FQtxBQCiQQvTLO+13S9DMISgweyoANKvbS56mT3UX/nlRVIPOW
         YOl8a+vDZ9XZV19l/DAo77eJ7+MKykd0kCl9TgH5KD1lhmDQxKhFa1DEoXgi6ytF0THq
         in8doeE3o+C6a8P1f+ftALA5JX6vGSSADttXMpGqFhWoyQRFh++8iYH7x4G2U45JHhcq
         O3iqyfchNJVzhg3wB4EgVMot9iXKwTrvlYwZzKIoXdnFtokcIwhKTOqptvxZtKz75cg8
         cQ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z145znUTSRyPKtFzUaXDyFLwmD4HnEY3Xx0IIr8udHg=;
        fh=X8oClh+x7BMvUE1/1qsCN/sBZsSL5oYtLkQU6wSCSzM=;
        b=IX/GwnYLpPicp1ot6f51hcpV1Ghf71Ia76EShsJEcQW+FQkqMFEwn2Ib30aMavbVxm
         vv3dqwp/fVVL6BxnHdO2dPWMlmpc8BXmKfGnURrh0+Iw4D//uhEcgKuUAvkE5gKXjplr
         VMlC8mdQ8bvgm+S1dwDyJuGYKC6QewIUr3DGD5NMhyI4QNukxTI6FxnCc4wxRA4LmRPj
         J0obA2lzv3lD5/DEleOpUsF47Txbu0OjIaLxCgGZFsBMEACDxVTTHMnxaEOWYqvEN/o9
         +EM4QhANsoXnkzYkPmKCHPBMy7fDyXOKVOhQIAXoqk9GaTMM9rr7+Bg3CMjrf90NXbhh
         mWYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793285019; x=1793889819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z145znUTSRyPKtFzUaXDyFLwmD4HnEY3Xx0IIr8udHg=;
        b=LGEsOJ3QYduacOrB/GeiIi+kGiHmrU2C3iF7B1awE1Dxal4fLPMbrVAp2a4cqhHbxx
         Xjef6gflgHBeMfGxI+ZqH/fGiW2/JLFtbN3eH5AhqNtDtN3FWNE539F6uKXq1WX+QjId
         T420BEGt3MfUYC1T5Dyal3j6uqFetxosTOYAbTHyJpDZVWtW+pC9phgVaH/xNEcPhpYP
         Re+V3KI0CiQWZ6ZnvsA1LnNL82fpeTK8EN1dj+wfdiuX6S+Zh8GHua7/Yoe8FTZoEJgL
         ic23LAiArCbcF2OGAR61ZMazg864Uy46AWwsA6BhFi39En3yWkJyj7NLVY/NHU+cx62c
         rSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285019; x=1793889819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z145znUTSRyPKtFzUaXDyFLwmD4HnEY3Xx0IIr8udHg=;
        b=D3Ljf0jlvLNCcYuXvq4HlSqyHRwFQkyx1cC7EiCj5lCSrhcjtQp4+itKUW35QT8BR7
         hN7aPfJ+aBnOW7n27oC90CAfeaJaCGygyYcC63H9yVS7/4daMrZ5h8LjIvShdOak0YvQ
         fVdBzNvMpc/8px8m04/4BAEfAOgvnQ7vo6TvAl7zedbdW+YcOOan9wG4/4F7MOEfjoDG
         CEGygXx4ruoVjxEa5eOYYOi6PcxP5Ru7vhF9wjqkxKimlZUBS4OL1R9Hm3NBvDDKGOzI
         hWf0ieB3dKMeWDln60KLR66tSa707tM4choj9SPd782BxQG6BlXGsYejeRQ34U0sGibb
         4k8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7k8ngsGqvD4n+9vMW0knm59hvroZ/iVC5gsNDeXbV950xrAaYdw4KNHlVMf0+yIVvbZ80I7EYXw/HfA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLMThakc4GkbVtTH+yR8EDZSjuBmAUns99Zxwb6MJiAcqT4k9nS
	CZAgf1vgLI70XiglF7LLdCaZyBb6+blF5Du2xA+cIxw2/ky9AcQIJElEwIHrbEbnwpgkMo/e5L+
	vjzbQf/YZMZEDfGKIxYNYVVP68qCQoyJri2khXzq+qA==
X-Gm-Gg: AYBFou2KjKJAD9u25mMTTtrR3S8iUbrCD33ZPRwuhDrkdOgWx+jxU/Fk5uVjHeq9h42
	KcrjWPm/MW/lO49Jdg+Mrh/Y6zMqVbbrNXvaY8P/+RvqVPT6jcd2fbyPp3bp2T/HMJDAKf5BLRJ
	DH6SkFSObKctwuVIEifxg9vDNfswf8WBtKSAkYLouT0HRVE3Ws+jOemn8lzQsT6Q9zZBFYq+74r
	pwF2mxCfDpmovGQtwy/YpZZ3cCXKeFE9r58Eo8y/FsjXs5go388HEqbbqDh9OBmQsRKd8N0GlS6
	VNfXpZBUEcnIQSHBCJ4B4k/koPKYcW26Q5LrxUl/St/9uCdq6GEu0vGlXtvgtQkuCdfu49chlhJ
	cI/EmkRazjW4vK1ukPqsg0Jm5yUhTugR2hRzVEoq71ov3Yq/R5mFMQ3T/Pl2OUr+Q1a0SDIWHCK
	ryoXwiJ9fClQ1Ida7N+WcGZt74Z1SDT8kXV2LYuQc05TsDpclNB1bMTg==
X-Received: by 2002:a05:6808:16a8:b0:4c1:5614:acab with SMTP id
 5614622812f47-56382d81203mr3829523b6e.37.1793285018819; Thu, 29 Oct 2026
 07:43:38 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev> <20261014-ov9282-fixes-v2-3-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-3-3bb376d8b1a9@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:43:22 +0000
X-Gm-Features: AclHuK8HEINmU3r1FVIqsPNHE0UWIKCBJ0QrPdQvofVLfeWv7-01NAJbHLdiNlE
Message-ID: <CAPY8ntCP80YX7mkOVhjXhOSaZ_EFW-JKP=GBjrQYu1ciBQusew@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] media: i2c: ov9282: fix flash duration to/from
 microseconds conversion
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Martina Krasteva <martinax.krasteva@intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Oct 2026 at 07:49, Richard Leitner <richard.leitner@linux.dev> w=
rote:
>
> Currently the flash duration is converted to/from microseconds using a
> fixed OV9282_STROBE_SPAN_FACTOR constant. This is inaccurate as it was
> found that the "step width of shift and span" (which is not documented
> further in the datasheet) scales with the line, so the span is counted
> in lines. This was verified by comparing the stobe pulses measured on
> the camera module against the calculated line times.
>
> As this is the same conversion as for the exposure: rename those function=
s
> to a more generic ov9282_us_to_lines/ov9282_lines_to_us and use them also
> for the flash/strobe duration.
>
> Fixes: b95d8058a2786 ("media: i2c: ov9282: implement try_ctrl for strobe_=
duration")
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 65 +++++++++++++++++-----------------------=
------
>  1 file changed, 24 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 5907f57b34523..e2a1f875160b9 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -136,8 +136,6 @@
>  #define OV9282_REG_MIN         0x00
>  #define OV9282_REG_MAX         0xfffff
>
> -#define OV9282_STROBE_SPAN_FACTOR      192
> -
>  static const char * const ov9282_supply_names[] =3D {
>         "avdd",         /* Analog power */
>         "dovdd",        /* Digital I/O power */
> @@ -491,18 +489,31 @@ static u32 ov9282_line_time_ns(struct ov9282 *ov928=
2)
>  }
>
>  /**
> - * ov9282_exposure_to_us() - Convert an exposure register value to micro=
seconds
> + * ov9282_lines_to_us() - Convert a number of lines to microseconds
>   * @ov9282: pointer to ov9282 device
> - * @exposure: exposure register value to convert
> + * @lines: line count to convert
>   *
> - * Return: microsecond representation of the given exposure register val=
ue.
> + * Return: microsecond representation of the given line count.
>   */
> -static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> +static u32 ov9282_lines_to_us(struct ov9282 *ov9282, u32 lines)
>  {
> -       return div_u64((u64)exposure * ov9282_line_time_ns(ov9282),
> +       return div_u64((u64)lines * ov9282_line_time_ns(ov9282),
>                        NSEC_PER_USEC);
>  }
>
> +/**
> + * ov9282_us_to_lines() - Convert =C2=B5s to line count
> + * @ov9282: pointer to ov9282 device
> + * @duration: microseconds value to convert
> + *
> + * Return: number of lines fitting into the given duration
> + */
> +static u32 ov9282_us_to_lines(struct ov9282 *ov9282, u32 duration)
> +{
> +       return DIV_ROUND_UP((u64)duration * NSEC_PER_USEC,
> +                           ov9282_line_time_ns(ov9282));
> +}
> +
>  /**
>   * ov9282_update_controls() - Update control ranges based on streaming m=
ode
>   * @ov9282: pointer to ov9282 device
> @@ -551,7 +562,7 @@ static int ov9282_update_controls(struct ov9282 *ov92=
82,
>   */
>  static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u=
32 gain)
>  {
> -       u32 exposure_us =3D ov9282_exposure_to_us(ov9282, exposure);
> +       u32 exposure_us =3D ov9282_lines_to_us(ov9282, exposure);
>         int ret, ret_hold;
>
>         dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
> @@ -579,34 +590,6 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9=
282, u32 exposure, u32 gain)
>         return ret ? ret : ret_hold;
>  }
>
> -static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
> -{
> -       /*
> -        * Calculate "strobe_frame_span" increments from a given value (=
=C2=B5s).
> -        * This is quite tricky as "The step width of shift and span is
> -        * programmable under system clock domain.", but it's not documen=
ted
> -        * how to program this step width (at least in the datasheet avai=
lable
> -        * to the author at time of writing).
> -        * The formula below is interpolated from different modes/framera=
tes
> -        * and should work quite well for most settings.
> -        */
> -       u32 frame_width =3D ov9282->cur_mode->width + ov9282->hblank_ctrl=
->val;
> -
> -       return value * OV9282_STROBE_SPAN_FACTOR / frame_width;
> -}
> -
> -static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> -{
> -       /*
> -        * Calculate back to microseconds from "strobe_frame_span" increm=
ents.
> -        * As the calculation in ov9282_us_to_flash_duration uses an inte=
ger
> -        * divison round up here.
> -        */
> -       u32 frame_width =3D ov9282->cur_mode->width + ov9282->hblank_ctrl=
->val;
> -
> -       return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTO=
R);
> -}
> -
>  static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct ov9282 *ov9282 =3D
> @@ -672,7 +655,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_FLASH_DURATION:
>                 ret =3D cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME=
_SPAN,
> -                               ov9282_us_to_flash_duration(ov9282, ctrl-=
>val), NULL);
> +                               ov9282_us_to_lines(ov9282, ctrl->val), NU=
LL);
>                 break;
>         default:
>                 dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> @@ -691,11 +674,11 @@ static int ov9282_try_ctrl(struct v4l2_ctrl *ctrl)
>
>         if (ctrl->id =3D=3D V4L2_CID_FLASH_DURATION) {
>                 u32 us =3D ctrl->val;
> -               u32 fd =3D ov9282_us_to_flash_duration(ov9282, us);
> +               u32 fd =3D ov9282_us_to_lines(ov9282, us);
>
>                 /* get nearest strobe_duration value */
> -               u32 us0 =3D ov9282_flash_duration_to_us(ov9282, fd);
> -               u32 us1 =3D ov9282_flash_duration_to_us(ov9282, fd + 1);
> +               u32 us0 =3D ov9282_lines_to_us(ov9282, fd);
> +               u32 us1 =3D ov9282_lines_to_us(ov9282, fd + 1);
>
>                 if (abs(us1 - us) < abs(us - us0))
>                         ctrl->val =3D us1;
> @@ -1277,7 +1260,7 @@ static int ov9282_init_controls(struct ov9282 *ov92=
82)
>         v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
>                           V4L2_CID_FLASH_STROBE_OE, 0, 1, 1, 0);
>
> -       exposure_us =3D ov9282_exposure_to_us(ov9282, OV9282_EXPOSURE_DEF=
AULT);
> +       exposure_us =3D ov9282_lines_to_us(ov9282, OV9282_EXPOSURE_DEFAUL=
T);
>         ov9282->flash_duration =3D
>                 v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
>                                   V4L2_CID_FLASH_DURATION, 0, exposure_us=
, 1,
>
> --
> 2.53.0
>
>
