Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7CE37FF7B
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 05:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785301400; cv=pass; b=l82XFDDmpxgkxK3/RTolemsQbCps7DIDzdGGCNtJJFJGtokBbe0gQhR5NDbga/EmetpaNo9BW8ODW7+ldrEDR+z3v6XfWtYuPmLHRubbrlYnnARl1VuRk6dA9grsxa5pQxt3MH9yrVQgHjk8ZzS9xcFtZAv3lRsw+HjXK5Qpfyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785301400; c=relaxed/simple;
	bh=uBWTvByf7/G8/44m7wuukvSg0OGwhnutgq3Exsc63Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRWRkQU7jwk8Gjns/vOkgMeJTq7JNRKHSKwAmVCwPCz4DM6Fr3QF5yoSba2wDRbvm8JUBftUv3bQ674Ffc3IPw4fbNkzOnabnioK8mEsOUs5FMbNjUd/EzKYPg69IxXi8R8oIw7YivNOvWp9onGWbBGiERjuGN2CQqnEtMhGXPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fALne90J; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fALne90J"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so806312a12.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 22:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785301397; cv=none;
        d=google.com; s=arc-20260327;
        b=sqdgwEmpMMCH3aNe5l3SMfdJmk3odIKXeOa40EIgdaWSb4hlgyWwSqMesry3Fkmqa0
         OxlN9nhKNKEfzYLHVjOGx/k26d+i2gGY0Zah2XXrMLY4UNEVnlo2dCSU1nyx7oaRLBBb
         LNtgys6hgf8G0+JsgDNXEmlO1yQ+JRmfIR4UzqGvsWaZAMtVGYW0DJ9zMhAK9sPKQXiF
         Wy1ie1GGjU0WJ06ZbzrMPd4fG9ewSYZNd1xB+ZZk8y9zMN2r+zjsTZxxr08AVTSPz++2
         6IfUfAEAGnPH/j+r195bnAmQBazCIxvKTZyKkITQ0MtrtNR1qdDdsNPQmTPftvgOrnaT
         lxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uBWTvByf7/G8/44m7wuukvSg0OGwhnutgq3Exsc63Cw=;
        fh=1HmTkh0P36HSdfkmIM1MUoOKoEGsgr+5+Wvn1DuUtN8=;
        b=U1GLmCGTmwKmj+X+pTkl7sWTPxozum75W6eaePRYbb0oWC01wI+DS9XK/qi4OyEt3i
         Z+YaSppOFL01l/8iybqyGI5qtWlMSgsY2RB0ecYNMgcSy4TeK3BuMm5AYxORrFOkOi6L
         WtZrAI/Sr3VK+2vxWS+5hp2CPCRC+hs9AZ7g8TuWLSkBo4NFQIgU5OhKHZcgY4mOgYO0
         MUvd6Zcc4SI6K0NTe2yik3SL+ig3VFvrRJH7Apv+cagej/F08o41h0WPnzk4wIq4uvFW
         4/F3rFzvVfuPg3VKJcPFCD1c6J5FkBVh1lgDGTiFoHNx9KyZIcdrYe6d2HKUm9hIyHrL
         iwSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785301397; x=1785906197; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBWTvByf7/G8/44m7wuukvSg0OGwhnutgq3Exsc63Cw=;
        b=fALne90JFtStngm7zHq07Oe3FHHyBVLyzCmyM7Rfw11OkW12U1psSiI1kjFuCHg7ht
         YTvAEcW0HlHOcZviXtYECkgakZpuJiHysMrBnNRuWos7M3rSjJvF5b1kFHGgUMppYWYv
         I5m58VUwEcPqnOM0tWznvLoUn57dbNlXCbT0IsFC0a419czI/kxyM8IOKuWXo//wgyb4
         EYPXWIxJ6fuldpw4rYra1UBEX/x/mRcWnnUvb/CMBGLLHgcTpw2STsP0ZnkRofwb4IOd
         Qyerz2UwlhCU27QOCG6oAYLpuI29G2KKuBYgURTjAD5Pio8ak2zsZHq+yicg5JOVGaIJ
         kCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785301397; x=1785906197;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uBWTvByf7/G8/44m7wuukvSg0OGwhnutgq3Exsc63Cw=;
        b=QvCHR9QW7+BXo8DDzIrIOAkY8R/7HOO3vVEdtbkHunHBz8WZ1prAI66ZDRkaajb3nf
         cjT2CLPiG5rHAtLhtOCy68zwtEZswK8LcEKXfhAy+pQznrgrcq3En+YHIE3KMwAr5biq
         rrc1WMzPFMsprjuV5ZHmE62+/GuGmGGWMJ7LXeYreJvVUWEZ9gsHMjISF1BVdqF7b9Y1
         F74F+K/00IGUmQXosP5TtuXbpU7rSRPak2WaLMJKqmz7M5Mtg1s9N1InJoh2AwYXSYBk
         X1wAD051nGgXiNTozs2/nOO7dlWPL2Ql1Yn1COSvguhwSjFSSzTtyo7XIKfPuLbUiYSk
         KzvA==
X-Gm-Message-State: AOJu0YwwMxrFQyxPhqiWvvImJDIUkkq9xSs5p0Hlhl3w7QE8SmJmuCks
	WNo9Qq+xwq1Tl1Pf2tf35D2kPxV8KHeEr034IwD3koPLOxqc9U5oKc7as0Vf4jRSIgyzKhoIdl9
	OlR0rC5rT2qV3GZ02cO+pG9XRQbF1lteJFGI7KF5EQWiSp60=
