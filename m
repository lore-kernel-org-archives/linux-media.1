Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196133;
	b=k98At38oDJ4lDdlM5y9OYFnitWPxFayjIKXPjVAMMVb2yyGZqd44lTLpSd7d3WGwsRe9
	 RoSq9VQdvdHBZTC8lWSZZubv11Gqs95hVSyjmi5uyX6X4JjjoY0IUirj4RjMXevze7PRY
	 baV4DqEOrwsvUysaGyenZPusiiO8rVSwHh09Wz5e0p5pUdq1iQqhLeVmYT+E2ZPL300vy
	 De7CG2BbecVfFqrDYEBQqNXVKWrSdEZ560P/hWGC2W8McQzIh+yf/QOqPaODeycyPaC5n
	 22Tak7MJdcxxCJBpNtI7AIWVb1JLw40COUSBK7c/BBMj/hzfmVhi4Z/aFWJmbhQg80Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196133;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=2n2zs14xPakSNx4z7J5v3THcb6G951+ehp+zy5kuS/Q=;
	b=jXohcuD3inED+FLguK89dcBHPM971R4rK9UyDtPtpdKXvxPUiWmrFQmhB0o5pRo3HY3f
	 0CUzDHlRmljhsdRxGlBFGRxzHmjaFeho71wWFDXgTxU57Vn8h+Ys803JSozDAxMMDaGjR
	 piFD6mwudqYfkEeMB+v7rxPzK3vTjwt8U445YgrEWfUPg/jOQKQsbKDHcBicrAlzms9IE
	 oj0QKR5rjSdbZURu3Iit/B0lHLufsyuqq4nRzValefKXdH6zhtLo+5H6DO9ItOIj5ZpsZ
	 fBKBKgB6Mkt5iNGThDsZDzJtFBU2PORPvX8py3NaGU6okwTZCDHauZUMAZPI5Fb5Lfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=cKaAddK8;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D3960A2605;
	Fri, 20 Nov 2026 17:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D3960A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=cKaAddK8
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5573c0abd;
	Sat, 21 Nov 2026 01:35:24 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: Fix potential firmware leak after partial loading
Date: Sat, 21 Nov 2026 01:35:22 +0800
Message-ID: <20261120173523.3923967-1-liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1fa06fdfa03a1kunmffaab860238b7e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSB0YVhkaHx9CSE9PGhhNGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=cKaAddK8jh/P0mfm2ZFvOUGmgcb1bDvhGPPvyAxq+6uOwoFl7nW1u+d8e2q+pLt7QpOhcbudw+qJNI/N+LdXcohrHJ+AxhKXTfQTRQrAlxbtFabBNIMNVJu72NfmwnWkkLE2ZhwZqAKQaB9M98rYrZ/vpc4nVUXyOr1XF7DkAXk=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=2n2zs14xPakSNx4z7J5v3THcb6G951+ehp+zy5kuS/Q=;
	h=date:mime-version:subject:message-id:from;

A failed firmware load can leave the minibuffer table and successfully
loaded blob parameters allocated. Probe skips firmware unload, and a
later retry overwrites the pointers to those allocations.

Unload partial firmware before freeing the IRQ. Clear all_binaries after
freeing it so cleanup after a later failed load cannot free the old
allocation again.

This issue was found by our static analysis tool under development.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c              | 4 ++--
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index f8875d2b581b..4917d6bae44d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1423,7 +1423,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	err = atomisp_css_load_firmware(isp);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to init css.\n");
-		goto error_free_irq;
+		goto error_unload_css;
 	}
 	/* Clear FW image from memory */
 	release_firmware(isp->firmware);
@@ -1442,8 +1442,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 error_unload_firmware:
 	atomisp_pm_uninit(isp);
+error_unload_css:
 	ia_css_unload_firmware();
-error_free_irq:
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 error_unregister_entities:
 	hmm_cleanup();
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index e9016d7775dc..8fe22eff24a1 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -511,6 +511,7 @@ int ia_css_binary_uninit(void)
 		binary_infos[i] = NULL;
 	}
 	kvfree(all_binaries);
+	all_binaries = NULL;
 	return 0;
 }
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
