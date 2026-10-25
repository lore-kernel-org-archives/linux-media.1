Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792942863;
	b=jzpfjP+xwDCLedheXACmMfmCpERnJAyvmIZHsl4hOikEIivx3ZbPB8YqBQgkfClii8oS
	 CIj9+vMkrBO25AceH9qRkfk1SdlUk/EAjQcfswazFIDa079cti7xrbQv1YgwW8NoUDWEV
	 aDIPsxEXrfveKMNw1V39iDmdex08X2YqAlA1mj1xNz1o1eUuUsfymgiTohRt5q0mglIW8
	 ErmhFpIKsfxuyLmnCSDI+yHfnn6ARriZ23xYbtJzJjCxAqrgh+Wf80USfu+XIpSBfCAIG
	 +rFqzSI5f3A+sAaCdx/dIjN7pjE7myIvA2lFT6qqyY4OfxM+7wLBJS7qJOdQIdjWClQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792942863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uf1h6a93j4+yEUbF39+PknBRrGGMkKcsWKsXQeeS/kQ=;
	b=H0nib1ywxaC1Jz/eoQYVTqN1oGSg8OGW295XIqEPTBny9jx5oAstpMXCpUJJK9LgMdU8
	 qmT5BQ30UTj6M1FvG8z81Ev98hkDdVwrKr0xTo1kVH6unoU5WwU7lCVe2mhUR3XecL9G1
	 qGxNxlO8w3BU4YPyNk5fieJb/En1bXN2YVcsGz927b7iFuxT6rDNZp0jYDdn6xeVSBqMc
	 Rvzha7fjE/Y7Epfutk8mR04jhxodHrlrynHkD+lnP4QlEpEUbT4NkGQTMllv0ejKzqoFD
	 zekpMnBB5dnIhl8Id9owWCODu6afkBuZZ/dVnDyr3RBwyKKALO7iEJlzGI4C05FSOEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ONc0W75D;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E525F606A31A
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 15:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E525F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ONc0W75D
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b042c0759so1292686f8f.2
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792942861; x=1793547661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uf1h6a93j4+yEUbF39+PknBRrGGMkKcsWKsXQeeS/kQ=;
        b=ONc0W75D37GzZCkVxEQG5HwzaDGrmqOyY6BIikyrFoBsZVuItg2moxQKjFPxLZEYrd
         hZlsHqSNv/66kByfseiRippSqe9vYikszMcyx+Y0TK/ccu5IYYAIgIohGBqUtE4yuLWy
         cg1CsBPDWfvIKDqJIoTYg+JMcNJSB20cqrwWCTfpLOyJWNOV5wjFVq2xhLqUXDHolkI9
         slZUGTn6pHiOaCBdBVal2+s7m84JF1H6eY4J+imyffy7sN+3w8YVRiyLJRsEtkr83pWp
         CksScCvDEJuX2etKI8Lt2QcnTKtcmlTI5j9TmflZqMOfrpbqCtCRZLhZFT1SbiEQBsjJ
         2Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792942861; x=1793547661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uf1h6a93j4+yEUbF39+PknBRrGGMkKcsWKsXQeeS/kQ=;
        b=zu6UPGtYsrxMilwltex/DIwRUi8AYLuAqxYYRCu+f67utsQu2SRcc6jjdxWiGWrP9r
         sVOF7N3sL961BtCNowmzUpVZVsV9eztyVAa5lUu+bRISvJL3z+pva5ZziivtpLt2AQM2
         0TvGEieXs7N39bwfZU9fe7FuxstYK6YQKt+L8bqf24Tkpkp5HyG/BFm60o4PdrYMwTzF
         LyC7OLgvjiMVOD3N2IcrivRb2dv0Y7usJSiu9dlulPWLGx61NETajJzgaLf/vWmoFBvL
         NisnahHSDV5M5SlR4FHmkA5/w/lkYwpGeQ4X7isVbGysmeBfGHjkPf3bRORxsR/jFbIW
         zP+w==
