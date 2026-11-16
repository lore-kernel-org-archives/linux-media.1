Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848916;
	b=fO8nofebhbH8lGcKC2cic92qHACILrb5K2AKdNq27dA50ZahFwi0wVZIwqc/zHfh5Cew
	 3rY+D87733rvGz0EiWV4zWPMmWFOP/l+Hzwz+r4vHje6qln8MnCpjBYjOby5q0B/JcUOg
	 oNkvVQGPaX05UB3uUi3eT1AaxBxiRvPfJPLM3pEbL83rK8dRRvB3RzzCS0Tw6S/9UmGK/
	 XupBUAb/e1x7TJtjUZfmtMP8YrHVk+7zhaT8sYtew+3azx4QsIFCZkwjfgkxqfw2YglsY
	 oIpruDY57hzT9vURm+spHSyvg+EFB5heBODpr5ZMOJAeET2CUiCVECHN54TSzIztVUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TyCAJqbOKleGpgFRMJoCvGXwTdjbSq8dLcDtNLIxJcA=;
	b=Iys0vjdWSKFbeUuMn3QQLG8RbXi9/y6Vl9/8WO2+rSbmNdY424YmCzZjkBHfQQNWlKOs
	 ZAsldMrZYdDjjdJw+sK//Yhr7WsHO9Ha8Nvd5QQ3P828J+5FNw/PuQpPr0v2vZYFcsaJG
	 9BtjcwgKNYVHntlduDcBqsXepFpg9kILRlpDVYpG/CIfkwaS8TTt9o4OZKDq90SV0bAIY
	 anf6OQqe/AmClmytMA636pYIIhOjOzeI6tzQqKOvl1AwvVmfUt+1PUu/0SkS9XgEs5MyL
	 Av4LndmOa1uYL5BwCS2yDn9dWD+Lwj07N9lTd/caQNvX3RNNNhJEFniVZlxAfKvTZZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Te7EjenT;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30460606A8A5
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30460606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Te7EjenT
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cddac941ed1so1724582a12.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848915; x=1795453715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyCAJqbOKleGpgFRMJoCvGXwTdjbSq8dLcDtNLIxJcA=;
        b=Te7EjenTdLjhLlJJK/DgwaeqvY3nzsOpzyFZoMLTyGvZKTrJmNbPSSbcde3cdrewaB
         rR5fsCC3cNWscCz6FuZTnYaKXKGvRsFd3/ydandusDQyy6gzyjgiIntRbPSXtfP66Gg5
         aYxZPu98Jc5uNTm0oyn1sG/L5N3ei0Yi7g2cmHKHNl7zgtd3ZRRukEttv3OnfrlUIxk0
         hM3kbnhSwLvJyjp4I8t7PNu7Ve/5Wee4HkdkcNjiaTu7gUjPMz1JmagV/fYFi7WpETXE
         pkyP8uaU/7dNQBVY3GLJKn8XcnOkJhPILKIL7Y27Q+L38MG+bWkrjwGu1dlTPPVOS5Bp
         Sysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848915; x=1795453715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyCAJqbOKleGpgFRMJoCvGXwTdjbSq8dLcDtNLIxJcA=;
        b=2K1+KPvNb3MnXVJMeHv4nI2eQ1dc84DZ8We3v2zn9y34anRMKpxIw/V+nVTBe39fPV
         gesWh0Jt1a/4+V9GWxx5VFwrl4C7DPGWwIQlaZUYdfOE2DyTLpYiz3cgdQ3+J8rKlDZm
         +OIkFZ+dZg9OtV5tYVacBOFOO8xiDd6VoTkhF8nLE3Epuc4IoSs3mMl/haIAfygIIBnr
         in9CGEM2iRVTMtjLJQ7zx8PfHO16Np4ib1B4jul8cgmF/l5mDjg6S6eVM39MQ+42/Amu
         +j6ofsr0SBgYrpzx3Nx7UOPy/+hTzdi+vtIWEzu0+LoUP/xJx62XH4fXtuZUcpsJ4uMo
         Ppig==
