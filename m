Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943018;
	b=ANFhEXJL3SLOnkcoGV6cpZ9NxPFlR798M28pDniFPDTvllOUivBUTR5405TBTmuDiiLN
	 kgJd/89LcP4RCX8/nNE20O2Fsm6nSgGSKCcRcDaeVJb52RVgM7CPfxAwgVF4P2PfO9w98
	 aQXvNhN9Tg9/Hy8iOwTmIKS0QYTEHjPyOJdYgn5UxjRyDOO333i2PsMFB8AbN2zu0ChMG
	 K+2J1MlN8mL+5F9XP7EbMl9FU4YqyE+BH+cBAhMMIxBnKUSIIJKNaFltlux+IB7sWglth
	 qTX/VIZKDB2JOXLpXjVhT/VquLMqELHNn0tfk8UKVLYXutMRwwDcA+r6xsyPkjla12w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1FUSnHVHcPId5S22oV48SA/we3+CcYQkvgHylRUM19Y=;
	b=El+7pBJZyfrMnezkkrmglylOQR0EGF3oMeDhSvLZpOFxWThCcBv/aSkdcBG6iZRpw///
	 /FGz9di4GcJOll9hlhq4pQ/DD5yh7peZpBst9PMm0bZo+a9K4A+vJ+hJrfsXukBYUJaEM
	 OrsaY76cmi2+lOhF4rQBVOOLtZG+9B5h/zGLuenwYGv2BXdVjLmo828XH8zj3HP6GVX+z
	 0Z1CjjpkNeTa7lNLq9mZJSnbIE1YUeVv0Zbex2wQS1N9kcd1DrMWTHHijRbpknl3fCOBm
	 FAu7dRH+W/IaxYzC/rquB/TLuynPUuy9+ES27ogOQGXHFa/psQLbIJJ5NLNd3mmy2hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="V/j3H/8D";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3A0606A31A
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 15:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD3A0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V/j3H/8D
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1348407f8f.2
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792943016; x=1793547816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FUSnHVHcPId5S22oV48SA/we3+CcYQkvgHylRUM19Y=;
        b=V/j3H/8Dz5yLeU7UEx/pte6igWWrj/on7qHbW6xsFqmrPtH4R7BltZfiW1b5Gyouap
         I0kx84ObUiu69I0LcUakgsYPWtHFCjrz3lMO5DrzruR2Hj+2bIq7C1etkFPM6xVZLBRm
         mEqzTxOT2QzrZDdhOctA4UuYGvDwy55WIsHXFQPi+Ddq1Idm2XOMogZqcMYekVca1sxo
         oHFga/vBmUflb7OLjiIWxg/UZTkgO8O/0dKZXQ95Y7MjK8C0a9uK7EB9+P6woMmdjskO
         bxKGtHRT3c5kxjYaZ/DDcqtBWTdkehE5Uy8GefeOg7sp1pE5WAbLKdKqNDX9Quu2te0A
         CvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792943016; x=1793547816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1FUSnHVHcPId5S22oV48SA/we3+CcYQkvgHylRUM19Y=;
        b=XKRd9XRs+0jO81iX1y2NYAGvHhznVQXm0WvZcTLMOahrhPFrcvyq/53T2hIl/8j7Bs
         lLZ2vtJEgs0d3vMS0b7ZPJVQokTp5P9Hk3yX9rWAkt45u+Ty00pQStZugA+wOKPpIksS
         qqAlmnkBd+VUByIDR4U8qeMV5CT7ywVks73c0wVargDoCf/1FVmc9NuFFYSxwNQKIFPA
         074TnqdxgDc36FSbfusQ5Jo2zU1s2oI8uvEqbz5AVtQ1PNu/oAA7NFodbj9UB9wb6pu+
         eZxK3jOucq30uTYSPFCfuARQi8kXQMTJ44+jh18Vgf+cllkpz+FCgmPR/gigJvvPWkZr
         IWxA==
X-Forwarded-Encrypted: i=1; AKwUvBw2lO7teba29/U6bAaugbA6mUQqOv/GmsCai3RI979MwIKTX7P3EB9ClHpA1G9wr8CXmLWaAXWxkQb9Xw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKHy97WlPwoDAVPK51722slFx0YhTf/KmINz+t7F0OLbSmn0KGt
	fYYxoSEB+hWVKmO30VXChZH4JhZLXFMNN9a6Y9luxR4vB32+pIviQnLD
X-Gm-Gg: AYBFou35BHXdbd6rnuOCpyOzn8x/cKiZRooDLwCzAztEPWcabT5AW8jufhackLSWBlC
	yrFqU/JjXhfquZ5wUxflAdG1Jp4Z8tyFo7u94oBaEbHbebu8YE+Q/Gpz60xteQ/SC/anwLgPtII
	+vhktTcYPT2sEXIKCO1lwvoeQpgpgibyhZXKl/M8gtN5vYzNgzcmWUJH2s2cO1YwBFmRrIUS9Gz
	kM83nHSxjNwwvGyjIQsF4wikkGdW15EqGHMEi47VwmewznwWAik8ly09RC0MAN28t8yKFBuIPRE
	AptjhoWW/4WeIjQDofpFFhFXFCqtxTsQMoVUhrs+dOmLE3VolH5UH10wIhb/clvVFy36yoj7oec
	cvmNjWjmZFSaKIQGLxYCfQpERSUKBuSwwc9QSF8b2DJMxLnlKVd04qQOR+g5NdfsLmKBtEFKDAJ
	L6nBTQsNB8CRwkTcnIaN4/GqT0cD7O9YUqo1lOmbeWSJitosO4PkZPl6U6sT2jrVJN0CKDlfkib
	33fU5uimDQkG/j6RuYvQSfYMjYv/HCKrAdBFVhRI+ztvX8fyoJz2WKvyKiR6WnBDrD0CexUgXVK
	yOxtRvG+UxcWMQ==
X-Received: by 2002:a05:6000:41c8:b0:48b:677:f80d with SMTP id ffacd0b85a97d-48e3eb83fe6mr8660776f8f.26.1792943016228;
        Sun, 25 Oct 2026 08:43:36 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm10533498f8f.34.2026.10.25.08.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:43:35 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Simon Kruse <simon0x+git@proton.me>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5693: Support control events
Date: Sun, 25 Oct 2026 15:43:31 +0000
Message-ID: <20261025154333.34707-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010142042.23253-1-simon0x+git@proton.me>
References: <20261010142042.23253-1-simon0x+git@proton.me>
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

Hi Simon,

On Sat, Oct 10, 2026 at 02:20:54PM +0000, Simon Kruse wrote:
> Tested on a Microsoft Surface Pro 9 (Intel Alder Lake, IPU6, OVTI5693) with
> media-committers next at d7e7bca71. v4l2-compliance 1.32.0 on the sensor
> subdev node: 45/46 without this patch, 46/46 with it.

Same result on a second Surface Pro 9. With v4l2-compliance 1.26.1 on
the sensor subdev the one failure is the same subscribe-event test:

  without:  43/44  fail: subscribe event for control 'User Controls' failed
  with:     44/44  VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK

The front camera still streams at 28.64 fps, as without the patch. This
machine runs a 6.19-based build of the driver, and your patch applied to
it with offsets only.

Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IPU6 Alder Lake-P (8086:465d)

Fernando
