Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943452;
	b=PoBN7SWGzLlN3AqDcrW764q8BH8LKNIoqWoTexvZcJwsjNO2gCStIgWwYf+takX4ahsN
	 DFGEVb/GVaqHAyXgucoamBVRxqbAQrQ2cs42Ki60A1JQVnGrL7IpLrHAmLST5C4E9i12z
	 H3VbNV65g/oGW9a5wcfx0yut+dSqXNHh0Oo5zKGLP8gPlvSSeXK60C1wRhCocjtR1sunX
	 H84AzKmUucUBgZSOG+ZYOzpbiVuH8OGZPmK//CLaHnN3OzziKqgAajDKr/xAom3LbxUc5
	 lLVjSNggFRVfYp9MrbOYlpKbgGidgS+xedPd2V6tuzZODyt4/dh+ZVdqfFOYzWBTpMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t0LxG8ArlpwGaMi1KQwMTB6Eitywqcn3wcV6XMmyhOo=;
	b=kKyIcquxlKE+GWAO+A0yJ5SEvIyZXFXAT9xUhk0uaOCzDxDD5eInqYDUImDQEneCyCto
	 3tSQG1XE6iCrgtTXRayocTUv1NqNv/K72pNH9uFKtf/HyJ2X/dsg+DC9y7WymwKVhU6a2
	 Hx4kbV6U8RVHX+HAmLkHkmuRrDdmbYiMiEW/PnuuMpFJfQeWAHVMAgENyyqjIN8ry7Se4
	 ygLulU8RrmAx9lwLj2hxLo6UAa1Rek8dY0366AwKWHBUZTFE/pm0ubuuGeq9VqHY621ku
	 BIa+Ck0VfyPRcSvbc1SSs+wFvPZKoaB2cUh0MnC0JgFwzEYPpjaj0fetLsJ9Ueq2gRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L0wSwdnq;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855B8606A31D
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 15:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L0wSwdnq
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso23067515e9.3
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792943451; x=1793548251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0LxG8ArlpwGaMi1KQwMTB6Eitywqcn3wcV6XMmyhOo=;
        b=L0wSwdnq4B2MyT9qhO5Gp7zLUkq7Bownv3MM2tcgVDrwd8zDrASQ1Zv7dJCb6XrC9r
         80V1h21aweGFPQ/sNib3bjqiPnTugoYb5uhGhx7I0snK6PTRI+4Z93JBlc+z2Nufn1b6
         66UWMFd9qaGceDsWXNgtH000KXf/Rl6c/FAoe4AZQYTC/iGfXzYZovrFTVzqyo5BBjCg
         66psmUiH4FllE8LdXvvd81Gc14XpheP+XOMGl3wvgVJsXT1vig0jbyoRnWo5zNGpEcsv
         mqU9vNeS59Ajlw75uTnlEGr7oo6PLBVmWEhJh6XDYpwT05VXts2D2nBragplrtsjgn/8
         VUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792943451; x=1793548251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0LxG8ArlpwGaMi1KQwMTB6Eitywqcn3wcV6XMmyhOo=;
        b=cj0HB664wWW7xMG+EuKFzt+IZzeRjxFPqZ9nQNy5+uAcg+Zw/VQpqxX2ObdVOh+/GW
         r23epDqZt5PkSohGokTzGkv4IGbw3g3x+4/AEZbe256tdd4cYUCitVI2/cx5+/InFRqf
         ss9WSLCzj4zhmCR66VBlPYc16lo25GM8LUSs8lCUd5Kf9SN5ZQMLmoIawhEq+UZuCzxG
         jNqnvxfHLPfw7Wv2S7GtvaSm5pS+rHttx8NwIX5l2+NgMJ6jfNmJTgjDoApW4UBwEAFH
         9NKveRiTptaPR/q0Gm8CDPZacN6T/3CmJc7cKv+jjgoyvnks3Bs6y8wcy8uO3z02M93F
         n9XA==
