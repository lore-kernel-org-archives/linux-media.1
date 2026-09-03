Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216B46DFF6
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436038; cv=pass; b=Uv0O9/VZfnfonuaCX8F7uWm/4BSW63n2tp0jKWqpU4LZJB1JGsM3fqXcS7SEj3csVtp6GnPGRdpUAHAvwHhKEHkLY54uqDZXKPemLcFmk95hvoTPhfxHuFra1ynOgP0XUoHFBOGvh/EhSlL6GOYFc6+PZjnbqfN2NXSvsl1BSG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436038; c=relaxed/simple;
	bh=5yzaVabpPxw5RXtOFZG6OegQNvc0fKUaFe2aJ4JqkjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSu3YEE0ZysmbBtOvVWRnanwzQd6zAGMLOH1hVwePL8LYPynRjZuZz05DVIdg0tGPUAlyDoXah1dPhsehmxQI799djtg2U/IDg8CRZ2gyByoKnvOSbNBsSsx9U0K+GanS//IyhXgXwAgJrvhNDkmRUvhp5UcD2PTQcFscyTSJ3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kYjHylo+; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kYjHylo+"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-46b037da544so1111654fac.3
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 04:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788436026; cv=none;
        d=google.com; s=arc-20260327;
        b=JxowQRXRZ5zr4UKz9xicLjlJHnCeR/93+jPC/t65taiMzqdWKwDuNxS/D5kcg8MfgC
         kKZoqM8Q0fFmq9JBC19BiymZTbeyhR/9QnGo1Uc6WWQQgkAFh/2ybKU5D/MCHVrUnyg3
         eVXQe5cwJm+ICVe0XpkbwTGh63ilMvF7G7cE2SCvpAHjZjjmPt4aFiI6ymMMeIl/6XZb
         mSbn+uEbtQwCRKA9VfQDUq0yw26TMDgi4KAkgdAtuyLzzjlXAyZu1AuTs1clHDk+9CLt
         3eQlAFYj1gGBQrPGjEk3LDgFiKVhjuzcxTRoS/hsSRhx8GOMvKp3KSGwsDoa+7TUD3UR
         af3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RBEbqnMOR/S2Zl8aGgmKKnttxc/jbqek/oBPL6ncjNM=;
        fh=cfz9VG4Nb6dy3e4auA0HJwW8zSDXPHj385/95ZwLyxI=;
        b=i520kEJw6CmDTE/Pk3qKO8BaL/DUgmgvCW4MW3IPnGv7nDFgzydfcdnmjCzibl0xDp
         vYw18XgUwX08WbdwIgYzqozZbzMGYukssFy8Qt53Sq8IEULI5MNs/eEA5bcmF6LK9E+w
         w+U8Qo3r0TAEnYPG0SM0T9pFkqEuGrfgfzInIcJwfVHemWf0v+sWy0v85BWGh8K9jy0V
         wAAtCF8fj58rrQ1eHV6vTIJp7uipgQBRAw1D1Xs5f8YceDOQFD5Wg/DL9YVybK85amu4
         UAS+E+fySlakOx6f6uZQ6ZvTk8VMUYVZUxG25Ejr8qDjGSHuyz1qA0MauZWLh3gU2B3B
         QnDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1788436026; x=1789040826; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBEbqnMOR/S2Zl8aGgmKKnttxc/jbqek/oBPL6ncjNM=;
        b=kYjHylo+ex1HszaofgBXyyVB+T/8rEM4tHaEz/5GJrNwxO4j8q2D8TFA7vW8CGpIUJ
         Ii6Hy9VdLdzYSTu6DjEnIX4aahzvbg0H5Qk+JpV4R5fWTMU6MNA0g5ucQtOEkKI9g3p/
         RDn0m90CE71BtPbDGNcDJsVn31nQj0Ur+7MP44N/Y4bUml7PwAAAWjJpxfCtMR3tA+K5
         H7bjiq2A/5SXAp3iXALUp+Xkm5JgHvipLtm0yyhW+G1ujOA9RbBShIlKRpfCKyk0NH62
         jqDU0HMsL20zZFinL/VyjDYFgiZ12NxDaHUpUbGiRz/b7WYqKPvTd7rZ84hGT7j7ySVi
         DPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436026; x=1789040826;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RBEbqnMOR/S2Zl8aGgmKKnttxc/jbqek/oBPL6ncjNM=;
        b=eGPqD18BkWViRjZfzLDFW1RhwmDOKqT4G4gwsd0KT1AFN80/DmG4+MWRo+VvmJXv2t
         95+mLb5Txu4Ci1miQcGPeDHWcYgkFXFoUvoS8oyJNVjQ/JKBccSBoYJxlg4si6NAwJsX
         vSfaCBL1JqS6kwazGxWs28X9AUoqK9z+0OwRtAdiUJc1Trm3JiRvbqKXusQ+JN/J3Cjc
         LpnUTlG+JV0H0k21qNM8l8j0+NEOsEEFuJsIjL0FkmrCIA8WvMF7vEfDKhwpXDd5TD8X
         Q3k67SnchKh8MHJlWj1QqPIxaqplaBXb1WI9OyrZ+3YiDhW79objZFNoW0n6dVUqXsur
         nYmw==
