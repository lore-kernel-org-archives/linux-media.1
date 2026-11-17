Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938207;
	b=r426JIakc+RTxnovkYya2eoM/fVAH4JDJf9BF5/A94uhQ7tl68eRsc2wcRxnbFC8SkO3
	 uzdcnSaHhlGR+vSagrv3RXbMT1SMh/UmO1kaNxuK4leWSJt3WGPuES53jTIvfRrPalt+A
	 eS9I8T0N4qCLPyhnaz1Tb8nNNO+FGpNtbVpNMf/r5mSORKr6yMOG9Zh6377UO0Z8Dxbyh
	 DHWWvD6xZciUi6gnzk1HtK6ssO4f7g+543hRb3n9xFOLzuORYqxP1Ul1VL3+OvGj1C7rs
	 2hi7JPMma9ZUmnXUVWVrtMbfyg15nCW9nc4XocUOpF/DFJX+6160RjwY5mSTF8YQQow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pD8vNDgtYkqY5yb1vjvicd9DBKj0i2pqXmdMkGJ2JPs=;
	b=dPZpBDgNlDZ+1mQe4wuzA1RRwqHywe4hsyoKDspIVGrLEq22CbBwyNVUV0ndFOHCvRpr
	 Wr+nkvddP5TYsOn3cmS/PdSeRWcci/xL2C6QXxNvV2YuEKaQC0J+j9HdT4Ee5FMY5oZ2V
	 dlvGh0mxJ+a9cL4br6qJJAjFP62aGQKQTqGDO7q/6aV7N3C2CFgXgX2XkkDUaAgSgcvOn
	 9UWEdCYL0h0ZMt9NafAk3zS7plj2se9mYiaX5QAvMZKa0HDNEZtRXEbgOI1aA4BnM3Noa
	 jeZDUeUnc1r7kJJ85g1y20R23hpBBI0HpQhLZi00QBfsqEppvuzkLpJnUVm51pLlY7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iU/sirU+";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A249606A895
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 17:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A249606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iU/sirU+
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so1607225e9.3
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 09:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938206; x=1795543006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pD8vNDgtYkqY5yb1vjvicd9DBKj0i2pqXmdMkGJ2JPs=;
        b=iU/sirU+F0zi2E3I7tubksI3ZnG+s1ky371W+kT4xc5sPQdCBLussGOH1HjbBjS8ng
         pDIHHQktP4m4tUiIiarGkzoaBU50QCthCYedutBM4Fajmf61YCNwkIY5LMM3Ds+WiCwJ
         wT36xAr+PLyUmdEIs33GRNFcnK+CXGyNK9QqRUUZm76pmunhUS/wGSgPl+IjxKqi4UWj
         c10sGmJo1V7Jhagn7LgBH/j3hxAiEybMJt4MwUKxFpoLIH9dWms5ZlQKilNWcg7Md7fX
         G2BRKOVQo0OOHMVX1FWrtGtngNgqfSFdtCw+fHv3g7DvLF1HfWM+0Xp/i9l+iVZBiz/f
         bHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938206; x=1795543006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pD8vNDgtYkqY5yb1vjvicd9DBKj0i2pqXmdMkGJ2JPs=;
        b=hH27tM4DgVLXUdqEGZf7kpUBfhFFrszoPOVL5ztkVw6BzOVzun309j3PWyh2OyjD/Q
         z50r37noOaFYRls+Z7VbZqNHMiMUznUW9e+lGa5cuyOJ4FteQU7SJlKqN+Tp/rkEmOfQ
         eKkZvT1KtnmbspNvDAeHf5l+9Vp9GUWmEHTPWb2MJXUz0Mtu4dkT2tZZO8jmFrUH9nSI
         kZOoPWVypnufJ1MouB5S2za8BrfztbSKkdXGSH7UbwnniUtSgFeSiG+5KaYZcAhf8Wfx
         rvqEOdJEe58DehSrn1SzJV5zzRErnt5wAQ2lSfjywVTy2uO+j57P70goPiFpYrMVVz4O
         3cwA==
X-Forwarded-Encrypted: i=1; AL+hErFAjBED4pAGrc7DpfK848VJUaQRuqRJjJSkt2hRPIv74jonABMRB4uc5ao+mnmCLtQtkUj8MQynMxNi+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9QUNgMfN9kZvEA5CqFiR2RTfCEQbwNHZgRXREMVYe5plOdPrdJ
	XzvQjYxWxXSHtHsTot0k/wGSsgSi+RVsmCB08culLgIdoRK3W/xjzWIy
