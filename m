Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793300819;
	b=SefAr5GV/EqSO1c94ahOZTJ5ciXYWAW1krAp4njX/6voMMO4SRIHJjXMD/reXDorSOFy
	 tW8br8hTaOPD20M+AerEWDRkBu8DIImqIAePZmuZKoiJs0BYOdeMska3c6LpxAZIJ5foK
	 g4PzyZvo4BLVc1WVsjxAnxOoTxXov0VLjU77EeMv7JZYeieLDiBq18OFJCSLfnniPjHa0
	 NOiobGlWaQthSZaZ0lkeopAhtWbCCB32We8FzaGkinQtGpDOnUc1lD2y6/PHWzIC8UGGN
	 yoif2TZm/FWc3SORd34tv72GkFhoY6kSPjr8UIYmhPOPbyx+MLHTvgc8K8LVhVztlAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=rWF5af6pEo6EMA5BmrOrM6NUXFElHsCaPEA1nqKLyVg=;
	b=28PERrYlw4yz/VZNfD1dQzq8tmbMOyvLaoUxkceIFJ8km7OaMvNjXf25cysqY8eCEynA
	 M0zvurU4rsxGBxehtF2XRqoJcUw4ibC2riBbe6y5fi8bQyIvmLluKNWPLyn8FjdqDGoh7
	 DiGBRmwr4h6W/LJY4Ri/4jdWFWfUuN9pw19bMC7zvhXYzMEEnNL9XffffI9ZUZXupBKlK
	 d80sbwDLNKVF8Bhg/uv5dhKJbs85ncTNuR3COXmFILJLaAxmFdsWrVFtjBA/+YXA+/IGL
	 r+nPby2YSoGUb3QjBjSHlpc0viAIyxMdn78Twm5QfhztvQYChHkECdl4oDShu7SbWyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343B9606A31D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 19:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 343B9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93ead211f14so115933585a.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 12:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793300808; cv=none;
        d=google.com; s=arc-20260327;
        b=M+NyIdwy6cyu0Zud0HkUQxhFWejDC13DMGn2BEOVC+SX9AFra80eOXsLWmwBzuUqIr
         dMoD4vY0Y0LJplszrG7rrVxt6qDyxm6uGcHJ5l3SoQGsOCuYEhUiSwW8X9ZuMxs+mwC2
         6oaDl0LBTC6KgDemdc0b1z7P/S8eUVoZZzfdNVFSLLoj5pczLzxKWsXQ7PcivYbJb4Kn
         gLRaITXqmKdDZMh8qVK8f88jQWEgHcLS1+cIB10F/3RwOLDyXemD78nZ7xcr6zNPsDyO
         Veltw0L8SSaHLWNVMbj38q/C34WuWtjPKo1ATHdk/rJ33t7QxEzGCnyJffod5Yxcqpep
         YFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rWF5af6pEo6EMA5BmrOrM6NUXFElHsCaPEA1nqKLyVg=;
        fh=EMwoIPxQhbJESTWXSjb+pfAw7BofnWbZULvadBdTgbU=;
        b=h3kibyagL3G3kGxg6/qt6Z6OifxZ32TdVBHPKzB4mGF/+c6/wOZ+pbXCwNg0nvEqbC
         +ZaFXxf+kxCkD9jx4PWDoErjLoJ3sddAEoyL5R/ZY/+//mZUYSa+sNNAkCfRcXcOgjzh
         2qH81PP6eSixmAe9X43a2CwuRvUoQxDs2T162zrp1zcJozxUsHr4ph9GMAKq4YMZx1Ma
         fB9M5JQaMF3Igk6JgIcjFQS+FmyrKr/YXgsIb/gqHUifzYQAPiw5DvFIiLkIgsokGUYI
         FCSQ77PW4N5KeMPUD9V85cpiSqr5YfA2FYvJFeKMSfTJkruCuFInNs0D9n5IF7H/PRXZ
         Fhkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793300808; x=1793905608; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWF5af6pEo6EMA5BmrOrM6NUXFElHsCaPEA1nqKLyVg=;
        b=fq3P/m36lKgYONgkNlKcJ2n9q0rQ0cY5YBE2kgtoKPzSV52E2ZypteL0Z0QDoMPJDy
         MqKYMU7nlRPyMwaBc/K4f63oDt7/GI+zLotT2jdIqr/cn8LWVvuM5S3NB16IEWb50Pzx
         szMF1kAongd8ARPufQSofgIaIR9PWT/MTiHGTkaaQbRddlhNy7GlPdAGkm4RAWEycbhX
         QJhWQIf+HMbAuwyqCmZMQPYm89pOlKwV3HFOJ+XMI0+QJZfITDfaTys8G1Ibtw0xQq8s
         1vl7SKsV6+wyBk9JEIELtxaZyuCIfxnbr8H2iSAVdFHO7TBOnR78aXvzviLBRpQcjY8x
         RFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300808; x=1793905608;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rWF5af6pEo6EMA5BmrOrM6NUXFElHsCaPEA1nqKLyVg=;
        b=QiKpvdzu3xUvfuMO06IYtqwmsvdGG1lrirtXZ2ZE0TyuRsH5LABva12GlRSJhDl1TL
         BClmjVasdJe4XxAfcGTsVRwspXG41qXFwP5XpwZ0Brsb/yQj1q3LshKbn3lCFbOKHYYx
         xBZlq6Oesp3IZgIR/CfdMF78zuaX1aDMSmyWaFrANn/I7C+HmKb8dCdq4J00VYwvfqyr
         dkT9Eembs0D8yaBDsdIK95NXtB7W6aUQ2OBLjd8MxB1orWkjti9rLspHwMKi0ZvTiTEQ
         2yPR3Li6WXOD8Mr2CG9WaHCPmixh1i6ZhhRfwtGVjJ94xYNMe8dipfkGq59O98e9djWl
         2Yew==
