Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8AC3C3428
	for <linux-media@vger.kernel.org>; Sun,  9 Aug 2026 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270646; cv=none; b=FJFhhmY4YG5vO4fsQkVQxa2OrHldNt1xHLl6LWFE0gqNu4Crvyei2wIOoalXXgMebdur8dTtTMrETCStWwYvua9GdyU67i6sjSqjiBeZB8AqsKIdXM+qiDjIY3cwz1znZTe+zb1jYuMCLtKBAeaG2UXA9wXXh33B1zsT8VBX8lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270646; c=relaxed/simple;
	bh=RvmzwK4dlyG2JGoHxX32qWKM1EMpKArPl1QuK0QEqAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=maSJ5oA68DXWd42Gmhquf5q+Pf4iSA13FBEdBgkX6RiWzGwFW5yDtCMUT+XQ3kivelJ4GaRNf4xb+xF4vfC5NTrDNYPL1sFD8Uvq56wY6n2wplWSSDDtj9Qa8Fr0pDm8hZTqR0SdUijtx+joE33AUgSWI7tQXaDbalQgz0Xhmw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARldIPFD; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARldIPFD"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-848761b5897so442770b3a.3
        for <linux-media@vger.kernel.org>; Sun, 09 Aug 2026 03:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786270644; x=1786875444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4SiRXpVk5uM6KSMknWzyY90uVTBQIGYj5y9bvf1u24=;
        b=ARldIPFDkzbBELNfI5X7LX4znIEQuOdw8gcyodocMNRfcK+Ecf3+6iKjLR1VyCnkiw
         1GMrVyLkQekI2Zyo3bLr2qYMVJQBVLu+yTt7/VPQk21GFyW82cw/vrRgSZvCWBJs2kB/
         BTIbDKWUiockWO6IdQiXqSg0CSYF9kEgsMo1KyEyaTfOqlF3sJJo+tDU5/YpQl1hDTik
         /kIvrgTK13I+cXFUHY+PNiaJyIgLHhKfN/aEsicz2ajLqvbI2ICaw2A8NLQJfBkVsshk
         2INr+Ujsh6G4JYOu0NUbH2q53edthn0rL6Y49CQVepjyU3UVJ6jdxiv+fUDd2+eIgZRg
         Nk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786270644; x=1786875444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4SiRXpVk5uM6KSMknWzyY90uVTBQIGYj5y9bvf1u24=;
        b=YXTiKhcQRnOLK1puoRBuAkWKQNPrlf2TH/E3XfKsecDPkNRtLSC6qHlj033nHpUN0l
         VIrlLB4Vh3mb642yW6CYmHtd8nBn8yYK12eYK5nTCG4vV4mdC5Xn4cQF58TXQhmEvhps
         FumYRkTQsEklYQRSP7fB4Sp50XIqgeHLGirX251MHI1Mn97uDsNstgVwj7+epVTJThp3
         k8/ACRnuYo8/WggQYclto5vLstOLqn9lGszU1y0AAN3L5t7ZeLPXNIh2jS2xy5Mp/UJ9
         TxHBNidsWtMCDxZeZOFY5VocUXjDZS2EVDy4t3nT0nh0N4XYYMEs6mXNiEGIVmf2N9uq
         WjBA==
X-Gm-Message-State: AOJu0YyNbnXHb6hppkfrnArqtnA+WS/Q/zz/rpQ6gFYlOEwvY3n4XS4C
	CnjTwa1q6iM1zH+F3HypFxgxWILc2LKaKWo1iI6Qa0srNjxin+e9o5H/
