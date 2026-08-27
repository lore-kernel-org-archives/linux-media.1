Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87423CBE74
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869793; cv=none; b=tg9LuWMnWOsmnwbt6ZsisCYji/TaY/7IRiB6mCWrbYyI9FZnbnD4Kd9J/GT4BepKj3lJhmatmWaL0BclBhu2pxf0C9078F9xwmpwG9UnneVAbxoXJLYJP8pC4GwRffZUNyknV9Ah+Rnn1KSXDruP8dKn4N+G2d8LZDBxih+xpgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869793; c=relaxed/simple;
	bh=TnqqFYpXbfSvwBbRODD1mhaJAl/yxdEsp0GQjz864TY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5gfXWOwpAaK6T8Q2ughJJxD83q9RbYgjrwflvevMhQDnNELb1a7CFP2+BQzZDKUYyBKpOrHNtubdhwYO4IpCAyvlOBxSQfms+HAMdzxoRvyma87f8RzHKXI7bRcXf+ZXagnW1gftzH4/FO33m7uMrL8NEgpYVxWfG8+7Ze+urE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRp4ASCT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRp4ASCT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E525D1F000E9
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787869790;
	bh=s1DAy5lHxL1jh6qjbsn4buXuy7blPMbcGLyJ4nQCRHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eRp4ASCTMQz9osVboo0L4poHe11JOABpZcb6weM3XQxdwM2za+b6vbNorxbgmS+AH
	 4z6rIYKQh7MwjiSAZwacJmKydsZwLiY4jVjIidBsQ1eSSvxIwvmhrXJKYQvPqlJdPC
	 XmWef7ivNhMmg7ZOz9oH04Uqu4IaZPcABsJkyB8umZyZ0y5ZClMaNjlUpgoXXExq6b
	 eW9LuqbOCsLzmA3FprTYMuxi3ezqKwN27Ii6zYcXks63CKSRtq1epaaG7jDypw8PzS
	 v0qUoudX80nn5yQiVtLVJT9jhSBBinuKkLpYPF9NJOPQXiSN+U/dTor466VXbRcyhd
	 ysnOpvD+q3Glw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so363552e87.2
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 15:29:50 -0700 (PDT)
X-Gm-Message-State: AFuF++nKm5arfdbBM0XaspQR/ke2TkURUy67CiHSvqle6Aae4jU4PzU8
	Bo5tVLlHdCRSvcIR9J/ZCBPvSJUbU5zB0l/0Whg0WXtGKz0t935siBCHlGim4f7v0IP99Ys8vul
	VuMSgN/HGeFCeqEAiTdYbHBmjD4WHFfs=
X-Received: by 2002:a05:6512:33d5:b0:5b5:e316:c9ae with SMTP id
 2adb3069b0e04-5b5e6afa49bmr512972e87.20.1787869789662; Thu, 27 Aug 2026
 15:29:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-2-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 28 Aug 2026 00:29:36 +0200
X-Gmail-Original-Message-ID: <CAD++jL=kHg-rMyQJ5_Rb0RKMq8dM4yt4HRkMG5qZ5A2J=wAQLw@mail.gmail.com>
X-Gm-Features: AcwNN1XeHjI1y2u6mrosLqsmLj3oEPl5wgNG-QSzCsgcLs0hP7YIEUwLbjLXpN4
Message-ID: <CAD++jL=kHg-rMyQJ5_Rb0RKMq8dM4yt4HRkMG5qZ5A2J=wAQLw@mail.gmail.com>
Subject: Re: [PATCH v3 01/29] media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari/Frank,

one more thing which might be a rookie mistake on my side though:

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

In this example:

> CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
> See section 9.4.
>
> Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt t=
o
> MIPI defined data type and avoid below duplicated static array in each CS=
I2
> drivers.
>
>         {
>                 .code =3D MEDIA_BUS_FMT_UYVY8_1X16,
>                 .data_type =3D MIPI_CSI2_DT_YUV422_8B,
>         }

The way I read the CSI-2 spec YUV422 8bit has this byte order: U Y V Y
(this is in section 11.2.4 in my copy of the spec, figure and all)
so this looks correct if you just look at that string: UYVY no problem.

I tried to understand the MEDIA_BUS_FMT_* conventions...
I looked here:
https://docs.kernel.org/next/userspace-api/media/v4l/subdev-formats.html

And in the table in the docs:

Word 1: bit 15..8 is U, bits 7..0 is Y
Word 2: bit 15..8 is V, bits 7..0 is Y

I *think* 1X16 should be understood as 2x16bit words (samples?) where
each 16bit word is in LSB, MSB ("little endian") order, i.. bits 7..0 (Y)
are transmitted *first* then bits 15..8 (U) correct me
if I misunderstood!

Then UYVY8_1X16 becomes the *byte* order Y U Y V.

But YUYV on the other hand becomes U Y V Y !

Isn't this then MEDIA_BUS_FMT_YUYV8_1X16 ?

I'm reading the spec and Linux format codes until my eyes fall out...

It's there in the code though:

> +       { .code =3D MEDIA_BUS_FMT_UYVY8_1X16, .dt =3D MIPI_CSI2_DT_YUV422=
_8B, .bpp =3D 16 },
> +       { .code =3D MEDIA_BUS_FMT_VYUY8_1X16, .dt =3D MIPI_CSI2_DT_YUV422=
_8B, .bpp =3D 16 },
> +       { .code =3D MEDIA_BUS_FMT_YUYV8_1X16, .dt =3D MIPI_CSI2_DT_YUV422=
_8B, .bpp =3D 16 },
> +       { .code =3D MEDIA_BUS_FMT_YVYU8_1X16, .dt =3D MIPI_CSI2_DT_YUV422=
_8B, .bpp =3D 16 },

all four of the related encodings, I don't know if this works in practice
but it seems off. Three of them must be wrong since MIPI_CSI2_DT_YUV422_8B
is very determined?

Obviously I didn't check the entire table like this, but if there is someth=
ing
to what I'm saying then we have to...

Yours,
Linus Walleij
