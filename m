Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BA64248A0
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380559; cv=none; b=dRae5t14hYfjXV4lfew37ssKTDs586g7CHQ10X1jnJhYObDVreQCGDU3rTvBBHgS8wr45Qro+0M9rruRb1vjraOwidbOkLdG9/vRFgopsMlPwLMOd0VvWQMqS3KhTRnJysuRaQurjRK6mPkaaNtpWOsQcs7AxgxQY61mfvFxyUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380559; c=relaxed/simple;
	bh=orZaZWZGvI1tCeE19P5a3V+UTWdeZC4NNvIK0PHV8PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rxHxLRP4rk9qEbbJ0teES45MllYv45BHrfY7bFbsj4jjd5TAjpYNhEdf8Ew2ikFEuxlSXsBECZ4Sppj4FDRb6NXJ7a7fATqDy9vgbogsVx7HG0vRrOqqZDfE/9F9SjY/zky2vVxgTFB3/gEE0taNbo+4QSLAePNQyiF6pUEKrNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Ujm3Wpb9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ujm3Wpb9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49e6deb520eso23505135e9.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 03:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789380556; x=1789985356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KiDtW76OrPQle4sNBKcnEO0egtcxluIwtMmImWhO1Fg=;
        b=Ujm3Wpb9vKVRXQ7UVUt3zGe3Z9tE9l0KDjPNBvMzeuG0XLYoG1EyHijUIVV1xN+6Dt
         ibCVIth/1LR44ZNGAFi34eXsAgIqtIqCIeO7yru5EY0i1Nh5KpCKy/LpGSmQJtvS+rtP
         0lux8uLoSPylhD61f2nzAZbP5CrIRo4gRzw3g3oRJU1WN2tONcddYb0uJeChDzEkQ0XU
         8WvgKobntcVR2YA7Qr8/eh3CkxFa9WJqrjX5wcntZeznvITVXmznCLs6tHAV3oDBEvJh
         OMCKPb9wMQ3e6Mhr1bkyhSS3zh6c4p+lqGtWecIFjC2HsDmYAvzwhISsDTnPu0sIrYrf
         55JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380556; x=1789985356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KiDtW76OrPQle4sNBKcnEO0egtcxluIwtMmImWhO1Fg=;
        b=RB0XFvXWmTuHYctZPYIvCqBPtYTQ2F79TX2SyT0K/gJJGRcg2x8b31rgqVzXNu6lMH
         GEQjlhlkPU4Tlj1nKYKm6nlzqbALZMSRSdxpr5YdosbjwWP/b9j1zhLlyeQoeJqvFNvL
         z5toTsbUD/Wc14pJqjsmOeONOqL08A6XXVUSAal9EcZZfd2omuISBd/mmgkQpe1ZlIMa
         5IIP47gASy1vTwLb/Ht+JSNcxQv9DWGZD/KPAZeCNAxnGOajXr+8y4PtIRSX4w+iWqZ6
         Y4mYcNrf2ahXDjtdperVgtGs7gnXZSZ16FGbKE9b6kVe1mBXk6c2HXAEzSma89/GQl2w
         vAkw==
X-Forwarded-Encrypted: i=1; AKwUvBwqv1lKTLcWxstr0tChcV6IGMGmy6ldKkWxZ6v3ST22X+Obj8b9hHCF/Er55CdU5LbkN6ZSkDoMusqXBg==@vger.kernel.org
X-Gm-Message-State: AFuF++mTNbxsp0dC1zbgARMv5nNQO0MV51/j+H/KBTepqhjdnpN819oT
	i3g3kLF+W96iRZG1Wbr8wxkWrFxdPX2Iov3Rz03GgOMZS8krIY2j0C4d
