Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009254;
	b=EWf4KMvSsOCs/Je0oxd2CjYJfKF/s7aX/clMhDrS2TYr5NZirzOBOcVraSHQ/XhNP1E6
	 GGXEkDoEtPuUkZGoiYHp3gFJqEwFlwejlwbHkuYOmmXrPeSVbmI8E6k8ZySCG3/yIzJiR
	 wOHsEBNmFTlkLAtluQbpUP9F/9m8ux6SAs09fMtVpYuNYSzE+uupGiiPidfubeTk1pa8l
	 OXOfl7Nwpm/+jLDk9D6GXWBzXEJqJ0TycAWXstgNRc/JjnJq6VjBBN8XP2QDPa1wqk9fz
	 9Mu50RY2rdNtxKnjmpKp1NfQ1A2+KHXSwJk2XwR2iE0v3Qfu6EyB89RRoz9+fVpjuSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009254;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=SERbX9iophMB+xD5OItMT4ueu9GiLVDzhjq3mOsJXYg=;
	b=RehvFTd2cBG8JFrcR9jhCCqq/zyKTsXM3R6UW3Vy9LVgbx2MV5WOt7pdDlRXBJMwvRSc
	 jMpUWRxKGN/lQoL/NdIcj744Cm82M+nv7i86kCHqfDz1Cu0ReajB7dz26gQFTGY51rM5R
	 GPkQnb5Yviiv+TwegPpdpjmJxPbbALvBAOusw4+xmtgX425CNWWHctA/OGH+bfU50bP/g
	 0PeWdmO+LAiS3uCmA+Xt4Ci31e4znaK8Py7h+kiEB7SInvvbPboiEwKGl0ZjKVI6bspUl
	 8unSXN40wumZXFzRX4en+Eyu2vv5q7Ex2JIcUXcHunMNQcS5QlltQ7mASS6dg1RvVhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="P4RCaz/k";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75070606A33D;
	Wed, 18 Nov 2026 13:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75070606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P4RCaz/k
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B47FFC4CBD9;
	Wed, 18 Nov 2026 13:40:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD0BB5FE9B;
	Wed, 18 Nov 2026 13:40:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83AB111BC209B;
	Wed, 18 Nov 2026 14:40:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009246; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SERbX9iophMB+xD5OItMT4ueu9GiLVDzhjq3mOsJXYg=;
	b=P4RCaz/kCTDzIFRYuUJTmoME7NtQFVT4ZjknBOtKH/CSe3hDKCKUmiQmeKa84ow2OXx4N5
	+tqjMBWGNOqNgmPVp5nRlrXs6W4W4ukAgAL1/3uBJGwjhVq/sGmRrUy9YkvNrTfsD/sz+O
	GbVLNXyK9JTc3pMhWwzL7vKGK3T1NV3etIPveEP1rGJhdK7DWdkNOmd4Wc7tRUfLHk9h8w
	/60awtelF1H586Gv+o2sGX2SuTqp2Imq5Tm/jiFfcvTAaJMZ9r2OQFTxQwHo/8/bGLwyFI
	aJj2FatvTIPAFFoc3KuH8uXVxJLU8/6fcH559qbg06uF8SM86OMKedz38VLcyA==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v10 2/6] i2c: core: Introduce i2c_get_adapter_physdev()
Date: Wed, 18 Nov 2026 14:39:11 +0100
Message-ID: <20261118133927.366482-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118133927.366482-1-herve.codina@bootlin.com>
References: <20261118133927.366482-1-herve.codina@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

The physical device providing an I2C adapter is the device that calls
i2c_add_adapter() or variants and i2c_del_adapter().

Most of the time this physical device is the parent of the adapter
device.

Exceptions exist with i2c muxes. Indeed, in case of i2c muxes, the
parent of the mux adapter device points to the adapter device the mux is
connected to instead of the physical of this mux adapter.

Introduce i2c_get_adapter_physdev() and a new physdev field in the
adapter structure in order to ease the adapter physical device
retrieval.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/i2c-core-base.c | 16 ++++++++++++++++
 include/linux/i2c.h         |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 165ec14260c8..0c08b0e71609 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1956,6 +1956,22 @@ struct i2c_adapter *i2c_get_adapter_by_fwnode(struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL(i2c_get_adapter_by_fwnode);
 
+/**
+ * i2c_get_adapter_physdev() - Get the physical device of an adapter
+ * @adapter: the adapter to get the physical device from
+ *
+ * Return:
+ * Look up and return the &struct device corresponding to the device supplying
+ * this @adapter.
+ *
+ * The user must call put_device() once done with the physical device returned.
+ */
+struct device *i2c_get_adapter_physdev(struct i2c_adapter *adapter)
+{
+	return get_device(adapter->physdev ?: adapter->dev.parent);
+}
+EXPORT_SYMBOL(i2c_get_adapter_physdev);
+
 static void i2c_parse_timing(struct device *dev, char *prop_name, u32 *cur_val_p,
 			    u32 def_val, bool use_def)
 {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 6a847fc88d25..bcf2e4e30108 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -762,6 +762,7 @@ struct i2c_adapter {
 #endif
 	int retries;
 	struct device dev;		/* the adapter device */
+	struct device *physdev;		/* the physical device */
 	unsigned long locked_flags;	/* owned by the I2C core */
 #define I2C_ALF_IS_SUSPENDED		0
 #define I2C_ALF_SUSPEND_REPORTED	1
@@ -929,6 +930,8 @@ struct i2c_adapter *i2c_get_adapter(int nr);
 void i2c_put_adapter(struct i2c_adapter *adap);
 unsigned int i2c_adapter_depth(struct i2c_adapter *adapter);
 
+struct device *i2c_get_adapter_physdev(struct i2c_adapter *adap);
+
 void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_defaults);
 
 #ifdef CONFIG_I2C_DYNAMIC_TIMEOUT
-- 
2.56.0

