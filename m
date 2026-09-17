Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE7A4E0B76
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 18:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669274; cv=none; b=gPeDrl5id3PeA+UAYwta8sXBRA2Uqa/+J+qsvuM7pKKm/HdGoL9UJkB04JH7kudjJBQsEycNeubjBhD9CYGHCtlLlMQ9PvWtHmxDgBHESmKlByeFO/qXQaKpdbjlCxi6f1vpa6BvVfJR7ElXTa1clPBajhh3mE7Ah1cxnBJLMW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669274; c=relaxed/simple;
	bh=6QaB1vCAHPDrZfq2UMtr0C/Dsi8/MZihkvuPXytBOdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kl1ytyXG0kQY0cN0ZmqYaejnlJ/dSPWAVPI12sve8+pdFHRuU8GM5clu8f4SCKbvhxbfDG3+Q2A7ujFDmkC/yKYv2MEetDwizNCgUmV7XUkCmEeUzxSl9KPIpaCt/PF07978LUVtKqJJQcLMN3J8VCFAloYe85nPbCan0uVWMfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsJyOlk0; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsJyOlk0"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so9962516d6.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669271; x=1790274071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxvIE5VyPmqRXC8q+9POUQDnnJS4uUoBxGmPT77wF0A=;
        b=hsJyOlk0GVVLp/TJvSOu56tX9ctJP+DNB+uKybx7JFxZmmvpr6c0/U+kKMuPNVG2Y4
         aAjxscp5NAuG8QiTHHS0ZLCGoF8NIKN+e2u7UzoLXoi5N+Sl0pZQ4Xrw5qsJYfKwBuAS
         tueGevEmShuRGR+ocbUT4uflEm0V7NTLsRYX27nFUO/NkT/KXZWRM+W1tZa9efWJWvrb
         pZAhk92jcp6inapGjbjKfPs0gYKE2QzWRMoyp6qRWJH1Ui51FXzmxU4w+LGbrsf0PN/N
         nU5wwShf22un+trMZTgxa2W+B79efUK3D29fSBlkKVcUpE70q0YCrGNTTQGq51PXnwHG
         BvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669271; x=1790274071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxvIE5VyPmqRXC8q+9POUQDnnJS4uUoBxGmPT77wF0A=;
        b=TJMdFvR2aCe5yw0wADOc9N0yLBWj/Vc4TGMYCfAkfzaiAHeGnW8iBTZgPCSVatqiu/
         hFR4ouoTNBDZAkG60+rh2zBvO+TjvR38GpizqKrhodXTZC758ehy+5t78A5UafgxPSev
         MxalOBlHsb2embD2pDAh81ilhl/le+hQvYsFFQeC804JmP/yhy9es0H1T9CR5XhGkjDa
         eOauLxkC5j/COw6nR++otkEkwMJgJ754czRGtQlwdLTEzewhufTtClxJj0EagEhf5kig
         gI0WSg2JJQO6GpdCMLsoKeOvNk0EPpnEOqcFVqAWuR25LrWKckdvDGvxkGHuE2ca5kjx
         u6LA==
X-Gm-Message-State: AFuF++mQ3QewS2j+c6h1pEDsozCEfcF9CmcQEYCkUhXBQoFnF+ahQpVG
	M2hT+IVp11gJJFxzJ2jX9hiz/nrV9ZynAe3ElTHrRj3xTspVg5vNAiA=
X-Gm-Gg: AYBFou0az5YLudUcPbuMLTzhaSL+Hn7bnYNN0Dv8OZbD4GMJ6QOKvjFemJCCJBXsjzJ
	HsUxEWQ8iRWVsuH+FocruIVzjVVoB4wWiVJqvdbxT8Ch4T+JLNb1pWDyPCmBFXnKwe5Xf9ktZxF
	2HYGE3VhafL6hDVIv57IJ7zuF7brSpARI6Om8D8KhpWVU04Oms0xQG0Za8HFO+arkWW9e3++XnQ
	C4oY0bwq3Sd2IbJLFAyHBRn4h683g4cqpNg4pjZSPQmhyQEGLMAY78WMRjA6g9eXkl+4YKiNV8B
	8O2kD2KUbbRbFpRucyZPBtnGhbOC1wTQO5eaC3KlemhEtEbnsVf0fJg3r2x3IjQ8f8joQRd3k5d
	SiU+7FhNaw50cAVsqyecUPSPTsYuKYJ33RFJq8G/A3tM1lj8Z7SeoJ5aPza5O6e1JhG+GNZYiI7
	FFPfvhMlenVAKrP7hAOqjIhUmA631IhukOZnoGjMfDvUW5TJegIe54LWe5v3a9wV0BKwHUed4Pj
	G4hRHb4C9I2IRzX5Y+pIe0rZv8K1+NVM91XPILsBPxRvOTP+9Z011k9Hq/Etmj/ou1sidCJ8X2d
	F+Dqvq/Yv9JPgjt46JaDGDKfItayuzH6TdheM/ZnjwmnRkDB
X-Received: by 2002:a05:6214:4119:b0:912:3c52:5f34 with SMTP id 6a1803df08f44-91254bd0194mr797506d6.31.1789669270580;
        Thu, 17 Sep 2026 11:21:10 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252cc7ce2sm3684976d6.34.2026.09.17.11.21.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 11:21:09 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] media: radio-maxiradio: balance PCI device enable on cleanup
Date: Thu, 17 Sep 2026 14:21:08 -0400
Message-ID: <20260917182108.32566-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tuner initialization failure and remove paths omit the matching
pci_disable_device() after a successful pci_enable_device(). Disable
the device on both paths, after the final hardware access on removal.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Add a Fixes tag for the initial Git import, where the PCI enable
  imbalance is already present. No code changes from v1.

diff --git a/drivers/media/radio/radio-maxiradio.c b/drivers/media/radio/radio-maxiradio.c
--- a/drivers/media/radio/radio-maxiradio.c
+++ b/drivers/media/radio/radio-maxiradio.c
@@ -159,10 +159,12 @@
 	dev->io = pci_resource_start(pdev, 0);
 	if (snd_tea575x_init(&dev->tea, THIS_MODULE)) {
 		printk(KERN_ERR "radio-maxiradio: Unable to detect TEA575x tuner\n");
-		goto err_out_free_region;
+		goto err_disable_device;
 	}
 	return 0;
 
+err_disable_device:
+	pci_disable_device(pdev);
 err_out_free_region:
 	release_region(pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
 err_hdl:
@@ -180,6 +182,7 @@
 	snd_tea575x_exit(&dev->tea);
 	/* Turn off power */
 	outb(0, dev->io);
+	pci_disable_device(pdev);
 	v4l2_device_unregister(v4l2_dev);
 	release_region(pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
 	kfree(dev);
