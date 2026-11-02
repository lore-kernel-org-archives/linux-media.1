Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602114;
	b=bhZgSb3wn+K8OBITm2Rtz6n7wp7jkR9uOr0RKVZyPbpE6BwckaCA1MWfZkVUthZu1Mn0
	 TJj+h25SviPaFgvkfYsN2ullzlWYHDfiETY7aa1goUgdbfwOxJ5Bp4Oi+kcmVX66uLNC7
	 uNh1TdeXfirKY84WYUcLbqKvv0QJjuigELPLmcs5xyAQfaGmQJ6yTc1LlAUeqFt5GJ7lg
	 QdT2CPD/ZRQ7c/KT2HsUmp+I6kvfIF0Wa2IuHicTj7/RHDX5FW0W9tUANVyKJew6VlyCN
	 1Xf+tO/MY3XiDYUPAGTR0felt2kIKYaMRKAI3Xw6d1YghM3RRamSv08XqMbEThivSTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602114;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=/0SMxbBKMUkeeYh6yyBaeX4NcF6qruzB6T5M+gLmKMk=;
	b=nFhr0SJTFibESNvcAKC463ma0I35zzn0S6ve19OQAuMrqRlSgNH5hsYTHn/6IXxaQQOw
	 zlp0j2B/1azEClR2/+P+GoSO2hGtvLp3CzdSvVC4Vj7Hg0BFsI/f8EL+7bcCBpza1Wuid
	 SVSojjla3f6hC4b3d5DlxB80YqS36C1655essXPYzKnDJM9X31qxPnDvW1gmwofvwUoXD
	 kHOkWL8umN27Fg6GmRXH1snIXYoa9QWiFN6Y8a0MToNW7ZnXdQSkyX0cfLKqZwmKcovmT
	 3u0DSW8CJxE8TpYyciF1pQrYuJzZNAfsLbJvndo2xnH7xZM3qDVZKiq43kdhQ3TF50w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bWugUChD;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74DA606A339
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 06:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B74DA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bWugUChD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793602112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/0SMxbBKMUkeeYh6yyBaeX4NcF6qruzB6T5M+gLmKMk=;
	b=bWugUChDoZYqKVZe+zdbCwHwTUl53KsTBcxGlOdxUug8KAVvkYeNgTwlFFLmmIrDb3CiUW
	tXIYKDob2bKg8mo5LsHkbniNgxe2l41KzoeYirvEVekE26ieYvMwsn9yu6Ft2uSmNV2CjJ
	q58HpqTLt/rUdnClTZuZpY7VkNwp8Uo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-iY3qFOLNP3WFuIFWepc3Ag-1; Mon,
 02 Nov 2026 01:48:27 -0500
X-MC-Unique: iY3qFOLNP3WFuIFWepc3Ag-1
X-Mimecast-MFC-AGG-ID: iY3qFOLNP3WFuIFWepc3Ag_1793602106
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1D6FB180134B;
	Mon,  2 Nov 2026 06:48:26 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0A7031803A40;
	Mon,  2 Nov 2026 06:48:22 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH] media: ipu-bridge: Add upside-down sensor quirk for Dell XPS 16 DA16260
Date: Mon,  2 Nov 2026 14:47:57 +0800
Message-ID: <20261102064757.34400-1-hpa@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On the Dell XPS 16 DA16260, the OVTI08F4 image sensor is mounted
upside-down, causing captured video streams to be displayed upside-down.
Add a DMI quirk entry for this model to report the correct sensor
orientation to userspace, resolving upside-down image display.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2563275
Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a8c4..1a6f41ee3667 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -191,6 +191,13 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 16 DA16260"),
+		},
+		.driver_data = "OVTI08F4",
+	},
 	/*
 	 * The first four characters of DMI_BOARD_NAME identify the Lenovo
 	 * machine type/model. For example, a DMI_BOARD_NAME starting with
-- 
2.55.0

