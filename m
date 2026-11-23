Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427203;
	b=2T2l8SmH3NxhjsZR00fGHVRq0NJRox0WjcqkPx0l8JjGUHQJEMFXbqHc+Oo8Fmgy3uRP
	 jWVGvh7bPUVmHRMM0UmMSYBh+OtlHFQe+7vz7fawPMbXRH9X90UX+F3k1mT8H6wGmLOKC
	 kjnnt7ybWSmtykjhmjTO74kXvS/Ltko5AxAE+9hPBYTqh/oH/CQBSs6IP5ySRWSbmlaxO
	 UjDEYutusHrCvGsjb4JiwKfU6Xx393k62Zn64BlTH5NfyDqyascmUnLIeHBpvCcWwiUoN
	 YRxNZohB9aVzpB0FWCQz3jgR3NU0ZUclF+bZsxq3tmTqgINJpcj4/eD+Zu/b2WlKN8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Ow1Q+hWzDlODuPLusaf1++hR85dplAxGuhutVEfabRA=;
	b=nRVHfXtYPQhyLfFwm7f9CuAKTYpcijXkVq9/ZXVBoEBSA1c6tFjm1uqx1zz1r7L3fHBh
	 khyVgw1sCoSJ3IYR0qKZmSbNKYmz+DXYsW0aY6WNxx7hJ9ZzG8lQ8IBtBBd8tyQkIuLgy
	 no5LwwZkShwBZLaMrJcXurbP+fwvJYriYYHPLkHknmrb0TDkQx/k6jcZJihFmmoSGVUlQ
	 3zc9TGVZ8bh3WI31d10NuTXyE/q0f9lvf2s9peqpwHOkEXk+oPXou0TwhYOgut6k6QTqc
	 /Vlew3e0Vgs87eqGnrcmnBBj6ElgJVtRzVukz0+tf2elv9B7wzLC5z099Dac10iyn7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XU+u+Y1b;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFA5606A32C
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFA5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XU+u+Y1b
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f0634667aaso7565355ad.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 01:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795427202; x=1796032002; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ow1Q+hWzDlODuPLusaf1++hR85dplAxGuhutVEfabRA=;
        b=XU+u+Y1bVIkzE+Jn/7sv8BBlxJGNLKyIXYrYC+l4oPb5VV5mYga5Gw5+2XnC8apCGu
         J+E7f7u6opcU8EwEIQXrgM5XrfRdqHt7U9Gmr+PBhVW1/PIw76n8P7xecj52XtT9iq7P
         iX5v8uSxtp57pinHR3X/LSUEWITf6hLAu6PhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427202; x=1796032002;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ow1Q+hWzDlODuPLusaf1++hR85dplAxGuhutVEfabRA=;
        b=FqNsuLIpJ4v0/wUX2BT6nGDUziYc2klTVpNUNnAHAxPEnndV6XiFUyQHhEqKlhndnI
         bUzA18hrdTLkY0nWxwVJMUq9g2DDfFjo6vBZQZ+w42l+BbeG3bwaqnxjTy6cqi1x4Ftp
         c39l3bjzZxjnf9WdArIzQuc4AQAQJQVEHIY/IaA97RUqX9Di1M5gtrvzNN1V2LHF9+kr
         EObcsvI0iGR9Ewzzw0iohNUrcAlKntOuPNxq6SEhr0tS/0w36hjs4ElRGjJpgQkSH7eV
         nG8QNRg2+NJbsQBvLKwmuoCrD7FZpeAhifadiazDhi2qMfF7KxruRGSgX5eorme2LVBh
         GqIQ==
X-Forwarded-Encrypted: i=1; AL+hErFZ2ytDzHP255SPSIm9r3K5W4ThPwhCS+aEfTh3Zi1VOxe+NY4HQYONkSQMLLo2UKjANMOyGLo2NLTaZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8EUHEC/AvYKzcOMi+EH/FQzXCCXoe5jJAk6eL7k8s9lx8eARxf
	rimNKD5uOxkBMZ5QpBgMbwTn9+uZ4nlckXjYIQxoAHBVyuM/YP/BoskvNPifcBYEUfyhm97i7AA
	INfc=
