Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD423D6CC6
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225742; cv=none; b=VhVCH/aNnQMEa6SuwV/KayU1duviL6Wt5m4qZO2MEii/W8PcJoKXlOZss1FCnojeIKO/h6biZbV5Y1640d2ugGmAAzBjdvx6gpZPXYnbAduZ0GBq3rT9qTstLC8/EAbrNgdJjGAwO6ywB+uHh5pmN0FpXlTeQuyR1qXlMuTnf7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225742; c=relaxed/simple;
	bh=cw4RVDbB+SS17gGDPFBsUyxANiYfj2/mtdfpCjWGIAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TC0SLTnDVtnakvmpy0ShOUppAh1/tHU8KOe2M948eCi1acZzO2vFq1TB2wrTjRj+f4C6bSVsERrHzKYrX3NNIIX4BdoBm8Fumci3Rac1EBQ32ZXT0Ss3Snj3d9m0tXu/VcY/SPX91ZQu/GFofKPnGe1yBJrrHGClMl9NtgdLk1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HnILnySa; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HnILnySa"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso5677860a12.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 01:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785225739; x=1785830539; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VADWkygOMgTz3D8oKiFNpo7c0M0MqOIRcwEmZNyVtzI=;
        b=HnILnySaPqb+NY1LnF2yGT5kWOPt1pOkjbrfzozkosmDEPD/0j4Id0dDFjkw/YKyxQ
         Y+ixqbvrzHW5J8hogwU9xhywz3dmheHAKurFDKDR2jD2oPdLg43InPWUSkEFRn7pMHwv
         0mkXvxutwPRgPfNFJUQSu3uH70H/uwa4r1Cpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785225739; x=1785830539;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VADWkygOMgTz3D8oKiFNpo7c0M0MqOIRcwEmZNyVtzI=;
        b=aQkksYolAWa1XdqEou6MKRXc9nvSFT9+6nEDThnXezZdDhLTPFBBpxsEodilJqV+T8
         blKkM1hvUYX231i240ubCUOuD9hQsOEohIZjmZXN8m9+Bt8MhYranlwm9pcW2v9a/HBN
         N+SkQg+NzgsYovTbffPsXfXK66DhpFTqQf5wA9AXfaSDtmRV/CXzutwR40534oXz2qB8
         +YrtrnfWgRnRwRA7z7k8Bap1UGC4OkF7O/kBQrdHW/pcWyJc0zd1POQDUcILiKXCYnV8
         K5sV6SZRXTImEWNQqFT44ZTLsb3PA38vb2EKu9t2N2tp/3r6c68R4hJq3XUb0z7YQBDa
         7rIA==
X-Forwarded-Encrypted: i=1; AHgh+RroeUMyIOitvf3E1rEX6XEAJ/kwT4lZqBl5ye2XP1UYegzrqYMiMYbIsQCss3rlNkAtAxdfneiqcFaVjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/pDSZ5O0wtIKwC6CRzEa6l1k2BNy081wK78zUkvPOmf0WSo6T
	ZgQSV668QUpmTjeVOSte2kDDZYW4nalcoRTCyCMjotiwYxI3MlV0Um1l6TjQ8PFZa/Dm2qM9cuH
	7ONl5TQ==
X-Gm-Gg: AR+sD13UCoFC620FaW36J0Xc+up1w1tmBX0oM+5z9UT0Pw4bpee/czGVgdZE8fLNiDe
	JiS+ZSlMTywhkGIkWKWkeTH5gUFyBuGsrY3+hrZzvVbbYpPsIfgDqP3nqBalItDW7hH+f0g/F6V
	pxxHBQK0TbL6EyFXRwq26MJ7zwBFp67Gsv/ROsRW/ZpcdhjgczVJmoPQmXXIH6OUt6Dl1oYWYxd
	UhKK2BYN9YLEU3aP162R/gqn45GhJK9QHJ+ndT8yGswKGd9JdOPzsRkzJOIGpSrX8WEDeKJUKFN
	b/GIQtA+j2m3EuFVpaDVvsT9hbiJcqnKDZhvEHWoCh9DZm2Ou93Xjbb93A3qI4/EjQIzVzwNGsF
	/9QPDowsFyF44z2KRZCevSsFmAxriFEf8rkabe5yOJOVi8ilR72S+DmYvTuLJooaGgsmIrHNI5G
	dHHjs5JBPfyl8P7yH63sjhTUQObJtUGrQEbKMTb5k=
