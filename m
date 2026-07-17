Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE143FE35D;
	Fri, 17 Jul 2026 11:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286344; cv=none; b=YWgsXFHWx6/D4OCRd6vjYJWPnAznoidwnbtRL7G9S05m+J3jnfN9QKefUPnHz2EBo5M84ljawtOD4mQXBwupi/ajHyZbGUBXvUN4nOSSIyVDixHSDnIyH4ibW1HFTzFNYm5j2M9QCsehK9oxytPWOhZhcZ8pAva5yuTFop4lWzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286344; c=relaxed/simple;
	bh=xGdBnI7XQIDc3+3t5EEhBF1Vf+frQ2AEOsx11AFmPK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EQlz8Tr8yNl4bIZ4GWpfqmh4snWPxk5QIjGrVsnCGzNAkOm/ZxGYNN1TTLOgq/vd95qS4WkUhnC8NACX+GNL1fCKFQSs/lSN4g3o7KBRBbY0wYmXWisPo534tgP8hdosOWg/YexIFczoGjSii1Tiw5ooRNEcKlW3kGUKkkWh5G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hkU5qF26; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hkU5qF26"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B2688FA;
	Fri, 17 Jul 2026 13:04:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286276;
	bh=xGdBnI7XQIDc3+3t5EEhBF1Vf+frQ2AEOsx11AFmPK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hkU5qF26wwvKlKP1B8iUhRXSLeJTsHFEMdyqTY6V2DNYaJC7gx1V30bXWNfDe6m0c
	 XdKt8/B9chHBf9hFFEIIEjx+la3soO8w+Kn3YblCVtUhibNIaQs4a30KPEqO43ZEcf
	 pa4bIcSpG8zJJjVvSK3PajMYcPt8n5wqQGj2WTDg=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:34:20 +0530
Subject: [PATCH v3 5/9] platform/raspberrypi: vchiq: Add helpers for vchiq
 driver data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vchiq-isp-v3-5-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
In-Reply-To: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Umang Jain <uajain@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=xGdBnI7XQIDc3+3t5EEhBF1Vf+frQ2AEOsx11AFmPK8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgxYqyekyfHhSwehjhie4K2nYJ+N0Y2KgtrEu
 MMBpe9e4gmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloMWAAKCRBD3pH5JJpx
 RTnaEACEJbPlrSAR8Lq3FwZ+bhR6Iiy/0RyKcKdrUSQI3LPKwATKW+DERVMIiup6sEsm9slbP6J
 JG3bPcLRo2qxCMbnsjTXRLMuC3khN0y+J7lw1qzs91FfHZ2edSl9TMl72U7x1r7gCjQikAYF1Yc
 SHmWLttqu6Kvbg8el3Y0rNqIszmcAKlTyzqidczp1ixEzLEeQsnJgrzyRCPzSaj9icyrByqXZEC
 3AIytGdjxXNG2JfyZxqBejNNRs6T8SfvnEgHTzRjRj1bk6LdJdyy04exIyjSqGwjt7effcTe750
 U3rNek9F4oMAXOxruH4x2soTHTB2RDhhPzQguED6PTq0ptvzz+L+arZ9twDdgZIvZ5JPg0+bTOs
 XKV7eBLC9MXKtLYtvLKaNpABtx8oIu/H/SHe0/TxlNjTw1GJtoQRvzVejjnBdiexGX78uRim2QK
 Z8cCtGQVGH2L+5WjDutOJtbtYoharZ6i+E2aWpkE1hkgJwsXxktMENRXb/x3N1Xm2rFyr4eWhH2
 N6QJoTIDYF/oIOpfZtOqZk/YR5msC4dSg0z6E2xOqOJNAELaSzgHKq5tymNVBw6e7S3aNjtQ2pq
 6hhuPBMsQS4slIbWQP+Pi6CeGA+kYtxEF/jt9rWNSFMTcDDQNR0cwtczTpkMVYHffIZBNlNuwYh
 s9WHZSZe0Onbt+g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Add helpers to set and get vchiq driver data. vchiq_set_drvdata() and
vchiq_get_drvdata() wraps dev_set_drvdata() and dev_get_drvdata()
respectively.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/vchiq_bus.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/raspberrypi/vchiq_bus.h b/include/linux/raspberrypi/vchiq_bus.h
index 9de179b39f85..6eff6b0bf599 100644
--- a/include/linux/raspberrypi/vchiq_bus.h
+++ b/include/linux/raspberrypi/vchiq_bus.h
@@ -37,6 +37,16 @@ static inline struct vchiq_driver *to_vchiq_driver(struct device_driver *d)
 	return container_of(d, struct vchiq_driver, driver);
 }
 
+static inline void *vchiq_get_drvdata(const struct vchiq_device *device)
+{
+	return dev_get_drvdata(&device->dev);
+}
+
+static inline void vchiq_set_drvdata(struct vchiq_device *device, void *data)
+{
+	dev_set_drvdata(&device->dev, data);
+}
+
 extern const struct bus_type vchiq_bus_type;
 
 struct vchiq_device *

-- 
2.54.0

