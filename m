Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2FC286D5E
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 04:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784953389; cv=none; b=SKPzAOWaiDEQTZ1o/ZnUVwvNlO1FIFRYRutUTc3MgdiSxx1FxOn5eKife2T77o4gSkZPxlt+bGM979eUu1qTmWXDsEA1+1NrrxfDan5uaZnJwtcJDGyn2v7wntF8DKPBpyDMu55i/9/8uuCJbb7b8wXF3G0/z3F2xYN9mVjECwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784953389; c=relaxed/simple;
	bh=OVXDHfQ/4VBABQ98lCGxl1R9LPtBxkFgDjMSiEn8Gr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEZIpV2dHlZtb+fewwP5Nvh+efW1HBqE49FJMZnMUYADUxKNpoK+Ulus/G+Ezc4JncTBG0nm30WeQwZMPQHjfxa7I9OJJqtfsrmZBi57FT69PmSLbwZC3f2tXhRvz5seBnMdPLB5mFie5E7J4LvTre2FYiyBtWGf0aJ2oiWiEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=om4jGK3e; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="om4jGK3e"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so184884a91.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 21:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784953387; x=1785558187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OpCxABskcZ+2n1Dm/bQqYdz86Nf+UnLePo8ZywgOT8Q=;
        b=om4jGK3eh2xMdub7q0+m5pWvyDVqjld4gmUIRdwxxshflAhHZYxfo84mH6k0CdeYkf
         S3LsOYHPu4gtriBmU9Dxeyk/ZKPxu/2MpJoiTl23uQ76MSy2i6XAMzd/K5Q53L6eMu6m
         U1kvhOmhrVkYYqUV4cQSJlrMmFh12kgpr2s5VofpvxMtVyQUbUPEIGcECxI81Ke2uSms
         r4MTBbISwdKaVrXr0Q+qhkV2kLZKg306ld07MJXFaBX2/kfy0VfQTtZDzwHWCoginjoS
         DfgNDAazy8O2y7PVZkrT3+4ipI4tCaI+XTu3xD8LBJjBeEdvWJrMOtKprF9zS5sE/Jcy
         3r/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784953387; x=1785558187;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OpCxABskcZ+2n1Dm/bQqYdz86Nf+UnLePo8ZywgOT8Q=;
        b=Ne863GffLsMTh36mIEpeygGRdvgaKrezPHWsb2lgXs9X+mezBmK6DOAAG6iNUDSUHJ
         SxIoWymrECh9sefZouLknneBQn0Q+y5qBmCDMz3JaDSt4zFJXDBARhS91c+lr707I/v1
         LjvkNnOEiXfG6KEtgZ2VwOygolmPGFcqgu56Uy+gxU1hdu62QWRPy4gR29mW5G/hhLjT
         tn9YQrthbLmmD04Ea7kxB7aEUq7uchswlU8MHi9XGJXteZejJKzHQn9p/D0tLtxrauFp
         jw2xxU1YXXsRsZAs/FQ2dZRmgSwjvfQvrlyPgpK39obgcgLPHm845E/uBCC9/G9dqEkw
         VeqA==
X-Forwarded-Encrypted: i=1; AHgh+RprQPx6DDBilwwJK/JDtBDdJtNf2KVo3hgQj9AOHzkaINF1i6S0KzHpbb94B+MO2xhlpGfUeq3rDqh+JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDqxIBfi5NS9QJ1f+prOFcLRytlXlIWZZCD4H2kvumhKln4KCa
	gH703R/1PNkKXqcTviaOg7tJTDiO2K8lV4V7pRlOb0wPqSYp+Jful03e
