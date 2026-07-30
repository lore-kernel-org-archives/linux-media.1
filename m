Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828E12E7F39
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407883; cv=none; b=DEzitnyBwqO2bgeP7G3w7hEOLZnHXiGXoBn7/hzIltaTIWdgHRRTK+PmdrHBRoHNHG0NDbUW9e7VvxIVv2kvt+XX06CPj+wITkVDjw8dPU1FDJ7IxCsC6rU4z2XbGziUozYP0VGKkXki4y/jI5t4/P8ft6gVwtOaM1/iBV0fsCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407883; c=relaxed/simple;
	bh=C+XIta/PnXbHgq5uX591/FuJJN/cSTbjopEz3wI5Rjw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nsz32p9HrUuqqh+FEF4SR+Wk6R2tMxXaJoF0kBGCyZx23kAnVF+vSBucCQd5V2KZaaTIBz/HOvsux7NMobwseImMcxhEuoRBB/MZCrW2/4HLDa9QBO3lD1FELKw9P/EjCnEp+c1PAjChFWJyw+b4KhK0lXML/QMRpdem/etedoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuEej2uf; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuEej2uf"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so2172453a91.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 03:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407882; x=1786012682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXK6Swv7vBgoQF3j9El0Te9ljuWn43Xnd3oqzZNewrA=;
        b=GuEej2ufTOCr3VT7I36z7Xw/1SlQmdYnq/zESN/IwicZwZQr78m9ebX9anFPsliB9u
         FXJxdbhhqW6w45mlIvDnA4aXcFkvdgVHfoCM7W0L1aFRa4n28UrHVzCvOf5Vjb7SEelI
         OYolHF7JMfEye9mnUOSlNbqVBng5Z65va2hHTE3pgRAYcQzG9BD5MfXLKjvhqtH7dEO1
         uuojPDmku2ItmkR8HMOi9oQARL21t4RPvHJ8IoBOSKADgGswyS50+1AbHomjLCuClHRB
         Q4MMAx2IPCfctahgHrUw+dSGQytNDwrD2BopNKQtPqrtpvXrPurKRzi4/BEpOetI47//
         jhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407882; x=1786012682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXK6Swv7vBgoQF3j9El0Te9ljuWn43Xnd3oqzZNewrA=;
        b=BkVSIesxQgofjY3yTLYU9xGl3Xh+wHZGJlg1UMqdZU2lF7yMiQeI0e0y+19cDbd9x+
         jfmAzBU7p9HYMpjPWybv8WsSoEv7eUd2bqhmlNOk4hgU9HRK48teNzaFhnK+1VfJPzo7
         2meEpVU0CZ6CtuNAOkA1bhs7x8lfo5vk/aiTamg2TjCIu4vDzYif/q22VwTlNRBFaR4G
         UAJF+3dcm/w6uU5UCJkaWzWG/0V4/L3nt/7xCFg5DaPZWFjm7h8MkRy64WdMgQIPygv2
         Jd7T7zAkqqNMAdyQbFYjuErnGU6j8+f/tJTistW7Qf+ss1l3n0vhoab/QvrrmWrdls8K
         XuxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYY7CEH0qIFXnVRZdtFo14YL5oo+AN/U77YU5GCiSDqfo3ER/kmZ5jhY4JrOqaLqqpBxLkkG+iGdraMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypP6hrPy3jgTvrYGerejMCjKgdrIB8PSGBnSUocQnxo4CuA3Qr
	bIyQ+0qkYCSJIk4KRAQ0qSPWCZl2HPYim1UDghVbVJbmq4l3ISJrkXT6
X-Gm-Gg: AR+sD10TU1QCT3Z9zK+lkyIoJO+6fe7gNwrmSJxP+/CWVUDXxCzsk9TNGEPBaiKjZSO
	Ws9gonqsQRlBj26Nzw9HCFMpi5Kl9YmPQPtjLl0eC/bwIE6hH5UJS6MwrjVjYcmizXTSrTBnrJH
	ehdTtP5jSKbE7RUboXyxKu8/5rsxceuJH4SulxOCf8+Kc+Fo+TP9logIkOWdkeb18ffhyrXQf58
	/DARTiY0qilgKrLxOWyoQxdkUmaaRVK0XuNMpKzR+0gSke9XTCtLHSryRXI4NDbjyTNEn842OSW
	z4HMQfNm2gjTmg1kynTarf+fh1K61POWs+HqqeE6xoqtMB17SFKKA9GuWLiK5m/tSpyLYODicE9
	GwnjYhzF4+buT45eRVRz8z8Kxv6+QZd+RkKrOLR558PYz/IUH6nNSvZ3gtA8kCiM0LkFRWD443E
	E6R7Vd3YhItQ+RCqsMG0oYXr0xCVg1DY3HWe+2rZ7gs2k7K4stp2PFxiA6ebwPW6ISy07dXQygj
	jo1bJFYJq1HcDAh
X-Received: by 2002:a17:90b:6c4:b0:380:a568:cc4e with SMTP id 98e67ed59e1d1-38f9bd632b4mr1766643a91.9.1785407881826;
        Thu, 30 Jul 2026 03:38:01 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b42d176sm837532a91.4.2026.07.30.03.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:38:01 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging/ipu7: fix async notifier UAF on probe error path
Date: Thu, 30 Jul 2026 17:37:54 +0700
Message-Id: <20260730103754.1480367-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isys_register_devices() registers the V4L2 async notifier via
isys_notifier_init(). If a subsequent probe step such as
isys_fw_log_init() fails, isys_probe() jumps to the out_cleanup label
which only calls isys_unregister_devices(). That helper tears down the
video devices, subdevices, V4L2 device and media device, but never
unregisters or cleans up the async notifier.

As a result the notifier stays chained in the global notifier_list while
the enclosing struct ipu7_isys is freed by devres, leading to list
corruption and a use-after-free the next time the list is walked.

The remove path already does the right thing by calling
isys_notifier_cleanup() before isys_unregister_devices(). Mirror that on
the probe error path so the notifier is unregistered and cleaned up
before the device is torn down.

Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/staging/media/ipu7/ipu7-isys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/ipu7/ipu7-isys.c b/drivers/staging/media/ipu7/ipu7-isys.c
index cb2f49f3e0fa..bf262c01a2b8 100644
--- a/drivers/staging/media/ipu7/ipu7-isys.c
+++ b/drivers/staging/media/ipu7/ipu7-isys.c
@@ -773,6 +773,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	return 0;
 
 out_cleanup:
+	isys_notifier_cleanup(isys);
 	isys_unregister_devices(isys);
 out_cleanup_fw:
 	ipu7_fw_isys_release(isys);
-- 
2.25.1

