Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998551;
	b=jegSHXlCR4Cb0lRmcBhbWeSL2BLvECXhTQp5qUJcGdXsz6C9ryFd1xCRwSYFAABIogIn
	 EgS3/gX3OFCRj/gnXoENt+czmjDXEFiH0WFARPUtcXmUQjRb2o79zUdB5kdE47dZTZgeM
	 kOEVvryow6EkW8Qx1TxFaMCa/k9r5XAYHbIRP1xX22uo4zHuuOlWnyoFoPVGJmqYlhdep
	 J+aufViYmwaeQE23Q7Qwhb1JGc3lfwOAPCypR/EPtMMUICAPqU4p1hhUWULf8C0lWqM3W
	 91K7woT1COPPwciP/rdMaDXSOPcxhJGuAIwxnLp+7xhOssQjUOKH9PFsJ3fqHflZLBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R3GadRqkUrlUWiVQ1/haVsz74SA4u36BlKTcEUmJ2ko=;
	b=agMu4JvSp9vq6OH6NvFj03Htiy0+5ho5+zWH9Jm6QJsirpkg0UpUIeM2jL6mpjMVvY96
	 vxpWcoWpbpKxTjVvJrAFmc/Kj5WVFC9CKyb1c6YeWkdk+Afze4uN/xxubod66zKk5XcXP
	 rdk3un6LAddkezCUmGrjh0m2mwJMKPle1o5Hz6Z1jhcv6K9I2JO4y6cTgzmhA/x00/N8R
	 8Fu0Y/6ydPr4VkD2v3offGQCc54erR+m+smuFXdJcQVQ35LFKtFOiJ1clLak7lQMADPTl
	 6toSl0g+hld4Q4ehnm6qSX1//f9EZkemVTSDr7ElJ+h3Ubq7qCgE6BQ+Zof/iiW6Wpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="r/WC8+Pi";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0904606A32C
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 20:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0904606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r/WC8+Pi
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso1623025e9.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 12:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998549; x=1794603349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3GadRqkUrlUWiVQ1/haVsz74SA4u36BlKTcEUmJ2ko=;
        b=r/WC8+PiKuYGcgHsp53IhgtATamLlvmJ9DxHOqwkIsCelkKWWRQIrBdiCIZD1k0eJL
         UosQXsLyF1Z7uEToXzt04F8abWfCoKztejsGn58VfW/HmzSB8UJMxcuk0SwF3Co0uJNr
         Z/NmmI4XzLPCpudKJlLslycAYpZVnmiqSzKXhkD/7Yb2F16MsZlE0vU+vJchCXX+VlF4
         l+ZDdF/lzQBnNI64oOQCRHKn/XLYq6BCZm4ESXKnrNjq+ZFxfSmSdvhbQtMoM4UClk4R
         U5xXEwTNI/To0847cbJoe7RvXGtDPHYQNbaBNG8WF7wdmfXLe5FDIlmI2SXq0ES+2gqi
         jpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998549; x=1794603349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3GadRqkUrlUWiVQ1/haVsz74SA4u36BlKTcEUmJ2ko=;
        b=2CGJIhWGWkuoKdR87TDG7/LV0wisCu7j1cMkGo1aZZ6l+U+vXeExT2S7CfFlAnBee4
         WkCdY+WMnclh0mm5TIHUD6CTCaMKxqHkA8gCNXTpwDnDNkb0Z8jAmB203jE7Ky4tzUmp
         5w31UzpWi/PcSKxpzBJ3541Z/uO7qlL1zmt4pujvWGdJEIrjX6YS8WLzHTz1xF4uAN9l
         uW5cCyMmZOAluACzWebPtOnhonun5SdrkaoSwHwjJyuCVdNFdIM9+BGqsC5OVlbCG0lw
         S/OX04W7QFyP0PcSbHsjJnSCtX9PmA1o6HaNlroLRxx6xEbCB33pJfQH3MA6zxu6NeaR
         fBVA==
X-Forwarded-Encrypted: i=1; AKwUvBw8ey8lHpyWzGpbkIss9tLp/5gmR5XLEYpMg5xFqby/sAUBoKZO8Tp2I+yDseKrxHcALN8MQ7wc801yWw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9HJDt9dmQnf8HN27giLMxGV+rUl83oH0rp0QlMe5Fq2Ye/vtRs
	uSHf7C8Y4JSbjqfHPYZmyybqLYudQvCg8E7mZuuHqKVHSB9NcfDrBHcJ
X-Gm-Gg: AYBFou3FZoyTbJLEvKsVGWspb2loroBImlVdaIIOi++BFICts1UjAgKPOnyptHUo61a
	+hg2oiq29+adv9Qr/8OrFbCXIiQoSCPL90PS40sAz9Xx7igUZ58nBP0Sc+vwHXyOcbswB/sVMqj
	xu536mOjoeKX7Rs3QgEaborT4edd9sunCeLd4woKnM0WDA8MYz1O0Hxq8HF8FQGC+1CneV5D2ZP
	P5ghZ6LBOniRM0sgOFUk3OqgyMwBDD4WLJBYWQXo7+DNDoOkskfbGsKisL1g1WCAgaNyPv7OvM5
	Tw8VpPShzeYLxPiRJy/bXkMuAwSKDruaNLpbSVY5zr5HdL2Qo+Do0nGCe+2g0FPREuRA8utN0N1
	RQCER1GoOIoUtBTGYN/0rA8gEmvophWI2FsM7za6BNqZe7vrVPJT4/9jhlypuTY4scB5bihPTd4
	bvh41BbFQ4Asp5lAUVkONbQuUS2EAgzgMhwHyZbRO21znkq8slCDZmkvsT3V1lrbJKFqOyBudaJ
	H1Wxa6YJoRjmRChdVCB0deLusMBPOXUQMPH4cFsHX5lIATokTIZJbJJ5Lr/R2b8iGQMLwYRxpMH
	deNjQhnzCUdbYBmV09HxTtQY5ffpeXzrY0L+B8WMgPJvrzMzAoVGgw==
X-Received: by 2002:a05:600c:4fc9:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4b6e017053fmr65530385e9.23.1793998548862;
        Fri, 06 Nov 2026 12:55:48 -0800 (PST)
Received: from localhost.localdomain ([87.13.215.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3271abasm7354075e9.4.2026.11.06.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:55:48 -0800 (PST)
From: Francesco Giandinoto <testata.nucleare13@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francesco Giandinoto <testata.nucleare13@gmail.com>
Subject: [PATCH v2] staging: media: ipu3: Fix alignment issues and remove an unnecessary blank line in ipu3-v4l2.c
Date: Fri,  6 Nov 2026 21:53:47 +0100
Message-ID: <20261106205347.10407-1-testata.nucleare13@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Fix alignment issues and remove an unnecessary blank line before a closing
brace in ipu3-v4l2.c, as reported by checkpatch.pl.

Signed-off-by: Francesco Giandinoto <testata.nucleare13@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 61fdefe78..e9b2ce2b4 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -248,7 +248,7 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_rect *rect;
 
 	dev_dbg(&imgu->pci_dev->dev,
-		 "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
+		"set subdev %u sel which %u target 0x%4x rect [%ux%u]",
 		 imgu_sd->pipe, sel->which, sel->target,
 		 sel->r.width, sel->r.height);
 
@@ -291,7 +291,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -306,7 +306,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }
@@ -753,7 +753,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 		} else {
 			fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
 		}
-
 	}
 
 	if (!try) {
-- 
2.56.0

