Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A5335A39F
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777961637; cv=none; b=TCTi7DZ7ML+2h/YKeZsJagpvqm/kDlrZWl1utcZL96x3TIrC8l5GPFzttbT5S93AJB46E5JUBsaKKWeTEfbKA1K78VMqf3aTOh27dRBFd+I79d+c4NlhMt0CtWc+pG3yuWQVz++1wFcmj58K9eBX9yiJEAJYkmB6V5gkkHFTIB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777961637; c=relaxed/simple;
	bh=CPOd4aYkI+3PQFkgUIoJBvoNBU1yoNPyqgy3NyvGy3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WtqyA+qmQtofyvyDDjQQvSR+kEVoJSRBPEVDAyJ8/DMqVkbWAYvZbQ7G9raPJF4vbZEKbG8T892VOIHxZLDCwxhp06Nvjlgv0sfbmmyFZodkrdgGFfjTswOPz4wFbry2+Xm0gyQuFBKf9Gc2XJjNwvdA8PjEGb6VnBhrlzV87HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N3FpyTwt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N3FpyTwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777961633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ul5+JOUOTf7SI88dNYBFIu+pb6nh97Whd8NFhuGUypc=;
	b=N3FpyTwtqbsxAF5T4mKOLQT9uN+2dGEFh8ErFQCti+1YrZ5/WprKMNt1SuFkn3njyedqaZ
	0bRLCHnINbRxL+Gpc00Ynu+VgGJag6EF2IGb/0epw5lzzKfe5ltXwKem4Ae4zz5kAN7eDX
	EtI+wcCJz1dcJI9mxbkywb6udw9K5Ok=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-WRbsH6mQPeWfbRhlN_8lOg-1; Tue,
 05 May 2026 02:13:50 -0400
X-MC-Unique: WRbsH6mQPeWfbRhlN_8lOg-1
X-Mimecast-MFC-AGG-ID: WRbsH6mQPeWfbRhlN_8lOg_1777961629
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2321518002C0;
	Tue,  5 May 2026 06:13:49 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.32.119])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C0ED919560A6;
	Tue,  5 May 2026 06:13:44 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 0/2] Add Sony IMX471 camera sensor driver
Date: Tue,  5 May 2026 14:13:25 +0800
Message-ID: <20260505061327.286700-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

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
[2] https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/imx471.c

Changes in v2:
1. Change the Bayer format setting according to the vertical and horizontal flip settings.
2. Replace the self-owned mutex with the v4l2 subdev state.
3. Rework the flip control.
4. Manage the regulators using devm_regulator_bulk_get|disable|enbale API
5. Invoke devm_v4l2_sensor_clk_get to get clock-frequency

Kate Hsuan (2):
  media: ipu-bridge: Add DMI information of Lenovo X9 to the image
    upside-down list
  media: i2c: imx471: Add Sony IMX471 image sensor driver

 MAINTAINERS                          |   6 +
 drivers/media/i2c/Kconfig            |  10 +
 drivers/media/i2c/Makefile           |   1 +
 drivers/media/i2c/imx471.c           | 992 +++++++++++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c |  14 +
 5 files changed, 1023 insertions(+)
 create mode 100644 drivers/media/i2c/imx471.c

-- 
2.54.0

