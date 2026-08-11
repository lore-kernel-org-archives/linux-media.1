Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7822426EDA
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439842; cv=pass; b=FHqD+3PukkKlZDozBZeZMAOmUOXmbsQaHC5veA1jmQS6bk25Ayi7ki1aVTWmTkhGMG/JvjX3EsY4rdP2sAw4lqlYeHNLvEjxv99SpDWZWZWjY6tlG0x61IbKtc0XO6g+b8nm9G9P9nCdn7JdTqJd+ZsRqAk7ejyt9lF3DdnLkrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439842; c=relaxed/simple;
	bh=KpcqzEH1ePmPvfI72lRYO2R89XBPggH7Y6FsYa5Szgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NprGgm3RZh19GjoGIQA36/3UcGXkRl1y5lYS9CMihz1zXNc2Z4xZRHpel7leEIrW7KrBdit+d/W8H5qwm4l+WWs0TEdy2z+K2k5FH8PRTE+KlUdzr63hxIn8TuPkpFkuN/0L9leNYF85TXqyzh8SZnJBuN/J/H3gr65MCCo/2fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoMqf0I9; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoMqf0I9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a1541ea780so433200a12.1
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 02:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786439839; cv=none;
        d=google.com; s=arc-20260327;
        b=G+lY/7/yiLP0XILm1Z90EQ3/3qKpQ5wp60/h10QUCllE/ENcocKi1M6u74ECgJqhw2
         NcWftB5QXm7asqcUJeYwpqFQnS8uFDphdKHt860kavnklzwcYx3J1lGctxxMRPQuPvIV
         pSnuoc/HTVAg/hNsNOhBS/SfLLQ3A7hWjXhAO9v1zrgwj5RLIpWqnu7Jhfd+hMFsXU+u
         O0GO5Kxz26zOr1YZSn+4su1O5KwRdptk3T4la048+lM2i8dNErnosk8JzoNcghV0G9lm
         H8rpAfmZ9jsITR0HHaKXrtdfnIW1+8jc7rz7jsnGTOQsD/I9iId5AJK3JqqxkacTIDI9
         2Abw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hZSuQ7916Bf9+Y+2gxJN3rLoU22x89w0ikU47PZS+4I=;
        fh=gUigUlNZaHF+K7lvsvvUXCUxEYTzi/C1Ao9BIlzdDeQ=;
        b=JmUMyD3ZmymINsO/PCmwcsI3Coz2E3Upmhlxn+fkOd12FBCIfP9rzXOLLsuwPogiAK
         9gUuST+M4g5uEsiq3B4QLUS5x0QtplABHTdcrSs1fznsk4n2sw2i9U4rVizBhlX9983x
         H67ymdYuRmMaF+lPiuRrvZwQCmyt1nnrqz+1fjojRfKj9X+r9TbwBuBZDK1qKcLJAsWB
         WPF+QhN9v7dDFHvU1i0nE7JQlDQflgKMjXrm2+3aczyPOTNDf2r9a0Jmt/Es0otf1Oxd
         +J3r/7zxvHDsTEVkCPu9ToYV25QCZZBGluUKePE8ODIwRbg95Px2TNlz9razlYI4sPWh
         S36Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439839; x=1787044639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZSuQ7916Bf9+Y+2gxJN3rLoU22x89w0ikU47PZS+4I=;
        b=VoMqf0I9Xd3T/MAol2jU17ncYvWKokfKYadQotnUa16IV2UV9vKpPpjfIndl8WOpWZ
         9WCvF9bG8wSGx7/5WbUzOD0I/cQy1Uq4Zl5ykzQGzecgavEGlRMS1ckyCFtwjENofGsK
         kRBhHnXAt906oho/fjrfknnDb065GmvG+1dCnYR6BY3jbTG54BkJL/aVhfr0j8+K5uwB
         W0Q8PSZiC945GuKE3nPwzRYN6fY6athktyMlpvNPXP3WLeaJTwLC3ujK/yDz/dnnJzpv
         sFSPSgfWjVx4YSv9Bx5y3wgVxfYIh/lqZDjIJp6m9z7ieTcfHB4XZ+kKnPLoR1THGrhG
         Yiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439839; x=1787044639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZSuQ7916Bf9+Y+2gxJN3rLoU22x89w0ikU47PZS+4I=;
        b=QLfaFtAGgtImRXFu4Ev/zKY8IVP3x5h94tt0g6uLu5zs11y+1c79RBo23L0bZuBn1b
         Yy5y+GCt4mRge253J+U66k6ldD8G2YIoZKBgtUduziYbKxPCt+PnNRF3ful/6Dib3KbO
         RjlDyXQsjBH1lMxvl9ciGmnItxw++TE3aMs68e8xrzY30+76odlsmbRkL2mFlGd6OSJE
         SCjnPcLt5Jlo3xFy1vQb9yFfNYoJixyIhyIyVjdRufrmki5KEfRre/goyLs96fpu3KdA
         O591DNAwIz8qf9DGHtKBM5FBI+fEeCNvMNqyRTgkTCkl4QK1KRiRPAn3hfTBpndrX04+
         ZIDA==
