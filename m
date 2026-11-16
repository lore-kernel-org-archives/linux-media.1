Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848913;
	b=KuRoXhrurBwY0D6lGOSlwdgffayVmFjAr4o6Jb8mlO4Er8JZlxnnau3R8jAo7HJfHndh
	 bh9HengWB4QWYdSqnz5lS+Q6BlUFqR58Kx0WDgyj35SyRdNykDZNR4F/SXoTd2cmJKimQ
	 3vi/61pdGU8For2Qyx3SqgDLRnCsYBoqeIHe8Leu7KXEKRu1Y4WFBJ4BiNJuYdc8ZdJoU
	 SbykhK8ktdpcf84TwCHfvg50q8+WM3PrRGR8rOvXn1Ic3qC77W+VT+MtIbrSouqmfxt6z
	 5ZRThK3hzYVLRO5e/62hVUEEXDlWApYjYooFaruh96bl79SeAcAdCPdWqEOjjUaepjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D29rmxrDoTADwO/LZ3yE5rm5+YgifUScXIfxafA5s2g=;
	b=5hrKIjpkOaw27I3mADcDb3KlTRhyllfCZFPTkSTPXEkSbXO7PiMBZDJp8t0BOBn7KU9s
	 zcBTSQzmZWFunZyPUU4CRGGhohhXjUhA1ePxIvBgAd0Ik3QM9hjy4NxJJX6ILdq5LjJSb
	 Ol9SJqKqZfK6P0x2u2qVST/zEw+Is+ENnbyASQadLew6TaGomxYzqN71C7oDQoe5rbENb
	 kRvzjmO3WrB07b78/GOSOFRnhgCV9PJXWimM0aGsrwTJuBinLWOnqWPgVVgPV8DaRC9V/
	 3IAE3rh1iaimyQNz4u2/peo4wLWuQReyahIlqZsf5BnCuHC9k+SF1Dr6p7G4mBjBmnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1qMnY03;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155D6606A322
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155D6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1qMnY03
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso2541677a12.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848911; x=1795453711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D29rmxrDoTADwO/LZ3yE5rm5+YgifUScXIfxafA5s2g=;
        b=L1qMnY03Cohr9avzf3alnbU9oF81cvPelaelzXsdJU57b/M3KynObOwltBSpAiwq7F
         TQHW7QMJBGb+Tr2wjt1Bo7GL6xfgoF48Xjby1+7fi9Hl3r+nu/zXP43oca961UXivSXW
         euip5H3W8JVyR+wnX8QY0gMIrOdEaCt6K3LSYJ2TmhPuzvBvChWf6hOboHIwV6UkAxKU
         9tIGUzGoYK7GnOtJpjVlqBrKiMydecfhEEQ5E2WrFe/gyhuIGB52tWgL791FnkvWUzMU
         lIRzQWPXG2lAiVIHDzFp26JZ3d3gx4vDb+ckXYTGJ0betAFGqBK2hNNtqMcMyxW0fsCz
         uDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848911; x=1795453711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D29rmxrDoTADwO/LZ3yE5rm5+YgifUScXIfxafA5s2g=;
        b=oVvSe2BkF8Y559fK5WQ0oJigXFjLRaOpuQy0YAeYLuQTbMDaxvwCBQIHJB+cteF0zz
         RiDxcflxCdzCrOnAvP8+6nBtxG3yF6GEuUN9kRC9FPVT/AgyRehTqgd1QVeTP8a+BW+9
         +8wASYn1+t0hV0PVqcO1Ykw5fA2pmH5SPqkOoevHEE30N9IzEjNGtw7ZjkPWTsboYSpj
         v/lZ7qiKA9HaA0Z0VwF85gSWspPLsEOI1SYodoFjuOpBH/znwiCv+oVj9hNA4DlQN3HX
         PTYY1NoKHDU0jTZ70a4SUxnUpR+/l7TL9rYO2NNiW9a6BEJbw3Zp18bX+kUjBWassyMt
         b/oQ==
