Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562625;
	b=KyAEa0k2RLGco6Grk5403xZbz95yl5ua/iH2NKgfOoA1ZZLJIC3D1ilnDUzgljQDUtJh
	 twzpEHkNdKXgrUE3wD756+TpCYutesqJeVjNV0rxQ/DSs0DA+gQMyhi62WON0YvALTH9A
	 7tF003KPabdo7NT/8yJEVelRyj5z1W+fp+6Lr4iNa6cFwzud+EZh6MuHO1a3Xh5h1sG0k
	 unQ/Fn6u9BTyHgTl/eAKPLwmg40jCPUeBfOQRu0P3+G8mpWpXgGouecwHDYyMeIAn4AmY
	 VelEXeTWtf+diW/4TX/5ipnsm/MEre9ijfH4oi/7dUtGJ0/xTddUFKhYLCOsDLh60Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2xnwoRJLMp2H6N6MYwL3CW90RaqThGjRhTOpE4wiGoM=;
	b=5YKFXpw9V/93CRGgmt1WumV6Lxtp0wzJfivcSWZMnhKaSJLJyVvloliUkP98v4nBCZIm
	 I37PV6i6xUuQFUb4OwREOWxbGBCQPfmol0nT6wHdAjyWEEXu7wgFR72HaP5mYZm9MSFrv
	 53uWYx7KCYy3EvyNRgQRdVLgspm4wBGaez+g0SNeLDO+CrFGxBrzXy3Dhm6oNUt/aR7TV
	 0RptMci2vdFHm4NICG0k5CiV/w8p3g6NcOBho7hfqh8e2qlkasmNiyr5luJ2cmLLLN5hu
	 gLjg9K3jMSda3i/tQ/MC459oGxSrhH0czK3kb5jPfaoU4F7LmK48uYlyi7M2aaVeDJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPGoeI6Y;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C459606A325
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 19:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C459606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPGoeI6Y
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so13673155e9.2
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 11:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793562624; x=1794167424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xnwoRJLMp2H6N6MYwL3CW90RaqThGjRhTOpE4wiGoM=;
        b=kPGoeI6YQsQX7b1vqlJca29y9ZK6b8NJ6NvjrI5IJtlKDTLcp1rwgsDqeOoVI40TO2
         frta/hjCDWXxyrnV9okm9aQVhROjcD3Eb6ZKnoOMSb/ZMju7xXgD+Sst6AVp3ITC7JY0
         6ysLQH/UCJNApB/QFQaaKP5hspln8sgEVIvxizSZu+cD25xcmcW+TYGUnJBEbo+ocXCy
         ilybA2Oo2tmUwjWMd5CDFNmmtZXFYBiEc5bgnKF1n/gTc7dhLKGI5kkUvzMozjWipblZ
         UiGWjPT9m3lTOSWHSZFQ6lsiCmHl2I1C7yKVzbUmQ/Bb0vlRaKQRZ4y1bfA96eaueMCf
         8CSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562624; x=1794167424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xnwoRJLMp2H6N6MYwL3CW90RaqThGjRhTOpE4wiGoM=;
        b=MVzu/XwRnKhd6YUZsAlF9HJeDJ9Mast1MM63DlJGpPnGpW0laDh4tJBRAzvcSOaRGA
         OxAnj0lxE5Jvm+JBMk79riIQjiraLuD94D3SPWN8NDLpvl3E5/wfWNGwj/ostp4T6wRp
         tmrGBmZgZFKgcZ4F0e1WGUMDEYF0uv3OM45B9BXrBoWqRMTwtGgo68E24qee95Xc1+yL
         +ee7v8xq49xiV6hAdz5APvY2RCIQkbCsu5+70q0LJ1n1FDK6qIn1/NKtWHD94lhEdpC8
         0/42J5hDDWsp1jy7lJvUYwrwjtih8scJA7DfJ9+vcY0mVNJSEQcaNVye8iIRfxTXuYKO
         7r1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz0DArU3FqgYge8jKIrYs1n6+Bd+6gGBJ26lIE4xRmGdzZysIkl/2REfX3qMYgr7TRhXBYe+jKUWbSWeQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKLz8vo5BglNx39n7FZeh8G8HZNE/f5iS9FIpAVguAr/kn0HO/Y
	LBEtmfIJn9EoBl7pbEANXAz3jU+L5aIJrncyNmlYtRj9R85357j6noYM
