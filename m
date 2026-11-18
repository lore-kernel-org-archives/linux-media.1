Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009260;
	b=OvotRbkLijuC56aZhtMJxJ9Ho1d9zZAaL4suvCwojCzwFjfJILWgys0sBlTDhUeSYJLZ
	 eQdNNsVT7P2U2txw6JRBT4wQlG3tAzTFbwlH6DSqnuLrE/KsI/JJNaUOXxaotSq/d4N/p
	 DdBDTe3AqyuT25AnW3/LEU+P4it5iDYKYuSvxYdrcFqiqXoRGl4RDqa3F7tbW/vGq8kD2
	 91AZiqs4wmEMk5dIe0ffsTWbSDE1d8izwjTs6wDzCKXdB9nmHR+bIzu/FlXFrtV+hYnmI
	 Izff/jLQ6AUxv4mufwWyuhhfX/WP1OOElWjHZXBOlFXHxTOWm5gUAhsXBjpza95mr4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009260;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=S2qC93mmpO3j7YEXCndfyVrlAonLbo+0MinHXVsL1yI=;
	b=volTy8+gzYPVAuYuD9UAp8zg2rpE9OPncw5/9+B7WVlyJiFm1ZHRi0byvm6P5O8LYaBv
	 aLGqqfbS5ItOH2nHYQuuWn5ULgF5e1hzo5YfhXM3mzzdglcNuke4+cizTw+YfNMvAUEWn
	 SrFU0csmVk1bLNDLFSGLHvyyq/tjxC5d6yAn72TkNoJIsS1tkuf+ivIMEalthyMqEnzvo
	 4f5nhyuV89NKLO5rptmlcYwxYPMt9ThZLbwNYK6GXszFg6ht7NNuJVBWIb4N2rOVLEBKl
	 erg1foDqDCL3FOIslI2OZRESTT8xUdsVSj84TxHGeyhWzdHaNcRtukOVwIgA4Lsl3MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HCOkK50L;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB298606A31C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB298606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HCOkK50L
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A72F34E41636;
	Wed, 18 Nov 2026 13:40:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7591E5FE9B;
	Wed, 18 Nov 2026 13:40:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DAD811BC20A3;
	Wed, 18 Nov 2026 14:40:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009257; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=S2qC93mmpO3j7YEXCndfyVrlAonLbo+0MinHXVsL1yI=;
	b=HCOkK50LZvIFdVK4mwIoqaie++9WKmVL/J/+0kYnhEZZGdY34uJTG9xfYZlE2616i1DJ1N
	F/MyHW9jGzaI7VM08pJ9tD1hRTJE0fGwdGMUaUE+f/4QcqVGyWCX4mYlCC/ICvqf5D3NTr
	yQLl72BgbkdbJcIz8Tr1QCbUeu3w+9tykNW2adRfr9oa8JcQVsP0wBryWZaoJNW+NxY8RF
	zXdVxnuM5uKRqDFXJ43YWHTQmjvA8FhO0gijZ7G3LxcNKLu8j53/+7Vx5kdSUqRvvK/JPF
	Pl/Mi6CVIQkU2FTf/iIReOq+ZXO7uRk+eXjfJCjW9nxjxIMyWbBwJ7YNxntNiA==
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
Subject: [PATCH v10 4/6] i2c: mux: Create missing devlink between mux and adapter physical device
Date: Wed, 18 Nov 2026 14:39:13 +0100
Message-ID: <20261118133927.366482-5-herve.codina@bootlin.com>
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

When removing an i2c controller device handling an i2c bus where an i2c
mux is connected to, the removal process hangs and is stuck in the
wait_completion() call done in i2c_del_adapter().

The i2c_del_adapter() tries to removed the i2c adapter related to the
i2c controller device and the wait_completion() is waiting for the i2c
adapter device release. This release is performed when the device is no
more used (i.e. refcount reaches zero).

When an i2c mux is involved in an i2c path, the struct dev topology is
the following:

    +----------------+                +-------------------+
    | i2c controller |                |      i2c mux      |
    |     device     |                |      device       |
    |       ^        |                |                   |
    |       |        |                |                   |
    |  dev's parent  |                |                   |
    |       |        |                |                   |
    |   i2c adapter  |                | i2c adapter chanX |
    |     device  <---- dev's parent ------  device       |
    |   (no driver)  |                |    (no driver)    |
    +----------------+                +-------------------+

When an i2c mux device creates an i2c adapter for its downstream
channel, a reference is taken to its adapter dev's parent. This parent
is the i2c mux upstream adapter device.

No relationship exists between the i2c mux device itself and the i2c
controller device (physical device) in order to have the i2c mux device
calling i2c_del_adapter() to remove its downstream adapters and so,
release references taken to the upstream adapter.

This consumer/supplier relationship is typically a devlink relationship.

Also, i2c muxes can be chained and so, the upstream adapter can be
supplied by either an i2c controller device or an other i2c mux device.

In order to get the physical device of the adapter a mux is connected
to, rely on the newly introduced i2c_adapter_get_physdev() and create
the missing devlink between the i2c mux device and the physical device
of the adapter the mux/atr is connected to.

With that done, the i2c mux device is removed before the device handling
the upstream i2c adapter (i2c controller device or i2c mux device). All
references are released and the i2c_del_adapter() call performed by
driver handling the upstream adapter device is not blocking anymore.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/i2c/i2c-mux.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index c1836114ef56..702ccca22245 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -314,7 +314,10 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			u32 force_nr, u32 chan_id)
 {
 	struct i2c_adapter *parent = muxc->parent;
+	struct device *parent_physdev;
 	struct i2c_mux_priv *priv;
+	struct i2c_client *client;
+	struct device_link *dl;
 	char symlink_name[20];
 	int ret;
 
@@ -382,6 +385,47 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 				      ACPI_COMPANION(muxc->dev),
 				      chan_id);
 
+	/*
+	 * There is no relationship set between the mux device and the physical
+	 * device handling the parent adapter. Create this missing relationship
+	 * in order to remove the i2c mux device (consumer) and so the
+	 * downstream channel adapters before removing the physical device
+	 * (supplier) which handles the i2c mux upstream adapter.
+	 */
+	parent_physdev = i2c_get_adapter_physdev(parent);
+	client = i2c_verify_client(muxc->dev);
+	if (!parent_physdev) {
+		dev_warn(muxc->dev,
+			 "no physical device for the parent adapter, skip device link\n");
+	} else if (parent_physdev == muxc->dev) {
+		/*
+		 * The parent physical device is the mux device itself.
+		 * Skip the device link
+		 */
+		put_device(parent_physdev);
+	} else if (client && client->adapter == parent) {
+		/*
+		 * The mux device is an I2C client on the parent adapter.
+		 * i2c_del_adapter(parent) will unregister it and remove
+		 * its downstream adapters before waiting for the parent
+		 * adapter to be released. No device link is needed, and
+		 * adding one would make the driver core unbind the mux
+		 * before the parent physical device's .remove() callback.
+		 */
+		put_device(parent_physdev);
+	} else {
+		dl = device_link_add(muxc->dev, parent_physdev,
+				     DL_FLAG_AUTOREMOVE_CONSUMER);
+		if (!dl) {
+			dev_err(muxc->dev, "failed to create device link to %s\n",
+				dev_name(parent_physdev));
+			put_device(parent_physdev);
+			ret = -EINVAL;
+			goto err_free_priv;
+		}
+		put_device(parent_physdev);
+	}
+
 	if (force_nr) {
 		priv->adap.nr = force_nr;
 		ret = i2c_add_numbered_adapter(&priv->adap);
-- 
2.56.0

