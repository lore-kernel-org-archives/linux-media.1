Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E32B3101D8
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 01:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786411049; cv=none; b=pTB+XrZU71GIvrJvseQGZKuK+sMxDU1Kqfp1gJBh82Nwu7Yog7APPoEv4RBs2vZNpIH4OrQeN+MnPAE9FtuJDzHRxUIqDn0mJZ6d8sEAqBbFEnAIu/vkCagMb03oh90EtYyibcdVYkx5I4gYy9ZdH9qukiATG3FW67xPQp1Iu7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786411049; c=relaxed/simple;
	bh=VikHt54Ptc1U5+w3VcuMD6AVAjm4zUAmKq760HwXhjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gj8qpfy05ptgG7TkMOYSKK/t1b+cz7BjwNBfWPORQTMRazOPpiemM6Y4Wq0vD/dpkFemPz21iJq+xSmSsRY6OO5lFcZHoVW6Y2S8VTCVn6XCTPv4Y2Bu8G33sQ/OQHKUp9aCoCM6kFqCaCc7thaKOlnl39+qkHGjI1ibjYfuZ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkJE60Ft; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkJE60Ft"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceeee8c46bso6478945ad.2
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 18:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786411048; x=1787015848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QaU2aib2fka6g8K5mPVr/qx+AvcdUlKsiWM47P5rcKw=;
        b=LkJE60FtTVDJxK0/5ZkXWZMSkEk2l1MTYe/4Ny278iq5i3IV0HeTINgd8KoNDrjvTR
         rPSMyuBuaRKz9S7s2dkuKNRs3kiUMm7NEcC/kkQ8tLhoVGxT1/JlTwkpU8seoHwVYIHW
         UejRp9w/MDHh9TkYcIZ82LxCw1+vvu3hoN4uc4/8eBaYM2SmFF0mGupks97VDsk2EpDG
         NIZWW4VWvrDhrvUGVgUzXTDXsbnY4l2/UVx4Bbju43C34JeTAxreflQ9uC8441zU6Vcx
         t12Ba68kP4u5frKnC7/+/VssXy9/QH/mHCZadhmf6YuP6ejjTYnpIxRcN0tTwED1kiZU
         WvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786411048; x=1787015848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaU2aib2fka6g8K5mPVr/qx+AvcdUlKsiWM47P5rcKw=;
        b=Ieyk/A43Gnn2btqqPRPTbX4ox1gAAHzbolS2j7Idms2ZsA3yfqhbUhHk67flMJXZro
         VjFFbmgko/DN9CiQBpm+azJmGmSu7IialPFgKvP3H/gf+ugfs7+u9sgvdCBfSx9L0Kmk
         pWK4dMMQgdQKGeNjaIjuY6TplEDpJGeClHHuyZdgx2xqrMK57Ohk9uLfXWRaZzofXuR6
         fXlIfqq9JYILiwLD2sKagp8q1MxjWfuxyupiHjLtlBW3tX1ZJQSKhEdoszpApqXsZ//p
         0xglGYl/WWX//A6bJJFLiwByASdBSY6ZS30ONQOvfKRcTF7G2mCtCnKHmDvBqOQSbGLS
         lqEg==
X-Forwarded-Encrypted: i=1; AHgh+RriMbuc08APNNqr70sSfqN27DzalHcGq44UUB9x703GWrZ389uZC7LcPVEDeG9BIZ8QgA3aijOeYW7X7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDR7+gIskNMxj4vuoKsxoSSawDFpjiju9686nXylMrTDLY/QqH
	d6wiapfyHWkUaEehIS78eJ81QzaSL+5pBLloKNEh9hoa+NC9qsdVZY/O
X-Gm-Gg: AR+sD10HQY4UXpfDBduFIz+DuwJEEic679W+Q8WidTAbES09Cb115gFJkgQrn1yX59e
	Uo1BmKiapVCcJWpiFVGkBkddR9SrjduKKh9J0+ZdS2TQC4xxLgkF8XmfXnnbWac1XDKZ4fqd1TA
	vpogNy5NB22mIdfhU4kRkCQN6X+ka9G65jRDcUSBvVsegh/bymRse/6+xU5NL5oGnjxEbRitCre
	As2WqqUgxhqLajXWrAYs+yqZZzJ/yYr3HUEh9WtU1yfIjZIXqozhT+lDVJt6D7Lql1jnzD39Jrw
	fla82REuuZQQHRUBwIRapXpXEYMlR/V7rG3EyE7R8mLho5iQ9CpwKpkDNW7be+km6S2YwR6HpS7
	5H3lFP/11gZ1pC92CYA1cMsB+vgxTmgvMkgFT40e7LEXqiaOqsbviKNkwJNkgOv0FYTzEmlB8gp
	cBBjztQ94eNuIl53PrNQnnwjutRPhzxd8DKLpLYqdGdeY9O56zOp6TJeoRWPNZRwvBHDyMP6DCF
	/zC
X-Received: by 2002:a17:903:32c9:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2d0caa4978fmr344731335ad.4.1786411047625;
        Mon, 10 Aug 2026 18:17:27 -0700 (PDT)
Received: from nixos.taile51c2e.ts.net ([122.161.243.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a706fsm46935750eec.8.2026.08.10.18.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 18:17:27 -0700 (PDT)
From: "Sidharth (Siddhi) Sharma" <wednisegit@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Sidharth (Siddhi) Sharma" <wednisegit@gmail.com>
Subject: [PATCH] media: staging/ipu7: return 0 for IPC messages that expect no response
Date: Tue, 11 Aug 2026 06:47:18 +0530
Message-ID: <20260811011718.274510-1-wednisegit@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu_buttress_ipc_send_msg() sends a command to the CSE and waits for the
send_complete completion, which the interrupt handler raises once the CSE
has executed the command. When a message does not ask for a response,
that completion is the whole story: the command went through, and the
caller should be told it succeeded.

The no-response path does the opposite. Right after the command completes
successfully it returns -EIO, turning a good send into an error. The IPU6
driver this code was derived from gets it right, since there the
no-response case simply moves on to the next message. This looks like a
slip made when the bulk loop was collapsed into a single-message helper.

Every caller today passes require_resp = true, so nothing is broken in
practice yet, but the return value is wrong and will trip up the first
no-response command that comes along. Return 0 instead.

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Sidharth (Siddhi) Sharma <wednisegit@gmail.com>
---
 drivers/staging/media/ipu7/ipu7-buttress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/media/ipu7/ipu7-buttress.c
index 40c6c8473..8b57c7c1a 100644
--- a/drivers/staging/media/ipu7/ipu7-buttress.c
+++ b/drivers/staging/media/ipu7/ipu7-buttress.c
@@ -265,7 +265,7 @@ static int ipu_buttress_ipc_send_msg(struct ipu7_device *isp,
 	}
 
 	if (!msg->require_resp) {
-		ret = -EIO;
+		ret = 0;
 		goto out;
 	}
 
-- 
2.55.0