X-Gm-Message-State: AFq9FYLvVT2iDNaF/J/zZxMlkJgFvBykXzWDTGw5yY+ScDgvKpUxOupF
	4CamjSFI8gqhzjaRJOs6YG3KBEMg+wak7yWp8nXRuWpnTyMUaOYiYCNzT73EmqgJxBeEkYeHrSg
	UMY4BwL9rKT/trCAcjBSk38Boaqf0XAUIzgKnrhzLOA==
X-Gm-Gg: AYBFou0NNzapi4sqPocn/g1HuFAk7f07rFOig5+ZCpF2nuG+aKXZhH11nJSD7RqoB3/
	2NEmFXFcW/AR6wfJgmBIF5+UM0EqRMsj0H8ugnyPkZegqd9AcmngVJD+Mh12Cv0cGgCM6nYGe/h
	6Txt4ruEy/MnaF7dpOQ31TCPF8Z9WTOePRnxoBBVxEmsB0LgxpB9gKNlyMSghBe4eOPt7Bq2Cf2
	feuDhTCcfNj21yme3nTXYWjtq5AZy8s6L8TaIBluqhlh8rqw7oT8FVulHoVwsZXWltmyQAGbt52
	tzJbaCjXY8IiUlzzqtpj8+fH1iyOrTtExPjSPzMQtxRWquIC+AYgIyxTM5YV1NCqPEKqeUQFj/K
	l3sdjcNS9fQMTwJcZN+HHhA+b82VPlPYIXJPPVWewgWV0M74Y/dohwZgZg5vGdxJpO4aYHgjRzV
	GS3fxljHML27SVekHt8wvHgN1+KFN35owVoAUtsOuizCcyUW4rsVqhdg==
X-Received: by 2002:a05:620a:2815:b0:944:6ad:1b7f with SMTP id
 af79cd13be357-944133c303emr496752985a.32.1793300808018; Thu, 29 Oct 2026
 12:06:48 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028112154.855185-1-antoine.pichot@gmail.com> <20261028112154.855185-2-antoine.pichot@gmail.com>
