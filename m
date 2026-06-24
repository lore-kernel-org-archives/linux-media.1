Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E205F30C143
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 03:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782272153; cv=none; b=STCMJ/thpx7k8Rp+ZDSqiDmcxlOEJ8jvUA2X/axte185KAOaU1gDuKP70eMQcLon7y9hQUEguxtIh8fqfDHps4KeKYlZhvfo9k3lBHDFcFFSNMF4u13hLTkfue5rh0Uh8XHHf/TPcnIEdaaQi3ExIvFD3YGoz4BiCBYHdpjSmHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782272153; c=relaxed/simple;
	bh=N4Fj6WY48SFiHJv2SHjjdMtNJfA81IjgI3/w9kXwqL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mq1Of6v/TVBL0vpJ5oqCzBrnvu+Lv3VUmD0G/M2vwNyEtC8JEmqnNLLpU2VKuQJpSBRbQfjIvM57DIN6GiiwZaR5EuBSf+QBD2D2rYS9/oD+I5Edgl1kX8+EHS8F1qOLmrLO4uw9nagZwM6gVhfDDi4Iow3kSWbExvIUX3qIVv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ugsygp/i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ugsygp/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782272151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+QdmqKNDho30FCCG/pBRWGnl+chqjQBAUDyRCUTKpw=;
	b=Ugsygp/iFityq/QBBXPZSBOynZysjGfWdsP5+ZDafHE/o2BrdqS00qdrmjrL6p0bLfx4aN
	yXfV1ONAXDTbAVgDRAWgrIUv109Q/Sj4GvReglFmTUx64cK+L+ETbBjc0MXX3ZyCl7Mf5y
	o2+RXVCCaZfvXRzqOzVI21I8ji57y08=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-101-6yOdE3goOBufaysvRZILdw-1; Tue,
 23 Jun 2026 23:35:47 -0400
X-MC-Unique: 6yOdE3goOBufaysvRZILdw-1
X-Mimecast-MFC-AGG-ID: 6yOdE3goOBufaysvRZILdw_1782272146
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 02CA4180065B;
	Wed, 24 Jun 2026 03:35:46 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.32.90])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A8F90180067D;
	Wed, 24 Jun 2026 03:35:40 +0000 (UTC)
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
Subject: [PATCH v5 2/3] media: ipu-bridge: Add Sony IMX471 for Lenovo X1 Carbon G14
Date: Wed, 24 Jun 2026 11:35:07 +0800
Message-ID: <20260624033508.27391-3-hpa@redhat.com>
In-Reply-To: <20260624033508.27391-1-hpa@redhat.com>
References: <20260624033508.27391-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The HID for Sony IMX471 is TBE20A0 on Lenovo X1 Carbon G14.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 2474452b3015..8ddfab357922 100644
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

