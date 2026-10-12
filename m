Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1987C48C3F2
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814734; cv=none; b=AvIk3eyPO6vATv7wUDvz5Zcv6rP2rZfQyzUGavtjYYOj0PSKckxg7enVnieCT+dUAt+W/8sZZfm95bRPF8lHh/aaH/DgSqiL/Oyhtxx9HWglF/6qne/HqUNPS7iVAkvmNjtHDQdzGddhis0ntHTlSlk2PAgQQeGO7jo9Z7a6lpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814734; c=relaxed/simple;
	bh=WQ7XIboTR1vqgyYymKbjyKtfPl2jvwq3FcS6nVzEnJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/Urfjfj9ohU0oOKyIgBDPgjuAIwe0IpYr8G9MuNMvmCG78NpwR3XlJAleKEu6SSbJu7ZJd5lM2f8YUJp/Ok870bopOXfPZpsNdeNN87XGOEiaxiixRDIIHihlVnJ3dXF/BjCRJMMgRqTxym2Amx5e9BgGO6bEboNYSX7XsqOpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkiyFwEK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkiyFwEK"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48af27fe287so1683624f8f.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814731; x=1792419531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAnUXHOCv1N6NobyAvFYO3nNsMFXZ2Np3QhzZc1kV3Y=;
        b=EkiyFwEK1I2hDwukikOC1NUvBdCQktGiY9FE2neq2wzpNAOzHFWLQuQoV37mIpekGt
         aPZcoOYYqSAoVsfUqT//pwaDDryPn5IOAkbPun1smEp3v7Ads03OFO42VmEf9bK7beCl
         aF/rOaFSEt7TjQBu300RLfAA65zp7AFn2kwc15eDiu6ymuiijjyjsn3Wb0y1Pjbmlz8g
         MHMRK2+LlrF5E8s8XGVmgrFn3Ye+q3hN3eOv/GDqO7Y+tozahnYcWeRxWcvQcMeOBzLt
         twbZBm6cNh+E3v/1gXHEb77kLtUsyE++lhyhc5eRFvuPWOrorCFGAAdKzxPrDGQ3pkCS
         I+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814731; x=1792419531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAnUXHOCv1N6NobyAvFYO3nNsMFXZ2Np3QhzZc1kV3Y=;
        b=PFVLNPik7L6PhV//E/r8qBgEP8goVGlDOrGMypUnkO7HHKbxo3LvuzVBDkUOg9LRFW
         BM6+gSMnU5uk+KhgpNOJVBaOLLBShsiFsH1rOSEakvqD2ihwiPDH4Po7+DfAl31MKyir
         lif8+AxBio4Slh+ew3KX63ZTBniPA+2IP+zPojHUD3zvLhtqtGtTY6IuZFDvJ05MPm7x
         AadKK7OFYw3bYjoBFf2JmOVBy5r/xssQgN6eG3I8c2BV/A/sBjceiNlQvCuw1RgaJVnm
         4uvQtfuC06Ro6Ob3N9ymtDrjqeutmA++N8z+VE1ZYmbIjE5I8BDLFPkxeyNnaGNqcr1a
         KSDg==
X-Forwarded-Encrypted: i=1; AKwUvBy8t6/XIMdwyIdFFBJbMU4qhNH10AItPkwZ+DROf30A+Xp66Bz/thZWtZ4IOVNbmLgqJfgrGsWhLwYK+Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUp+HBcXdPCYDK8x6YmGMxm75gmGgMKn0kk+n5ujyjOEvb12w7
	oaI+TKkjlBeN+XOTjzksj7gdH8yEy0qDFp8rey2gDlCSaiP+O99ESc8xVF8N5/8mLu5udA==
X-Gm-Gg: AYBFou1stANIN7lZNpwaDEycJHwlc6tLgDvXKzJgZmsmV6zJqUSYd0behtBStA1L6/X
	vQJL05pV/ejatv8CjaGSXqutoLaVTaJXlY3vsDMAyjXYQ7O5otJYVojnb+Oe2N6KyyPXoOjPvP2
	QqZ0ssCdx2Ezpf4Kl+c31lbpsePRImq6tv865yrn1QVjt5hvflSqnXPm4tgDvgTf7LCFZVM9zbZ
	UnK+C9rI+TWjmPn6SWDeD2RySeqnUQhoDbWmXuqWwtOHW/LdBaCtQJmfKHPkvwdC96xcLkaR0AJ
	RmTCP/B5gY6Dup0OK+6cIqR+lHr66N1RLsmvB8D7kIU87cEEY9G9I+clCkwkXNEn1USyt2UW+fs
	MtIE/VP+VxjM+OXFylrgTMe15a0jumSgOsNFkA7GNclo/iZaxkGAvsGtTFHzy6V6XKdhO6TVATO
	9u9wxmZ90PaDZppZK/KVTlXgcFMkpfwuCWOf9uv8FfO04DxoPHG3FwEPJi1ApQy3hn4lTgkauMH
	SoB4imeB0q1h/kpVAArtjiTBw==
X-Received: by 2002:a05:600c:5397:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a18e4a7cacmr183870185e9.25.1791814730914;
        Mon, 12 Oct 2026 07:18:50 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:da28:f29d:be73:9231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm257034665e9.5.2026.10.12.07.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:18:49 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>,
	linux-media@vger.kernel.org
Cc: Ming Qian <ming.qian@nxp.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	imx@lists.linux.dev,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] media: imx-jpeg: propagate encoder command errors
Date: Mon, 12 Oct 2026 17:18:24 +0300
Message-ID: <20261012141824.497906-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mxc_jpeg_encoder_cmd() returns success when
v4l2_m2m_ioctl_encoder_cmd() fails. When an encoder command is issued
while the mem2mem context is draining, the helper returns -EBUSY,
but userspace sees success.

Return the helper error, as mxc_jpeg_decoder_cmd() already does.
No obvious reason to clobber the error here.

Fixes: 4911c5acf935 ("media: imx-jpeg: Implement drain using v4l2-mem2mem helpers")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index e17085935435..5e466ea65a92 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1726,7 +1726,7 @@ static int mxc_jpeg_encoder_cmd(struct file *file, void *priv,
 	ret = v4l2_m2m_ioctl_encoder_cmd(file, fh, cmd);
 	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
 	if (ret < 0)
-		return 0;
+		return ret;
 
 	if (cmd->cmd == V4L2_ENC_CMD_STOP &&
 	    v4l2_m2m_has_stopped(fh->m2m_ctx))

base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.43.0

