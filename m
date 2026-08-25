Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6D323D281
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 00:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787617409; cv=none; b=ogx33ZngjZnU7OZZ4+KvZuIaVRo2LbdXZd0tWxZ9q9Y6Kkh1dIRFlnQ+gMgJtpz/ARuTcuReHbJ9dbEXeu/Po9gCMZimb5XLM4Zjw7DB6kR4hUtLRutyGXvKSr/1E9U2XCYbDZC3wmqKsHXQ6gG9G4JhzZIZKXD8aieRiAnuqI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787617409; c=relaxed/simple;
	bh=8Ohuk7SxaRMgNRAI2QDndqerJtURHkZBt819Ep/HNF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p89+ElC4HxgsZkTew8aoyYm7BG6IakdpPvPTyHqReVr/qrOGqmC+IFR5JELwq2mj5GaaR9e0SG2xKahPWdRAPxL/foKG5piCMWlDzoG+Bov/ITsbBlpc5rP26pOtG7wQa87IhDhmhaRue9wY4lUCU1N02RQpgTVgHiXqkLi0izY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKQ+GwR/; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKQ+GwR/"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so1709336d6.0
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 17:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787617407; x=1788222207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GzzrJDRo8J+Bn9++DveRDK7yY0YpRf8r1a0n6rrhbsk=;
        b=EKQ+GwR/7Pw4+CKVLeQhQulKeuiZyEk+T/CaoXedKkU+p/cyU6U7Y8RQ5I6nLgpSqK
         VcpBszktgAbJkP+f8xmkiaklTO3ur5VX1isG4vAYp4xjLLEwkYDO2cFT0rDRufcJGH18
         MqbczcH2KO3fDwAv6Edzu2q8LdJ819APeTgj5imm6l08BYXFwy+tBX8RRUUqW7Q6D1r9
         n2w9RUaRqSUqN0gQ6ggrUB7GZ5QNkVvYmqiCB0/lNnFCl1wVCQlsLjg14FSTGqPLeqLz
         /5C2g5LLTwu9LibX193CoWzpB1q0RsOpPcnrSVKWCYO/br4tEZu464W24icFCofHYbU+
         Vrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787617407; x=1788222207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzzrJDRo8J+Bn9++DveRDK7yY0YpRf8r1a0n6rrhbsk=;
        b=qmFi5fH7qaARarFAO140JXkDUYq2HdPK3fpE+Y3eaJPvFfVWQcN/jfw7S+026lGz7v
         M9srb7P/CIbdA8e7Hxkrg0po1KwNn2yG3jgbgAiQPnNGPE1qK+NIZsTL2ChX3q85gWoO
         OMxxeP1/dJjgkSi5tPROICw5uDMGBKXwQtj1V+muP4BCaKjjtQUQAyfaUF6nRMPOdVPk
         xPz+4/WTxz12ObncAIK9EM3w/7d2XUEGt5AP8qT+G1ae3oGm+QUczophQmVWV5QrWK3I
         x/MLHOish5ud952b64narJlMOXBe9ieDPlxEbanRJP3EKFaxWMHsPV5S9rdeO14NjN8e
         YCvA==
X-Gm-Message-State: AFuF++lPUVUqTVNsbyEGE2+IS5Jx/QXPf9Xq1W8g+JSGFwF0+gHqkYUb
	GwQ7QhPYUAFQMBuyryqrhOgTKvQpwju0IQduE/gEe+i8hn/kqghIL23Y
X-Gm-Gg: AR+sD13Dno6wVIA5GHLxGsdnmMIU/rSxSgpJP8O9TLgJtNMqpshgw9SQXiz9n1RzM7+
	gBxHXWdOR0VIJh9Hfp2k6PfuFQ5qX2SAZ6k/OU9a23+ayqT0Uc5RF/eBl1RiHpiyRn66JxmeawW
	q8sAzy/eDuyc6GW0TwwRU31MLoUdDi1E6lGc0SpY5TosJjUgNjT2zW0k2qYmETIXQA2lWLfOtOi
	HzEjJ8PvHo3tXfy32SgrkTTb6e7PoekYvfIenusRKADVc5p3jlWTa2+s9/v2mEM9j0E2OkNA/7X
	4Xw8sVJ5mV7hLk1IaLza7EC3/Fz6bgCICrQ7hGkto3g/h55qSiDlTsmUqTcax1WdtbJw4NxHvq3
	bUQ6t9aaWsE2uOX4QIXGCuCVrvmFokpdIxDEWGJekHbtuuJ1SUAhGqZLB26CHf4WyY/akXAkjlQ
	qPlP0FwM4HpC1NsaIcdw1ai7mLi8AgBVz2+q+jtq3v/Bkub5bdfVKELJ2zbhFDUvscWH738udpI
	1W353xdhhyGriSjUPIXSaJck+NxO3QU3uuNHt5eRN8QIPfaCdtcXXRHVVQolrYXo4QWR4KLdWFc
	kJkrYKVwiaXDTfDhqeXQzEhP