X-Gm-Gg: AYBFou2dYnZPCxmMs+ItU7tauVoJ4eGzPeGDSPmHoDw8u15tsbXyCOkNRFhPgxSTl4u
	JeQdBElS5QxwOuD6pfL3TuCoc8vIWM/r4FVcREm6S1mT3VScWIuYiKLkiBOToqyrX51IQM69eMr
	Tkv7inAG2eK7xGgURnYN7yoivIiTiwyq2GO5J7y4z+skBOq0APe03ZsjhzZbmPOz0LigSyHlBV9
	NVK7IxUnpFCed6Kf+XvkF0AG334DftbudBm0cql4wsSXN7+dMKsdjvSglBdKVdkNFG2/6JldIQH
	5Pal0wB3UHbxmq7xheCkJPvvArTuDZr/aYlfhbDYkU6HBofnY2VbifYQHCBdskEbhOKej/Prq2G
	jilh6eM624Bk4SixQvcuyDLq2kpEA7W1I/SxWla2H4ZikwIMJ9JtcBfE3b02hiUMFmNZwyFtnPb
	bQZCL4Lr5EF3pjaj3wr9Fn4A6JPzc+mJRLSzwaEx3PwqGuyqYw47180QsojU/5F0KMmmKBMf2me
	so+jgxhCnf95Gf/4qrWZyOawjKsnEPcy9u1nNNjwNZhG5KDq/KMF1KqyWlbt3S3SWZ/MeZ8etRA
	V6SHGPZjDr/SBUOTbPTPyPB/JvfOTolHU/coOFe0lrlEXw==
X-Received: by 2002:a05:600c:8b57:b0:4bb:6118:4f57 with SMTP id 5b1f17b1804b1-4bb6118533emr268214555e9.18.1794938205744;
        Tue, 17 Nov 2026 09:56:45 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:11a1:dc8c:1ed6:51c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b74d6sm1292895e9.9.2026.11.17.09.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:56:45 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: andriy.shevchenko@intel.com
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: atomisp: Don't enumerate frame sizes the preview pipe can't output
Date: Tue, 17 Nov 2026 17:56:35 +0000
Message-ID: <20261117175635.11790-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avwtA3b3XMkGXPfZ@ashevche-desk.local>
References: <20261116175750.21905-1-volodymyrchapman@gmail.com> <20261116175750.21905-2-volodymyrchapman@gmail.com> <avwtA3b3XMkGXPfZ@ashevche-desk.local>
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

Hi Andy,

On Tue, Nov 17, 2026 at 12:31:31PM +0200, Andy Shevchenko wrote:
> So, what makes us stop implementing the crop support there?

atomisp only uses its crop path for sensors whose driver supports the
NATIVE_SIZE, CROP_DEFAULT and CROP selection targets
(atomisp_init_sensor()). The IMX175 driver does not yet: in his review of
it, Dave Stevenson suggested that binning, and possibly cropping, should
wait for the Common Raw Sensor Model. Once the sensor supports cropping,
atomisp takes the atomisp_enum_framesizes_crop() path and this code
is not used for it.

Even with crop support, preview mode would list nothing larger than
1920x1440: that is the largest entry in the frame_sizes table of
atomisp_enum_framesizes_crop_inner(). This patch applies the same limit
to the non-crop path.

> No need to repeat these two paragraphs, make sure they are in the cover letter.

Of course. I will keep them in the cover letter only in v2.

> TBH, this feels like a hack, but I'm not v4l2/media reviewer/maintainer,
> so I don't know if this approach is legit.

The intent is to make VIDIOC_ENUM_FRAMESIZES match what
atomisp_try_fmt() returns, which already clamps the size to 1920x1440 in
preview mode. Without this patch the IMX175 lists 3264x2448 and
1624x1216, and TRY_FMT for 3264x2448 returns 1624x1216. With it, the
IMX175 lists only 1624x1216 and the OV2722 lists 1916x1076, 1616x1076
and 1436x1076. Every listed size is returned unchanged by TRY_FMT, and
for the other sizes I tried (640x480 up to 3264x2448) TRY_FMT
returned only listed sizes.

Hans, Sakari, would you prefer this, or a different approach for the
non-crop path?

Thanks,
Volodymyr