X-Forwarded-Encrypted: i=1; AKwUvBwh/np7bDTaZ9LJmcfEeLrR3IxzD7wTS+ijMYe1lTPMk/3l7rbsqQoyaiUnSup1+42mhxJx/i5+SA++bQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbNEUhrvlJ4BzOPwUvqxBBOSwtjcC3TLLmax/dLFPVjFYLuSZu
	iZH8dUDWPsPwdJGCQUHxDPSAjgQScOCHqL56EqNjDx3WVHokr0+I5K4K
X-Gm-Gg: AYBFou0uFS3w2L3TduldInEo+fFSntYgt8YA22xHB/Ww3l24IvLMF1hiT50Ws2OYbwA
	yQVFqDWJVlJjxVnCT+dYlZrhOZ+sGP9Qnq14w2Df9NITm+V2GRth2WlyKNmGWgVZ5lSSwUT9iKv
	Zw6BsrkAiQwrqD/t6bS7dd/jo9JLHf/wmPW/4X5S0yPV/VmHvLNUd3vQfm/UnVAqf2BO9ybA36g
	UE3Wqs9apeUVnYQG121ZW0ZfFHoyUfPtBBC3nz5yonMuLVlivnpf4cTIcS7LLBzYsC3sWXtA596
	GGn9Fdww7qb0girOeJg5XKKvCe8QFQKKkkS83KhsovaBwIuT2zn2k/1DbPU8sXlhFkrv1B0RiTc
	IDwhlx7m7oWwJUSW/lzjPE035QPrFkyuVcfK8WaAfmIoWyROugV7BNrMs2hDJMnj402cgoxCgPZ
	T+cNkNFJ0NdBTT2rHFCLPat2eO5YROIZ+XLQ5rAkmeHUaYQsGydubqVL0+MExKrqA9MKnfDpP/p
	UtBZnwREIVp3zhanuMDBF2B16+AL6OUPYKLZ2MFV/M4buc4d3DnRYZqrvv5SCfy77mXcZ/6+taF
	8/d0LxOnStO9YA==
X-Received: by 2002:a05:600c:3b02:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4a35ac8e71emr77642285e9.14.1792942861063;
        Sun, 25 Oct 2026 08:41:01 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm10487861f8f.16.2026.10.25.08.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:41:00 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: vd55g1: Two v4l2-compliance fixes for controls
Date: Sun, 25 Oct 2026 15:40:24 +0000
Message-ID: <20261025154031.27083-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Two control fixes for failures v4l2-compliance reports on the sensor
subdev.

1/2: In manual exposure mode the driver marks the auto exposure lock and
bias controls grabbed. Outside streaming that fails the QUERYCTRL and
QUERY_EXT_CTRL tests, and because v4l2-compliance switches the exposure
mode while it walks the controls, the S_CTRL tests also fail with -EBUSY
when it starts from auto mode. The controls do not apply in manual mode,
which is what the inactive flag is for.

2/2: Control events, as most sensor drivers have.

How these were tested, since it is not the obvious way: I do not have a
VD55G1. I have the VD55G0 of a Surface Pro 9 (Intel IPU6), which runs an
out-of-tree driver derived from vd55g1 through Peter Marshall's VD55G0
support. In the code these patches touch, the exposure control handling
and the subdev ops, it is identical to vd55g1 in media next. I applied
the same two changes there. With v4l2-compliance 1.26.1 on the subdev:

  before:      41/44 in both exposure modes
  after 1/2:   QUERYCTRL, QUERY_EXT_CTRL and S_CTRL pass, controls show
               "inactive" rather than "grabbed" in manual mode, and the
               bias can be set there
  after both:  44/44 in both exposure modes

Getting from 43 to 44 also needed a fix to that driver's own flash
duty-cycle cap, which vd55g1 does not have (it is not upstream), so I
mention it only so the numbers add up. Streaming is unchanged, 150 of
150 frames at 57.60 fps before and after.

Both patches build without warnings at W=1 against v7.3-rc1, the same as
the unpatched file, and apply to media next as of d7e7bca71698. The file
there has not changed since 4a069a763e8a.

Fernando Rimoli (2):
  media: i2c: vd55g1: Mark the AE lock and bias controls inactive in
    manual mode
  media: i2c: vd55g1: Support control events

 drivers/media/i2c/vd55g1.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.43.0