X-Forwarded-Encrypted: i=1; AHgh+RpGoDQNTamIIl4r4Fo6N/zECKBWWxYwanXK8xEsx/oQkrtSGOXR6p6su7qsPxt2iTGdIsN0YR2zVgHBAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbrur1IaRZGlAgzPcyQ/JAp1omag3NnQwvCL8/Gdl7RUnhIuf9
	XOuB9kV02G6AIxZuSse8Y42hPlryr/wNG5MjPfud8QlYgI1OTAeDh4IuoH1/HFkHfucq7xD4GE5
	HTxSYW3UfG15t0reYgbnFvAKzG0B/KZg=
X-Gm-Gg: AR+sD10gwkkZ1DafofVnrzAqE7EGUadabeRxZKwCospvfX8/R2qTZA/Oe5o2zI8NLFy
	K9Q/CfwOssZPV5iFczJJ1sJWQuWdBR/RlExSil0lnP39LSexjaPOrl61OPR7aXxHgd8RK/EUYw+
	+skfeIIZaGSiSORDu0Wtv/D9cmi1oc/YO9XLkfHMFzpUPrSqmWyHVkMoxTBwZ6d1IMVP3aT87q9
	JDYQpAF8pZvs4SWjcKIm55l4BzXhiUB6UIiCaPrFqy5vgA0Rknbz696aRvKESt9k/09tjqOyt2F
	1qfBnl3CXvmZJ9auX/zkLzD80r/QM4n1qt9TU5OZUSQ=
X-Received: by 2002:a05:6402:3507:b0:69c:794d:4866 with SMTP id
 4fb4d7f45d1cf-6a36451210amr549230a12.4.1786439838260; Tue, 11 Aug 2026
 02:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-ov5640-1lane-v1-v3-1-ae476eaf5024@gmail.com> <cff4de4b-3a94-4a5d-acb9-726939a75791@oss.qualcomm.com>
In-Reply-To: <cff4de4b-3a94-4a5d-acb9-726939a75791@oss.qualcomm.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Tue, 11 Aug 2026 17:17:06 +0800
X-Gm-Features: AUfX_mwvAcly8I6-88t7WFFW5unFKbTgdsOtp3Ivfbg8asrINcSNy_rjnatdgIY
Message-ID: <CAPwA33KyHsKm2U40n-i=tnoYBcJJHBmSufBxNUKO8tDEP8VfUg@mail.gmail.com>
Subject: Re: [PATCH v3] media: ov5640: select the MIPI lane mode from the
 endpoint lane count
To: johannes.goede@oss.qualcomm.com
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Thanks for the review.

> Only changing the low nibble for on / off and always setting the correct
> lane count.

You're right, that is more consistent - applied exactly as you
wrote it in v4.

Regards,
Jason

<johannes.goede@oss.qualcomm.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=8811=E6=97=
=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:57=E5=AF=AB=E9=81=93=EF=BC=9A

