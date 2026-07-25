Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867D729ACCD
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 07:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784965527; cv=none; b=Q/K9mCiQZYg9QTh2muj+nVF2f3PC8bXNKwZKT9ih0Spqbh1p+57zekd2iOnjqzjRMJDPh8IZ3FHGzE6ojQybdnY/ngK9/PwQRsg2BE2ZheU4N899q/G5O+ww6XE8onY7UCAzlg8eQr9A5SWR7mJ/jPJMPglAWJPKejS+UDhUZO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784965527; c=relaxed/simple;
	bh=6lBhACCZj2P79lv00t3v60jKDAEwX85X8jBJwD+dqL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8giaAUPtvenzIBpC22XBUacDn5s+qHZxkEQ1OXm51ZaFjJ/JgXGmcN8on48RDW9rEdmkeR2SMgZONL/963ysoV59aRvfG+MptAtBt5w8gmhwmz+9IYAZqANGnJaF2cnEcI0xqypFptj3i13Ve9BLu0b2Hm/Q0ZlCkzBDJMKWXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFFyeU83; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFFyeU83"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc7a269ca1so2460415ad.3
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784965526; x=1785570326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=54njo+35o5CM08BxMiGfJLDeg/totzOP865IKX9TOyQ=;
        b=DFFyeU831TgL7uTv4q11QYgYn22u4vRM10ZT7zu5w4ElzQ6QYy1HiY9wDfoHY0mDtE
         8ip8q4Z+u/obGqQwQ73upPeC2Ydg/EaN1P6m11pKIRdttSbO3yYiAgG2NSiEunX+0C5p
         FYnKJQr1NAqRlA2SouxavLT3EA7RI283g2xzQilj25eWCEhKdb3dhD624mpC3dsHGVKa
         AwCcHNSoiNJJHCAeib+yx4h5DIPlvdvdD1ejvuYuZ6/OPJBaWBY0TWMUB5Nbu4X2zZ9/
         iBo4w8dRTqLPrto9bS4rD1xGgPEwkBH84MWRbzo3nCCs9FylIZYHCWhHQD2BMXp+1CBJ
         kTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784965526; x=1785570326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54njo+35o5CM08BxMiGfJLDeg/totzOP865IKX9TOyQ=;
        b=MnP0nsevqI/4ybrlblmm0JllIacgQ3uiYl3gMDSQfAgp0RwQbd0MNOVCX2EgzItZZ5
         ugaxK4GjpKfeD6BjhF2JEaE2BGjgx4R6m5jyNpzbqlKemWGlx9Yda75YfAfr2ZFt4cZQ
         pK6wUmBPUGXqOkjUUYRdQ7wVHJvD5qpJJgEOG4wIVqEXJG/z2uz+ujkQVFmM2gfdnJRi
         9gJ4lTVkR7FThRokWgdbaIBoxfB1YjHzZFD/qNAeinh/GlEWD4ESvZFVo6sRGNj9cbfg
         sMiABi+Lpzt98DVXZyg3z3n2udftai+/HbEkahmnI4Jtf0URQV/3TgSiL40ijhEjLaaA
         AXJg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+FF5hPs3I1G0kEOXWZRTQvC1C4sMBy0blanVKCKe4hcNWAXXJWdXGwTN/enfYqffIsTfSYrrpO7nc+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBhr7ZzDW0q+9NT3GM4fjDwEgQk1/g4xYu0+YpXBl4GDeyPZit
	6xP9ucbkOgRFOa1E9PSUlYMqCYz5BBfJ/UipI2z+84eqAGBx2lm3nuvF2DPHl1v2hP8=
X-Gm-Gg: AR+sD125YdXmwQoXC21G6enPLJPgbWDRRfEuSMps2FXQcFBHp1dVS6U2b/pqHnP47dV
	6LHEOQMt29IOrINRaQsC+wTdADoaGn8I0NbF6nvsL40JXnUjicK6jhSJ81oVnaNg1GRVxLR1sZT
	Z8zVgCIbNJ9cTC5iQS1Izx27oS6+u4RBtKZ8gm8okEC0MPC+O3LJRH6EHHsehnH/i7RalxYo89p
	02TeQms9cuFRbZSEdvz65qmaJz8SLJEYYb8h+o8mn+KgKKtKLjVVcfuAAC+fbuxcQqqt7Gk5NgG
	r5R3nonBbJ0lgQwQAICTO5F60k0QI4CuW4aXEy3JcWN3hKdkgYGEmDVjuHqLzTlW7Uc0AUhL/FX
	/Hpy2sv+I59m6k1QVQ1M8hXjCtM5eG7qgfhFKXBancGG7mvc1bbYMDsaxqAD28vnHkN0TFYMQaE
	UKpki5o26F4qSYrweJ3fPdKSWWoIJU/U/T
X-Received: by 2002:a17:903:4b2d:b0:2cb:2b50:d9da with SMTP id d9443c01a7336-2cfde84d398mr11434055ad.3.1784965525844;
        Sat, 25 Jul 2026 00:45:25 -0700 (PDT)
Received: from FAIZEL-KB ([2001:569:5b64:e100:ac26:5a81:1f39:799e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm6600975ad.4.2026.07.25.00.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 00:45:25 -0700 (PDT)
Date: Sat, 25 Jul 2026 00:45:23 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Chen Changcheng <chenchangcheng@kylinos.cn>
Cc: skhan@linuxfoundation.org, kieran.bingham@ideasonboard.com, 
	mchehab@kernel.org, hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: vimc: Replace do_div() with div64_u64()
Message-ID: <7h44zvktv5up4cxv7wweqio3r4abhgl4mhz2pu5h2267da7qss@mstbqjlx6uqo>
References: <20260716093017.175254-1-chenchangcheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260716093017.175254-1-chenchangcheng@kylinos.cn>

On Thu, Jul 16, 2026 at 05:30:17PM +0800, Chen Changcheng wrote:
>do_div() expects a 32-bit divisor, but pixel_rate is u64.
>This can lead to truncation on 64-bit platforms where
>pixel_rate exceeds 32 bits. Use div64_u64() which handles
>64-by-64 division safely.
>
>This fixes the Coccinelle warning:
>drivers/media/test-drivers/vimc/vimc-sensor.c:107:1-7:
>	WARNING: do_div() does a 64-by-32 division,
>	please consider using div64_u64 instead.
>
>Fixes: ec1e620b2454 ("media: vimc: sensor: Add pixel_rate,vblank and hblank configuration")

See the previous changeset
https://lore.kernel.org/lkml/20260629-cocci-7-2-v1-4-5884c80ee3b6@chromium.org/

