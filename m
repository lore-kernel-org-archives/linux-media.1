Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF512E54D1
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244437; cv=none; b=Zo2PdVhPTTWopvqbP4eb5mmwerEUEkBUp38i6tipCVKR0N35wATbf0GsnWNgXVXxkh3IK3+sylzIp/p079ntEssIcmJnI5WhJ9DnHb6KSQSo3tOKcQBuCffL8oVK3xQ1zADwGVRvWHN7q6Qc+6ep9VOq3uH8+dqz3GjINAcI2l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244437; c=relaxed/simple;
	bh=SKiKdv5J0a9yKd1F/BXWfqXIuTSXai4BQt2mltfVBVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXGhlyGKW0tFnR5UC8KfeZ9rGFwrJxqOBI4aXV87js9xJSqxTA04dHr7Ta3SBGn8UfeWPWmGfylSOoxVJzBnBjJbBbbbBocbGB4fL2Gxr7orSky+3gDT6qij3JD7y1phuScLkaeAlbgjYWZDh1HQZ//NejDMbFWIwCS/LbaaZbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuXifJc4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuXifJc4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso49644575e9.3
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 23:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244433; x=1788849233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC4Jgo3RleAZFIkAun3yFJqVYOX6VIQqPfa9Zm+C37M=;
        b=HuXifJc4wpBBKBpN4el+2b2KEIPMzSGZO3F9HUkhhBq4b/nfLUAUR07xxg29QFc07C
         KpgsbPvI5Uf2T5dSvj4SrvH7lqtXVAy4Hew7tr5J8tMFiWH6ZWbYSffYraaGkeqV+35u
         dVLj90QWJF1gOKK8ZEEaH7qkR0+Ea/fQ9ThPGaBqVGOOc4CkzxF4rMuF5KrPh8ij0pIp
         22GZd914TyZ5TsiQOzyFRlAwvSYbjap5C0DcXmuYTHuNh24mKayt5r3m/zSWrpvtqVg4
         fDIJCKrFmmJicgE6hRUAIP+RaF+eXt11X6nb1xDrsXDDwJsl++SZ0qqqWLiusaduQiWg
         vuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244433; x=1788849233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC4Jgo3RleAZFIkAun3yFJqVYOX6VIQqPfa9Zm+C37M=;
        b=KYdnHsKod0ZsXV1m30sdlmcUuwy/halX11V42H2zsKAEyiVV1T38k1+ZLK5IatpJP5
         RuoxtTNWwWf51jp3Ce3Z/adRBMkmIpLjkPzulr/nYYYlSZ4RdGsxSw2LpMCSrzeHcV12
         /YJzDe8hpuHtjhq6DKpCGHmeZ8pumgXncK83cbADomCT5Qb6ARpGJ/PqAJrq8qF0dmPf
         Kl+qvfo/nCzhcKIKIlDebZJhT3WEVVzrkdO4xrXQ3pZ4MdvlZRXUrFgAJyNpFNCZFCyp
         t7JrJPtFMCooJj7Gjkeeqb3SUM2GgLvNGKehYrq6V0nCyxc66JqrXSjtPyuThuR7pi+R
         DZvA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6o8fLu2gSgIeA0038N+a90ax0oCfEjxRhLH5uxiYT0mzaWyiwqIqmJEuipxmz3aUj5FR6KwKm+U3XNQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l/5D7bdUr2wgXZRKdFVMRkIt0uNDPgRmEL7YBM623IRSaein9U
	XMJiIXHDAnqeLO3gOH9+OJCcWs1IdFL37JdYEA4HZB2HyraIudt/PFc=
X-Gm-Gg: AR+sD113fy02AFfnKT+kJukr2C5tBbOolTg/oyDSgxwpIGBGPINOU9/mWCDWior0Qji
	nu2+omj+ycdXUczYXTXR7XilxBWnJQQTEcAbv7TIZHYl0vLBROMvm2bdsTvwZjx5owO8V8bTkfi
	DyWfeFfUWNW7u9vAsVYV6HibMwP5CQDGEYw92wx2/cmMczItM6pjauR1IkXqgK85BBEd1aFlhkR
	Af1Q1SdJ+D0Fnze+H+sz9w5h9N8+EpM3AJ8Cvp/014/wEgs+m3xIkKrOyDJ086OjKVbUmbPfkr/
	nt0T7hSc+0lCQhOFSazji132Gy1seC8C5mkNnxjt0VQVtbqoOHR7qr+BSgKozTDKyF0XFo6HNs8
	GL84a+vq3m+yxIprakdp/yFYqB/mk+7ee46gQ20zDmfyGaowsuzbe333D5Apk+tshBjrUhkmAUB
	KEPsi3Uk0wQf21egbOj027kXisK8L6LdBIfx4VBVPs4rr8wB8/K9L/0rmFjaRQUsteRRA5JcwX/
	enls34dHoNCP798IKKuhYbVnekkM+5T3bazt9bLpOYG
