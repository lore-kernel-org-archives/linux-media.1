Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748FC435A8A
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 07:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620288; cv=pass; b=QagyV3+m+y1uLaNpiUhPYS6I7IQlQouECuGNE4uob51wHRzWWjfU7lgZadV7abgM1nILASprgaWTxb0uUroUm2SHu2R6Fe/M/0AdQIAMn2lwDYwVunA5nM7RFXMCiWRcLUL5mlzeJa19JAKG5Sc92sQFinW8SXPSbHt8o6hHksk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620288; c=relaxed/simple;
	bh=CtMhL4ZCm1kTXN/tbtKm7J4VifWySfdzn/e2RDGEauo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=trjb961TOlo7XnZsN38EXcaGI/JEAW/6T+ZZmCUXLXDXfmeCXYK013ciA6kSr6O2+1u6i8INBchwkoN10nvIcVLbete4bjw8+mpkIoZeZvTrWj01wDTKp4dhFTxUtgdYeYZernVMngqQoOn+a+Uucgh7xbCbjeAfWMSapFJvS54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJgT3XcH; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJgT3XcH"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81bffd7daa7so12610017b3.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 00:51:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784620285; cv=none;
        d=google.com; s=arc-20260327;
        b=rdomic2vvk8tFvwLpwzRlrrAkCA2fB/nN8gQYvDPoqfQR6/6h58k9C9POq5w/ysb1T
         KyAad+B5T14YIsabGcsnUoaTB2HF8kfM8Slhq9XKLF20VEObFgb63QJvVM1p+F2U10yp
         QAfcJjfqY0qh7zgHD39mkBNgUoVE577ce9jggYrGRu0ovV8HEGhx9zHB1lPo98wHyYll
         zKEcR7x87Fg17n3bixNGYdth73lPrLnxm+ndd2gdmqWJoXkOOHLD5k6hyNxLJeJIhEyy
         7guoJYRDE6/XTi7RHJvB/nG7sEGKVME7BshHPZ0IKbS+XmYcQDB1F8jpKBEkEu9QZxvi
         vPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vZzSeZR0bkDEH8l+WELeqcCX8Q33dRM0eRRSsd4cPwc=;
        fh=+FpLgBSFdQ1dgAeZpiUCNYe6wj8TPmva4YgACInxDyk=;
        b=foyBpO9C/fdtHiQlI163tGSY6Et2xKsuuffyRPzQ85wf4xtPEdEQnj/WObFCMHx1Ms
         coWNQ2ZA5XshSW2DvlRjCSqWcB6Cva/p2wxLTBNbrl9/UymoZ139ngvBINFrCELehQcQ
         LCu0Hv+pFCUOhpbIxLrjLgH3Uq3aGdjrDCP8/FNCwjHR5Vn/FNFDNvj3l4F2JPsXwsYb
         VPmcsBA5yJW6z8AIhM+iDWzMBRCdQQYnzsayiCh6jzEaFlD6gq5C6eho6VjgSB6+Oy05
         8EjqvqKP8dtt0uUJsWXo4PO5DxE5xx7zaY7w3cV3fTzxv7S/1zwfzkc/Xyhd+0HvVBcv
         zZNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784620285; x=1785225085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vZzSeZR0bkDEH8l+WELeqcCX8Q33dRM0eRRSsd4cPwc=;
        b=XJgT3XcHpeRCffhoJQz79EfHn0pepLyBL/FwqWo/zQWlXMBpU3fZp4Sk2gKx1aRubn
         2Msr5LNQD0FBXxwB6TvZLn92ntSqqhXfRXj4Ym77H4Z1r/ZtxPSqs+lHxuqBh1IAlZ1H
         pLudwOcl1acRGEMqhpIn4f5S317bbFXyPCU9sPGf2eqOvIkZw5lmsvgHKVezLDhS6iA3
         P0NxevzqvDpmqSibiSI4n9ZzOogfUq2iT2MMxd4Pt5hHnW1tLVp0Y4VrKWiUwUsBNEbW
         4e+h4oT6VBStKaI4fHNPa/k42uQRbL1t1S701UBaVV4BxMrq/lrxBrPJ8zhU8wfOTLKd
         YXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620285; x=1785225085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZzSeZR0bkDEH8l+WELeqcCX8Q33dRM0eRRSsd4cPwc=;
        b=C+j7WqB/W8i/f4iPOP2AUh4LLlfzY+iNYJCN8BGlkjsG/VMAJjFJdKJbvD36sisIgY
         QEdgJ4c3CeQ+Y/7Qx7fGCYukOzBUWox9hlxJHpPkyxvW+ixy9+Pbpa/H1L+ULAiTZ80w
         /+7apzCQX068UUyXedFwNuqJT3naX42X7Jx4hYuHFpBD1uY9cf0iS74Ycu7wN+dUH2Ax
         2f/ONovozdBul5GMNCR84YSbhQmRp5VALapQY15SsPGFG6DFtHJV37nQqPwBuJH1Dwc6
         hgAl4TwUdTGAFqvi4Z9fY/RP5O1PdDAs8JNLMwFBp3BwaJ1J4xNzNiOYQ0i5xp9KODAa
         5vCA==