X-Gm-Gg: AYBFou3P+zr5+qkk618nchk/mMagDVgw6pjT6ntpYH0krWOuLAHvn7KWa7w4MeuUmHq
	MEFSE5pEmU3J0bgBgmZhjLnc/xjHb51n1QX+9HKCB+0PCABlvkvnNlb+KtTz3t0OrbygoHmuQvc
	g0W1tCnAZY21Spy3VyMzV5y7vttC+QF3R8oCGyXS20tzk2wWuMT0P8UoTxUs9/Mnrrw0XlYMaO9
	gvEC9Z7A9/1/VxydW8tnra+rEWHzbfrAzBHaKrIFiYz6UoTM0zwEzdV5xWCv+JMZl0metgvL1dM
	voT1/vqa5Ln0vtbksCZSDliMOWgZboGY1lxXkLw2YRri1GmioxB04kSOn6JXe9/6cxqqLJ9PQsj
	iyEJfsHt4SF+3b/QNZk9wHCGj5GJAj0bsmaaqdvDcFHMGB7r1mEcTXZ2FZNXI1Q7VoajI7u6+Id
	QQs3fp1Vlw+1JAewA8Q3i7F7Q9Z8Uofv8lZ46nZCrBLIuem2ZgsjosurIB9Jrk8N9Rnqm3iQGCL
	XdvvqZMD9vnfmDIJT2UyJwi8E+RnJs7Qzk/mwTErkphmhrETtXeHrBM4tqVZw3MMivyxuI3rA==
X-Received: by 2002:a05:600c:19cf:b0:49e:73d3:78ad with SMTP id 5b1f17b1804b1-49e7a6859femr20731045e9.18.1789380555982;
        Mon, 14 Sep 2026 03:09:15 -0700 (PDT)
Received: from omarchy.lan (p200300dec74de0474f67e4b61f2de2c6.dip0.t-ipconnect.de. [2003:de:c74d:e047:4f67:e4b6:1f2d:e2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm458381205e9.14.2026.09.14.03.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:09:15 -0700 (PDT)
From: Manuel Knitza <manuel.knitza@googlemail.com>
To: junjie.cao@intel.com,
	miguel.vadillo@intel.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: hpa@redhat.com,
	regressions@leemhuis.info,
	spencer@omarchy.org,
	regnirpsj@gmail.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Manuel Knitza <manuel.knitza@googlemail.com>
Subject: Re: [PATCH v2] media: i2c: cvs: Get the wake IRQ without claiming the GPIO
Date: Mon, 14 Sep 2026 12:09:14 +0200
Message-ID: <20260914100914.230246-1-manuel.knitza@googlemail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913133017.624919-1-junjie.cao@intel.com>
References: <20260913133017.624919-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending here at your request, so the tag is picked up with v2. Same
test, unchanged - v2 carries the same code.

Tested-by: Manuel Knitza <manuel.knitza@googlemail.com>

Answering the DA16260 question you asked in the ipu-bridge thread, and
giving the tag here where it belongs.

Dell XPS 16 DA16260, INTC10E1, ov08x40, linux-ptl 7.2.3. No spk-id
conflict: all four CS35L56 amplifiers bind, no -EBUSY, audio works.

Note what that does and does not show. I am running your change, but as
a DKMS copy of drivers/media/i2c/cvs rather than a kernel build - Arch
derived configs cannot enable CONFIG_VIDEO_INTEL_CVS, exactly as you
described, so the Omarchy packaging carries the in-tree driver as a DKMS
module and applies this patch verbatim on top (omacom/omarchy-pkgs#418).
So it is a test of the patched code, not of the unpatched driver on this
model - I never ran that, and cannot say whether the DA16260 would have
hit the conflict without it.

The rest of your analysis matches what I see. With vision-drivers gated
out and the in-tree driver bound, the graph is as intended:

  intel_cvs i2c-INTC10E1:00: Quirks: 0x7a (VID:0x06cb PID:0x0701)
  intel_ipu7_isys: bind Intel CVS nlanes is 2 port is 0
  intel_ipu7_isys: All sensor registration completed.

"Intel CVS" sits between ov08x40 and Intel IPU7 CSI2 0 on
/dev/v4l-subdev4, the sensor enumerates and frames flow. The
manage.c:1502 WARNING from the out-of-tree module is gone too, since that
driver never had the IRQF_ONESHOT issue.

Thanks for the correction in the other thread - I had claimed there was
no in-tree CVS driver, which was wrong.

Assisted-by: Claude Code:claude-opus-5