X-Forwarded-Encrypted: i=1; AL+hErHOy5qyIXGClsDiw83i1821ZrupHBPLCGkUmR2kwlz8cIC8orDMrSHc0iqdnEVt5ooYyiJ9kCUv0ThASg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+blQv95/6TEXtEjj97rTuyYisIPiUUWIvPOLwHEIyCnFXWVh7S
	xv+Y9AYyTVfJXBH5zdysd/j6dMLJbjjMqBfeK4ay4K+Oi/w9QbdjGNKt
X-Gm-Gg: AZFdTZfg9U/RzXpp+97u3vNBV6gKP2sjrnmUbkHb9j1e7Kvs20bbSMK6kWm5D2Tt/p0
	uuJIyrMKwIlrcno+fP9WSbDkozV/Lra6PHVGqqLpYr0YpbmV4ZcSG6ayAUEaOBG0CVFmoU5ZQCM
	ukzNv2+GR+H3DdbuJBNkTGuJArRfmtJgz665zPhF4KphTRQVVZyVVcdyuc45qwbEMyxWJv12SLM
	Kdqrcrtkj+uxf18w8IarxcgV+pee00fxRi/tKrZTbXZOT/ZZw8l1H9WnyFX0O7P3AtwTIuEI5A3
	dnZ9ff/LZc37d0ivDb6HORHlN2ECCyqTVgr2E4hpTWCQalGWvwsJmnVT31egdWXfz2BLkjHwKBj
	mIM2o7hx+wb2j2kD/IJTgFuJBv02X5vKp5EJAbhWrG8TD1pjfmwrcLI3sJL867M+JNQpYGfgQ8G
	VUR15WGXRhm4TOQoG3i/Q7P/uAebRsyxUr2wCQ1bxq/0au8upPzvDamHQfFxrAFpU9IH5zNYr5L
	4nrySoFwm0Vxyz8NkEPEd1fGPE+tGBxfGpkGJ8mVSVSJikKP4i4tqvWXvDBQwvif0FyHE+ec5Hw
	XslJNRTZ/s97IqtGzQ/yMSr/6y0MiUfHaRjVhixLCnklhoWkURXXcSU1pGXfSJLr2ZQlCdIEfA=
	=
X-Received: by 2002:a17:90a:c2cf:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3b1b0ccec81mr10390370a91.44.1794848911208;
        Mon, 16 Nov 2026 09:08:31 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm150901a91.2.2026.11.16.09.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:30 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2 0/3] media: atomisp: remove unused functions
Date: Mon, 16 Nov 2026 17:08:10 +0000
Message-ID: <cover.1794845230.git.chaulagainavishek14@gmail.com>
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

These three functions have no callers anywhere in the tree. Remove
each unused function along with its declaration and the now-stale
leading comment that described it.

Found via a tree-wide search for functions whose name appears only in
their definition and prototype, and compile-tested under allmodconfig.

Changes since v1:
- Also remove the now-stale leading comments that described each removed
  function; v1 deleted the functions but left those comments dangling
  above unrelated code. (Dan Carpenter, Andy Shevchenko)

v1: https://lore.kernel.org/all/20261116114250.6587-1-chaulagainavishek14@gmail.com/

Avishek Chaulagain (3):
  media: atomisp: Remove unused any_virq_signal()
  media: atomisp: Remove unused get_sp_code_addr()
  media: atomisp: Remove unused hmm_flush()

 drivers/staging/media/atomisp/include/hmm/hmm.h           | 1 -
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c      | 8 --------
 .../atomisp/pci/hive_isp_css_include/host/irq_public.h    | 6 ------
 drivers/staging/media/atomisp/pci/hmm/hmm.c               | 6 ------
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h  | 3 ---
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c | 5 -----
 6 files changed, 29 deletions(-)

-- 
2.43.0

