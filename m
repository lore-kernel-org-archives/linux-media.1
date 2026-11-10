Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310084;
	b=vtQTLomHoVizjPPlcF2efCBox9sOmiW4NVgXn2teeC5pkIU58mmcmyyL3+Fh9j485E6j
	 dPO8wVzxaDSoCcnZXJsph+Tgx7GFH7yVuVRIGPZF5qnnsew3ukFfBDj22r55zMLyJtlo7
	 A7mS0Np9wokK495dpPBq3S2dp9DBzsS7eK9egp8JQwORI1x6gZRvvZ9csNkJbKVCZMbmH
	 wwFKDaam6Vi7vkSKHTx2tUyy44JhmrVpI11XZnJysFg19or0+1d41HfJHuuE9PIgpy8Bu
	 0gBmGidMI23aqqwx3pRyEYuHtNvo0E4JlfLkbgPEpp5XbKHeSrVUIWMk3kygKxzryOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310084;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=+8SmpKfanibtqfQvPi11fKmx/q2tro7mfSWNxssCkTI=;
	b=bS86mmvHF7zH1RUS6S7TNin0o+nLzGmWAzgdutUgwZ7Qizihkd6pqPwQVPyGCscZ9V7/
	 kfLQrutHLpeDjdiUStL3Chb3JG4kpW1127S1hOYa0LBn7f7BzJVoXM+syaxXXv9VlJNdS
	 N6NKsh1OGNZQmCUKA3iLgggu7B8Dk1tYYA1S3YCV3AXE9ZsexiXmFi76flIQ/rDg3MUdu
	 2Wq9NortN2w6DVFNWYjVmlCFZJxZEIrPHjcSwVBPQDlI+SN6lfPdE8QolUvSPVPDUkG5W
	 WaaRc46k0M1By8VCrk6V35zOJCDJr/jfNAF+H6S5/b8Q+JlCWYHrTMYoluFe2blHTpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918D4606A31C
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 11:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 918D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a215e64962so21651945e9.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 03:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310083; x=1794914883;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8SmpKfanibtqfQvPi11fKmx/q2tro7mfSWNxssCkTI=;
        b=ZN2SwdsHq9wpdCvdnAPCC1Hvzfje9HmoYZ54pL082nRj+sy6a5NFStBZnMEt3S2pVs
         OqUXw9t8cRZIdGT+zpD9uvl0zP19B3JomWSkGZ8aHg3zfuNngdSjnjNW6YoAoFs+0NtN
         qJmKFB8vwBfaJDMZo76Yd7zKviJjRe9uc6idwUenzxKPa3/lNkmDXskMEvSFZ8+NQpr7
         EQed35yIOapzkU3/a45HzJnNCsDG0msRBWtyHVMFzZabVbYN+xLiDsvDjZACV/Hnt5dZ
         dIjMrLiFmn+nXLTqMsCojUs28FaYBNT5F3rmH+txTlC6hIHysdouYh6lzRTdI9aZsjQ2
         mcFw==
X-Forwarded-Encrypted: i=1; AL+hErE1572NUixIZjK/17xhotGWcHcumqMSXP2pmPgsCnIaq8Vf07tM3jBJQQr9S5SJjWwCSWt8gicYqxtGKg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sw9HcDiYmZIASjosGKdvZWBxRWefzi+gWjBd4FrwV3jtys9kI
	rLEkTtL47CCzZ0OBXTojVOTPAsHfNfsu+MpEb1VIHRiQAHSboZJACSDS
X-Gm-Gg: AYBFou3OfiBAkwROxGQr4dSgyQVfpcCrt/oGo6bOp05m4X5AFkFXyDgehHfL9YpYtJ0
	SvBp2Bfw+9f4YHsOFflSujuKPCjK7/+0Upsh3Xs7HDnZYfJljVzooIxU95ZzcOIycT5uHVWYM+J
	nWFDCdqesfAYdx2VHTqPAXHfucWgri4j390nHVMeVE5CMGwqbURqd3Q2FXXujISy3ShburYj7Rm
	sV4jTaIGhKLYU4vrZY3F2WjlaM0yM9GzSRCMmr8MTyD/Si6tsKsO7aeDXc3q9/QLVDQkYynJphz
	9v3f3e58GhnsTxh2Idua7KZtoE9h0x+Ym229VDYttFhAVBxfU/nPFX2Mdbru3486xdQpyp+FfLj
	qVevWtqkanzjGj7ZvrDZifywbsHoBmQ6EcKaDiuWMlsiKCFSOsyhlekqclnP9SzPTb5sgcJpWWA
	PF5mBM9ZnxibNPiOxxr8J1O7RuaMYmJPJRPg8Se1r6QMbstX+CNJveZGGFke7fC/s+lpVlSUF+1
	6U5DtqTUPpYJ7X1fszJF+Wnl80uA/1/jRouGB48kQ0XmqLOgkjM4O9Y+/71RmDT7Lv6Yk/TEAgf
	XprxyWnIAk9AqOv4rxpbsfM5gJxzHeV5mm+Fvbp0t3nsWhXFtKceIueBNni5NH5LIfeO5VTC
X-Received: by 2002:a05:600c:3b98:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ba02351506mr44181675e9.32.1794310082728;
        Tue, 10 Nov 2026 03:28:02 -0800 (PST)
Received: from smtpclient.apple ([194.64.145.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm58644735e9.2.2026.11.10.03.28.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:28:02 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 3/3] media: verisilicon: leave room for the JPEG header
 and one stream burst
From: Sergei X. <shomenkow@gmail.com>
In-Reply-To: <d8ba9d67a9452bc44be219d5327aa9d7ad83275f.camel@collabora.com>
Date: Tue, 10 Nov 2026 13:27:50 +0200
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <46F3E2B2-AE47-46D9-BD41-6970B58763F3@gmail.com>
References: <20261109-hantro-buflimit-v1-0-f0b86ce61e66@gmail.com>
 <20261109-hantro-buflimit-v1-3-f0b86ce61e66@gmail.com>
 <d8ba9d67a9452bc44be219d5327aa9d7ad83275f.camel@collabora.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

> +                     max_t(u32, pix_mp->plane_fmt[0].sizeimage,
> +                           fmt->header_size + 64);
>
> Did you mean to align to 64 instead ?

No, the max() is meant as a floor: the 624-byte header plus one 64-byte
stream burst. Patch 2 already rounds the stream limit down to whole
64-byte bursts. ALIGN(sizeimage, 64) would neither keep that floor nor
align the stream part, which starts at offset 624.

