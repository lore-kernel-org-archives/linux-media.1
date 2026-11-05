Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839753;
	b=nwNoOKPfZMEewxAnuEZir85CvbRy8YOgy4SrR3JlvZS8+qz8rtGVk7jR/vkBmcyXaPN8
	 09TuRRv+MEdWfdAbpcEH9bRuGSyHj55liqYwQ5wr6SScywTU1WKy1fn98LLcooITBN6o/
	 /hQHstZ8gwuYhYw3FaC9GElTqeqWIZKtQGBVUf3g39e2M5ACk0LJsTKAXj99W9R0pB1Wi
	 rhlp2qytOVhI2rd4L4hlgPq9ggROjHyg844PSsERlKXRyrvbLtX+quBr1cXTPvrBUmFSR
	 eWOXkQUNQvKz/A6ppXCBRaVU2kbszq6SxW9M7IquJPaVDOjeUrFKon2SXQsOddq7z6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4h3BLrXVHnJpXsfgbQ6hyAgdCfmWNlHoclXhroqCLTQ=;
	b=ByU8JZ1JiaeNOSq7ZJLcNox/x/nCB7IW16j8+bYW10x/R6y/QaOVhFoJpP6vL2mbdaLu
	 LcAVuTT5B2GjAasdH9SwzJ1YbZlTyHSslWLKlNyH4rb/DMpI1W0m5wXB+CtFb2FlYlWrn
	 A9Jip95MyR0hB8w2Rd8YlZ9KrFpI5dN9tc/3X54HFCc5gCSnMVwZQDcDTUBz/qqbaq9cU
	 wXTTtDWprcbdVsjXnVUIJeLG4cI1VvXSvNivJLqGorKNkmvbSFqtZx16GmpXvXfPZGeuC
	 DDmZVUhfeoP2rNi7S5qpgmftX/KSTJ2prretzMkD+WeUXYYjMUDEHcNT0XJ2iu5WkkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMlT76ti;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9007606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 00:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9007606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMlT76ti
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so9332315e9.2
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 16:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793839751; x=1794444551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4h3BLrXVHnJpXsfgbQ6hyAgdCfmWNlHoclXhroqCLTQ=;
        b=CMlT76tib7PSYcqx2zJ/vlCC/lC1Y0daCJu4o1YNPOKLP3c+5tnYv0v9swgUi+gbp7
         4FaZZx90N1jeMtleG9SWq9Q2aqFTngJy59DzPT1wUhrX30GID1hbq7BF0f/YQAJd7X6K
         SC+A8J9TyplMbbegXxfSEuamW5otF1aJ6HsfqFHqM+ij/2449+2fBfvCTTCGrFkRbC7n
         /VL7Sz10wk8s1dZKHN3zvH6+UR40Fjtppr/Z1zmkDFSQQHugcgTnmEIQlpGy2iltTtIH
         u/8zEqW6Vy8/1yvZ6Ibh0ApXRBz19pEPcZdz61JUj9zk2gfBoM4Ug0KLxkvTPdyuYU9i
         gnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839751; x=1794444551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4h3BLrXVHnJpXsfgbQ6hyAgdCfmWNlHoclXhroqCLTQ=;
        b=zAxM3pWw9KLGggRGO2eYQRjzBa3ZqQCH8xRoftjFS8jPZds16UQ+iR2m7kUr++mLqM
         pA1BNagJQ0abbOJ1BhW6yinxwNSratrgC964YZuHTBNtEGmCyGPEt4DSfSUKCg06kmwA
         3wz41Atj/rDLI+fEFvbgSU+Eq6d6gh4V41I8XzSKCXXSIYCNNASdKLFFGkQ//btbsmNs
         TzPYrC7gwB8XMj8bH/0JQJWkGXkKo1brG8le4d84EBULnNxJseagIbjAPQOsZmp+SJzr
         b9h/ulaC/teDmelNCDErJm30IUvhw+LT3z/vieZPsF1W5vdCKqSYccbsOVJOZiys2f6V
         Czqg==
X-Forwarded-Encrypted: i=1; AKwUvBxeMX9o3i0Be8sZ9XCM3Z3SfmLOJhS7lXA7ffYz7FAml72RZ2661zL9qMlzhm8WRGWysbdPhceEMBhP8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/98VGMndYKMz5013ByRyUFBnbUlDonMKPEJL6nUzLCtR45niMc
	FP56mP1pjAInn33gi67pTrv/QOqd6T45DQ/x90QYUM7QB28QiTtT1XGU
