Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794294741;
	b=2tmVSRjKNVnAnvVtKLCy1Hog/CzqNp2/iLe+s6jaUVIepDS7PQSBYYjFCr1PVbL1tw7P
	 y3laG/GeBVqB4Rar/VilSPqJVGiYy+cUliA4xx9qEZK1a7sNSC1ETb3hC3j6F17uctWj9
	 +UiBefEn+RsG6nl6/98BDC7bQ0YPg7gUF+CaE4a0YceRNqlLzSZMEDXLyiI+IzaSDjAXC
	 WnoP/Abcp1ikklo3B6PWA0DlWoeg+GirjWZjgp0oydZJnvPM0GVG9E38KcW7zCboVh2tK
	 pybAkBYDYeAt4jFfYu/J3BPqc0Yb3DPoIIs8aubuPCvazOnPYutOevngNJ6h2BBwxFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
	b=MaIgLQ6/q6YKwmapQZI3LzuSblk3JLSHm7GPhlA9+dtNz8EJJtuWcgBX8FscMwRSxBVM
	 4PS+4yIphczllccGIjNLxDhd3Uf2EGlwFP1gSl9mORiSYk/Sfj0ecVgmY+8Ihax3uMBMU
	 tHD96GtOmFZvTV4kV7NMOXhUUealyv9d2OPnPXD30wxESsCYXZ/UBLKjYe/rBFFLC1FcD
	 1vldjOchX/J4uqEcnz3JpM2tuYGLG5S/fINTMv9UIwQ3y0K0N3Xn3mIWxiQmBrj7pBRPh
	 Dw125xBbrzsKXDi7wqiDSblEyGuGnVCWDTwV4CgavJj7OwbXmLgTz9h29LIgGJ1/IKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="fbla/A9X";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5E606A321
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 07:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A5E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=fbla/A9X
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b10d24345dso17001807b3.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 23:12:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294739; cv=none;
        d=google.com; s=arc-20260327;
        b=oOZpsvCW8Pr5MLjp6gC2qWwhV4JR+Fu9hC+eTZOZaRPw8lF490zIITsTeuNGuevEk/
         49PVOCVmQs21aZHtNVDRl5YU2dzq9mp8BK4uXZOXTVyTqWMTy7LiXi7FhWdzLCdMnPL7
         WCWmkogANa33tSRRIC0+BsGlxMcvN/hRdta3R2qDspEuF3xiUN0lUyyDi6FgXs8nV1Zj
         iopb8kpFWNrXciBu30QJ7sBY9NKL1Qij+krxfxnSxgSiZpClZAZCpVgRP0uaWQsbuzA5
         eAaqTqwnqY3NQSRUQEPBak8hJqBt+crsGnGWhRyHXmjHwZ/25UINy11UL1qUaR717DU+
         5RRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        fh=HE/xN5Q3RANTnxyjGWt5Dqbf2t57QhFEQ/sY68xROAk=;
        b=oWpKaySaR0aGhRIlzTFghuM6J2HZCze9ENxr0MIvFZv4vUASvUBRpt3+Ymie6QqKl1
         8to72dSCuehxHqxQBcfiKTIkgKzANojNYvEeS+1AzpXJ0fH63JLrTN8062v00oiL+m7w
         k1NVeBhRgGOKnLyDTbXOgTC+weiZNUcH69AFkdqDm9XiBG6djczOcPwyKr/EaRVVqHpV
         01SW2+erw0nS5IUyswEQWLvqsfvbywddm+4lFeGcC1g27zpk5dgIMSwDBPU6/JCb3Mzs
         wnMgb83aDdC2VNhyBh/rOkcUiBoIOq7Qe0E+tJ6tuQi4sZCZ25/NQMg8jC9gvDhMxtwn
         Fmiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794294739; x=1794899539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        b=fbla/A9XlF/lOq2bcG6iZJPCqOGC/emuDCdTn1krs+v0qAsMuaTyS80O3LxALZZmIb
         xjDBtyT5AkLFFP1fIRpXPJDwqGMFDo8KvTpFSfFW9kBZyhqqE+r6kjNTvb4m48XHzmar
         vDoxjsCGVnyLYnPDthxKh0nVIe+czDQ9Rx/E1sc4mzTpy07fjkputPxJk2GI45wlZV3y
         7muQnqIgNYGyAiny0chTZlUz5JSMyzsE7WbaSY8NqcuHN4Ucm8uMe2C/MVMKu+xgghP5
         Aoi2rVgCbW2QSyRxNa55wznfOwYZv64/7fGeGjO5sZ9Vgv7uAXur6s7ubM9VZMUCTPHZ
         EOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294739; x=1794899539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        b=gZnirKU95oALQa1rZH4/P4o2JdY14gf+VT35W5b5WdfVMGQ0Zl54N3qIenweexgzB5
         JJchEUQqb+yPiPJgSOx6uR7xdeDx74a4oPV7EECao1N//pERBg+UOjNupMmJrncBRKj2
         MnFYNq8KnakxuNLUv/S3WRioVu8Kib0V+Nfp5y8D9hgrAKnLtLCvITy3sngZoTHxwyOf
         EW/JbeHZFyYPMVJDGJ26V8q6akcVSNNFVjpE7evvHhV2+k5lMNsch82iZYEtrlyWzl1y
         BcAXJCv2p2aiciqOTvYhcC9xycZb5M7TYg4D9EyWGBTdD+DUgjIey6ldKCCHKcFf5iKC
         +f4A==