X-Forwarded-Encrypted: i=1; AHgh+RopP1AZskehGb5TbmKEAnHOr3SrNFjQIT19px5TscTBfa3ERKtD1bHKd42nxuG9LpSukqp/BHZcGGZlFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ilRLLurFfSrbDdQ5j1SR5ccONU5nnerc2ecZW2VulYza29hD
	eoMntlj874/25qfH/66UT/yqm+MiTT0hxLXpDhVdETrGGU2hSv3ln8kXt5Ga/oARSitELHz6fbV
	inr0Z1QW4eZZJgEe0SVmjRGBY3ALzTtg=
X-Gm-Gg: AR+sD10n8aYvFYvL5zITk/YAHMko1hnWnlN9jprt8qVI/rkSzEAKDvFHwJOL7aMSF1r
	3qhKuIwlYPL5Im9MtpgYD1YLFrHaoW97sKfFLCA0TiJXdjjhudfzbXWXS9scVxNKgeV6Mi+LFNe
	cEtERozGBCHNuDmsG6N2xSzRyICJfI0tmm2fPE0hhbfpYBRdGdYm+jEgVBUe7hCSdf4eobPfUV+
	1gnNE0UEs7eQcRmnWZHfUP+cSZFlucyCM2YVNtZt3VTbrdIKUH3i6sY2wChJlnikx2vdqn8H8Dq
	OuxhT85oZb0r3bJsZZ51
X-Received: by 2002:a53:b186:0:b0:668:7dbd:7a07 with SMTP id
 956f58d0204a3-66880b4d962mr392625d50.5.1784620285255; Tue, 21 Jul 2026
 00:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721064115.64809-1-royalnet026@gmail.com> <20260721064115.64809-3-royalnet026@gmail.com>
 <20260721070036.51C371F000E9@smtp.kernel.org>
In-Reply-To: <20260721070036.51C371F000E9@smtp.kernel.org>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Tue, 21 Jul 2026 09:51:14 +0200
X-Gm-Features: AUfX_myuY5cs_jihA3WZbNrynJGYGTTN4HuyfxbJXYsOu2kmiTef-qbsCaf3Zt8
Message-ID: <CAEWPSH7FZw7XDhHD6x+mWcQR2VnLs5yF5LUGMisQoCsv43-z8w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] media: synopsys: hdmirx: add HDMI audio capture support
To: sashiko-reviews@lists.linux.dev, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Does this byte reversal using swab32() incorrectly scramble the N and
> CTS values?

No. This is the third review of this finding -- it was raised on v2
and v3 in the be32_to_cpu() spelling and answered both times, and the
comment above the code documents the layout. The premise doesn't
match the ACR subpacket format: CTS is not stored LSB-first from PB1.
Per the HDMI spec, subpacket byte 0 is reserved, CTS[19:16] sits in
PB1[3:0], CTS[15:8] in PB2 and CTS[7:0] in PB3 -- MSB first -- with N
likewise in PB4..PB6. The packet decoder stores PB0 in register bits
[7:0], so reversing the word is precisely what lines the bytes up
before the 20-bit masks. swab32() and the previous
be32_to_cpu()/cpu_to_be32 spelling produce the same value on both
endiannesses; the v4 change only makes the reversal unconditional.

It also remains the path validated on hardware, as noted in the
cover letter: a 44.1 kHz source is detected as 44.1 kHz rather than
falling back to the 48 kHz default, and 44.1/48 kHz switches are
followed. Neither would work if the extraction produced garbage.

> is there a use-after-free risk during device unbind in this driver?
> [video_device embedded in devm-allocated struct, release set to
> video_device_release_empty]

This one looks structurally plausible, but as the report itself
notes it predates this series: it concerns the video_device lifetime
on the V4L2 side and is independent of the audio support added here
(the audio teardown path was exercised on unbind with an active
stream during v3 review, see the v3 thread). Addressing it would be
a separate fix for the existing driver -- happy to leave that call
to Dmitry.

Igor

On Tue, Jul 21, 2026 at 9:00=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The use of `swab32()` when extracting the 20-bit ACR N and CTS v=
alues incorrectly scrambles their bits. Because the packet bytes are stored=
 contiguously from the LSB up (PB0 in [7:0], PB1 in [15:8], etc.), reversin=
g the 32-bit word using `swab32()` places the LSB of CTS (PB1) into the MSB=
 of the extracted value, and the MSB of CTS (PB3) into the LSB. Masking thi=