X-Forwarded-Encrypted: i=1; AKwUvBx/MENWl+c7Pwqc5lASXhQUucuRM50BXy7swEi1lfuPSKnmuB7bawjycH0fXO7/N3cyjXJZavpEWOzxYg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIylN68zzNWiuTsHQRMbCO0CarUNwPwPjL/4bJlQB3vyJGuKtA8
	u79COY4O6OnqApXa0Xi4nGtYaU2gqlqh0nT9r/kRt+pYXGbSSRibwfnx
X-Gm-Gg: AYBFou060e9IlzYoo9FlSK8lL8kkLw9qq/8Ho/19WtFZ/9CoxdQIlaq5vFUVWZ6CTpp
	mSXLjccKa43LxPCXjpzfbIvofqKDBGB7mWqRdvGzDV91vCbf4QZUh4bUE507BOkf4Xk8sAYYz7z
	FrW1yeeihIfFXQ44eZbtQwcuk06lMelMqMmRJpTqjp/a5dpXKJbr4/b69YuqEEyUIdAS5hSydQg
	RoxmW1reW4gdjr1DifkcxDOf4uan1k8UAR771pkwxzj9V5yIh0jr+/dyHZKWKFYREUc+gAhpkLY
	GVnsHC+AX8HlJYqUYwG5/mbC3Uh+oGMJuUMRXonAucaTCdlGm17gmRYk3ytk20h6XMfJ8erYrI1
	kv6FMc54iDriMbR1OFBcLSEDNVBz85/8KUIwmehxtYBiiaRENtofvpBQYxcqHV8Vrrdn3Zzwm6n
	9GYGstY4WmQDdYVn0c+yRItvzWGCVo9O8PsaO+kbiabq/SRNhGdnp451HgZpHIEeqWQwjmXvZHL
	ZDLw7Y7bhLfwONdnFFZODYjwydTaMFr3RGZ7FmXNA041uJweX2rbiiuoJAX9Lr0Ae8rYFl0eop0
	5lzHENxOWs9+sw==
X-Received: by 2002:a05:600c:a104:b0:4a3:5c67:55ed with SMTP id 5b1f17b1804b1-4a35c675a4bmr58810335e9.12.1792943450808;
        Sun, 25 Oct 2026 08:50:50 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bac37sm137730275e9.6.2026.10.25.08.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:50:50 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Hao Yao <hao.yao@intel.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sergey Lebedev <lsa.uz@pm.me>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for DSM method
Date: Sun, 25 Oct 2026 15:50:47 +0000
Message-ID: <20261025155048.42957-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208035122.2147678-1-hao.yao@intel.com>
References: <20251208035122.2147678-1-hao.yao@intel.com>
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

Hi Hao,

A data point from a second machine: a Surface Pro 9 (Alder Lake-P, IPU6,
8086:465d). Its infrared sensor is the same ST VD55G0 (SMO55F0) that
Sergey reported on for the Surface Pro 11, with 24 MHz in its SSDB, and
INT3472 enables its clock through the _DSM. Without your patch it shows
the same symptom. With Sergey's vd55g0 driver at 396 MHz, every mode
runs at 47.31 fps where the controls give 59.14, and at 600 MHz at 57.20
against 71.49. The driver this machine used before behaves the same way
at both frequencies, so everything the sensor derives runs at four
fifths.

With your v2 applied to the int3472 module and loaded from a cold boot,
nothing changes. Sergey's driver still runs at 57.20 fps at 600 MHz
where its controls give 71.49, and the previous driver still at 57.60.
clk_summary reports INT3472:01-clk at 24000000, so the patch does pass 3
to the _DSM here; this firmware just does not seem to act on it. The
other two cameras, whose SSDBs ask for 19.2 MHz, are unchanged (front
28.64 fps, rear 29.95 fps), so nothing regresses.

So on this machine the patch is harmless but does not fix the clock. I
cannot tell from here whether the Alder Lake _DSM takes a different
value for 24 MHz or only produces 19.2 MHz. If you know of a way to ask
it, I can test it.

Fernando
