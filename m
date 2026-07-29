Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262E52264C0
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 02:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785291529; cv=none; b=EwEGjF7PI1ZPScdA0RL1ibPMFeyWp3u5NwdMIgBb431dv71wwFnp68H9jR6BuTw74Az8bOiK+FuPpsfUCkPpNFrTH/lT7FzCJ3IFp3FLoNJOKD16QUXIZv21yAIFZLtqc1JLBjSTvEA4OKA0oRTaHTF2x8V8pQRRYfFW9CHD654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785291529; c=relaxed/simple;
	bh=dmriazfhWcf5wW8lxOVtQBUgCYLeSYhcaY4KgrG7ctA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dn8n4fCtp81JMzpLZFM/Oj9HDOZUvgQUfATd0+OtMr8tLPYkbH3sGKHMLAEVLbd7Zmf8TE73ylmFA5gqSRGL89opAaABkzOoJnRpS6nOKRZN0bRbqTnekzxjvikx2TwTkh5FzvGMrGnU2CFOPlohaHNFhhfxH5VigSzRz5EEjBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxcpqN8r; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxcpqN8r"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceaf8a1265so5678255ad.2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 19:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785291527; x=1785896327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3vGTZ+9cBJHUjmSn73Xe4evmb/1PkSIQ94tual6z3w=;
        b=cxcpqN8rq7HglPHwR2IbvxtN3GRe4NGzynmTkyK5gm0qBOA+Aoz+G+e9xEZZjKgB6P
         3Q/limCrCp0xbEw3GNbLkuj5QLRHJTRt6eORffvT3s+BMDQDUJeAGZbTg3wHS+m/UPij
         ngZ3i1pVCHG/6wDjRDKQ5BU62/lfhPfTq3duGviYVBcd2Oe8KQM6Xcm2sqAI9+7O0pSI
         lluM3cOhYR/sIi8ZXxX1DuHyxd5gO2E/FZEPjnRBZmIkOq7LGkhLaqqnZKKTvwOxDqt0
         LB+a5BjnJZzHdtUivq1OnMYyrc5XvRRlg+EJRY7wnHHcDz5D6znhpAQtkKUXRb0gAfLw
         Whrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785291527; x=1785896327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3vGTZ+9cBJHUjmSn73Xe4evmb/1PkSIQ94tual6z3w=;
        b=bDfCi0yjFt56ycNs56pjKsH737r6qTaQOjj/OSz+vxASnW9Jriz/xi2Q2CbOmr/cNs
         IZXsIsfVC1lTCLP0ELEa999GdiJYlikEQr+e25vPO8cjDFPDiQvPqQihFjmHmafIgRhm
         TpL/WV2vmidi1PopA4kmqaTpuukdsS/ldkUMf+PUH8W1ylu1B4Ak8E3a/ZX7EAbjQQpz
         lN2P1tOGH1dtEN08+n/pDF+ZJnWOdMsOlShg0IAe1Vl68s6dGSGWaTOvTmMRPtk+gFaR
         uNZpYyG4xcDT/1KxpBOF9zQQnKZ2ibL0VxtYUIhmSfmYyOWt2034P8MjKERkL8717R4x
         PbDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rod3AFrnF/ZzSRlbLITCgs77KWZ0Bg02ZOISnwJTY7iYU3mKF6EImGMGZN+whndYrsIHGfl949/iSnUVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrXsuvmtO0X1yWeivBtgKLpPbQniVrkjtAPmIhGOFx+BjCYt8r
	0wEnaQwjZI5LbxZCW8EfFM77+F/ov2Tg/jKY/2k6QiBgrsZh7Gb+Jgo=
X-Gm-Gg: AR+sD11XukCAzGA3eqHlx7Mn7oYrmfApb3PdoDe6I//5FtVT3ZPj8HvVgtQeUbgXqap
	vMQMp7C3AFKeju+g/IHpKGtOGFi6N/oKKBYRTbr87NVkgbCj23XKrtRLoeeO16KexvN72e7+3Ew
	Uf+PVZgH0/W6IMpG7ecKn91L7i5begFCn0e8EnqSYdgXR4ozrk8bHOIFlF+h7k9FMGS6SWEiF65
	/YfcbN4YGe3hWDQQury5ezNRGuwm92iDiezij7hWcEstDXB/G00VTZ9J2xSNgEHvoxImIId48oH
	bWsEiHMI+nKpEsvU4UeYNXi/n0Pkt94AZZT6Mjj9gQhQ0pX1xYbdiwyIroP/WsT+nipeua4MHpg
	88Ip63AMr06yOU8+xbFrESVHd2+mqCqnpQKoFo+Cy4EyLdqO/pX7Bd8VVGOcsl4s/W86StXaW6D
	C8tq2Rr50+2/SgFSCgGvhv+p+yePwKPYV8gpX+rJr3H8oJvZBRy/8NDh3SMg/5XOxpMey0BYIHH
	D8EZKrKRE/AM1QJabua4SB+WvxuNIl+bxuBPEohC3xKPnUjx6fBq15bbjC9+JNhopMaAiip/tb9
	wiCIhnyed34Aj22lZbp1ELSbvKEJUqOefg==
X-Received: by 2002:a17:903:1905:b0:2ca:ca48:c36a with SMTP id d9443c01a7336-2d015c0fcacmr52704555ad.18.1785291527425;
        Tue, 28 Jul 2026 19:18:47 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a46774sm3848685ad.27.2026.07.28.19.18.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Jul 2026 19:18:45 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] media: stm32: csi: unregister async notifier on cleanup
Date: Wed, 29 Jul 2026 11:18:34 +0900
Message-ID: <20260729021834.50550-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stm32_csi_parse_dt() registers the async notifier before probe finishes.
If a later operation fails, the error path only cleans up the notifier's
connections.  It does not unregister the notifier, leaving its entry on
the global notifier list after the devm-allocated csidev is freed.

The remove path has the same problem.  A later async operation can then
walk the stale notifier entry and access freed memory.

Unregister the notifier before cleaning up its resources on both paths.

Fixes: dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -1059,6 +1059,7 @@ static int stm32_csi_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup:
+	v4l2_async_nf_unregister(&csidev->notifier);
 	v4l2_async_nf_cleanup(&csidev->notifier);
 	return ret;
 }
@@ -1068,6 +1069,8 @@ static void stm32_csi_remove(struct platform_device *pdev)
 	struct stm32_csi_dev *csidev = platform_get_drvdata(pdev);
 
+	v4l2_async_nf_unregister(&csidev->notifier);
+	v4l2_async_nf_cleanup(&csidev->notifier);
 	v4l2_async_unregister_subdev(&csidev->sd);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1