In-Reply-To: <20261028112154.855185-2-antoine.pichot@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 19:06:31 +0000
X-Gm-Features: AclHuK_Jd1_q7feVJfoLbgxqQ5EoRwMls_1DdxR9BDGkGVOV5XFZSQbDS8rlPb0
Message-ID: <CAPY8ntArdj338V8bcSxrmwKQecy-pAcCXMbkWy=qLckX=hawNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] media: i2c: ov7251: Use in-range PLL1 dividers for
 the 319.2 MHz link
To: Antoine Pichot <antoine.pichot@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, hansg@kernel.org, andriy.shevchenko@linux.intel.com, 
	dan.scally@ideasonboard.com, djrscally@gmail.com, dmanresa@gmail.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Antoine

On Wed, 28 Oct 2026 at 11:22, Antoine Pichot <antoine.pichot@gmail.com> wrote:
>
> The 19.2 MHz PLL1 table for the 319.2 MHz link frequency puts a
> pre-divider of 1 before the multiplier of 133 and a divider of 4 after
> it, so the PLL1 multiplier output (the VCO) runs at 19.2 x 133 =
> 2553.6 MHz before being divided down to 638.4 MHz. The OV7750/OV7251
> datasheet (rev 2.12, table 2-11) limits it to 300 to 800 MHz.
>
> Use pre-divider 4 (register 0x30B4 = 0x04) and divider 1 (0x30B1 =
> 0x01). The multiplier output is then 4.8 x 133 = 638.4 MHz, inside the
> range, and the MIPI clock stays 638.4 Mbps, so the link frequency does
> not change. The Windows driver programs these values for the Surface
> Book 2's Windows Hello mode.
>
> On ACPI systems this table has been unreachable since it was added,
> because ov7251_check_hwcfg() selects the wrong index. The next patch
> fixes the index, so the two must go in together. With the index fix
> alone, a Surface Pro 7+ (IPU6) had CSI-2 errors in 7 of 10 150-frame
> runs, 3 of them stalls; with this change 0 of 13. A Surface Book 2
> (IPU3) streams clean with either table. Dave Stevenson measured on a
> 24 MHz Raspberry Pi board that the out-of-range tables miss their
> nominal frequency and proposed the same values. The 24 MHz tables are
> left alone because nobody in the thread can test a change to them.

I have a 24MHz module and had tested with it, which you'd acknowledged
in the previous sentence.

You've got me sidetracked into doing the cleanups, and that has
included validating the link frequencies on a 24MHz module.
I've pushed where I am to
https://github.com/6by9/linux/tree/rpi-7.3.y-ov7251. Patch "media:
ov7251: Add support for a 400MHz link freq" fixes up all the 24MHz PLL
settings. I've also done the conversion to use the V4L2 CCI library.

The cleanups do raise the question of what registers 0x3016-0x301c do,
and which of the 2 variants is preferable (60 and 90fps both use the
same values). The datasheet SC_CLKRSTx naming isn't exactly
descriptive. I don't suppose you have any information?
It would be lovely to ditch those tables / merge them into
global_init_settings, retaining ov7251_mode_info_data only to provide
backwards compatibility with those clients that use
set_frame_interval.

Feel free to pick up any or all of those patches, otherwise I'll come
along behind you and submit them.

  Dave

> Fixes: ed9566ce1946 ("media: i2c: Add support for new frequencies to ov7251")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/linux-media/6ae0e944.b6db0abd.16b13d.d261@mx.google.com/
> Link: https://lore.kernel.org/linux-media/CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com/
> Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
> ---
>  drivers/media/i2c/ov7251.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index fce6344b5120..f429de5f1f7c 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -174,9 +174,9 @@ static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_240_mhz = {
>  };
>
>  static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_319_2_mhz = {
> -       .pre_div = 0x01,
> +       .pre_div = 0x04,
>         .mult = 0x85,
> -       .div = 0x04,
> +       .div = 0x01,
>         .pix_div = 0x0a,
>         .mipi_div = 0x05,
>  };
> --
> 2.56.0
>
