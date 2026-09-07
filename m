Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C911392C4B
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 02:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788746447; cv=none; b=XAtAKv6X5Z+vT2qmuvqDVd42iPJi1B7OnZk7HwdGUI20O68pRVZeAiz1/xXcBdx4yhzgQ80mV5xMpK+PCByid2zmJ+Ti4Ae52ovmU24KnTTx7w5fuO4H8gyoHJAMQ9X4+8OUmr9NYex+dRTa8Va+ZwchwWFARbgqLWv3pt3r7Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788746447; c=relaxed/simple;
	bh=yYrs6k1O0eabP1N0BxH2R5bt4reAexkwhrkGvyyz8xk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BY3lr+7YeEXTQODb+PrQW5cfLNeG2Sr6DUH8lBv3qZzRyPYpoivMWzvZV7JwmLh2mSbAxrDB/urklT+M6INaLIIWJQa7BgKVoUmdA7MbL0NAxBe/Jj1LB1aOxnDw5oVAman+BrBYdWLPBhI/hoU+0iQ9xZjDl2PdID4JqMhErZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmIOn1rb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmIOn1rb"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so29018965e9.3
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 19:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788746441; x=1789351241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DODmIDn0ugaIVsoeMJTfX4p+/M5GpWJISoJXth2GyC4=;
        b=LmIOn1rb+JcWtCdx1hisHPDQTnP2cxfY0pv18vquAJ7tE+kkbJTbGHqOUjhMxQJRfN
         RHB9k/7DemTOJusOG/SWOud/X0xZhfsMstkyBZge7A4Ghv1W3fh+PLjXAneBAZFZ2+Sf
         Imkpf0KoZ2rN3qkgnua/j0EMoOt1l6fDbbso5Yr6B09BGF+zQ9ihgSCatqPZxHIQC55m
         bzNyPfHd1KV+7c//RP/mFN0CBAwMUL0/rTKq1IiB2X608aH1epRoptI9qguW/0oj/bN9
         gd/dgI91ltNfqBlJL1QoolHFgsTyWgfsYdlGHMtwUkdp7FFdynzD/O3c/CZ/VCr9eOGl
         4w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788746441; x=1789351241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DODmIDn0ugaIVsoeMJTfX4p+/M5GpWJISoJXth2GyC4=;
        b=JF+ecF29gN+dN55blCTnKUrz2jZKtpsJWwdv42yKUkKW+yR6KZabALKq8s9yP6G4b8
         fu3D6xc3oYMFz/nwbUnOWHRPWabcroltfL3ZcR6MhUUdA2IGkhhlnPm1SB4daKsVo7xy
         UfEAUB4VbiAlsXzDNAQF+O0kMFgPD6J20WxpsfbutHDo6/0aA432cQRVfGToIPUTM4eW
         3SBsvI40+wrM/RBB7L6Bv68vuFuLCfD2WXn3sFC7rQx4mm6Tf1pmGLTHtYhLbab+ugI6
         Focex3Yk5IAiJipDs7/0xEzoNMFU86OmkD9VkMXR9COGn/zQmJOOP+7Eutdg4M5cZ4FX
         h0Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ5XRlgP19aK5ZeBORk2iAF3KgF9qOrx/7UFTldNxhS2mcURpnTrsSXqB69/eV9fYFy1oK6RUd+wcQbQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lvghtb/upImIWtcV9q1nd3KhfCZ5Xaszdfx+qvAjVC39G/ymI6
	t2HA6HPGbMalOScNUCcbLlhrERV2B0N9sbHGuUdI3KQJM5AsjiutA9zS
X-Gm-Gg: AYBFou3/kVXX829dMhjPiCmMaZKRP6nbLxhmu+r4ajhTybIZ4lV4YMczA5Tu3xHVrGr
	8CQMDdPWdwQBpK8Bw+zG0VFKQswfYeBBQf7j31SHz1lKazEC148bbVbFcj/V/1LAK5yuFNI9aHd
	frGLL0pk9S62RiEjIw4Iicvkl/aduw1gdQiSUE1PTWXwnhdGx9+ASU7x73l4d0PsZk3Id6lVEDe
	60597NGlFMvyI4ehD9Ms7Mv8q7pUIvgO3KmMoIzlZmHIh3nC42SJlRqVqlzY8znDRNdBq25BzCO
	vgcrXQTW5fnZyhyh98Z26zm+anjcOnDj2GXON1xw3tKgxttsFeNLcPTuJQJTtfXv/qa3Z23bjpg
	ESivw1NQKqmn4BfRCbXOpAE+5JaesE5frx3eK5miM7G5SQCQoD9WtHxQfPQIlRfwkTpRbSddbvI
	1UN58AQqaXSfA+Jp2hdiIR0yVRd/hraIcoDLQJHDKr3Akp022NkCl+KYLKfdtxDFYTSSDNogXia
	o9Jjew4wq+X96WTqiYJVXDNair3dLZ6/p6S1P1yVAUsxQpDvNOlKVyPcaqzqOZ1VhOqh5RaUANp
	j58jTDWW/VLX2xvaUSxU7R3Bh/QkAN/jimVoFYUQEV0iKXLNtJUCetzZtgN7uUkueyGGNkxgYQw
	vVjrLT0l3qfk=
X-Received: by 2002:a05:600c:a00a:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49cf81f6736mr403091665e9.6.1788746441066;
        Sun, 06 Sep 2026 19:00:41 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b0c9-3601-9daa-d59e-970b-f46c.310.pool.telefonica.de. [2a02:3100:b0c9:3601:9daa:d59e:970b:f46c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d08144037sm170897995e9.7.2026.09.06.19.00.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Sep 2026 19:00:40 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: Make DMABUF_DEBUG default to y on DEBUG_KERNEL kernels
Date: Mon,  7 Sep 2026 04:00:15 +0200
Message-Id: <20260907020015.24719-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by default on DEBUG
kernels") changed the default of DMABUF_DEBUG to "y if DEBUG", but no
Kconfig symbol DEBUG exists, so the option has had no default since.

Use DEBUG_KERNEL, the Kconfig symbol for a debug kernel.

Fixes: 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by default on DEBUG kernels")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
This enables the dma-buf debug checks on every CONFIG_DEBUG_KERNEL
configuration, which is what 646013f513f3 set out to do. If that is too
broad today, the alternative is to restore the previous
"default y if DMA_API_DEBUG".

 drivers/dma-buf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 7efc0f0d0712..e4f078a326a4 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -43,7 +43,7 @@ config UDMABUF
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
-	default y if DEBUG
+	default y if DEBUG_KERNEL
 	help
 	  This option enables additional checks for DMA-BUF importers and
 	  exporters. Specifically it validates that importers do not peek at the

base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0

