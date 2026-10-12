Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B354E36DF
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 20:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791836495; cv=pass; b=NhMa9MIYMeUMoVRw5w0swO4UxcCj87j4pHev3iqPGWdT41k/I8098k8i3dvxNTKwiTCaMDG3+/0oV70i3Huh/6RMt6UPMWFAsok+xLWOldXii/49arAUkbZwUXZ+f/zGIhhc86ad76ArlyMV1KbCRwZNNCrBErJetOxAWjv3/aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791836495; c=relaxed/simple;
	bh=RCQSpzr//uy/KVkDYVkHMEFT4GgArym2rxeSz4PmqKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzrJ44WUh5XZ44igfBygHBfgV+fTN4lN3A7qmTcjFsyk1t0MK0ahgcoHEOLgV5dkDNDbGCPkD/WJdvF4m5PgaugsxtaUpQJsSL8pBI3lS1TxAuEp7IIQpLcVE2EIDGTXaWtiZSBw0zy2lP+PkwTAM27ys7LJhtFJPAlsvzGQ4nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUUg6g+M; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUUg6g+M"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c14a06c95so1715204f8f.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791836492; cv=none;
        d=google.com; s=arc-20260327;
        b=oM+N55bmLTbYtKMDtDb9D2zLtJbYUgYylO7UbYYlzhQqhZCbDmDnUBIYuihj0TNUNh
         Zo61S9CYGWhSwLKyWCmsg6GHp0Oq/DXDbXOjrTIhZp1HNaisOU4XE6kEIsYy+UlAOj15
         OSinSUo4XVStdAdza6A+5zvI6dwiSFSnO/0fV7GLJKAl3RlKgpm9Tp6hffAiG03yaMAp
         X7FK11AajH3KHF0TX3neG8tEe/8SE9slQQBA7KidmNV9CTSr5l47OmEQ8HmgKPtiMLbm
         DjKqX7neM8G9DCe/+ZPG7LwBkjCkosFmRIUb/XyDzXaSKHFmo6ZfKtjGt8jlMtiEUNyz
         PfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oFdrxz7IDO5EI0kw4vrk/ogosg+7aqS767pWdjMdgj0=;
        fh=rrmVL4PkpNfJSpmRti1cxN59fjpMlohbOnXD996aPlc=;
        b=mwSZaYFgeyOXcRxMs7PvDXthCp3zijmhSJvdFDLBnj9jQ4OtHOXnuHHSFRZgU0zufL
         gZzRLkoNVQfnmCwjBllgcMGjN/1cc7bKV27LmivhALe4NB29GZhQYmZKabf5luW2AJvG
         5orTnSzd5SuOwkXiFoy2NqMhWNc2l2+0r1eC0QE3zGWCe+Vb3jicXpWA4qNlCNlRpNuI
         DYBvAjjK93yXxUhpBBNWnKV7jAP3gahlhGlgdlxfaWuJ3eC+RfIGjTZ9uzSvi6+FyqY6
         LdEFyhnjpkJqr1epC3Uvet1XfLhu8dgoYtCvwI5xvbzLau2LjAZx1YFicbZQaB4bggC0
         Ikfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791836492; x=1792441292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oFdrxz7IDO5EI0kw4vrk/ogosg+7aqS767pWdjMdgj0=;
        b=QUUg6g+MkTonjvrizNKgr6vgNwhUgts7WR9s1McXCqmcVgwdgc6sjgzWQIW0wmWIcH
         SeThEWH4U+sirFCrJWP0UW407koSK2smZQxfHI2oNu/His2Zsat1g37mHrOUnZpw8tYm
         bGgXU3xvw3j9S6R68kKuQUTDWV/FNbHkSTeJh+uFFGo/avE1530tr2uAD75VQzlWd/5M
         elyOVqdQJfS2vdDiMuu4sLr+fbS3aPFtnB6V6jCtDT1raNKjcCAor79R4qg4D+Lg2X/1
         J2FHCv1qmsvrVGEtNdXudXOmnaZajyfscWSCSUYdwais/rB+3ftwYP+FtgQuAvwJq4sD
         6XLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791836492; x=1792441292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFdrxz7IDO5EI0kw4vrk/ogosg+7aqS767pWdjMdgj0=;
        b=Izp2JLq1QcoJydKfXkSH2iK0uFtWCOh1x7ju/yEH04RieRJA60ShkDCnfQB8sdkRsd
         qRgCr3tzqzdQXRBkvkAZx73aTbgCVl/MilZ3xO/gFBHTcszwOxbV/8MrygYLG9koxnWv
         HhiFy41HFLNq0nuQ3mXZXNq3nVo6WuK1s68g+FpyMrABNiCiY1HrvbgSUoK9d7yYG3ZU
         3O/zJOLne9DcQCjsu027XVHQO9WH7AZYDZyr4T2l7Ijjns5ZJB5AYTidPOToRYssSzXN
         YnM9pZ8EWNc1mzDjlv3GXhAM/0G+XXW0uUnyAggWa5KTSzngOZd2Y2VyzPBa23dOj/dR
         GrLw==
