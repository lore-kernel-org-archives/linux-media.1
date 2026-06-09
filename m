Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314334192EE
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009410; cv=none; b=DPdezTzwPOHgTSctVtyFxWm79HM/xQ2bCSMAX6BCX6AAf7jOkIKaUpeYjbG/KTazUhZZ0xH8nOrfayK4UebX6pQWjdgwiNhmwC7orAh0xfDcKQhKbm4FYobB1dMq84/mjGghlU9OTOncJmlLnCPibd63oHS/DQjJ1O+0+vIumaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009410; c=relaxed/simple;
	bh=tbsEN4WC7wz0BSb5uMNiBbPoBED5FHFiujsl/IdaECg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAtYJk6cDyqwlDA6aQeifsm22KulNWZ2mbBNq1PU2uphiEYCygsXcwEa+Z1+r/8nMZC5OzsoT0Gqi+FZk5axAU8k9Iha0j06wL0SgYkvB3QU3EXr/XZuVcYB2PLzA3H/3gvnXAyGQLa+smUDyhsWURNYv7LwFSzX6INnRCbQM6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iwL3koUL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iwL3koUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781009408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWjKuCKW/8zIUwqUf/1QwY/E8NmZZ91Lu/d8cYitX/w=;
	b=iwL3koULb7QmGHjcihGahELqFq8nR46au20TXIp5WNRJwaR2il1y3eZWuDDdWwVJka5qsS
	Zk4oTTLfrVkakCA9gvMmfj6t2dlm04jJWq+1d5+KHU+fLRVEpn0K0UoRegZmBqJSySGE7X
	wMO1b1fvxCHVk0hMwRsPsTW3W/G+GkM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-324-hGHV50V4NDuE62WZeEFSzg-1; Tue,
 09 Jun 2026 08:50:05 -0400
X-MC-Unique: hGHV50V4NDuE62WZeEFSzg-1
X-Mimecast-MFC-AGG-ID: hGHV50V4NDuE62WZeEFSzg_1781009403
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A89B18601F7;
	Tue,  9 Jun 2026 12:50:03 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.32.87])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 45FDB3008B38;
	Tue,  9 Jun 2026 12:49:57 +0000 (UTC)
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
Subject: [PATCH v4 2/3] media: ipu-bridge: Add Sony IMX471 for Lenovo X1 Carbon G14
Date: Tue,  9 Jun 2026 20:49:25 +0800
Message-ID: <20260609124926.1038981-3-hpa@redhat.com>
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

The HID for Sony IMX471 is TBE20A0 on Lenovo X1 Carbon G14.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 9e24aaceecdf..1bf1e4d5f4b6 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -97,6 +97,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Sony IMX471 */
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
+	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
+	IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
 	/* Toshiba T4KA3 */
 	IPU_SENSOR_CONFIG("XMCC0003", 1, 321468000),
 };
-- 
2.54.0

