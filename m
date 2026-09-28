Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D918F49EC52
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593652; cv=pass; b=LutTx1N2DxCDpBu7x7V/CC8xsmv5AUyit3TQlZbGo3WniDyAgkYhSnlAVfaveq3kyzUfgx764WP+FC48FCBG2V4G+Bv54QtbK1PdB3KVEMXJlb1sAnFhd0oHwYGsm3YbSIOf8gB4fEUUCWIJTfqRn6uVu3TzIhAPc+gTS1KAMrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593652; c=relaxed/simple;
	bh=SfAnFz5JOmRc/oUFq/CdplF5E+SFaJU0kO2gyOAb214=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3E14taBY9ZcGYOT0o++T7Nif1NPqf6Mii7Q4K20kIlAbl5saBcJQwZMTXwq6VZsvqohYKG0myTMxqfCditAF/Ya2L2OimBCJy/2HqLEaJlUmpkJ7A9R2V/Z+pvc6nH4Ls18V1XT3KhGDUA/285i8MjyAhTZIaFLgeLTiw6iXM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=iMGbybvm; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="iMGbybvm"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49895394230so179726fac.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 04:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790593649; cv=none;
        d=google.com; s=arc-20260327;
        b=qUvNovUdRAxSt4+RyNYrBMKwmplK2U6omsJpjoTTRKx+JtG5QbPB/EdeZBn+xxJbfz
         HxjRuVaNFoIZyIZfG8DF6gxh85/oBJ3vfXLMsvre+LjvISC2ay7GqDD6S35KA1fFMe0S
         vUwxA8OEle3Y4/Vr6jyYLvMV0c/Qltbb5Cj9gLt+v/bml/UqKa5s38Tj2DLOmQIs1aMy
         ZordOaQgy8krwApyXpBo7VKDJ8h9dHQG2I+zcnALjZooo1173G/XBPBzn1fs55PtCe3U
         GG5UaVJMCI70atbcKxf2uUgXMafrpunjmPfV+sCEHdcYQIZOQYXUpN8JuQY1l1D0nvQs
         37DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sIpyHcifBhbNKOevvGAhBQ1aKd6xNGYYy1X2lYwtlRg=;
        fh=J3mRtw5KWfY/OyQhz1fCinJnIZ52N74r11GbgB6k9ng=;
        b=gLcTWzHZ9YkSCGBaL4DI2qvzTDvyhZlsJ9BTxpXj7Eu1ywz1D5dBBkwqKIOZWVM7NW
         iL4m13W0sq1/0w7JXYSW1TfML2NZGRxHqfVwbLjGuuwVdiCnRxd5JBUn0sbDiy8jW4PJ
         5IXas4kf8fsfyuZtu6MAPSlFRT05q/f3tcb3rXFPAEaa1cFu5Mg8SbaGK/56vHkhNMYd
         eNrwdyIPNzdxxh6fmpqQXAczhcBugw5SoJwRF8XKB9vnBbt+WkCTgRrBm931NwCD5ooL
         Dy15ffmDwjAXNVBHQ3NrirABZ/5MysnbGjZNikKcaQ6EXpDNpLjws8bLNFzGAEktHElz
         Kl1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790593649; x=1791198449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sIpyHcifBhbNKOevvGAhBQ1aKd6xNGYYy1X2lYwtlRg=;
        b=iMGbybvmG/zCTdDDjgRWIen34GuYdiQcg5ue0WEwvSr8WfK6dzmcVE8ZU1AetostU4
         SeTbvJYlZOXP3jQtZL2Z2jWpffRkimE+IWqvjFBvn1cL6C853w0z19bRYR0vuTRarp9E
         XrHtboMC+casl0h2uknCE5r9Zxl4aymn9S9b5jFaNp1ZRyEXspd7xmv+bE4wnUxmT2b8
         W3z/K62a6I4TwrlOQorht4SPemN7+zvvvwprYyjq4AAKZqq5h1gf8EyrTeczjHV+WvTz
         VBHol0VvgphEfNbM0vY0eRF2Iun6D4kXHBm1fBz+Rb4ahWrCuf9kZhEVZFxw96a0AtJ+
         Lg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593649; x=1791198449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIpyHcifBhbNKOevvGAhBQ1aKd6xNGYYy1X2lYwtlRg=;
        b=jwuAw8JGZl8hhsu5A9dmAhluIritYSBBKav6pnxtxWgt7I/tyDGumwzJ6NN6MGtv7P
         lxcnk5y27n5Qr/C0BGvy7oOdSWdQbKEdkhoSXOdpSkMHhP3+07yoxR2DbBzYwg2phNqi
         DhHVAmRoA1IQGjQvE/WdcgMqwTP7zYOyqvVB4tgkU5YSAPvzH1ionV/WxkBnQ7PPdaMW
         rgqhqA08FNyewOzx2uIwxdWD+dmTAB19n5wmQN+JomLmPEa21Wkxkm7tVjgfBmj3itGS
         BbMWBDg5FSkUjPdRh6+KbbjbHuwHdjb+nN01k+DbQMhrE71uvG78VUNGtzWSXNpgqsbw
         RZRg==
