Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFF93F58F5
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 09:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512416; cv=pass; b=GpTwQQHtPFpPc+hspS+KGX0Zu3E92U4gKEez4yP88BmH39E4XHshKa8gCNFTYCPC3gTdF5pnScm/lhBLxXoKZVITIXPuxvUROmlRbonzSWxmv6S2+yQaKXGb08JcK4vXyPcF7wq9h0mDb7N67s7FLbdysByE0ZMX34D83PjGcjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512416; c=relaxed/simple;
	bh=CmvRkw0tcfjCM8LSq8XxS0x2PFuwr0H01M7Zp2qL7tY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5SBGbcOCfFyeOoao9e7nU8+wzrc+otwqJOoi4SVHdmJs5Sfohubu2x39G49qpvc1nQWLsc0olE64E/47xEw24HqiUlWk7RRrIhWAclyX79istpQt2qJUXnjdY/2ogKyqr5Z29jXJGLVTFmKDG0bjevf0h+NyjWNIHSVasf/JRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hh9Y0gU2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KbZ5kUIM; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hh9Y0gU2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KbZ5kUIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788512413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bW/1iYuMrSnS89b1ddhWDpNkS+WRr5i40Ku0yGmKoHY=;
	b=Hh9Y0gU2xLRXXKGUdhv6aVf3dtICmyzugEzibQbTeTheCq8V25aVmMh6XCwXEGE+7Gj6bK
	/hU2xOm2P9Cttr8NaMe6/fk6hnG/ZYjKKfByBvqHkfqVZM6c5DciWcskTbxJyjAba1qBsl
	vKYK7uv97yEVEiGyvjyVYAgdJaYZNjg=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-4v9L2m-tPCiPynfmqavQ1Q-1; Fri, 04 Sep 2026 05:00:11 -0400
X-MC-Unique: 4v9L2m-tPCiPynfmqavQ1Q-1
X-Mimecast-MFC-AGG-ID: 4v9L2m-tPCiPynfmqavQ1Q_1788512410
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4667f641a98so833594fac.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 02:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788512410; cv=none;
        d=google.com; s=arc-20260327;
        b=R1RqknMjvX92fBXs2QRMDFCcqGb2W85gheaeCrkVI0R8CKM6mKIbiyNxaaqicCUnm5
         2SaNOL40UBa0TauNNrOX/lK9vvVGh+GC4gaf2A5/IWnKDc8h1UM4O3pwib6acJa2YTyv
         wNCG7XJU1FX/vGn5bmTMk3VGTkwcKVY6ZNUM/Jgx5Bhao6JxEM3BNMFvV2SN7Y3/UsU1
         F8fv+d3WUFZtR2d1g8LDPkzxSzs2E21VEcB7CvKY4KE5qJdbr475KQXqptp1P8zHX7cg
         sh0qVokVf3hN0aHZNishCTVhKfy6rCbf/CGjeyMLIAlTc49IZ5ZJFnI/S1Ull14/o6GH
         CB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bW/1iYuMrSnS89b1ddhWDpNkS+WRr5i40Ku0yGmKoHY=;
        fh=UQf7vV6xGf+8NgtUdUI/a2z5MH0gozeZPUHSQ95trtk=;
        b=aBnHGRk9GAg6//7446i5m26Z1GlDoqrsolCMO9Cxrt99fZN3BAc1jp9TJ7hV38/1sd
         np/bCaXGkw74APxwN0E+SUOcwCTn00ytUNXRXUWs5724LKUC6S9eL70MRddwOBYZEU+J
         aj6bcqGvR3F5/iZdc8bsv2gDiP31JSiza/oJGGPjTCREXzmOEKDEylSM8GuQEQ7fjEc1
         ncUzBJMHxlXJRH8ohJUjoKv+LljeJOalXatxA8kaNSzd7qXgEs2SkSeRtb6ynx1s1WYF
         nT9IzQGTzAQYKQaQOWQJxgwcWhpidlmSqt8Sm2VlZAR/jA0A5szLe/P1Jf8V8mEk33rC
         mZPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788512410; x=1789117210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bW/1iYuMrSnS89b1ddhWDpNkS+WRr5i40Ku0yGmKoHY=;
        b=KbZ5kUIMB8P1Jkfdsc2zUQSPglrxeTARdmKGVz25M/yhzEdcVIMvKeOoCvdW4qTMBf
         CSwtUHzZWqx6vnKtAiGxMhAcdQw+4HDRiLfU9c/7TpguNXd1w2ygQSMWwHKfpC4D0Xhh
         7EIByKOxOTxIBzZ3555y6jobIY37/KiXXm+UhoCPHeFYPDzf+y7nXSFSk1cqBS+NGN6t
         nafAiz5u1Ws4PLRpyWwIRr7Mkn8AFaohSP7jD3Tz/YYES2kz33wY7shvQbMne2j38aGA
         rQVjBowC+6cDKC2HIETRdaPCilJB8K4cqjcLWmRYVdjFVr0+oF0v/4uAasAjYeby5Lf2
         kDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512410; x=1789117210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bW/1iYuMrSnS89b1ddhWDpNkS+WRr5i40Ku0yGmKoHY=;
        b=MxXIjNMWtoXoXEfYJ157QeVgny1xj2SkDAkSSLqv6Qr9oqrgSnk5Hn7VxeUeWZVNaJ
         K2x1dE0gWrQXB4KW0ATVOOa0FclqpiyICXqs5Y3ba61V2BSI0ePZ2Yz7B67dUdQojht9
         UR/47AtK8E7k1P9xQfDV/fTzEpH2aWw2kkSDIyFZcJq1JyUDrEL94jj4qOz+YEQXGx0O
         HR3iGRbyLe8DRTImPPZUxYJjOHs+XWlmt5WH8dh88M7WUooA4zU0ZQWOBwtSkgcvdBC5
         yWqx3j5Ngd1sdSgmrebmnDEWhArQHOvD/pXoRkYXZuX8kWtGKBW1y3by4PhYRe24HNB6
         r+Ng==
