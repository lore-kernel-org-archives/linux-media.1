Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530A42FC893
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434095; cv=none; b=J/lJl/rgnSgFcD3fH0N2Nhy3lesWjpK1I4rYsYIs4lJIHpaCiakakA+/9M4XAIeBpNb4w66YOOHTi3h+YMcKS2fEqRhGG4pcnbVWRTHTdRTFDp92OBrCHa5j3UEN0vqK+vm08iPyxgjK8mHrgFmm2NDbAkJaHKmtAFT02yZCPDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434095; c=relaxed/simple;
	bh=JGYjlMEgD5WnbjjufUoTn4wjOaYAWASOCbxl12i9cy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ejvnvlsFKA2TvKOpD+OXBadGEnRXxPONl3+RRlnX3AgJ/4Cef/CdFzIMK44vEm+3d/1vt7LbEIkwOUTw/9QdlzTs7gQEItI8PEFuAsxZLjHwMBBpLqC+BxFuPpBTMB3ePGBhUxyJTDtdFelG96x4vRi/CpYZ2cKfoHuS4WujDKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H36ptEX6; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H36ptEX6"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-939fa4f2b81so227191185a.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 18:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434093; x=1790038893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMu3mYHM8YQYP8LuIfgTNRZj5kYqyGYxw7oJHEX7gg8=;
        b=H36ptEX6C+mgbQhfDc6thTq9DmcL4rSdDKKpVsrfQaNG7gTUfpgeXaw+m/K0e5NoWB
         NxBOgBsfLxRRrBJ1FhxYOVLgaJommJENhWuqlWAhlVF/KXW84H+84VWeobNBLNHWxN1U
         uvbG1SL7VU6jaGN74rEWldJD3YaaAonGnM0I+ohBxI6J7+IIRCEXyko/rAu3V1Sigb9c
         dMNlAVEcUiTdaC6WxeYAl8yt8TttyWezLHKazlW+04W8UVdsdu7YC2bU8PXhsSoVFSCY
         9hURMVyaxyDoVsknkNK1yyPdygtm0SvtijkJU5e2HQFo7fW33bJden+LVEPv/4XXiUtP
         bpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434093; x=1790038893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMu3mYHM8YQYP8LuIfgTNRZj5kYqyGYxw7oJHEX7gg8=;
        b=hEf75myxTLglxujpys1TzP0tahknhn3j8PXZ1Fxn30pZDrXSX80+1937ZQLoE3Cd9h
         IhFzQ1l91p9NwBCpdrxxLX7dD5zd3LuC6/c1Y1VLBxun3LvdzBimAaoQ5qf/P+cBNNf7
         7+p6t/sL/mmY/DjE7VDBlirfzugUGs7ONZeY63fLmuHJLqiZnTfsfktqbY5siLzi87RQ
         WkNGqZicU/vnlcqlL8cAoLXd/fH6zxczUEtFVYoKiAadoXnZbQTGAqY17k7BXoXqtZpC
         3CX1//N5ZLQqs7NoyzFCKXxej1nM1CuvDKlh63bCpzaXSvq7AsAT/X8SJYWdwRyYxi4Y
         /A5g==
X-Gm-Message-State: AFuF++mcvgyT3MrQMCPdLu2sY3CyW3Lf0buupSb6mjeqON3KYgu4FPMO
	4vJ7GZLilb1dpJKdNY3iE9x0FOYsuR9l+giLHmF+Dp97xEyd6oitwYAczTCPdhXX
X-Gm-Gg: AYBFou0hsbtCyh0jMnAW3e+rpw0mq2EZfjEaXFz8e+IQWDl2Hmznuyh8g4ykcdtrlLB
	kqeuBR3T34kiLFX8kRUuj2iyl+LNkptbFyizUdUUkwamlrOhDT9VzhszxqCW9mquomkuljGaXrm
	lBYPOyN0igqhDA4XdrcCt7dS/ri4uIe8b0Q8jCUJKBG63trqQodDqTLAfkM7adHycA4NtU/nJ2q
	fF5ZyGumNIqVqsuGdLGz9c+icrpn/7GprISN87c9x5Rnfv9SxCGIkI84v3+98LMpaNwrTDHRRgM
	U/1X3vWRCfS/QdwaP1/EuGQCV5qNm+zdktiqXqP/SsD18v6p0S0MPKj729S1hV0vsc4mEImHmX7
	z1i7l0CcsOKoJFz5xLTLGmrzekjDgS8jceV7npa8iRfQNid/VyRB7odkKeg2pV0FF3vbbBhPjtM
	UDA4ttiCCzzYHKXwXSJymbN36uwfsHGL8tceIjw40Ah5rPKAz5NCbjNiEVbSWVcBA0Qr1jL9p9k
	3Q8vnklC5+D3LHqwJkn2qIEKls8yNOh6d+nIY6bh4++oXGP5g==
X-Received: by 2002:a05:620a:268d:b0:939:993e:bffb with SMTP id af79cd13be357-93a29804240mr793154985a.22.1789434073593;
        Mon, 14 Sep 2026 18:01:13 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f18467sm1147705885a.11.2026.09.14.18.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:01:13 -0700 (PDT)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: hws: fix shared IRQ and video quiesce handling
Date: Mon, 14 Sep 2026 21:01:08 -0400
Message-ID: <20260915010111.101551-1-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HWS quiescence currently disables a shared IRQ descriptor and calls
vb2_streamoff() without the queue's state mutex. This can prevent other
devices on the interrupt line from being serviced and race userspace
capture operations during suspend or shutdown.

Remove diagnostic register accesses first, then restrict IRQ quiescence
to the HWS function and serialize monitor and queue transitions. Runtime
readiness checks report an unready core without resetting shared hardware
while capture buffers may still be owned by another channel.

Based on media-next/next at b38d06ad1e13 ("media: ipu6: Fix up missing
IWYU issue"). Apply the three patches in order.

AI assistance: OpenAI Codex using GPT-6 assisted with this submission.
Each patch includes Assisted-by: Codex:GPT-6 to identify the agent and model.

Validation:
- Applied and built every patch boundary as an external module with W=1
  against the prepared x86_64 kernel, with CONFIG_PM_SLEEP=y.
- Strict checkpatch and git diff --check pass.
- Hardware capture and system-sleep tests have not been run for this
  extracted series.

Ben Hoff (3):
  media: hws: remove debug controls and lifecycle tracing
  media: hws: quiesce interrupts without disabling shared IRQ
  media: hws: serialize video quiesce with queue state

 drivers/media/pci/hws/hws.h            |   2 +
 drivers/media/pci/hws/hws_irq.c        |  84 +-----------
 drivers/media/pci/hws/hws_pci.c        | 181 ++++---------------------
 drivers/media/pci/hws/hws_v4l2_ioctl.c |  14 --
 drivers/media/pci/hws/hws_video.c      | 144 ++------------------
 5 files changed, 44 insertions(+), 381 deletions(-)


base-commit: b38d06ad1e13c32970d58039c154f009b81a3368