X-Gm-Gg: AYBFou1Oh6NjNqOSlPmKvN+cssly59dRmhv2WD7OsYlZ+NK/XzHw7MIC1g5yFnji3wt
	UPHXpeA1HWH3w4nZGfyDyqBBVtLbcmbrKr3L52IrUkKv8Y6E9dISjCpo//EsR94BxX9vE3hPKAP
	Ee5HkMBOYCWEfZGRwujOYAqKUEIVy0qcxTOecHtX+MXDi9cV6L+NkdK9epFUkTMpw4Zh5t84xZg
	7uEIgRbk3s5/n5DlnrzkXIvangA7ywvDmiRxJT+bu/wnTz50qi8G1ppKHjHQhpahvqaAv7gxZII
	YRwM2JpqX6cpnuPeAPOnzIXgZSfSUL+8HL6pXBIMgMfFjclq77TLVxIkHUDaAeVcHELDiSichBI
	542QR88ZcbW0uFtHfg2BRQu1AxR5/XIm7gcfUJBcXIlXNGEj3eqegjUGpA4JblCpEONn1wFXrrT
	/qX277Oi8KcxLJhYo4iqJ2CgxQwhdymjiOWqb5i82GV95DgxPB7jqkN+GpHcNSE+WtQgFPAKsk9
	PkNcqHiI/If3CpuvBML2KHcd+HfrEExpnCWn/CQ2SCWU6fEfz3/n95WjWM2T2PFJeKNwT4d3NvT
	SoYVTOGAo5mHw/GvXgqhYmcK4P08x29ySSshP/Arf5PIcXcOZQ94mA56D40u/uY=
X-Received: by 2002:a05:600c:6087:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4ac17753befmr384150545e9.15.1793839751358;
        Wed, 04 Nov 2026 16:49:11 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba0f3sm21341515e9.9.2026.11.04.16.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:49:10 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: i2c: vd55g1: Two control fixes
Date: Thu,  5 Nov 2026 00:49:03 +0000
Message-ID: <20261105004907.150545-1-fernandorimoli11@gmail.com>
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

1/2 marks the auto exposure lock and bias controls inactive rather than
grabbed in manual exposure mode. It is unchanged; Sakari's question on
it is answered on v2.

2/2 replaces v2's hand-written event ops, as Sakari asked: it
initialises the controls before v4l2_subdev_init_finalize(), which
enables control events. The same order fixes a locking bug the driver
has had since it was added: the state lock was set before the control
handler lock existed, so the two were separate mutexes. Moving the
finalise alone deadlocks the first stream start, because
vd55g1_grab_ctrls() then takes the control handler lock a second time,
so 2/2 also switches it to __v4l2_ctrl_grab(). 2/2 does not depend on
1/2.

Because of the locking bug, 2/2 carries Fixes and Cc: stable, unlike v2.
Benjamin, drop them if you would rather not have it backported.

Changes since v2:
 - 2/2: new approach, see above (Sakari)

Testing. I do not have a VD55G1, so this was tested on the VD55G0 of a
Surface Pro 9 (IPU6) through an out-of-tree driver derived from vd55g1.
It is identical in the code 2/2 touches, apart from one more
format-dependent control (pixel rate). A test-only print in s_ctrl()
compared the two locks:

 - before 2/2, VIDIOC_S_CTRL ran s_ctrl() with only the control lock
   held, and setting the active format and stream on ran it with only
   the state lock held;
 - with 2/2 they are one lock, held in all three cases;
 - without the __v4l2_ctrl_grab() change, the first stream start hung in
   vd55g1_grab_ctrls(), blocked on the mutex it already held.

The controls at probe and after a format change match the unpatched
driver, apart from the default of that driver's pixel rate control,
which my port of 2/2 left at its placeholder. The flip and test pattern
controls are grabbed while streaming and released after. R8 644x604, R10
and R10_CSI2P 640x480 streamed 90 of 90 frames, and five start/stop
cycles were clean. v4l2-compliance on the subdev gives the same results
as with v2, in both exposure modes, and control events pass. The kernel
here has no lockdep, hence the print.

v2: https://lore.kernel.org/linux-media/20261101195006.220657-1-fernandorimoli11@gmail.com/
v1: https://lore.kernel.org/linux-media/20261025154031.27083-1-fernandorimoli11@gmail.com/

Fernando Rimoli (2):
  media: i2c: vd55g1: Mark the AE lock and bias controls inactive in
    manual mode
  media: i2c: vd55g1: Use the control handler lock for the subdev state

 drivers/media/i2c/vd55g1.c | 65 ++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