X-Forwarded-Encrypted: i=1; AL+hErFID4AD+gt4dpD/apqJuIcajeqyocBlktMlH0nnF8BrGgSixhlPlmiQiGzmdsj7uViXAVwQOZqIEmeDxA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+GOwKpDx8zJr29iAvMBByhUuJCugHI251zYV+VAGnY8Fez+uGq
	P+5/3Vw7csFfe2vBMqpwPvSFa6/TMSL11AhE0QU1ABo2bfm0zgcvCYhZ
X-Gm-Gg: AZFdTZek7lxeX+s7bR8ZQU5lrhbaVG6WMUGjUey3VlM9CB3b1ZyjVTaKqB+zEULOICy
	UGTiEPolZAK8atwkAMnjv6onUG5KrnDSUiJ5bVKi7tkKDUuHhUgFLp4RX2/sxoO3STq2eL/7t+S
	BDVe2E1E0OmKV47C95n09ZcAhe6flNzjTh589fJfVKHtpZpxuHKcUpWFQqJl5thW1Pv0Zqvacjv
	0NXXv3sm93gVbzlcjARj6EQNmr6lFk/EdbrmqiqeDYuvkLzUSRhdtH8gLk0AXDjbRBD2x/KTT7e
	FbxJvP00Y0ai7+6W/HrV2v+cDJccXq4dL1Bo1HfKlGiV6VBA9BeUcOavumqt3Q8lhGDMbzDJgfH
	dV4ff+yERkdjwia5pvEwI5/VPWYbcXF9k5yWbT0tW8kOf70x+oFndEFraR4IbfDKs9DXLhmwTiL
	81zJKMeswNtmiqjl900uyil93//kzoXw0noB9igWUNeJb8yc6qCuZtfTgf8q+MShIEa6S+jWEQ/
	0eNxCCVQtj1IKPIGBpYrjGK9PKgxrXhnW/Hm3OUHK7RcR4t6TncczDIpSs5O0w2h8UiFh9hvjks
	uChAupH5/Zy+fc83+8t9yTaoiEXshDfGpyr93UrshMGI0EcruUj5flGDIC6zJ6yWkU8t0wpPYA=
	=
X-Received: by 2002:a17:90b:4a88:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3b1b09f37b1mr9809235a91.12.1794848915345;
        Mon, 16 Nov 2026 09:08:35 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm150901a91.2.2026.11.16.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:34 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2 1/3] media: atomisp: Remove unused any_virq_signal()
Date: Mon, 16 Nov 2026 17:08:11 +0000
Message-ID: <ab38fba11a3d7c38f50c5bd4751494b4f6281d6e.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
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

any_virq_signal() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c      | 8 --------
 .../atomisp/pci/hive_isp_css_include/host/irq_public.h    | 6 ------
 2 files changed, 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 61dea3863..f1b01f5f9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -215,14 +215,6 @@ void irq_raise(
 	return;
 }
 
-bool any_virq_signal(void)
-{
-	unsigned int irq_status = irq_reg_load(IRQ0_ID,
-					       _HRT_IRQ_CONTROLLER_STATUS_REG_IDX);
-
-	return (irq_status != 0);
-}
-
 void cnd_virq_enable_channel(
     const enum virq_id				irq_ID,
     const bool					en)
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
index 901e10f87..b487b7f31 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
@@ -103,12 +103,6 @@ void irq_raise(
     const irq_ID_t				ID,
     const irq_sw_channel_id_t	irq_id);
 
-/*! Test if any IRQ channel of the virtual super IRQ has raised a signal
-
- \return any(VIRQ.channel[irq_ID] != 0)
- */
-bool any_virq_signal(void);
-
 /*! Enable an IRQ channel of the virtual super IRQ
 
  \param	irq[in]				IRQ (channel) identifier
-- 
2.43.0

