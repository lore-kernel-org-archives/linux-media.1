Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D604183C6
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009401; cv=none; b=dLzE9YqJ7IkZdTFyJg3fDmYc7o9M6GyDRsBzJBXWrpi9kFjkXdc4o+uNQhPzddygZ60FfiktPrqreJFJZDNTo26nE2yP8xVbPsBOnsUmYvsS8uk7L96CV+Y++xJmOVIIKlnQJFwZ962HPKqxL2BwkPgVsWVdi56T0Z5oTOLQqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009401; c=relaxed/simple;
	bh=6ZQAAbAWL9TVHVa7h6SX5jOroDAMR6xn8DPSRV6eqZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSXW1K5xYJZ8Vw7j9wbsRuYFHH8R23Vdr2qNgqXaZY7qWtDUeg6eq9zsjarH6rMhJbl0p4bnyYQkg7MLtc57AvLOFrS9q1zwVedb9nTrYFt4Ue9JmWTzr/6vSbEaRPNqn8gDzD6tUInQ0JLdQpk3Z1Idt2Vali//J/s11Ep4qtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dppocRGx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dppocRGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781009399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0pDZC6xUOr1eb8WfY9V7D/WZuhcqNUhc/PbAwhbCgDA=;
	b=dppocRGxaDSOYJLAuJYDTDn9SPqCh+jAYpk89ExcqcJ0BgIeIlMnhApy3PcXFwn6KvcHd9
	pyVCnwBHsxmd7oC/R7YMgKzE+rwt5c/fOa7cJKO9mjkRoBqD4DzTL6SIsg1yjBnwCv5jxD
	nboHzWT27sJSnhbaDdUeq99t57/zhMw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-121-Mev7ylX1MEWffPtbVJ4zHA-1; Tue,
 09 Jun 2026 08:49:57 -0400
X-MC-Unique: Mev7ylX1MEWffPtbVJ4zHA-1
X-Mimecast-MFC-AGG-ID: Mev7ylX1MEWffPtbVJ4zHA_1781009395
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9F1881800639;
	Tue,  9 Jun 2026 12:49:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.32.87])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8F6D43008B38;
	Tue,  9 Jun 2026 12:49:50 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Damjan Georgievski <gdamjan@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v4 1/3] media: ipu-bridge: Add DMI information of Lenovo X9 to the image upside-down list
Date: Tue,  9 Jun 2026 20:49:24 +0800
Message-ID: <20260609124926.1038981-2-hpa@redhat.com>
In-Reply-To: <20260609124926.1038981-1-hpa@redhat.com>
References: <20260609124926.1038981-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the image
was displayed upside-down. Add the DMI information of Lenovo X9 to
resolve the issue.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33de4..9e24aaceecdf 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -134,6 +134,38 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		/* Lenovo X9-14 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "21QA"),
+		},
+		.driver_data = "SONY471A",
+	},
+	{
+		/* Lenovo X9-14 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "21QB"),
+		},
+		.driver_data = "SONY471A",
+	},
+	{
+		/* Lenovo X9-15 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "21Q6"),
+		},
+		.driver_data = "SONY471A",
+	},
+	{
+		/* Lenovo X9-15 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "21Q7"),
+		},
+		.driver_data = "SONY471A",
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.54.0

