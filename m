Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8EB4749D7
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521718; cv=none; b=e5KTjOsQqwlXKgkbqOLcR4gchD1cRF3BRECKVx1duqnqveu8Far1Wb1o8XtDeDtqFw4/dcYHIzeeFsg5K33lj1Q1lSgSYk9L+5vUa3lEkbVi3atNWra8qSwKlUJ02cZR4abYTrGeAQaMeStam+CfXsaLv2E5IZ/uEOF+u+s/y6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521718; c=relaxed/simple;
	bh=XjDrZd4YIhNKuCnOzVL9JK1gQzcT2yvH+5UE75VLw7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZ1ef4o3Jo1sIBY6PVzm3ByqLOqrZ7l/34yRa/0Nu03Ex2+aYeN/5JR8VJItQXAk1OMGuBdKDreHfCzKN53jHFkLn2eOSQSoIn4N9gIVb3wnqB9ZRi2FWaLzgTkK0UjS2nNF4+GxY4pZKiQzWAOH4fPGoasI902ymoc3GFwDLSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7aVp+81; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7aVp+81"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1033274a91.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 04:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521712; x=1789126512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJW4o/L291SC+eI59BXCWfFEdxDJM34jTF9K0ZgdsqE=;
        b=l7aVp+81Qx8D8Pf5MtN6a0LW0Wv5m5oq0vgc11S7G0E3wiFijasTECXvar0Uy6lqsJ
         Yu/a+HwBkFMAGVlLSDpQSRIB9HXvIOOfTAUNQ5w51a03Uap4uhfQgzZWCZLwL1xnOoff
         NW+0vufX76M7e80J9O0y3fzvr8ZOMrlGIwVWFrQkupFuAGycDzaqY6OKh+JIo2p56e73
         T0rlgKXdmqjQ+R8tzY2p+HUI8szTLMj5j+0PjcKqVa01ieHFwXZtmsaQaWylfDyg7Mrg
         0mCfbTWlQ4NYurwA05aMtuN8cODh/X/M0WPXR4xwdTRzxBcu6pSgLsBsDq4gEPoTFK8v
         X0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521712; x=1789126512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJW4o/L291SC+eI59BXCWfFEdxDJM34jTF9K0ZgdsqE=;
        b=R1cJZhtZ3X/ht9MfQPRsAQCtWGcNY6XDdgYtl9T4JzCDMixs4+p25ZTEal1KZHjC7w
         VZJSQbP+xjFwntgUI2aC8sC0+J4+noRo/NaTolnBtlRr4b844UvSmtk6MxLWfUhGeaIY
         hdDMCMAXeYSGQ/pmQyy2Zpy5Vx9jdxR0dMdVgG4BYQ2f1YwHeIcZSjAhHQyCbmDdUnPs
         r9TuxJSZDOlDlk3ZQajecWsMje5Y1LMaV74zZLr0HTB5NhOM2n+0PFttbxqqPIq+nOLd
         pQzXPuiRKOQf31cxtE26ytgyxlsdEiu8K+hrG2eofxrh6Rn5S3KxdCSugMVsnVDUOZZ8
         JQzA==
X-Forwarded-Encrypted: i=1; AKwUvBy+oK27CZwMMUJbtmYZ+yPHlYMjWH3upGWHAq+Sc5MMPDkRzcIQgIfnM5lm6yTLB0QUJeVAdhzQ44wuuA==@vger.kernel.org
X-Gm-Message-State: AFuF++letlZArJY8jkUv9jcETmFTjZG5hwA8AVu2EtJrQEIhBBjsjUpx
	GBKxLeQMZe1VRX3M/6ayYNnoBwTGTNaLMkCMaLHD3g6umF6r/1xcQFao
X-Gm-Gg: AYBFou14fcnMCpMOZAOxfET8X+Rc1KPDm5Vsm3lgll4sL9Qa7AeFBZIDDtBOwtqtpQj
	1hLyfZC/+DtNlVv20mskkzB2Uh0nF8XZLkRnGM12XG4SyWcl5FddjLf1FjjP9NjbRVPeyvFqK1i
	KPoUbQ48faH+EWEtwBEQX5920znz2lo2fVHRNzP4t9CyUc/G/x0TUU7gDYElvSOkM5KUdC/S8t+
	cl1zXcjagMUkeX5tnpCX0DnMTvWegKYJCVimi+KrprVpRPkn8Sfe2Q0n/Z0Lqj1h654h0AdBdPE
	WQq0H+vMQCZfNqMgFOuBnwbNNP51FEV1OGqehS0CtOxBF3cx+qE0qmyU4IRQfvWJgNSPs2fQZcQ
	/1AIhnVgqTJ59mn11xN+fcKfdCL1tx0KmkzDfihp+6Ai/1VgMxqJrVVTe8EyMwQ0hNyMcoMmdJx
	8Kue+KoDcvj5GbyFB2Ph0CW0IC0KpEyDG0vdTiF2nBzAkM6nnWLUdYi20LOKBvMAc3uMGL5y+aB
	i1ao+gC6QPwiVI=
X-Received: by 2002:a17:90b:2ccb:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39b261d8533mr9704057a91.17.1788521712347;
        Fri, 04 Sep 2026 04:35:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm6054536c88.10.2026.09.04.04.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:35:12 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: pci: fix repeated word in log message
Date: Fri,  4 Sep 2026 17:04:44 +0530
Message-ID: <20260904113450.15838-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904113450.15838-1-hemanth.selam@gmail.com>
References: <20260904113450.15838-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the word written twice, reported by checkpatch.pl as a possible
repeated word.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index ac5eb6b923e2..48e56617f324 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -856,7 +856,7 @@ static void saa7164_get_descriptors(struct saa7164_dev *dev)
 		saa7164_dump_hwdesc(dev);
 
 	if (dev->intfdesc.bLength != sizeof(struct tmComResInterfaceDescr)) {
-		printk(KERN_ERR "struct struct tmComResInterfaceDescr is mangled\n");
+		printk(KERN_ERR "struct tmComResInterfaceDescr is mangled\n");
 		printk(KERN_ERR "Need %x got %d\n", dev->intfdesc.bLength,
 			(u32)sizeof(struct tmComResInterfaceDescr));
 	} else
-- 
2.48.1