X-Forwarded-Encrypted: i=1; AKwUvBxOfuLxX4/8/05ySLyqP3xMnikC3V3doWIpJopAzANsjwkuZaxshSOmCI1jNxSMlNVDBu3ZL4hpXz+1vA==@vger.kernel.org
X-Gm-Message-State: AFuF++mcFjR4YK8DAhfAG6p0L+5//kC3vnduUrZLrFddGEP7esqUwwHl
	QBpUJ3tcUusJrXIiOZxWHupEJbbFeseiLkguLytuS1elkTG5hsMDkDEftxcL8vBgfypwLMxL8oe
	J/f5reHTtCU9gT107TYUcH7Ov8yKp4NkK26HsPOtmww==
X-Gm-Gg: AYBFou2yzc41nFYSStKjkZyoJi8xDeu769hW9cBRH54TJCfZesJ6rVR3b17GokiXBxW
	n4cm28X+N9AYIxVokbYFguxN3cZG+kssQM4UoleX6VxcjwQKssPCCIH+JSncHrkp8sZ4sG480Ix
	Km46ELOdd0Cn75fekGefMa+WZMwlbuTgm4AbFEzBo1Ej65XGqtRrgaOO5mtlEtXRYuI5IZ5/HuP
	MJmPHYZl090QqVbGxsmfeuLmnBUBD3SC2tNztiGJ1l4L1/EjaEKWLRwPgsgQIdN+ZHVaMND0RXb
	QI8JyxQv9CobvpY576PANcMdOpZ+zIvePbZ0ygtq0wr2nJXb9u4OeIole2w/pT7mwTO/zu1eqyz
	ixU88Z8Wqt0Nb1s865MR6EiCkbXClgIkJqrYAj+SGS013fvjjQkeuzfp06z0b6aEim9aBaI1B
X-Received: by 2002:a05:6870:d288:b0:470:e97e:8f7f with SMTP id
 586e51a60fabf-491e98625bemr9701368fac.15.1790593649534; Mon, 28 Sep 2026
 04:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-3-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-3-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Sep 2026 12:07:13 +0100
X-Gm-Features: AclHuK_UqKRjeowcIuqYWdTMhpiwhU89uBcQw44CeEXOA6E1zfE3LpwIwTiHb-g
Message-ID: <CAPY8ntBrN-GHT6+Nd+wu6Np2CEbsT5PGG-RjVcB2H3+8wSNoKg@mail.gmail.com>
Subject: Re: [PATCH 03/10] media: i2c: ov9282: fix flash duration to/from
 microseconds conversion
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> Currently the flash duration is converted to/from microseconds using a
> fixed OV9282_STROBE_SPAN_FACTOR constant. This is inaccurate as it was
> found that the "step width of shift and span" (which is not documented
> further in the datasheet) scales with the line, so the span is counted
> in lines.
>
> Fix the conversion by dropping the constant factor and using the
> previously introduced ov9282_line_time_ns() helper instead.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 66 +++++++++++++++++++++++++---------------=
------
>  1 file changed, 36 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 3f83a6cf338d8..90a0fe542ce4a 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -133,8 +133,6 @@
>  #define OV9282_REG_MIN         0x00
>  #define OV9282_REG_MAX         0xfffff
>
> -#define OV9282_STROBE_SPAN_FACTOR      192
> -

I'd been scratching my head over this one of where this magic number
had come from previously. I've now just clocked that it's the
(corrected) 8bit pixel rate.
Using the updated version of ov9282_line_time_ns we've discussed in
2/10, this should therefore give the correct numbers.

I'll hold off on giving an R-b until I can see it in-situ with the
other updates, but it looks like it should be correct.

  Dave

>  static const char * const ov9282_supply_names[] =3D {
>         "avdd",         /* Analog power */
>         "dovdd",        /* Digital I/O power */
> @@ -509,6 +507,42 @@ static u32 ov9282_exposure_to_us(struct ov9282 *ov92=
82, u32 exposure)
>                        NSEC_PER_USEC);
>  }
>
> +/**
> + * ov9282_us_to_flash_duration() - Convert =C2=B5s to flash duration reg=
ister value
> + * @ov9282: pointer to ov9282 device
> + * @value: microseconds value to convert
> + *
> + * Calculate "strobe_frame_span" increments from a given value (=C2=B5s)=
. According
> + * to the datasheet "The step width of shift and span is programmable un=
der
> + * system clock domain.", but this is not documented further. Nonetheles=
s the
> + * step width was found empirically to scale with the line length, so th=
e span
> + * is counted in lines.
> + *
> + * Return: flash duration register value
> + */
> +static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
> +{
> +       return div_u64((u64)value * NSEC_PER_USEC, ov9282_line_time_ns(ov=
9282));
> +}
> +
> +/**
> + * ov9282_flash_duration_to_us() - Convert flash duration register value=
 to =C2=B5s
> + * @ov9282: pointer to ov9282 device
> + * @value: flash duration register value to convert
> + *
> + * Convert a given "strobe_frame_span" increment value to microseconds. =
For an
> + * explanation regarding conversion factor see the documentation of
> + * ov9282_us_to_flash_duration. As the calculation there uses an integer
> + * division round up here.
> + *
> + * Return: microseconds
> + */
> +static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> +{
> +       return DIV_ROUND_UP_ULL((u64)value * ov9282_line_time_ns(ov9282),
> +                               NSEC_PER_USEC);
> +}
> +
>  /**
>   * ov9282_update_controls() - Update control ranges based on streaming m=
ode
>   * @ov9282: pointer to ov9282 device
> @@ -585,34 +619,6 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9=
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
>
> --
> 2.53.0
>
>