X-Gm-Message-State: AFuF++l/mrpA/PdPneBqv59W/a7OUJ6XWjGrnkva/uk94wO2d6frLIOL
	I2hW/4A/AU9b/6svgLTw1di9N0g3gfIiIwD/F6q3RORnX+6nBNazWQ3dP4DhI9gGF/oupLaF4Q8
	Z0Tzmoo7YPd0qcw19ZgivwisMbJ7dTqv/hClcxFMZ4xLQTiWV+o9g0dpHZEDer9gHMbW3m4Bl92
	6XOu+7TNVYhTKmMo8uZLW9d2TujANO0hMdXJZPF4E=
X-Gm-Gg: AYBFou02ExD3gOtWzW92EbokxNW65rBkIiWhg+ES5MDEqGen1YYJpr0BVeWi7F7bywV
	VmgijGw3En7EFF+AQWQ7JGNXzWSBQfyYboOHoeeCz23Fi24xR4wedo5V8AR/G+hITxz4GTGt/Bk
	4uMER6hfySNAyUOWYEmxrvDk6RgfCD5DkEaJ/FOnovCyfv0/lo6/bt7FuI
X-Received: by 2002:a05:6870:2184:b0:45e:25a9:5455 with SMTP id 586e51a60fabf-4755136f9b1mr4772110fac.2.1788512410056;
        Fri, 04 Sep 2026 02:00:10 -0700 (PDT)
X-Received: by 2002:a05:6870:2184:b0:45e:25a9:5455 with SMTP id
 586e51a60fabf-4755136f9b1mr4772063fac.2.1788512409513; Fri, 04 Sep 2026
 02:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ede568ada4304d2dc92cd43986fc07aa68628154.1788377269.git.christian@themurphys.eu>
In-Reply-To: <ede568ada4304d2dc92cd43986fc07aa68628154.1788377269.git.christian@themurphys.eu>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 4 Sep 2026 16:59:58 +0800
X-Gm-Features: AcwNN1WYQ90aHpgHAa3kyg4v5hrd4_0w2-C967zk3QLCYwvdk7dagXtPUGOfwXo
Message-ID: <CAEth8oF0__WNz9_gsSnrycP2SYcs_-G06r6TCPCFK2g1N=jbJA@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: imx471: Fix pixel rate and line length
To: Christian Murphy <christian@themurphys.eu>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, tarang.raval@siliconsignals.io, 
	jai.luthra@ideasonboard.com, linux-kernel@vger.kernel.org, 
	antti.laakso@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Thank you for working on this.