X-Forwarded-Encrypted: i=1; AKwUvBz3DA5qEdqb1Jvl4yocKq/Nt3wsPwbsgZjqWFEXlIpD/tfAOwOBNG/UdD207ATg1VGxWpAmp+Ej0WThGg==@vger.kernel.org
X-Gm-Message-State: AFuF++nXZuPo43ysp4dLAnd3p6VJ/jN+3H0GUoCBigO7inA4SnyRJnNS
	S2vykaKAGr9YbGiCLbXJBGHGEgY5EfzoM17SPYCUNQgrCbCyaxP/coXLm7CQ+sMZbzK/XZOTjeb
	uBhvo7Is7qTV2dkx95lCqJ+XlJI3E98KH1TTZ6PRqc3UEmCAa8oxbS/A=
X-Gm-Gg: AYBFou2spdIYbzeUwVOpM+J4LGTOJ22q4Y4Jfx4+8VSa7MQcJeXfqrogJwDMM7gsTIz
	sx6OBlwRGpSfIy1fwKN76i/DT0f3dRRR709BpZankWOTuEDeZ8dOyH7ayo2uTzg/riSkJQZKBdn
	didzy+VsO5FgvzVBRbkUIwBR13VouNDN/wyM/xhRoDno4/dgPWKee+pfbOexsHQEWLTJNgIiuY0
	94QeMiNXs0obmqhL0Vxe6WH1b5ocWJ8v+yj6AEQmSJknQpVNej0MGEpbKVljQXL9eaTYhz21kqi
	bqD6Q8AIdLPhuEOVtszr/LSseT61Jolo8NdKQYFhZ2f8NRnYETcOGgK7tSqE4Q4dYPEOjvkAWHF
	ZvAHE+9BE0H1aJsDvNqbb69zQBE4Zu9ByUTWVYMTU56HATvGoI4VMr9mUZBeJPg==
X-Received: by 2002:a05:6871:c921:b0:442:175:cea7 with SMTP id
 586e51a60fabf-46f85e01f72mr10128824fac.1.1788436026484; Thu, 03 Sep 2026
 04:47:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com>
 <20260805-media-starvis2-v1-3-91e8e4eae44f@raspberrypi.com> <178840924662.11722.12680340547715469059@freya>
In-Reply-To: <178840924662.11722.12680340547715469059@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 3 Sep 2026 12:46:48 +0100
X-Gm-Features: AcwNN1V_rdED1LTqBqth4XivSuKPAiq1rGIGwj4L0ffVbXE0kyqHxqrMRNIHSmk
Message-ID: <CAPY8ntCQQhPiGoJFOADY-0q7QtKbi3XiCYHz1A6qogwhUdnL6A@mail.gmail.com>
Subject: Re: [PATCH RFC 3/4] media: i2c: imx678: Add imx662 support to the driver
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jai