X-Gm-Gg: AR+sD10pW7x8WoPrtjxOTktyzW/ynHhIlgeS+TBgX0a9kv55ySqPSzRPTfLUNOEPgOf
	fHj5AxdxEQBZw5NdRT/t8lE/wbnOLwlUhCotc8NOHgWRi9RuvFNS9YxDSriUcxElKg6GB9Nzmqn
	moF1A0WSIku6MUu9Efue1XG3mS00ZAUm0xYNS0V+IG5O83/x0DbDkXgj0wRmAEIjEDQnORuZewG
	RZkM2+n50JxciMWlSYq4S2OEYyPBp9MS5JwcLqsZERiAd8bKPKVkRh/+m9DjX4rLjSupyK5oULO
	6NRmivPWTrzKpiRrNt3buHqFGJqRHfZ1zQCio0hzLmioJvgTDPNAZpwWcRknTI+UE2G9UZnDXS6
	udGKsSOQEvjJw
X-Received: by 2002:a05:6402:430b:b0:69f:4b71:41e7 with SMTP id
 4fb4d7f45d1cf-6a0349eab87mr2709499a12.8.1785301396462; Tue, 28 Jul 2026
 22:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com>
 <20260727131252.1580332-1-j@metarealtyinc.ca> <CAJTcUFQxyVWJ7s3WnZHV+wob3nnkXH2_iFJL8ixh_Y8j33ah6A@mail.gmail.com>
 <20260727154058.2350497-1-j@metarealtyinc.ca>
In-Reply-To: <20260727154058.2350497-1-j@metarealtyinc.ca>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Wed, 29 Jul 2026 10:33:05 +0530
X-Gm-Features: AUfX_mzqiZwXNklexSO8rUfKTC8iIvv8iS5Drc6ewkg-fodUYAEnPx9elIu8fTM
Message-ID: <CAJTcUFQg4Nm07xiqhvy5_seEoiAHmqPjhXigxJKyTUAY4=YQPA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] media: Add Himax HM1092 mono NIR sensor driver
To: Jake Steinman <j@metarealtyinc.ca>
Cc: linux-media@vger.kernel.org, elgin.perumbilly@siliconsignals.io, 
	sakari.ailus@linux.intel.com, mchehab@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jake,

I have v6 ready now. I went back to the ASUS Windows files rather than
deriving the link frequency from an assumed 30 fps measurement.

The Qualcomm power sequence explicitly requests a 24 MHz EXTCLK. The
sensor initialization programs:

0x030d = 0x0c = 12 (PLL pre-divider)
0x030f = 0x5a = 90 (PLL multiplier)

The resulting CSI-2 DDR link frequency is:

link_freq
= EXTCLK * multiplier / pre-divider
= 24,000,000 * 90 / 12
= 180,000,000 Hz

Because CSI-2 D-PHY transfers on both clock edges, the per-lane bit rate is:

lane_bit_rate
= 2 * link_freq
= 2 * 180,000,000
= 360,000,000 bit/s

The mode uses one data lane and RAW10, so the corresponding pixel rate is:

pixel_rate
= lane_bit_rate * number_of_lanes / bits_per_pixel
= 360,000,000 * 1 / 10
= 36,000,000 pixels/s

The initialization table programs:

HTS = 0x0650 = 1616 pixel clocks per line
VTS = 0x02ee = 750 lines per frame

Therefore, the calculated frame rate is:

frame_rate
= pixel_rate / (HTS * VTS)
= 36,000,000 / (1616 * 750)
= 36,000,000 / 1,212,000
= 29.702970... fps

So v6 now reports:

link frequency: 180 MHz
lane bit rate: 360 Mbit/s
pixel rate: 36 MHz
frame rate: approximately 29.7 fps

The binding and driver both use the 180 MHz link frequency.

I folded exposure, analogue gain and digital gain into v6 using your
register map and notes:

exposure uses separate writes to 0x0202 and 0x0203
analogue gain uses 0x0205
digital gain uses separate writes to 0x020e and 0x020f
group hold uses 0x0104 = 1 before an update and 0x0104 = 0 afterward

The exposure maximum is derived from the frame length:

exposure_max
= VTS - margin
= 750 - 21
= 729 lines

The exposure range is therefore 2..729 lines. I selected 500 lines as
the default from unstretched illuminated captures on the ASUS system:

500 decimal = 0x01f4

The init sequence and control setup both program it as:

0x0202 = 0x01
0x0203 = 0xf4

This keeps the sensor state and V4L2 control default consistent.

Analogue gain has range 0..255 and default 0.

Digital gain has:

minimum: 0x0100 = 256 = 1.0x
maximum: 0x0fff = 4095
default: 0x0100

I tested exposure 2, 500 and 729 and analogue gain 0 and 255 on the
560x360 mode. Those settings were accepted and changed real frame
levels in the expected direction. I also exercised the digital-gain
endpoints while streaming and captured valid frames. Runtime PM
returned the sensor to suspend after capture.

Here is the ordered Qualcomm table you requested: 185 (address, value)
entries regenerated directly from com.qti.sensormodule.hm1092.bin:

https://gist.github.com/sppidy/8b6b57f047343c88d4bb6c8ef22a910d

Please post the comparison against your Dell hm1092.sys table when you have it.

For ipu-bridge, I would prefer a follow-up patch on top of v6. That
keeps the x86/IPU7 ownership and testing explicit, since I cannot
exercise that path on the A14.

I currently credit your findings in the commit body, with Reported-by
and links to both messages, and in the cover letter. If you think
Suggested-by is more appropriate for the control implementation, or
want Co-developed-by with your Signed-off-by, let me know before I
send v6.

Regards,
Ramshouriesh