>
> Hi,
>
> On 11-Aug-26 09:30, Jason Yang via B4 Relay wrote:
> > From: Jason Yang <jason98166@gmail.com>
> >
> > ov5640_set_stream_mipi() always programs IO_MIPI_CTRL00 with 0x45,
> > which selects the two data lane mode: the number of data lanes
> > described in the devicetree endpoint only feeds the sensor's clock
> > tree computations, so a module wired with one data lane starts
> > streaming in two lane mode and the receiver never assembles a
> > frame.
> >
> > Take the lane mode from the endpoint instead. The field encodes
> > the lane count directly - 001 for one lane, 010 for two - per the
> > current sensor manual (version 2.33). The 2.03 manual documented
> > 000/001 for one/two lanes; OmniVision corrected the table in
> > version 2.1, which is why the long-standing comment here found 001
> > unusable for two lanes and validated 010 instead.
> >
> > The power-up path also programs a two data lane mode, but that
> > value is overwritten when streaming starts, so it is left alone.
> >
> > Tested with a single data lane module on an i.MX8MP board
> > (imx-mipi-csis receiver), where the unpatched value produces no
> > frames at all, and on an RK3588 board.
> >
> > Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jason Yang <jason98166@gmail.com>
> > Assisted-by: Claude:claude-opus-5
> > ---
> > Changes in v3:
> > - Inline the lane count in the write instead of going through a
> >   local variable (Sakari Ailus).
> > - Link to v2: https://lore.kernel.org/r/20260811-ov5640-1lane-v1-v2-1-6=
5205ae86feb@gmail.com
> >
> > Changes in v2:
> > - Compute the register value from the lane count in the single
> >   write instead of branching on it (Sakari Ailus), with the count
> >   in a local variable to stay within 80 columns; the programmed
> >   values are unchanged, 0x25 for one lane and 0x45 for two.
> > - Request a normal stable backport rather than opting out of
> >   AUTOSEL (Sakari Ailus).
> > - Drop the quotes around the function name in the reference from
> >   ov5640_set_power_mipi() (Sakari Ailus).
> > - Link to v1: https://lore.kernel.org/r/20260811-ov5640-1lane-v1-v1-1-7=
9699457ce13@gmail.com
> > ---
> >  drivers/media/i2c/ov5640.c | 18 ++++++------------
> >  1 file changed, 6 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 8deb5f5501fa..18c3bb5498f8 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -1831,22 +1831,16 @@ static int ov5640_set_stream_mipi(struct ov5640=
_dev *sensor, bool on)
> >       /*
> >        * Enable/disable the MIPI interface
> >        *
> > -      * 0x300e =3D on ? 0x45 : 0x40
> > -      *
> > -      * FIXME: the sensor manual (version 2.03) reports
> > -      * [7:5] =3D 000  : 1 data lane mode
> > -      * [7:5] =3D 001  : 2 data lanes mode
> > -      * But this settings do not work, while the following ones
> > -      * have been validated for 2 data lanes mode.
> > -      *
> > -      * [7:5] =3D 010  : 2 data lanes mode
> > +      * [7:5]        : data lane count, 001 for one lane and 010 for t=
wo,
> > +      *                per version 2.33 of the sensor manual
> >        * [4] =3D 0      : Power up MIPI HS Tx
> >        * [3] =3D 0      : Power up MIPI LS Rx
> >        * [2] =3D 1/0    : MIPI interface enable/disable
> >        * [1:0] =3D 01/00: FIXME: 'debug'
> >        */
> >       ret =3D ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
> > -                            on ? 0x45 : 0x40);
> > +                            on ? 0x5 | sensor->ep.bus.mipi_csi2.num_da=
ta_lanes << 5 :
> > +                            0x40);
>
> You're writing 0x40 aka 2 lines now when turning the sensor off in 1 line=
 mode.
>
> I believe this should be:
>
>         ret =3D ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
>                                sensor->ep.bus.mipi_csi2.num_data_lanes <<=
 5 |
>                                (on ? 0x05 : 0x0));
>
> Only changing the low nibble for on / off and always setting the correct
> lane count.
>
> Regards,
>
> Hans
>
>
>