On Thu, Sep 3, 2026 at 3:36=E2=80=AFAM Christian Murphy <christian@themurph=
ys.eu> wrote:
>
> The pixel rate is derived from the CSI-2 link frequency, 200 MHz * 2 *
> 4 lanes / 10 bits =3D 160 MHz, and the line length is the binned array
> width, 2328. Neither describes the pixel array.
>
> The VT PLL gives 19.2 MHz / PREPLLCK_VT_DIV 2 * PLL_VT_MPY 121 /
> VTPXCK_DIV 6 =3D 193.6 MHz and the array reads two pixels per clock, so
> the pixel rate is 387.2 MHz. LINE_LENGTH_PCK is never written and its
> power-on default reads back 5120. Timing frames at several written
> line lengths confirms 387.2 MHz at every value.
>
> With the declared values the line duration comes out 14.55 us instead
> of 13.22 us and exposure is overstated by 10%: libcamera reports a
> maximum ExposureTime longer than the frame.
>
> Derive the pixel rate from the external clock and the VT PLL
> parameters the mode table writes, and set the line length to 5120,
> which changes HBLANK from 400 to 3192. No register write is added.
>
> Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor dr=
iver")
> Link: https://lore.kernel.org/linux-media/20260728042013.23707-1-hpa@redh=
at.com/
> Assisted-by: Claude-Code:claude-fable-5
> Signed-off-by: Christian Murphy <christian@themurphys.eu>
> ---
>
> Notes:
>     Changes since v1:
>     - Calculate the pixel rate from the external clock and the VT PLL
>       parameters (Sakari), naming the three the mode table writes so the
>       table and the calculation share them. The object code is unchanged.
>
>     v1: https://lore.kernel.org/linux-media/20260830173345.15886-1-christ=
ian@themurphys.eu/
>
>     LINE_LENGTH_PCK reads back 0x1400 (5120) from the streaming sensor.
>     Written to 5632, 6144, 5008 and 5120 in one stream, the line period i=
s
>     llp / 387.2 MHz at every value (14.5457, 15.8680, 12.9341, 13.2234 us=
).
>
>     Tested on a ThinkPad X1 Carbon Gen 14 (Debian linux 7.1.8-2, libcamer=
a
>     0.7.2): controls read back 387200000 / 3192, 17.296 ms frames, maximu=
m
>     ExposureTime 17.057 ms. v4l2-compliance 46/46; W=3D1 and sparse clean=
.
>     The driver is new in v7.3-rc1, so no Cc: stable.
>
>  drivers/media/i2c/imx471.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> index 4053aed84340..0559195bcdd2 100644
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
> @@ -65,9 +65,12 @@
>
>  /* PLL */
>  #define IMX471_REG_VTPXCK_DIV                  CCI_REG8(0x0301)
> +#define IMX471_VTPXCK_DIV                      6
>  #define IMX471_REG_VTSYCK_DIV                  CCI_REG8(0x0303)
>  #define IMX471_REG_PREPLLCK_VT_DIV             CCI_REG8(0x0305)
> +#define IMX471_PREPLLCK_VT_DIV                 2
>  #define IMX471_REG_PLL_VT_MPY                  CCI_REG16(0x0306)
> +#define IMX471_PLL_VT_MPY                      121
>  #define IMX471_REG_OPPXCK_DIV                  CCI_REG8(0x0309)
>  #define IMX471_REG_OPSYCK_DIV                  CCI_REG8(0x030b)
>  #define IMX471_REG_PLL_MULT_DRIV               CCI_REG8(0x0310)
> @@ -232,10 +235,10 @@ static const struct cci_reg_sequence mode_1928x1088=
_regs[] =3D {
>         { IMX471_REG_DIG_CROP_HEIGHT, 1088 },
>         { IMX471_REG_X_OUTPUT_SIZE, 1928 },
>         { IMX471_REG_Y_OUTPUT_SIZE, 1088 },
> -       { IMX471_REG_VTPXCK_DIV, 0x06 },
> +       { IMX471_REG_VTPXCK_DIV, IMX471_VTPXCK_DIV },
>         { IMX471_REG_VTSYCK_DIV, 0x02 },
> -       { IMX471_REG_PREPLLCK_VT_DIV, 0x02 },
> -       { IMX471_REG_PLL_VT_MPY, 0x0079 },
> +       { IMX471_REG_PREPLLCK_VT_DIV, IMX471_PREPLLCK_VT_DIV },
> +       { IMX471_REG_PLL_VT_MPY, IMX471_PLL_VT_MPY },
>         { IMX471_REG_OPSYCK_DIV, 0x01 },
>         { CCI_REG8(0x030d), 0x02 },
>         { CCI_REG8(0x030e), 0x00 },
> @@ -282,7 +285,7 @@ static const struct imx471_mode imx471_modes[] =3D {
>                 .height =3D 1088,
>                 .fll_def =3D 1308,
>                 .fll_min =3D 1308,
> -               .llp =3D 2328,
> +               .llp =3D 5120,
>                 .default_mode_regs =3D mode_1928x1088_regs,
>                 .default_mode_regs_length =3D ARRAY_SIZE(mode_1928x1088_r=
egs),
>         },
> @@ -691,8 +694,9 @@ static int imx471_init_controls(struct imx471 *sensor=
)
>                                            0,
>                                            link_freq_menu_items);
>
> -       /* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample *=
/
> -       pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
> +       /* The pixel array reads out two pixels per VT pixel clock */
> +       pixel_rate =3D IMX471_EXT_CLK / IMX471_PREPLLCK_VT_DIV *
> +                    IMX471_PLL_VT_MPY / IMX471_VTPXCK_DIV * 2;
>
>         v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
>                           V4L2_CID_PIXEL_RATE, pixel_rate,
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> --
> 2.53.0
>

I proposed a v2 patch of line pck setting and pixel rate estimation.
It can be found here
https://lore.kernel.org/linux-media/20260904075113.125751-1-hpa@redhat.com/=
T/#t

According to the datasheet, since this sensor runs in PLL dual mode so
the PLL configurations in the op domain are used to calculate the data
rate and pixel rate.
(If it runs in PLL single mode, vt domain settings are considered for
the data rate. If I understand the clock tree correctly)

My patchset includes naming the registers and pixel rate calculation.
Could you please look into it?

Thank you.


--=20
BR,
Kate