s result produces a completely invalid sample rate.
>
> Pre-existing issues:
> - [High] The V4L2 `video_device` is embedded in `struct snps_hdmirx_dev`,=
 which is allocated using `devm_kzalloc`. The driver sets `vdev.release =3D=
 video_device_release_empty`. If a user space process keeps the `/dev/video=
X` file descriptor open during device unbind, the `devm` subsystem will fre=
e the `snps_hdmirx_dev` memory. When the process later closes the file desc=
riptor, the V4L2 core will access the freed `video_device` to decrement its=
 refcount and call the release callback, causing a use-after-free vulnerabi=
lity.
> --
>
> --- Patch [2]: [PATCH v4 2/4] media: synopsys: hdmirx: add HDMI audio cap=
ture support ---
> commit 19c9c4db1394f1dc0fc1cb44d51317198a87b078
> Author: Igor Paunovic <royalnet026@gmail.com>
> Date:   Tue Jul 21 06:41:13 2026 +0000
>
>     media: synopsys: hdmirx: add HDMI audio capture support
>
> This patch adds HDMI audio capture support to the Synopsys DesignWare HDM=
I RX
> controller. It extracts the embedded audio stream and exposes it as an AL=
SA
> capture device via the generic hdmi-codec. It also introduces a periodic
> worker to keep the local audio reference clock locked to the source.
>
> > diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/dri=
vers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > index 25f8ca0d6d946..1b4a7fda9e195 100644
> > --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>
> [ ... ]
>
> > +static u32 hdmirx_audio_fs(struct snps_hdmirx_dev *hdmirx_dev)
> > +{
> > +     u64 tmds_clk, fs_audio =3D 0;
> > +     u32 acr_cts, acr_n, tmdsqpclk_freq;
> > +     u32 acr_pb3_0, acr_pb7_4;
> > +
> > +     tmdsqpclk_freq =3D hdmirx_readl(hdmirx_dev, CMU_TMDSQPCLK_FREQ);
> > +     hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PH2_1);
> > +     acr_pb3_0 =3D hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB3_0);
> > +     acr_pb7_4 =3D hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB7_4);
> > +     /*
> > +      * The packet decoder stores the ACR subpacket bytes with packet =
byte
> > +      * 0 in register bits [7:0], so byte-reverse each word to line th=
e
> > +      * bytes up: CTS is packet bytes 1-3 (PKTDEC_ACR_PB3_0) and N is
> > +      * packet bytes 4-6 (PKTDEC_ACR_PB7_4), 20 bits each. readl()
> > +      * already abstracts the bus endianness, so the reversal is
> > +      * unconditional.
> > +      */
> > +     acr_cts =3D swab32(acr_pb3_0) & 0xfffff;
> > +     acr_n =3D (swab32(acr_pb7_4) & 0x0fffff00) >> 8;
>
> [Severity: High]
> Does this byte reversal using swab32() incorrectly scramble the N and CTS
> values?
>
> Because the packet bytes are stored contiguously from the LSB up (with pa=
cket
> byte 0 in [7:0], packet byte 1 in [15:8], etc.), reversing the 32-bit wor=
d
> using swab32() places the LSB of CTS (from PB1) into the MSB of the extra=
cted
> value, and the MSB of CTS (from PB3) into the LSB.
>
> Will this result in an invalid sample rate being calculated, causing the
> driver's fallback logic to silently ignore the broken rate and use 48kHz?=
 This
> could cause any audio stream not natively at 48kHz to be played back at t=
he
> wrong rate.
>
> > +     tmds_clk =3D tmdsqpclk_freq * 4 * 1000U;
> > +     if (acr_cts !=3D 0) {
> > +             fs_audio =3D div_u64((tmds_clk * acr_n), acr_cts);
>
> [ ... ]
>
> > @@ -2765,6 +3064,10 @@ static int hdmirx_probe(struct platform_device *=
pdev)
> >                                                      V4L2_DEBUGFS_IF_AV=
I, hdmirx_dev,
> >                                                      hdmirx_debugfs_if_=
read);
> >
> > +     ret =3D hdmirx_register_audio_device(hdmirx_dev);
> > +     if (ret)
> > +             dev_warn(dev, "failed to register HDMI audio codec: %d\n"=
, ret);
> > +
> >       return 0;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is there a use-after-free =
risk
> during device unbind in this driver?
>
> The V4L2 video_device is embedded in struct snps_hdmirx_dev, which is
> allocated using devm_kzalloc() earlier in hdmirx_probe(). However, the dr=
iver
> sets the release callback to video_device_release_empty in
> hdmirx_register_stream_vdev().
>
> If a user space process keeps the /dev/videoX file descriptor open during
> device unbind (such as during driver unbind or module removal), the devm
> subsystem will free the snps_hdmirx_dev memory. When the process later cl=
oses
> the file descriptor, will the V4L2 core access the freed video_device mem=
ory
> to decrement its refcount and call the release callback?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721064115.64=
809-1-royalnet026@gmail.com?part=3D2