X-Forwarded-Encrypted: i=1; AKwUvBxRfdz3/LlyTIUVURGCPjyjX9h/wt8QKEOXqJOWa+A8JIVkEh75LV7L34ZNgHPW3ivNyfAMPMdJhL0QVg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZO+EpzxLJ29UpRQPrODo0RUHedYUgk2lpVoFgmMKlkOCTmq2H
	rT9hO8zzg+REPdstYsYKcSKxwwiCvEPJUnxAlmhtwIiag6tjLQ2Otwdzbd7OOCaBwAreuG+tvvl
	ane2vcuEaM9D2GO9Qchp2cZmLQIu3uPY=
X-Gm-Gg: AYBFou3dzMI7zEZlmxY5zZQrJlOShnbJNKBb/sEj3ws1H3wqnn1JWuljWrGqxvvdsao
	0cNBOQYWpLxmrYrrb3HGC/XdoLwSQD1qhnxcd2H2q2fwMGLur96JDmPhBfp6HolA6MeKfTpfz1N
	y1ReVYuSQIpza7HsngRUz1XlsegIVOY26tCmq2p8m8s06wORcSIuGMNhVQBSbrvISpeAq/DloDT
	G53jXIxWzKtgDN9LQjVfs4/jUOH19xDUqygNfVEYL95hK9nXHAat853+4Z/I0n1W0+23KsYb8ic
	dDRi5dbOTwkUyAu3HLheOj/4m54+KEy28KsiT/taVYjzKpxA/wElcbnNNWQyuem49z1bbesL6XD
	akrDpAUES8ijXYu7702tJtjsY5dSS3laefGHa/q7tKPs=
X-Received: by 2002:a05:6000:3108:b0:486:f856:1975 with SMTP id
 ffacd0b85a97d-48dbaae5c02mr18183316f8f.22.1791836491382; Mon, 12 Oct 2026
 13:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org> <asz8oEtow_lrUU7K@zed>
In-Reply-To: <asz8oEtow_lrUU7K@zed>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 Oct 2026 21:21:05 +0100
X-Gm-Features: AclHuK-4f6aEgz84S7166QRmPA4srEwYSx_VGps7yC24cU0L6Xa5D_BUxV8o_-4
Message-ID: <CA+V-a8tnYhY4cWjy+ddsptAwmRU0KmpuF_EJtxO2h6LmTgym5A@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

Thank you for looking into this.

