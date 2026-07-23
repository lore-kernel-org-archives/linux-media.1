Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6395047FAFB
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 18:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832751; cv=none; b=JCaR6YVqlxxHhebrkuEads5wSEcl6C/IpTpKueZQhp9e5f0lkALuzcwmfrfrMcalhNgy8FKZ3zPhOCitRWttYF0aCCkSL0Qk7UReXm9FwDCb9OO+ZnlX3bptJPVX9cI8AY8FB0ioJNLR0Q+4Up6nbB57Zur5UPiX6uJnK8QJrNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832751; c=relaxed/simple;
	bh=jtb1dfPMaoreKcsQ8N5ItxaF395qXqULaSTj8ZO5pTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qn5sf8pZ05FkmMjFEfun7iFYTzWCliqOA1aP+uqXsujrguI+avqtRmfrtsi0JhEsBqmFDwxp+1S3/3PlNeXWz6tWYeYqDw8E0HjNNjMdYTxTbpFdo83oShzwNL+VuGKBD3fu5fPh9tKOw4Z7E4UjtNNg5bykUBRoRA9JG/goJUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d//VnxwZ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d//VnxwZ"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so8425211fa.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832744; x=1785437544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjgVM8geKt3/AuWw27/cEi3vTspr7e35stfS3ut0Hec=;
        b=d//VnxwZzSCfdSAWfqVAne8zK4sitXK81vF4Mi+dTJvJG4yqR62/i2aY8rJ1jPxBIe
         b7Onvd/TaHZ9xgI2UCPAcAkYyzuyDqtuf2kaUdyozjeMyQVNkSzIzkxMJEjM2+73YMp1
         3viG8IhjbQTX007jrOFgegIC6fmJQMh+k57ufJphGK+8hXhdedXpGcRIwBvj3Zi8bY5L
         L2Y3lmp7NMEhu0kWjaIRgSkVBQqPuA66hCaoyp8m6ko6pxZszHO9pdS1XVbVujYuEpLW
         D5Jvt21SBU6nOBWKMqRm81zNVAc/lbNfdd5FsrEY6e77v0gHL9+X9V3jycgOG3KQpTKl
         ogAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832744; x=1785437544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjgVM8geKt3/AuWw27/cEi3vTspr7e35stfS3ut0Hec=;
        b=llgrjn3L+CHVWwYDPf7OSf5FnTjfl2ThinhMv6OD/QX1qBOughw81E9U1/ohvCn73R
         xc3CPDGlOFQgQJZV13/4/goiyGdW2IS+D1EkxN6xoSeeomeWU0f98YCxSx9uXvoCaP6K
         rUZUTbcR8IB+MFlzc84TLQqz0B8Fx3VaYONUxC6Px+Xb2cd/lwWQ+fgNosm6ZPqx4XEi
         xkHyPzN5O6z1uhVid4EMII+Eq6+epIs/1AVqSKBRfi4m7/NDnUf+Zbrj6RE9MINLWW5j
         qRTdK9mZqrY3jukOMJj88U4w4UdXmGM6WnLgMOo4ga/QogTlEgg4LFQv+de9uKaAN89h
         gb+Q==
X-Gm-Message-State: AOJu0YymQCXLhHTmWH/TuD50DKsGcIeelVEr9e6eRtZPY5a7CdFrGOP8
	KS/uFg9uKk3XfnQPVS2Ms+fCLhbjFK7jH/LKASrv7sSU0wGCX346ZX4R
X-Gm-Gg: AR+sD13cs/VWi6hHQLASOUf7XgrZQlzAsqReKx0yAKsEW93kB47tas9gpx07VFjGIxp
	oYtPzg+fbdL9Ekml9blrEC5R7rM4mRtISyaIvqeYmvMAzcuTPcnWO3rtzrsb1gvgZcrrDjKawXu
	Ugp1k+dJ9LJbw2akpvDc3N++hgbU7OjmLDDBw+g5DwDWLpHVHuIGdkyt7c5XCkC/69cGcFVybeR
	JEek6bJpf95guw74yCi337ZCAuH7hpdRwRHk3zobRQyJ7Gi5keswQmPQpcoT3UKELclvvdxbOuY
	8yPA+90AiRIkRjyx1kwgqj15GzlJqpsMK385fU7UIVL1/g6s/oU6Sx/qtHh/i1DXWdOMidVeNFJ
	2vXwm6V0h9zvDzQkPTpm/MSXG6F0opU9WN4EWgRcLJCH3dnGNzqRgd2Swm6SdPtlDC7fWcC/03V
	M=
X-Received: by 2002:a2e:ab89:0:b0:39a:e29b:7926 with SMTP id 38308e7fff4ca-39f07f35e31mr9410891fa.41.1784832743959;
        Thu, 23 Jul 2026 11:52:23 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b68ebsm11601731fa.10.2026.07.23.11.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:52:23 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 0/4] staging: media: atomisp: cleanup pci/hmm/ code
Date: Thu, 23 Jul 2026 21:51:17 +0300
Message-ID: <20260723185217.317981-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused functions and replaces obscure
variable-checking macros with clear conditional expressions.


Changes in v2:
	- Squashed the function removals in pci/hmm/hmm.c and
	  pci/hmm/hmm_bo.c into a single commit.
	- Add commits to cleanup macros from include/hmm/hmm_common.h,
	  as suggested by Andy Shevchenko.

Nikolay Kulikov (4):
  staging: media: atomisp: remove unused functions from pci/hmm/
  staging: media: atomisp: inline macros for checking the bo/bodev
    pointer
  staging: media: atomisp: inline the check_bo_status_*() macros
  staging: media: atomisp: remove include/hmm/hmm_common.h file

 .../staging/media/atomisp/include/hmm/hmm.h   |  17 --
 .../media/atomisp/include/hmm/hmm_bo.h        |  46 ----
 .../media/atomisp/include/hmm/hmm_common.h    |  60 -----
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |  41 ---
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 240 ++++++++----------
 5 files changed, 109 insertions(+), 295 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/include/hmm/hmm_common.h


base-commit: cb08dcd0a896c3ac8073a57296f2377b106c35b4
-- 
2.55.0