X-Gm-Gg: AZFdTZcgZnxrDlWBzi5Afu5RjF8RA1VSwVrQeCet70ZhdvveNcWf5X66xhK78V3hXA+
	FuB/y8F2w91zEMWjcQV52hB7nDc6cDgkRFr/vVBO+i3Jj1md3726nySsuTRXqsLns37y1G6VWXn
	Qig2O0Wzsnhkq1f2KlVYQH1zfAGVAPyF+tgYPuX87eAbjNdQjHxX89sKlDN1Uwzsd0Oikm0aYu8
	1cFoMcMWx0/tYSXA0JNk3KSwS+lhNEgTrcaOzzwwr8Wsbs2/a+opt4ZdR8141xOBUNrlMwZfG4O
	CjM04fgwA7OjxU3lpRIXJStpXi/MqgCXmxRh+6/EEC1+MRUnJkfY/uyn4fxCLCuRLkxugVbOBjb
	RRmzpVb5xLySnyGqLiYMM80sWNX/LSoRw5su42VM4OUU/C1dDeaKEdthNcE83SC9hF0zQqaO+9+
	mkqX9Hs4bWgLCsBQEzDd/5xbFfquAekKna/oG0QU5WQDcVn4GzEtTFDDxZ2CrJBXs0pvyyudBhE
	BcS/sKmJWkcNGq13Uf1WXHRV4iMqkQ5VeMQyzEGY6bD5T+QU7jf4X669r+Len34olWfYp0GaRhb
	8s5k1Ye+fqvaoWRKL0FNvYUUfKDfMM2aAUnqXocC7LqWj2/+cMh+n6Gll1a1ISJCtH1uBw==
X-Received: by 2002:a17:902:fda5:b0:2ed:fb0:bfd6 with SMTP id d9443c01a7336-2f031e08699mr93319225ad.11.1795427202382;
        Mon, 23 Nov 2026 01:46:42 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm49341905ad.21.2026.11.23.01.46.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:46:42 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38564b4b017so3313709eec.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 01:46:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE8trGnds180Wn7P5kdHK7cAyAYF2k6vvF4H8zCS2pXml64xXXBSUH0n6s2DIeTUxjryNVA6rqsHcPoYQ==@vger.kernel.org
X-Received: by 2002:a05:701b:21cd:b0:1b3:be0d:696c with SMTP id
 a92af1059eb24-1b5567e661emr11015754c88.1.1795427200278; Mon, 23 Nov 2026
 01:46:40 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122184500.7c9f2e1a@protonmail.com>
In-Reply-To: <20261122184500.7c9f2e1a@protonmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Nov 2026 10:46:26 +0100
X-Gmail-Original-Message-ID: <CANiDSCuBmdKTdCuGp6qxQZC0tXbZ+iEimnkw42wjw9G3ukOK5w@mail.gmail.com>
X-Gm-Features: Aa3M54oXNIs-f5o3vjrQJVELrHbbr79FTM5LygD5kvlkzrngvrhAxhUUIoxpkSQ
Message-ID: <CANiDSCuBmdKTdCuGp6qxQZC0tXbZ+iEimnkw42wjw9G3ukOK5w@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: add device entry for Logitech C920 (046d:08e5)
To: Bob Summerwill <bobsummerwill@protonmail.com>
Cc: fernandezfernandezpol@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bob

On Mon, 23 Nov 2026 at 00:59, Bob Summerwill
<bobsummerwill@protonmail.com> wrote:
>
> Hi,
>
> Field confirmation of this series' diagnosis from a stock, unpatched
> kernel, in case it is useful when considering the patches.
>
> Device: Logitech HD Pro Webcam C920, 046d:08e5, bcdDevice 0.21,
> directly connected on USB 2.0 (no hub).
>
> Kernel: 7.2.15 (Arch "linux-omarchy" build). The camera has no
> device-table entry here, so it rides the generic UVC catch-all and
> uvc_no_drop_param is at its default of 1 (deliver error frames).
>
> Behaviour matches the commit message exactly: intermittent gray
> bands over the picture in applications using strict JPEG decoding.
> Setting the module parameter nodrop=0 -- the global equivalent of
> this series' UVC_QUIRK_DROP_STREAM_ERR -- makes the artifacts
> disappear entirely. With it in place, 300-frame MJPEG captures at
> both 1280x720 and 1920x1080 sustain ~27 fps, with per-frame mean
> luminance stable to within 1/255 across the burst. The camera has
> been in daily use since, artifact-free.

Can you share what app you are using?

It likely needs to be fixed to check for V4L2_BUF_FLAG_ERROR and skip
those error frames.

Thanks!

>
> To be explicit: this is confirmation of the failure mode and of the
> workaround on the affected hardware, not a Tested-by for the series
> itself -- I have not built these patches. I am happy to do a real
> out-of-tree build against 7.2.15 and follow up with a proper
> Tested-by if that would help the series along.
>
> Bob Summerwill
>
>


-- 
Ricardo Ribalda
