Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D27438F646
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776414755; cv=none; b=QLTx9CCtg8OmlY5Gj1Sjv4tkFP2XR15pxySPdRFYBmwyYO2yF84H1LMpfb3nRxw0w4AzgOlfBhQAorFrugfaSa7nWa2Ol/TAGw9J0V23VbHeT5WG94yWNv9Q4mullhWaG509fOwipXHzaU+DIBmchlGjf0FVbn/Q0rH6fe0SgOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776414755; c=relaxed/simple;
	bh=PGlhkUGT/8tsMqGlP+V9blUjjyqfQI9waAza9fTjg/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rXvcaQCcuEws9txUUnqGz6l0kryzA5dEOI47qHhJ+bvWRibhz+LDYtOkBt4JHvN6Tz9kZBD/eDx9fUPITA8CaRVTd4mdhg7G4E9t3Yd6ULA8+tthonGqyMvOg+7MtN/Go+Ow2UpPnJEd21lI/zZaxrwPSGFAqGGyG3ASkdKM1sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dt+QpnOs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dt+QpnOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776414751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=09pzXNtHf8i38lr0D6CWZPX2fUM2B0S7ivIM3jbP7ug=;
	b=Dt+QpnOseCPsit5WA3rIFwz2C8dc0p5CQhCM+B3dWYCcnkB743y95UoP/kcpZOy3ZgYmlD
	j6/VOKYkqHSZwgaQDGwBk4e8HdVf4ce+Ilrbw1/u3lJevMfok4L5FQY+Ex7GximqTyNk07
	iKPEZlz9cQe0M8RCop3pAeoeLptEK8I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-205-yVZvowkGMDO1s5INJQIYkA-1; Fri,
 17 Apr 2026 04:32:25 -0400
X-MC-Unique: yVZvowkGMDO1s5INJQIYkA-1
X-Mimecast-MFC-AGG-ID: yVZvowkGMDO1s5INJQIYkA_1776414744
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 04C2F1956054;
	Fri, 17 Apr 2026 08:32:24 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.32.5])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 92D0B195608E;
	Fri, 17 Apr 2026 08:32:19 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 0/2] Add Sony IMX471 camera sensor driver
Date: Fri, 17 Apr 2026 16:32:12 +0800
Message-ID: <20260417083214.222189-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

This patchset adds the Sony IMX471 camera sensor driver to the Linux
kernel and resolves the IPU7 camera can't work issueon Lenovo X9
laptops [1].

The patchset contains two patches:
1. Add DMI information of Lenovo X9 to the image upside-down list
2. Add Sony IMX471 image sensor driver

The IMX471 driver can be found in the Intel ipu6-drivers repository [2].
To comply with the sensor driver implementation, the clean-up work
includes:

1. Use CCI register helpers.

2. Enable and disable streams using enable_streams and disable_streams
   functions in struct v4l2_subdev_pad_ops. Invoke
   v4l2_subdev_s_stream_helper() to manage the streaming state.

3. Get rotation information from fwnode properties using
   v4l2_fwnode_device_parse().

4. Finalizes the initialization of the subdev, including allocation of
   the active state using v4l2_subdev_init_finalize().

5. Add the IMX471 driver to the Makefile and Kconfig file.

6. The mutex lock is managed by the V4l2 core.

7. Replace the supported link frequency with v4l2_link_freq_to_bitmap().

8. Drop unused codes.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2454119
[2] https://github.com/intel/ipu6-drivers/tree/master/drivers/media/i2c/imx471.c


Kate Hsuan (2):
  media: ipu-bridge: Add DMI information of Lenovo X9 to the image
    upside-down list
  media: i2c: imx471: Add Sony IMX471 image sensor driver

 MAINTAINERS                          |    7 +
 drivers/media/i2c/Kconfig            |   10 +
 drivers/media/i2c/Makefile           |    1 +
 drivers/media/i2c/imx471.c           | 1047 ++++++++++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c |   32 +
 5 files changed, 1097 insertions(+)
 create mode 100644 drivers/media/i2c/imx471.c

-- 
2.53.0