X-Gm-Gg: AR+sD10JIeXw+hxmC0bGVEtm0/lMOaThqWx6RzFA5vNi4GTMA9FycinK3eH6ffJSSHB
	2JrK2Wx3ym9OT4wP9lyNA0aGovZbhiHHst+m4t8eQEXzu9oA/4oyRTIhDZd4KpS2DQOMkbeVzWq
	KNSMCczms4MqOxmbER3LMdgPNMRIIVnOxE7B7hsHrb1VPiqa7jwBY/ayWnwW46d/z048VaucyYU
	GSfGIsmPF3uOhPBBJsM9+/HWGASvePWMzmfFCILo6VEzMT4xH1xVvgBRF97Wk5A8M3lFqeul1nA
	vvhAwmM7ISymPbnaV+BeoEB8P+IjY297wwAHG/sWQqrSfHbhcvV2bfM56rC3xspcw0AUNUmNSoT
	uGf+1MmIYENwp6I1U9MWQvF3wWfe8e5g4rXgG/o6g76UIREFlpGkYUetr3OlDffM4OjIwzOVZlk
	qPvMKaG17Ab9TSZk400UhxmeZ6w+N/5yHys9rDP5+P9Ywfpr4Iz0Qjs1B8p1RoE+UqLk2tRrAT2
	n+EwkDpElb5LuIXZaAsbccrALn6XkKmKpXXUiARIx/QXqSFLgt3eYaSx15IJlLoepiLGYvMbTA8
	iG2YQAaCcng0rxRezQl9rqiDiWU5zpZ7kdNq+9xrRdmR/UKm7jtUmiKgBPli4WaJzTfMXiYq9jT
	o8FIAPCFnHuwHPFrZDr15gEAgvCrsH4hDVlyNSDYSkKTsWS6z
X-Received: by 2002:a05:6a20:d52c:b0:3c3:812a:2198 with SMTP id adf61e73a8af0-3cb85df190amr44418663637.4.1786270644170;
        Sun, 09 Aug 2026 03:17:24 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec128a0sm33347654eec.25.2026.08.09.03.17.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Aug 2026 03:17:23 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvbdev: fix stale minor on registration failure
Date: Sun,  9 Aug 2026 16:02:18 +0545
Message-ID: <20260809101718.24495-1-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_register_device() gives the new device one reference and publishes
a second reference through dvb_minors[] before media-device
registration and device_create() complete.

If either operation fails, the current error paths free the device
directly. The published minor then retains a pointer to freed memory,
and the global DVB character device can pass that pointer to
dvb_device_open().

Route both failures through one cleanup path. Remove the minor under
minor_rwsem, drop its reference, release the registration resources,
and finally drop the initial device reference.

Assisted-by: ChatGPT:gpt-5
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/media/dvb-core/dvbdev.c | 42 ++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index d753d329502a..9a2783175771 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -551,36 +551,17 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (ret) {
 		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
 		       __func__);
-		if (new_node) {
-			list_del(&new_node->list_head);
-			kfree(dvbdevfops);
-			kfree(new_node);
-		}
-		dvb_media_device_free(dvbdev);
-		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
-		*pdvbdev = NULL;
-		mutex_unlock(&dvbdev_register_lock);
-		return ret;
+		goto err_register;
 	}
 
 	clsdev = device_create(dvb_class, adap->device,
 			       MKDEV(DVB_MAJOR, minor),
 			       dvbdev, "dvb%d.%s%d", adap->num, dnames[type], id);
 	if (IS_ERR(clsdev)) {
+		ret = PTR_ERR(clsdev);
 		pr_err("%s: failed to create device dvb%d.%s%d (%pe)\n",
 		       __func__, adap->num, dnames[type], id, clsdev);
-		if (new_node) {
-			list_del(&new_node->list_head);
-			kfree(dvbdevfops);
-			kfree(new_node);
-		}
-		dvb_media_device_free(dvbdev);
-		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
-		*pdvbdev = NULL;
-		mutex_unlock(&dvbdev_register_lock);
-		return PTR_ERR(clsdev);
+		goto err_register;
 	}
 
 	dprintk("DVB: register adapter%d/%s%d @ minor: %i (0x%02x)\n",
@@ -588,6 +569,23 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 
 	mutex_unlock(&dvbdev_register_lock);
 	return 0;
+
+err_register:
+	down_write(&minor_rwsem);
+	dvb_minors[minor] = NULL;
+	dvb_device_put(dvbdev);
+	up_write(&minor_rwsem);
+	if (new_node) {
+		list_del(&new_node->list_head);
+		kfree(dvbdevfops);
+		kfree(new_node);
+	}
+	dvb_media_device_free(dvbdev);
+	list_del(&dvbdev->list_head);
+	*pdvbdev = NULL;
+	mutex_unlock(&dvbdev_register_lock);
+	dvb_device_put(dvbdev);
+	return ret;
 }
 EXPORT_SYMBOL(dvb_register_device);
 
-- 
2.51.2