X-Gm-Gg: AR+sD11sfkRfjfxwJRaulzx6rtkBogU8zRh9LCYav9dyUjOmTsGjVQeQ5GdemQeVhhb
	ZiqndYEjiu4/FXBDcvtPAvp2fshqgf2+Et08njyA581/TSjIblFNy16lf+s/jtU2jNUnqEC6pyG
	2u6m+IbdtIyEAZ7piWSUqw8VuYf/nfkZfncIMGtxLEHFUIUN1XMQCet+fUbUhy2MelinVxu+MOP
	jK8jA5NMio5+nqdbdhoCv2x4qcHfXrMLnSwvjG0x3vlVgdBfExia+TDvAkO7xFzmPH66L4X5N4L
	DtMN2W/Pvh2ChUfQ+FImHXWqnfhbzp5ZZdBbGDh6pgkJEq+3fwSd27Tjop6qWFEcaXzwyT0HIXi
	T/Jf76Y1eGTpBX3RnnPVtdFVv0y1jsByRYmKNh1rDPhrV7C2R+1fcojiaD99WMBfxTQqKeMklgD
	nAJFVo/g9Sr6FBXRz+F/9zpPdeME3ncZxV
X-Received: by 2002:a17:90b:4c81:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-38f29625678mr1016105a91.4.1784953386975;
        Fri, 24 Jul 2026 21:23:06 -0700 (PDT)
Received: from FAIZEL-KB ([2001:569:5b64:e100:ac26:5a81:1f39:799e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f2951eca6sm370859a91.15.2026.07.24.21.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 21:23:06 -0700 (PDT)
Date: Fri, 24 Jul 2026 21:23:04 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Bin Du <bin.du@amd.com>, Nirujogi Pratap <pratap.nirujogi@amd.com>, 
	Sultan Alsawaf <sultan@kerneltoast.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Abylay Ospan <aospan@amazon.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/9] media: vimc: Ensure that pixel_rate fits in 32 bits
Message-ID: <qrcq3ntszxswpk2wbeb7uq4gq3mncegwtoncyplkhdhrslzghs@dhkvpb6n5jsf>
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
 <20260629-cocci-7-2-v1-4-5884c80ee3b6@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260629-cocci-7-2-v1-4-5884c80ee3b6@chromium.org>

On Mon, Jun 29, 2026 at 11:30:45AM +0000, Ricardo Ribalda wrote:
>pixel_rate is set to VIMC_PIXEL_RATE_FIXED, which the code expects to
>fit in 32 bits. Make that constraint into a WARN_ON, so if we ever break
>that constraint a kernel warning will be triggered.
>
>It also fixes the following cocci warning:
>./test-drivers/vimc/vimc-sensor.c:107:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
>
>Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>---
> drivers/media/test-drivers/vimc/vimc-sensor.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
>index d125a79fec8c..83dcc9d61ee0 100644
>--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
>+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
>@@ -103,8 +103,12 @@ static void vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
> 	u64 total_pixels = (u64)hts * vts;
> 	u64 frame_interval_ns;
>
>+	/* Sanity check, pixel rate is fixed and fits in 32 bits. */
>+	if (WARN_ON(pixel_rate >= 0x100000000))
>+		return;
>+
> 	frame_interval_ns = total_pixels * NSEC_PER_SEC;
>-	do_div(frame_interval_ns, pixel_rate);
>+	do_div(frame_interval_ns, (u32)pixel_rate);

There was an error in the data type of pixel_rate. Actually it is u32 instead
of u64. There are two changes suggested by Geert in reply to the original
report. v4l2_ctrl.val is s32, not u64 and using mul_u32_u32() for total_pixels
calculation. We can avoid the sanity check also. Would you be able to consider
these two changes which avoid the warning?

-       u64 pixel_rate = vsensor->pixel_rate->val;
+       u32 pixel_rate = vsensor->pixel_rate->val;
         u32 hts = width + vsensor->hblank->val;
         u32 vts = height + vsensor->vblank->val;
-       u64 total_pixels = (u64)hts * vts;
+       u64 total_pixels = mul_u32_u32(hts, vts);
         u64 frame_interval_ns;

Link for the suggested changes
https://lore.kernel.org/lkml/CAMuHMdVx80Eh8w5-OioH-Uyahea0ZRQHUVg9MBfQ4uEjaxM5Lg@mail.gmail.com/



