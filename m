Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB74307481
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456250; cv=none; b=RWF9LAooQG+dE3DVDFWGVnDrlqvrIMoC89vkgtxiveUMjAGAw8E8LIXbDcNOeKdbTd4Jb4myNfFPwIOHI7I5b2j1Tq0NAZJbC9//29w98/46jx/bMCPaskJR8b5AReog+ZpRtTidy1J3wP25HM5z6DMBqcbUdEDN9Vpne9E6k3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456250; c=relaxed/simple;
	bh=nCYCPVMm7UiRnt72HgVaO88SMofkYM4zDJXXTr6L3Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDGNRpltHN8Tj1mv2pbH6egCtRrg8Y3AvcrzrrUKLWvfHMn98HmMgTHWKxojavAhLb3qTOFNLc++wnP2wIl8P5vBuIxdPlYyfRwc1J6j9X43kvFZauO5bTOUYt3f+Br4s4lxiHhJYjmQ7og3knF6Z6x5jQ8yHuPenFh5A7+uXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBSTNb2y; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBSTNb2y"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0a5354da1so20423045ad.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456247; x=1782061047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikv7Eqa2s2Mrx2CW5Hi2avcXl63yH6FHKP5OPXB/6lg=;
        b=hBSTNb2yMrWRrDKTsDwkUpoMX79fxS0Zg+gJ+RMFciNY5vIrC2LJhzv9uoxaGklkcX
         C39bQGLP9TItXqE95fwCP61uEaxXWE88NWR+zhlAyzSttQK0VBgFdpYZdB7jMXa24zH7
         JAEGtUVRBzpoJFeywGvrBOAxFayLfZRDz1nJG8Aod/Zdaz3AC++LxnN9D1Cs3l0AuFMu
         7oK6SozqpJ7C9hy6eq/j1umXeEosCZRUXKnay4bvc2jK9dSUdKC05wCaVW1iUySzr3X9
         H/NMcwFqTMd0uoAJ7Yt18XlKvvzm7DwIpgZ7LLohVbtTa1OCSb3CZRbhYH74jRVwK2C5
         kr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456247; x=1782061047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ikv7Eqa2s2Mrx2CW5Hi2avcXl63yH6FHKP5OPXB/6lg=;
        b=phAwiAldQbVWFDzf9/1PoW64yc5zUsPHDz7CaiolsKZMYPMP1vCgGIBCWRcoSrk9fm
         0beM7z0J/m6+UW7IOUSpURhzbX8UqvthtHUYBIe19VM/wpPihc7Js/y0sJLoEM9w3BXU
         ys5mi+4+Rp/Y+ImI3vZUlYTdnWukI/w4fgxPKEJajJr9yXxMXuk8v46CV2hXB3d7mGlG
         z0VgpySk8R4hqscsElpHbd6VfFRttlJAEpxx40Y7qGLMArSb4XDd21qVczAQildDKyHP
         v1nTuZyKUpfC+KrbezHyXZbruGAVTsKF6YXPQ7jNeeL3xUvinPE+5aHPWVeCMcUBhhQi
         V6yA==
X-Gm-Message-State: AOJu0YxsDUdoq6IdaMZjsIuwC5wuY/7SGT40kLZ39FUBJZvx/SdM+I3X
	FF+6JPNMhUvQ23/RJaCYMm1/h3KNBu65aQWk5MU7ImBJse1qWOK12io4GAuKBNIJ
X-Gm-Gg: Acq92OFdZGqJs6Gz+SvLcWWojmTgvH3A4TD7eDmQ/3QA/lo6qvljr/hiDauohVAqpPd
	SGethftgOd4DEWWIkqYXYFxWkk/7fyZTHKBSZVoX3AxulyBVF1v4UDBOU/7jwec8AHQD6/XErbh
	PjffMSX9jXpjmv4Srb8QxshwYG+HTdRljiRzWno3BsId7Nd9YwRXRMr5SIzKVIpAMgJoguleBfY
	/EcKUTjZT+URpMLkGosauyxA6LIbIrtaSWu1QW4TSJ9xUJvmrm+60btCMubjs864inoJg7XVJM3
	BG+uFyWmHG7Bek7Izgfb//0uJgc+F2CHsAl6nEEf7bCCtivGJD1m374+umMDNWDJYpd5phNlN5w
	an50Q/FCNVank7XYmDsfmGtGdh3gbeQ/b2F9IirxjJUiagRYh4SwWGZdq+ff9jZvQauq/fufsiG
	xP5Nf8WHiYE9TfBK91X6gAx+e4zO/T4gUgkan/z7Yr2OmcADMWKvsf
X-Received: by 2002:a17:903:1a70:b0:2bf:367b:f46f with SMTP id d9443c01a7336-2c3fdfc2b12mr84794015ad.30.1781456247354;
        Sun, 14 Jun 2026 09:57:27 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:26 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/22] media: platform: csisp: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:48 +0530
Message-ID: <20260614165630.3896-12-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..51db5ad25c47 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -556,6 +556,7 @@ static int risp_probe(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&isp->notifier);
 error_pm:
 	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	return ret;
 }
@@ -569,6 +570,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