On Mon, Oct 12, 2026 at 4:47=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Linus
>
> On Mon, Oct 12, 2026 at 01:56:26PM +0200, Linus Walleij wrote:
> > From: Daniel Scally <dan.scally@ideasonboard.com>
> >
> > Add the Input Video Control Block and Arm Mali-C55 ISP to the device
> > tree file for the RZ/V2H(P) SoC.
> >
> > [Rebase onto v7.3-rc1, place the nodes in address order, add the missin=
g
> >  interrupts in binding order and name them. - Linus Walleij]
> >
> > Assisted-by: LLM
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
>
> How was this patch tested ?
>
> I am rebasing my rz/v2h tree on v7.2 and I've backported this patch.
>
> Unfortunately I don't get any frame from the camera, but rather the
> system hangs in unrecoverable state
>
> > ---
> >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 47 ++++++++++++++++++++++=
++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a09g057.dtsi
> > index 639693d464a7..228155fa3c76 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -1839,6 +1839,53 @@ queue3 {
> >                       };
> >               };
> >
> > +             ivc: isp-input@16040000 {
> > +                     compatible =3D "renesas,r9a09g057-ivc";
> > +                     reg =3D <0 0x16040000 0 0x10000>;
> > +                     clocks =3D <&cpg CPG_MOD 0xe3>, <&cpg CPG_MOD 0xe=
4>,
> > +                              <&cpg CPG_MOD 0xe5>;
>
> Compared to Dan's original patch I was carrying my tree the first and
> third ids of clock and reset properties in the ivc and isp nodes respecti=
velty
> are swapped
>
> This patch
>
> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -1709,8 +1709,8 @@ ivc_out: endpoint {
>                 isp: isp@16080000 {
>                         compatible =3D "arm,mali-c55";
>                         reg =3D <0 0x16080000 0 0x80000>;
> -                       clocks =3D <&cpg CPG_MOD 0xe5>, <&cpg CPG_MOD 0xe=
4>,
> -                                <&cpg CPG_MOD 0xe2>;
> +                       clocks =3D <&cpg CPG_MOD 0xe2>, <&cpg CPG_MOD 0xe=
4>,
> +                                <&cpg CPG_MOD 0xe5>;
>                         clock-names =3D "vclk", "aclk", "hclk";
>                         interrupts =3D <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 865 IRQ_TYPE_EDGE_RISING>,
> @@ -1719,7 +1719,7 @@ isp: isp@16080000 {
>                                           "fr_dma_writer_linetick_out",
>                                           "fr_uv_dma_writer_linetick_out"=
;
>                         power-domains =3D <&cpg>;
> -                       resets =3D <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2>;
> +                       resets =3D <&cpg 0xd2>, <&cpg 0xd1>, <&cpg 0xd3>;
>                         reset-names =3D "vresetn", "aresetn", "hresetn";
>                         status =3D "disabled";
>
> Fixes the issue for me
>
It also fixes the issues on my side; I tested it with the RZ/V2H EVK
using the imx708 sensor,

root@192:~# cam -c2 -C10
[0:10:13.102940291] [1010]  INFO Camera camera_manager.cpp:330
libcamera v0.0.0+5679-0b4b0ef3
[0:10:13.136058708] [1013]  INFO Camera camera_manager.cpp:220 Adding
camera 'mali-c55 tpg' for pipeline handler mali-c55
[0:10:13.143446208] [1013]  WARN CameraSensor
camera_sensor_legacy.cpp:354 'imx708': Recommended V4L2 control
0x009a0922 not supported
[0:10:13.143574833] [1013]  WARN CameraSensor
camera_sensor_legacy.cpp:426 'imx708': The sensor kernel driver needs
to be fixed
[0:10:13.143612416] [1013]  WARN CameraSensor
camera_sensor_legacy.cpp:428 'imx708': See
Documentation/sensor_driver_requirements.rst in the libcamera sources
for more information
[0:10:13.147022541] [1013]  WARN CameraSensor
camera_sensor_legacy.cpp:594 'imx708': Failed to retrieve the camera
location
[0:10:13.147073666] [1013]  WARN CameraSensor
camera_sensor_legacy.cpp:616 'imx708': Rotation control not available,
default to 0 degrees
[0:10:13.254700791] [1013]  INFO Camera camera_manager.cpp:220 Adding
camera 'imx708' for pipeline handler mali-c55
Using camera imx708 as cam0
[0:10:13.258077083] [1010]  INFO Camera camera.cpp:1214 configuring
streams: (0) 1920x1080-RGB565/Unset
cam0: Capture 10 frames
613.444141 (0.00 fps) cam0-stream0 seq: 000000 bytesused: 4147200
613.459953 (63.24 fps) cam0-stream0 seq: 000001 bytesused: 4147200
613.478004 (55.40 fps) cam0-stream0 seq: 000002 bytesused: 4147200
613.496112 (55.22 fps) cam0-stream0 seq: 000003 bytesused: 4147200
613.514060 (55.72 fps) cam0-stream0 seq: 000004 bytesused: 4147200
613.532173 (55.21 fps) cam0-stream0 seq: 000005 bytesused: 4147200
613.550287 (55.21 fps) cam0-stream0 seq: 000006 bytesused: 4147200
613.568400 (55.21 fps) cam0-stream0 seq: 000007 bytesused: 4147200
613.586458 (55.38 fps) cam0-stream0 seq: 000008 bytesused: 4147200
613.604489 (55.46 fps) cam0-stream0 seq: 000009 bytesused: 4147200
root@192:~#

I was also able to test this with camshark using my older setup.

> Why is this an issue it's not 100% clear to me.
>
> The driver handles both reset and regulators with the bulk API which
> does not guarantee ordering (and no ordering is specified in the
> datasheet as far as I can tell). All clocks and resets names are used,
> so the ordering shouldn't make much difference as far as I can tell.
>
Indeed.

> I can't access the "additional documentation" from the Renesas website
> where the clock/reset ids are reported. Could you please check ?
>
I will also double check this.

Cheers,
Prabhakar
>
> > +                     clock-names =3D "reg", "axi", "isp";
> > +                     interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>=
,
> > +                                  <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>,
> > +                                  <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "isp_vvalid_ifp", "isp_vvalid=
_irp",
> > +                                       "isp_int_fstop";
> > +                     power-domains =3D <&cpg>;
> > +                     resets =3D <&cpg 0xd4>, <&cpg 0xd1>, <&cpg 0xd3>;
> > +                     reset-names =3D "reg", "axi", "isp";
> > +                     status =3D "disabled";
> > +
> > +                     port {
> > +                             ivc_out: endpoint {
> > +                                     remote-endpoint =3D <&isp_in>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             isp: isp@16080000 {
> > +                     compatible =3D "arm,mali-c55";
> > +                     reg =3D <0 0x16080000 0 0x80000>;
> > +                     clocks =3D <&cpg CPG_MOD 0xe5>, <&cpg CPG_MOD 0xe=
4>,
> > +                              <&cpg CPG_MOD 0xe2>;
> > +                     clock-names =3D "vclk", "aclk", "hclk";
> > +                     interrupts =3D <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 865 IRQ_TYPE_EDGE_RISING>,
> > +                                  <GIC_SPI 866 IRQ_TYPE_EDGE_RISING>;
> > +                     interrupt-names =3D "combined_interrupt",
> > +                                       "fr_dma_writer_linetick_out",
> > +                                       "fr_uv_dma_writer_linetick_out"=
;
> > +                     power-domains =3D <&cpg>;
> > +                     resets =3D <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2>;
> > +                     reset-names =3D "vresetn", "aresetn", "hresetn";
> > +                     status =3D "disabled";
> > +
> > +                     port {
> > +                             isp_in: endpoint {
> > +                                     remote-endpoint =3D <&ivc_out>;
> > +                             };
> > +                     };
> > +             };
> > +
> >               dsi: dsi@16430000 {
> >                       compatible =3D "renesas,r9a09g057-mipi-dsi";
> >                       reg =3D <0 0x16430000 0 0x20000>;
> >
> > --
> > 2.56.0
> >
>