On Thu, 3 Sept 2026 at 05:20, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Quoting Dave Stevenson (2026-08-05 21:39:18)
> > IMX662 is a 1080p Starvis 2 sensor that follows the same programming
> > pattern as IMX678, so add it to the newly parameterised driver.
> >
> > FIXME: Update the common registers based on the Sony spreadsheet.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx678.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> > index 40ba6661b366..9083f2744510 100644
> > --- a/drivers/media/i2c/imx678.c
> > +++ b/drivers/media/i2c/imx678.c
> > @@ -673,6 +673,47 @@ const struct imx678_variant imx678_variant_def = {
> >         .hmax_min = imx678_min_hmax_4lane,
> >  };
> >
> > +static const struct cci_reg_sequence imx662_common_regs[] = {
> > +       { IMX678_REG_WDMODE, 0x00 },
> > +       { IMX678_REG_MDBIT, 0x01 },
> > +       { IMX678_REG_XXS_DRV, 0x00 },
> > +};
> > +
> > +static const u16 imx662_min_hmax_4lane[] = {
> > +       [IMX678_LINK_FREQ_297MHZ] = 990,
> > +       [IMX678_LINK_FREQ_360MHZ] = 990,
> > +       [IMX678_LINK_FREQ_445MHZ] = 990,
> > +       [IMX678_LINK_FREQ_594MHZ] = 990,
> > +       [IMX678_LINK_FREQ_720MHZ] = 990,
> > +       [IMX678_LINK_FREQ_891MHZ] = 990,
> > +       [IMX678_LINK_FREQ_1039MHZ] = 990,
> > +       [IMX678_LINK_FREQ_1188MHZ] = 990,
> > +};
> > +
> > +const struct imx678_variant imx662_variant_def = {
> > +       .name = "imx662",
> > +       .id_reg = IMX678_REG_MODULE_ID,
> > +       .id_value = 0x296,
> > +       .native_area = {
> > +               .top = 0,
> > +               .left = 0,
> > +               .width = 1937,
> > +               .height = 1101,
> > +       },
> > +       .active_area = {
> > +               .top = 0,
> > +               .left = 0,
> > +               .width = 1936,
> > +               .height = 1096,
> > +       },
> > +       .pixel_rate = 222750000,
> > +       .pix_per_clk = 3,
> > +       .common_regs = imx662_common_regs,
> > +       .num_common_regs = ARRAY_SIZE(imx662_common_regs),
> > +       .vmax_default = 1096 + 40,
>
> From the IMX662 SRM I see the following constraints for minimum:
>
>     VTTL >= PIX_VWIDTH + 70
>     VTTL >= 820
>
> And the table giving round FPS numbers like 30/60/90 assumes VMAX = 1250.

I find it weird that Sony's datasheets fix the number of vertical
lines and extend horizontal blanking for frame rate control. That'll
give you the worst case for the rolling shutter effect, so why would
you want to do that?

> Did you manually verify that setting blanking to 40 also works?

Yes, I've verified that vblank of 40 works.
This is why I queried the values in the IMX908 driver that Lachlan
sent, as the datasheets always seem overly conservative. There may be
further restrictions if you enable the various HDR modes, but we're
not there yet.

  Dave

> Thanks,
>     Jai
> > +       .hmax_min = imx662_min_hmax_4lane,
> > +};
> > +
> >  struct imx678_model_info {
> >         enum imx678_type type;
> >         const u32 *codes;
> > @@ -703,6 +744,26 @@ static const struct imx678_model_info imx678_autodetect_info = {
> >         .auto_detect_mono = &imx678_aamr_info,
> >  };
> >
> > +static const struct imx678_model_info imx662_aaqr_info = {
> > +       .type = IMX678_COLOR,
> > +       .codes = codes_bayer,
> > +       .num_codes = ARRAY_SIZE(codes_bayer),
> > +       .variant = &imx662_variant_def,
> > +};
> > +
> > +static const struct imx678_model_info imx662_aamr_info = {
> > +       .type = IMX678_MONOCHROME,
> > +       .codes = codes_monochrome,
> > +       .num_codes = ARRAY_SIZE(codes_monochrome),
> > +       .variant = &imx662_variant_def,
> > +};
> > +
> > +static const struct imx678_model_info imx662_autodetect_info = {
> > +       .variant = &imx662_variant_def,
> > +       .auto_detect_colour = &imx662_aaqr_info,
> > +       .auto_detect_mono = &imx662_aamr_info,
> > +};
> > +
> >  static const char * const imx678_supply_name[] = {
> >         "avdd",  /* Analog (3.3V) supply */
> >         "dvdd",  /* Digital Core (1.1V) supply */
> > @@ -1470,8 +1531,11 @@ static const struct dev_pm_ops imx678_pm_ops = {
> >  static const struct of_device_id imx678_of_match[] = {
> >         { .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
> >         { .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
> > +       { .compatible = "sony,imx662-aamr", .data = &imx662_aamr_info },
> > +       { .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
> >         /* for non-conforming DTs that rely on runtime check */
> >         { .compatible = "sony,imx678", .data = &imx678_autodetect_info },
> > +       { .compatible = "sony,imx662", .data = &imx662_autodetect_info },
> >         { /* sentinel */ }
> >  };
> >
> >
> > --
> > 2.34.1
> >