X-Forwarded-Encrypted: i=1; AL+hErEYXEGszTzZYn9P6VZ2hk4oWKB/C4+EJNGpGm7KqNGom+eT7P1wjar1fGGOgMag15cmM32Fa1FU1LY7kw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8O6XoPYMRFkcN8EOoei0yN3y0NuqdhMvjC7qgnGhIQ/blKyZ4J
	Qfu/ho6Q1EIXnyXYtG6Qp32KmuB77t9B2Gg15mhYJtL2HaFkyQHeoTW05C8yg8m85cnqdH771+X
	7/UyvEKQ2XDrChFeDBAI2o/qgc8Fcpm4=
X-Gm-Gg: AYBFou27AaZqfGEQhaOcTgWGeiJxk6x1cG4hThKivxH2DrgzXI7WBsP8tt/7/YeGZm2
	1vX54fsqg/+fWbTCx/F3BGpayqd0fT4ZwZ7z7NZ3sTebD/au+yIA6WD731JyXEUvKMuNESjwVcp
	/XQ/tsYaQFzrdO20uE2MFl/ClsyqYd04zE+NY/WVjCYRTyR3dmoKLuCO3Qsz4kABdelZv+Xvb7A
	r0OGOVCDzL0NEA3YsVRKFO9NaWQsHPePZVg7nXtc7iYwHbz+7OkBFmvEBJGenj5nbzOxbIdFpsG
	lfrjMqDfNVC4IPwQiBX6EDNRC3kaExC9PMe+ciRnCGFxIp9uUZZvDzPdcVEjXxPwZUIV2WBUCDQ
	w3g1xRAgJW9gFgbOTttXsp7J0r6HzBVJCFyqP
X-Received: by 2002:a05:690e:c81:b0:679:96af:e306 with SMTP id
 956f58d0204a3-67c568269e8mr1104943d50.56.1794294739207; Mon, 09 Nov 2026
 23:12:19 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at> <20261106101954.46907-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101954.46907-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Nov 2026 08:12:07 +0100
X-Gm-Features: AclHuK-NNQu1JbIxB1uGpolHVv_SmZbveDQeysJSYIv9CiWjgRe7D4MXv9gg7C8
Message-ID: <CAFBinCD5aQ_AsNxELgUd5yzXsghUVQg1tuGtVvF-bmPx+AjaUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: rc: meson-ir: allow the receiver to wake
 the system
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:20=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The suspend callback switches the decoder off, so nothing is left to
> notice the remote and the receiver can never wake the system from
> s2idle, where only Linux interrupts can wake the CPUs.
>
> When the device is a wakeup source, keep the decoder running and arm
> its interrupt as a wake interrupt instead. Boards without the
> wakeup-source property keep the existing behaviour.
>
> This does not affect suspend to RAM on boards whose firmware watches
> the IR receiver itself while the SoC is down, as on S4 where BL31 wakes
> the board on the remote's power key.
>
> Tested on an S905W2 board in s2idle: the power key on the remote wakes
> it; with wakeup disabled for the receiver it does not.
>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