X-Received: by 2002:a17:907:fd18:b0:c1c:2c92:fd60 with SMTP id a640c23a62f3a-c1f71e94502mr68529866b.13.1785225738805;
        Tue, 28 Jul 2026 01:02:18 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f19c57sm715280866b.58.2026.07.28.01.02.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:02:17 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15dd4b9132so520098466b.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 01:02:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqOAr5R1y83k3sELeAihhD+5/6kpMmjF0WnBQ0to1BVmQcn5gnG4F2RFOn5xuCLvIpKKareybxwOzDAug==@vger.kernel.org
X-Received: by 2002:a17:907:c80e:b0:c12:34ed:da14 with SMTP id
 a640c23a62f3a-c1f72504745mr52313266b.64.1785225735405; Tue, 28 Jul 2026
 01:02:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728001545.331638-1-faizel.kb@gmail.com>
In-Reply-To: <20260728001545.331638-1-faizel.kb@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Jul 2026 10:02:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCs=UXSD92OwTjaK5k-bgJjJr6MN88LYirWiDhhKdo56GA@mail.gmail.com>
X-Gm-Features: AUfX_mzElulVKQqbbYLWCl1d63kYtJl-7XEMUhAnK5PRxIgpYaBGhkaXW3P0b04
Message-ID: <CANiDSCs=UXSD92OwTjaK5k-bgJjJr6MN88LYirWiDhhKdo56GA@mail.gmail.com>
Subject: Re: [PATCH] media: vimc: sensor: fix pixel_rate type to resolve
 do_div() warning
To: Faizel K B <faizel.kb@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Thanks

On Tue, 28 Jul 2026 at 02:16, Faizel K B <faizel.kb@gmail.com> wrote:
>
> vsensor->pixel_rate->val is a plain s32 field. Declaring the local
> "pixel_rate" variable as u64 misrepresented its actual range and made
> do_div()'s divisor look wider than the 32-bit division it actually
> performs, which is exactly what the do_div() coccinelle check warns.
> Revert pixel_rate back to its original s32 type to match
> vsensor->pixel_rate->val, resolving the warning correctly.
>
> Fixes: ec1e620b2454 ("media: vimc: sensor: Add pixel_rate,vblank and hblank configuration")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604191731.10nxGZ92-lkp@intel.com/
> Link: https://lore.kernel.org/lkml/CANiDSCs9s03DUjKwcPgDtZt2QJ4i0FGwab4zpEP+wCawagSC2Q@mail.gmail.com/
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Faizel K B <faizel.kb@gmail.com>
> ---
>  drivers/media/test-drivers/vimc/vimc-sensor.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> index 83dcc9d61ee0..7cb544fdfddb 100644
> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> @@ -97,18 +97,14 @@ static void vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
>  {
>         struct vimc_sensor_device *vsensor =
>                 container_of(sd, struct vimc_sensor_device, sd);
> -       u64 pixel_rate = vsensor->pixel_rate->val;
> +       u32 pixel_rate = vsensor->pixel_rate->val;
>         u32 hts = width + vsensor->hblank->val;
>         u32 vts = height + vsensor->vblank->val;
>         u64 total_pixels = (u64)hts * vts;
>         u64 frame_interval_ns;
>
> -       /* Sanity check, pixel rate is fixed and fits in 32 bits. */
> -       if (WARN_ON(pixel_rate >= 0x100000000))
> -               return;
> -
>         frame_interval_ns = total_pixels * NSEC_PER_SEC;
> -       do_div(frame_interval_ns, (u32)pixel_rate);
> +       do_div(frame_interval_ns, pixel_rate);
>         vsensor->hw.fps_jiffies = nsecs_to_jiffies(frame_interval_ns);
>         if (vsensor->hw.fps_jiffies == 0)
>                 vsensor->hw.fps_jiffies = 1;
>
> base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
> --
> 2.43.0
>


-- 
Ricardo Ribalda