X-Gm-Gg: AYBFou0c3CZnoisV4an34CG7Gl9NMsYpS9u1xlHdudxxd3ocheLXCjeNgLmYFRYa+ey
	VV5rWKLbpj7PeajOyaVnZ3ZVlk7d1X1WT8/Gb+Iyq0osI98d/AfdZ9QyyuRY/f42Qp88IjFi4g4
	x2xyVa1rgtoJPZ6jXjtXE7NuTi1QmpPNwfg7y2dNUYanrfo+x+FPYz84y0FpsX2cThfY+rsmQf8
	pBf6g/SkceKpaX0jnubxPmQNkulkIdxtQI5z4sbvtS23A5XXjJXKCWZ/DROBR38UhuCsilHRuf+
	4zlebSx5+R+d0ngoI1eUoDwYA42gAuREOfiaKGY0KP91N6Ud1m/1+d1VY7Z4k6k9xmxNcx0oq+P
	xQ30udErCAAEvQe0SsRVbEv4eNBfugTQske9mutji5MGWieZqnv8dq7HrOFA+f0eRMIRdrdZGdp
	YIIhWw4QveQHL6I+lNpuX0CkHO3pQT51Mee2HkPxCebgxmZvfDbHbzPV24V2wQkuFgFSmzYcn/2
	V7sSEglsUdXuRqX2ffBKdOTEkDP1csvX1ahczzxS/3mH/Bdcre0zfRkICJz8hPKWATYOe+LexdX
	VD5ljU4hmdJYfGsH2FimAg94etyDMVN+qHnwHlDersTkmgOKLT7OOrDiv+/rMZI=
X-Received: by 2002:a05:600c:314a:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4ac1775316amr183746735e9.12.1793562623673;
        Sun, 01 Nov 2026 11:50:23 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9a3b1sm17254258f8f.44.2026.11.01.11.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:50:23 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Alain Cousinie <alain.cousinie@laposte.net>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Milan Zamazal <mzamazal@redhat.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	libcamera-devel@lists.libcamera.org,
	linux-media@vger.kernel.org
Subject: Re: libcamera: pipeline: simple: Disable packed mono for VGA sensors on Intel IPU6/IPU7
Date: Sun,  1 Nov 2026 19:50:17 +0000
Message-ID: <20261101195019.220940-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <304e2a5a-f8d8-427d-84f5-b6f4498452df@laposte.net>
References: <c218b8a2-9e69-4ef3-b36c-7df7e7637d4d@laposte.net> <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com> <20261101164311.GA3368923@killaraus.ideasonboard.com> <304e2a5a-f8d8-427d-84f5-b6f4498452df@laposte.net>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alain,

> Forcing packed monochrome (`CSI2P`) on VGA sensors (640x480)
> triggers a systematic `stream stop time out` on Intel IPU6/IPU7.

Not on every IPU6. On a Surface Pro 9 (Alder Lake, IPU6 8086:465d, 6.19
kernel) its VD55G0 infrared sensor streams 640x480 R10_CSI2P (800-byte
lines, 832-byte stride) at full rate and stops cleanly: 120 of 120
frames, then five start/stop cycles of 30, with nothing in the kernel
log. R8 and R10 at 640x480 behave the same.

What does fail here is narrower lines. With Sergey Lebedev's vd55g0
driver, which offers 320x240, R8 (320-byte lines) delivers about a third
of the frames, while R10_CSI2P (400 bytes, 448-byte stride) and R10 run
at full rate. So the limit depends on the platform and the line length,
and a libcamera rule dropping packed formats at VGA on all IPU6 and IPU7
would also remove ones that work.

Which IPU (PCI id) and sensor does your Spectre have?

Fernando