X-Received: by 2002:a05:600c:4747:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-49cdc57bf3emr86849635e9.5.1788244433013;
        Mon, 31 Aug 2026 23:33:53 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce11e0fsm43331585e9.9.2026.08.31.23.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:33:52 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Jakob Berg Jespersen <dev@berg.pm>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: [PATCH v2] platform/x86: int3472: map the ov7251 power enable GPIO to "vdda"
Date: Tue,  1 Sep 2026 08:33:51 +0200
Message-ID: <20260901063351.67231-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9bjLpqRXj6Hx0eSwnrfYfzQUL9rQwcxzb7uzDdMDhfQUkXmd8vUjOYrWOWHduP7IUZ8rtmnsUxIzX5E3CLVGfXCylvdrZYdmJhkX-O24aT4=@berg.pm>
References: <20260831102306.36610-1-dmanresa@gmail.com> <9bjLpqRXj6Hx0eSwnrfYfzQUL9rQwcxzb7uzDdMDhfQUkXmd8vUjOYrWOWHduP7IUZ8rtmnsUxIzX5E3CLVGfXCylvdrZYdmJhkX-O24aT4=@berg.pm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 31 Aug 2026, Jakob Berg Jespersen wrote:
> Tested-by: Jakob Berg Jespersen <dev@berg.pm> # Surface Pro 7+, probe/power-on

Thanks for the quick test!

> 0x009e0903 is V4L2_CID_ANALOGUE_GAIN, and the in-tree ov7251 registers
> V4L2_CID_GAIN instead, so only the front and rear cameras get
> enumerated.
> [...]
> Did you have something equivalent downstream? Happy to send it to you
> or to the list if it would help.

Yes - and so does everyone else, independently, which is the strongest
possible argument for sending it to the list. The linux-surface patchset has
carried exactly that two-line change since 2023: "media: i2c: Clarify that
gain is Analogue gain in OV7251", by Dan Scally (on Cc), in
patches/6.19/0013-cameras.patch. It was never submitted to mainline. Last
week a Fedora user rediscovered the same fix from scratch on another Surface
Pro 7+ (linux-surface PR #2252), and now you make the third. Since libcamera
hard-requires V4L2_CID_ANALOGUE_GAIN, mainline ov7251 is unusable with
libcamera on every machine until this lands.

Dan, it is your patch - would you like to send it upstream yourself? If you
would rather not, either of us can, with your authorship preserved.

> I should say I have not got a usable image out of it here yet: Frames
> come through at the right size and rate, but the content is saturated
> white, and the sensor's own test pattern does not come through either.

That is almost certainly not the sensor: it matches, symptom for symptom, the
IPU6 CSI-2 receiver desynchronisation I reported on linux-media yesterday -
"ipu6-isys: MCD PHY is initialised before the sensor is powered; intermittent
D-PHY desync at stream start (TGL)". The signature: a session starts with the
receiver desynced, every frame arrives at the right size and rate but the
content is garbage railed at full scale (for a 10-bit sensor most rows pin
near 1023 - saturated white), the sensor's test pattern does not survive
either (nothing valid does), and dmesg shows "csi2-N error: DPHY fatal error /
SOT sync error" from the first frame. Three checks on your machine:

  - dmesg right after the white session starts: if the DPHY/SOT errors are
    there, it is the receiver, not the sensor;
  - close the video device and start a new session: on my unit the desync is
    per-STREAMON and clears on the next attempt (~3% failure rate at stock
    30 fps timing, but it drifts with uptime - I have measured up to ~50%);
  - if the front camera is streaming at the same time, stop it first: the
    OV5693 (port 4) and OV7251 (port 5) share MCD PHY1, and starting the IR
    while the front holds the PHY made it fail 22 times out of 22 here.

My IR capture path retries the session start automatically on that signature,
which makes it invisible in practice. Details and the register-level evidence
are in that thread.

D. Manresa <dmanresa@gmail.com>
