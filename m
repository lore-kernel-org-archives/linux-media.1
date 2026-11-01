Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562612;
	b=ubFBtpTqL6oHkvU2LKXC83myz3Oo9OVx+4aFpAXDcUVi4l5T+0YZBoL79tqifXGyRu8Y
	 dxDOPZlEsb6SkqJobA7lGLlFz/PSsJyHMaOy3szOJKne1nGHtc8wghdJtvyrgi1w2rBU7
	 Y4C6JzKAA12ltcWfpsoIKhcFG4ZPuJf/pK6mbPIbTQVLPHjYSK93hH/jYikpty5q1b248
	 E73pqUYTGyDZQwoxKP/UzC/YbhvLRwiv6cBB4oJcGBzAet4NDAMiM8ZPtd1ru9Qpvl/1B
	 MFXE5k4QsoNud9mJV3y1DMKnI2d4IqvMETl37xHgra4Z/+sdr+tPWpf+MFZGE4DZEVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qsR29nfnZSgq4Ri0x8gwo2H00XqMzrH+moznS7qvuZE=;
	b=XgjUYGOel6OGO/p1eddAWPvyKGK4AwNa8NycmQBACcn+dqWhtlb1Rqr0EHG3PglR2VKG
	 QUusLHNbU6Ss4vDpdHfb+l8+kft0FBDxUUB/Kb388NgZN9oopZj/k11DTmZKFs4/bFkS7
	 GT4LHT+dIoARJxboEPntz1KKpPxk3KIAvPKRmKAgrXmNTIMCo822ChbsETzuSXStAkZRf
	 F+U7Kl3M321WWIkrz2ETcLsPr2mXfz5vfwfvvuHRZl4OpSUJ0lEnIemPWC2juCitYXixM
	 3YmcWla8RXOhTPIu/UQF/fl08QPDwNWF16zImuXQQvwJrGxX4AXUDNC9zigew/xbHxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tt2e9AxY;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C74606A325
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 19:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80C74606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tt2e9AxY
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so19901115e9.0
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 11:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793562611; x=1794167411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsR29nfnZSgq4Ri0x8gwo2H00XqMzrH+moznS7qvuZE=;
        b=Tt2e9AxYdsRZ6wLm7iNkygRrz/pNUalqZnm+zzG+3//Afbji7Lx6q7EP6sOoMVxq7M
         rMF5X9KC3egBNzc/l35OrbFGa6uVn+iOPFSN56iRgB+jYA3IHNxSMxnfogqXgg5F587i
         rCGPvwvzx9jgSLCzfS/PB6XLAGNbR76gC5wJEnzLC09vl++F1592jTYzmhKpFPXlJe/Z
         k8NPXZv8YEPRS0C1ExC5PvWxzTi116jaAbgFB+aU7+mPus7BVHdEABQvWdkKiJurxww1
         2r+niWxQCYq1GbR34qBp2M+Bu78U/APhbHpQwwk2kLLTdBdxOD6y13iwksjhnBEe5d9R
         ZTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562611; x=1794167411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsR29nfnZSgq4Ri0x8gwo2H00XqMzrH+moznS7qvuZE=;
        b=NMRBcVbZZHfwBqzthxw/2rxEv3RLfE1fxD8QyDhCvaIk4SQXIc0oouV+zk0NEx8YJ3
         JPKxFhIO1M71tP3X9irWAxUgVdFGnZKDYnz0PkY0KMh5jY/DLlzKCXxQqC/fPBisezEF
         xqZB2R5lL//I+pWzVMDpiLMS/i7YWDgg/XH5jNa+mE90mAujaso00OojkFD3qVDXilC0
         YNU/ro9BN8r3bQ6Qu9YfqbSk9wOyyU9rvlFucFLdKRQXWBTzsKX3akFz6gVF702aSfGf
         RQ2kGiKJ7CB0yde4DXg79KJDLzuAOWDP0bVCiXE6GW/vsinvBy4X10jZ6gbBEouW3sD3
         eDog==
X-Forwarded-Encrypted: i=1; AKwUvBz/EJyJD1VD3kXSTQxVwlG/asFjJVv7syA7fNM4aZJDVH9DF+szk/e78iH/ou7VmmzZye+IJQsqIG3Ngw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKzoh/nYzT//Ao8G0RBqBY1punexyzhGOULm06vvev5xWaTRbJD
	c3MhPfamFEGxL/FufG9RcEjKwkSBAQiGzDvqJh75pGqIthFuPcz0WC25
X-Gm-Gg: AYBFou0gh5Nzw+sBX/+W9RkVe9DAbYFIc2Q/zKiFCtumI9M+HVXTsmwclWP05sEYKxc
	FY1qqQ7OVO9hTnUnXoLWfDtGMEXTD9caK83iemMNz7RmIzZKoMssF9b7vgtSnhTNPdCajaq+uJK
	Xg224tljbqaobLv6Qabfu0jBRTeSKBQ4vMWNWDaLVA2LqvDy/ub3ADX0Gk3TWI4cUsg6Ac3z754
	BUvBN3ig5MTLac7r3W2ksixRbXqY6EobAAQ5yGqYnBxJzNQ/yM5pkqB1pRkDiYSx3Awztdm+fgu
	5tm3AuavtHbWGxb7wMgRh0uQtI0vMmpkV+TDTy4B4F8lBFvlWFhecfAFCQiQE5DA51mfcFjDqBY
	yImWPw062H/73OrQ2s5uff0SLweWkRHakiZb/zNn6eyhQryj41EUrVR/QtCsUMmuhCmfIKIq1kw
	rrFlqjeIneuG5bfygZ3lJqEaOQl7GCx35/9VCxNwrJGITersBFyVvtOI5ybXOfIPopRrBKFULvc
	8uSBFBWBTF6siR5izxNrkZaNFpPEITWqsxMUKEXfutbi/lToOR6LWZT+1dUdPDoErmVM8RuH7QV
	82yb8Sz7iKJJauOVVBaM7+AEDlEhX0+M/45Zcso2exuuwFMeX2/GvoB12x/hP3E=
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr65816875e9.35.1793562610664;
        Sun, 01 Nov 2026 11:50:10 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm281548865e9.2.2026.11.01.11.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:50:09 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: vd55g1: Two v4l2-compliance fixes for controls
Date: Sun,  1 Nov 2026 19:50:03 +0000
Message-ID: <20261101195006.220657-1-fernandorimoli11@gmail.com>
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
subdev: 1/2 marks the auto exposure lock and bias controls inactive
rather than grabbed in manual exposure mode, and 2/2 adds control
events.

Changes since v1:
 - 1/2: dropped the Fixes tag (Benjamin). No code changes.

Testing is as in v1. I do not have a VD55G1, so the changes were tested
on the VD55G0 of a Surface Pro 9 (IPU6) through an out-of-tree driver
derived from vd55g1, identical in the code these patches touch. With
them, the QUERYCTRL, QUERY_EXT_CTRL, S_CTRL and control event tests
pass on the subdev, where they failed before.

v1: https://lore.kernel.org/linux-media/20261025154031.27083-1-fernandorimoli11@gmail.com/

Fernando Rimoli (2):
  media: i2c: vd55g1: Mark the AE lock and bias controls inactive in
    manual mode
  media: i2c: vd55g1: Support control events

 drivers/media/i2c/vd55g1.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.43.0

