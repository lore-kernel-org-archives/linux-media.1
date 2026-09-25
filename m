Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1133CF043
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 19:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363819; cv=none; b=VJmjWMdB62deHiYjRO/0RGe1VkjBUpk241CUfNXPRjEamZzw8DOD/uCuq+UmhT1BIs7fkRkkeFt+JdL85qZzCjxRJ7RZMKLUyqgrBMDt97njIZ7xtnB3/ezW16fb6+ZH6OD5WtxzawrpDoHsD1HnEx6FtqZqkzhfWR/QGQgMt1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363819; c=relaxed/simple;
	bh=LmDohTXcxb9m7JrOrmG+Y32/Ci8WQptcCIicn5s+8/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JF0RVGe2pRx+1UStu1/32btJJXkVYT+O5bI4Y8r7BZIfjkAVxNIFor+B5qTCoCJzR+4oPrXdr8m3dSTianYiNtJl087AXeLHBH33oHXraf2rLzPgArVnFEjm7ko6FGPh2B9I4Cc6Es3ZgcybufqGAJb7kxm06hwWxPpLhO11euY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUVYScKV; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUVYScKV"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9105d241693so11665056d6.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 12:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363816; x=1790968616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8eF+kTesN6ABi4qFLszfBvuUIZqOPzgqacuEmXgYpA=;
        b=rUVYScKVOkQ+m70+eLmvAMIB/ImF2v73gQ9pEpToYLj5QwB7jotM6uUW/o/HTBh0KU
         Fy4vOjwkEzR0+LcVIGPIHkAbSGlD/2RTxW9QFvRTwmnneY9RY34nNVVUVfZwLEOlh0SS
         9jCOvalxTp6xfiNqOSUq8jGhVqoJvN3UXPC53QFmxwVbrLUZ2kCATrcbxGMEko35A34v
         I0xQboEShNyQYpLToACbCscxBG2HlU7ouUxssWLCdSzLR/uVxF688DvtaG+L8NHvaCwX
         LCu7+LKTaH/pvC9RM5TxsNofZ+WCXCZOH6ADI8kkfwG6UhtLtKy5ueD89wKjhhn9fjLj
         OwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363816; x=1790968616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8eF+kTesN6ABi4qFLszfBvuUIZqOPzgqacuEmXgYpA=;
        b=OBh3ZjFoTwTV45uRh1ka19tvrXM333Cy3sW9OJNva8ffhotroJuQSV5iNkMgv3MsXi
         KXabDj/iYm3xWTNB3ke7eIcYgNZOoNq1N0iDPPfyRzCYveYGfc4WCrmkuJXIOZ5B0eJ5
         8zqSGfi8JREcuw0GWq0v9yDfCSGuWC5Xc8E/KSmIIJgfBvT1oWryrdyaVDCngHd/reSq
         SKmduPQxxeEstbpbMt9/YnKIlHCA2zvVK0luWzyCYaTIbgixnxMf22qi8KSfYWLXiRy5
         QmqjHfIxjFgy+sQjV3WZYcxb2CIiEHlfr6Ty4keVTrg/RTzRJXL6iodmYwj2MY+XRSl4
         UI7g==
X-Forwarded-Encrypted: i=1; AKwUvBx3vuD7d6U/yv/wfk32DjLqgY/k6pDmM2n0pQ3o5YDL2K8M0KUBeuRN17ZC9ZgZ+Z6mz+sgKrHzdO96+w==@vger.kernel.org
X-Gm-Message-State: AFuF++nF+TCSmlFUhOgg+Y26tjm10vcyUhcj8hXzNnZtLdaYepVOH4tR
	fDY/bwVbSFz9bze5N/VD1cph3se5wFFdunDs3R5rkIsnB3p91vftEaA=
X-Gm-Gg: AYBFou2Tm4eoRQq8yfZNGZzVpdd0J59lowT7qXJrftMDMzOnyHnrPp7cie8QrwdCk7f
	VUjZGeAdOROZAxI/0y0ZKTIr6/ADIK+O/tt96Ar0WLUuMFyOQZyZtAKayDsW5dp/9tzInpXwqaI
	GYaEWNiTd1Vg88AS1vvkOzEReSbY59gObKlBxEQMAPwsJG+gApHLxkPrMRNt76zo8U6EnFnJDTI
	jhNTllswFyQQXgiOcYL2aPBdf469MG9kE7VmO/DJELsrpuK+/ryy5iytiUDG33NbyTmKv9CKytx
	LEUarDDrmmhsYF5vU0e2CcDX8QDshjLLLxJxej6dXyA72N/kjrU/nirGCtfi2JUEL/LHAtEVXWL
	Rop5yRUbJn3djoLfAPX3VVaFy5R6qt267k1cJAtgYSpn83L4VU0AIPRsSvlqxR2AL6TgxjfNQo2
	ktGsKE9dpy7w3pz5j8Wpi7kZPtp555mSptnKRhn6PMgBjeL2ztFypmr5a6oFQI7oJEXnUBwF1S4
	l4k/A34ERiR9q8Y+ltasVgd2Dac0rbWkPH1mXL0ZVUwVUMXrjWjfpd/GqKcXQlxSvKImAz7M1qE
	cUuXfcGrr7/N39KpgdGVRFQUVBgS
X-Received: by 2002:a05:6214:4004:b0:912:5836:82cf with SMTP id 6a1803df08f44-9142f797f41mr59798056d6.27.1790363816086;
        Fri, 25 Sep 2026 12:16:56 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914309a24c4sm24142666d6.6.2026.09.25.12.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:16:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: venus: fix HFI teardown races
Date: Fri, 25 Sep 2026 15:16:51 -0400
Message-ID: <20260925191653.3144006-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of our ongoing static-analysis research, we reviewed the Venus
teardown path and confirmed the race reported by Sashiko.

This series fixes two HFI lifetime races during teardown. The first patch
waits for the hard and threaded IRQ handlers before releasing HFI state.
The second disables and drains recovery work so it cannot be requeued
while HFI state is being torn down.

The later Sashiko report also identifies a separate resource leak when IRQ
registration fails during probe. That issue is outside this series.

Changes in v3:
- Send through git send-email over SMTP. The v2 cover letter incorrectly
  said git send-email was used; v2 was sent through the Gmail API, which
  still wrapped the diff --git lines before delivery.
- No code changes.

Changes in v2:
- Regenerated the patch files with git format-patch after the v1 mail
  delivery wrapped the diff --git lines. No code changes.

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)


base-commit: 4efa625593e1e9c76346232413997556dea1d89f
-- 
2.53.0