X-Received: by 2002:a05:6214:390e:b0:908:598a:91d4 with SMTP id 6a1803df08f44-90cb6051637mr38214346d6.8.1787617407082;
        Mon, 24 Aug 2026 17:23:27 -0700 (PDT)
Received: from zaina.mynetworksettings.com (pool-173-48-203-201.bstnma.fios.verizon.net. [173.48.203.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c935e2423sm76625346d6.6.2026.08.24.17.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 17:23:26 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zain Aboobacker <zainaboobacker33@gmail.com>
Subject: [PATCH] media: saa7164: remove register dump debugging helper
Date: Mon, 24 Aug 2026 20:22:40 -0400
Message-ID: <20260825002241.12074-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

saa7164_dumpregs() dumps device register contents during initialization
for debugging purposes. The helper has a single caller and is explicitly
marked for removal.

Remove the call, helper, and declaration.

Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 30 ------------------------
 drivers/media/pci/saa7164/saa7164.h      |  1 -
 2 files changed, 31 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index ac5eb6b923e2..8c587d31ffec 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -742,35 +742,6 @@ u32 saa7164_getcurrentfirmwareversion(struct saa7164_dev *dev)
 	return reg;
 }
 
-/* TODO: Debugging func, remove */
-void saa7164_dumpregs(struct saa7164_dev *dev, u32 addr)
-{
-	int i;
-
-	dprintk(1, "--------------------> 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f\n");
-
-	for (i = 0; i < 0x100; i += 16)
-		dprintk(1, "region0[0x%08x] = %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
-			i,
-			(u8)saa7164_readb(addr + i + 0),
-			(u8)saa7164_readb(addr + i + 1),
-			(u8)saa7164_readb(addr + i + 2),
-			(u8)saa7164_readb(addr + i + 3),
-			(u8)saa7164_readb(addr + i + 4),
-			(u8)saa7164_readb(addr + i + 5),
-			(u8)saa7164_readb(addr + i + 6),
-			(u8)saa7164_readb(addr + i + 7),
-			(u8)saa7164_readb(addr + i + 8),
-			(u8)saa7164_readb(addr + i + 9),
-			(u8)saa7164_readb(addr + i + 10),
-			(u8)saa7164_readb(addr + i + 11),
-			(u8)saa7164_readb(addr + i + 12),
-			(u8)saa7164_readb(addr + i + 13),
-			(u8)saa7164_readb(addr + i + 14),
-			(u8)saa7164_readb(addr + i + 15)
-			);
-}
-
 static void saa7164_dump_hwdesc(struct saa7164_dev *dev)
 {
 	dprintk(1, "@0x%p hwdesc sizeof(struct tmComResHWDescr) = %d bytes\n",
@@ -1344,7 +1315,6 @@ static int saa7164_initdev(struct pci_dev *pci_dev,
 		}
 
 		saa7164_get_descriptors(dev);
-		saa7164_dumpregs(dev, 0);
 		saa7164_getcurrentfirmwareversion(dev);
 		saa7164_getfirmwarestatus(dev);
 		err = saa7164_bus_setup(dev);
diff --git a/drivers/media/pci/saa7164/saa7164.h b/drivers/media/pci/saa7164/saa7164.h
index 94e987e7b5e5..53ef9c3343ba 100644
--- a/drivers/media/pci/saa7164/saa7164.h
+++ b/drivers/media/pci/saa7164/saa7164.h
@@ -490,7 +490,6 @@ extern unsigned int vbi_buffers;
 
 /* ----------------------------------------------------------- */
 /* saa7164-core.c                                              */
-void saa7164_dumpregs(struct saa7164_dev *dev, u32 addr);
 void saa7164_getfirmwarestatus(struct saa7164_dev *dev);
 u32 saa7164_getcurrentfirmwareversion(struct saa7164_dev *dev);
 void saa7164_histogram_update(struct saa7164_histogram *hg, u32 val);
-- 
2.53.0

