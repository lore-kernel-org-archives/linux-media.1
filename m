Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC743A7F41
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 05:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784267395; cv=none; b=tELRzi1/Yt7OZQW19u9U5/yGLow6NkSqF+bLVsoIeXyEdcxqRVd2JB1v6vN1v5whKJRvgCVXbdn0dX5HvjrBK9UA9Y7/WwV4E8L/KC6hbhSJiQC0sZ+/GHHo6lb9hbZf5ks/TGZDws/rjZ8Or/ECg2flqGxORNXQpYBsnXSH2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784267395; c=relaxed/simple;
	bh=zko0DNTJNhO6nLopXgEhpBF+G76yMwm8/kgwCnSg4tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iFWrWaNxbrFXgqWeDJ8Vt29nWERD94ZFdgvm1i0tQLUjSIne3ZTuuED2dzXTWnxvgd+/bE9uPYdL+V/7nGWDdbSvpRmClplLiqUYqYOXbgaJGfw+xVAYOtHiN5gIx8GwAwvn/BZvcQfvqDTN0DpWUTy/7hszOjIm3jcbdF1Nr+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2N6u7gp; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2N6u7gp"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c21495722so50420491cf.3
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 22:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784267392; x=1784872192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vojM1XpTdcxnBW7GtKa8Noe5VtZU5Xmye6lFOvFDJfg=;
        b=n2N6u7gp/7uqjTtiQivH+s/fWt1seJTis6FLhe2nrdf7JUT9gSAgcmCRSCvxtdvPe2
         ufmWLfvYsOLyejU+hmurbF81dPoPsDeg+Yh0anMS1k3RnMlb9sgPx6U7pAUN3NJPwhQn
         BkWzBYsLUlH80aORNXbH224d9XQKyz+mS8hf8J+S6CeI5hxuyoOyX6JgObmJDFjlJrfN
         KDhvbt+RRExiTG3cVCSwgsXzcJwhVqTw/LpFLZH7aWEm2aj15tF6ibN5rb8Ct/syPHQn
         8Gr8UzslKzdOxlr7yUre87jK6wXcGtRtg0TAXoQ4gLmCXZmcDXAgvlnMpx8/X9wm9CoH
         1TQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784267392; x=1784872192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vojM1XpTdcxnBW7GtKa8Noe5VtZU5Xmye6lFOvFDJfg=;
        b=O7tW3+tFUSug6fEzsz90GHbe9f3+Zu3JYIvArDmHzI1LnS++Cc1xBpUWV3Tj/V+INb
         sQhdIoPKnCsTES0ALulk/ys5+ZjXaMcbx0qWyItaw4DDVg7rH9XuSttQDsC4jZYT+HQI
         ppKD1RFHoCNEI+eq0tNTy+4QALY27owIiEOwFKA7nnp1JfovTGwiQjAxvKClU3t//XNT
         Hv02q7MgBzu9OTUomawEYVg+hTIm4vB5mYJEjWmAJPWusnMMabX4IAmUt4/VVgPHN9yu
         ahuMJQdapVUTVSsO6cUIfxAYSBxbo1HtHju6PTfTtwFokYT/Xl3vp7AnXaNfSB+LpMoh
         MMyQ==
X-Gm-Message-State: AOJu0Yz8I6OdYOZn2iTsLXZiUvN7KHEdJpGq8nbM7PwYYu7rs7SL1K6y
	9oKzJhZsP335WlnQ4bGC0bIA8TOtl068EJqtMAknrSRfvr3+UsHiDBl+
X-Gm-Gg: AfdE7cl8dwGvjWT+WwZkA2OvVZBuf6iT+TRCUX9JBqD+RpNzro8RgLmvHNUiQPUCSXK
	qAw65lxO55oar5ILl2vw6cTh9twaI/7uIP4q2iqNyQS3XkrtzwVIBq142iX3Wpl8oAAGHZIt+TI
	7ePXZPFEFCJiCMhN0Fu/vFooSKC4LltTgrU1eIIilr8z5SUN8WKtLjZOCNd+ys/IWXt2vXaXbMd
	6zr4DIpdv1dg9xqOlnDaaUe/0EKJrgymTFeGPnUTmsRUu8PGJrB0djzvHo9GFsjTl1trdKr7Cn1
	8MZGnCbVU/hcvLlc2Pjg8CzJvLSxkzfB5adAjCWuDbvS0ERBCJ0bzwcXXmX2GnEayI616+p0U1D
	Hqd3KHKHw/Yd/HJnCPTwykg6w3Ws/rqTkqONxvfR9ZvOqFAYdwGR3Y1SvtuebcjOiMzozqW4bsc
	ekAfHV5y49iXVXCthli0eJtgGgTe98Rkc=
X-Received: by 2002:ac8:5901:0:b0:51c:1590:8e28 with SMTP id d75a77b69052e-5213c7e5699mr9021741cf.25.1784267392365;
        Thu, 16 Jul 2026 22:49:52 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214f5fb88esm4407551cf.21.2026.07.16.22.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:49:51 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: dvb-core: fix UAF on failed device registration
Date: Fri, 17 Jul 2026 01:49:21 -0400
Message-ID: <20260717054921.873577-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_register_device() stores a dvb_device pointer in dvb_minors[] and
takes a reference for that slot before calling dvb_register_media_device()
and device_create().

If either later step fails, the error paths free the dvb_device directly
without clearing the published minor slot or dropping the minor-table
reference. A subsequent open of the same character device minor can fetch
the stale pointer from dvb_minors[] and dereference freed memory in
dvb_device_open().

This can be reproduced with the in-tree vidtv driver by using failslab to
fail the media_devnode_create() allocation in dvb_register_media_device().

Add a helper to undo the minor-table publication and use it in both the
normal remove path and the post-publication registration failure paths.
Drop the initial registration reference with dvb_device_put() instead of
bypassing the kref with kfree().

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Cc: stable@vger.kernel.org
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/media/dvb-core/dvbdev.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index d753d329502a..64c68581b649 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -448,6 +448,14 @@ static int dvb_register_media_device(struct dvb_device *dvbdev,
 	return 0;
 }
 
+static void dvb_device_remove_minor(struct dvb_device *dvbdev)
+{
+	down_write(&minor_rwsem);
+	dvb_minors[dvbdev->minor] = NULL;
+	dvb_device_put(dvbdev);
+	up_write(&minor_rwsem);
+}
+
 int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 			const struct dvb_device *template, void *priv,
 			enum dvb_device_type type, int demux_sink_pads)
@@ -551,6 +559,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (ret) {
 		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
 		       __func__);
+		dvb_device_remove_minor(dvbdev);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);
@@ -558,8 +567,8 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
 		*pdvbdev = NULL;
+		dvb_device_put(dvbdev);
 		mutex_unlock(&dvbdev_register_lock);
 		return ret;
 	}
@@ -570,6 +579,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (IS_ERR(clsdev)) {
 		pr_err("%s: failed to create device dvb%d.%s%d (%pe)\n",
 		       __func__, adap->num, dnames[type], id, clsdev);
+		dvb_device_remove_minor(dvbdev);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);
@@ -577,8 +587,8 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
 		*pdvbdev = NULL;
+		dvb_device_put(dvbdev);
 		mutex_unlock(&dvbdev_register_lock);
 		return PTR_ERR(clsdev);
 	}
@@ -596,10 +606,7 @@ void dvb_remove_device(struct dvb_device *dvbdev)
 	if (!dvbdev)
 		return;
 
-	down_write(&minor_rwsem);
-	dvb_minors[dvbdev->minor] = NULL;
-	dvb_device_put(dvbdev);
-	up_write(&minor_rwsem);
+	dvb_device_remove_minor(dvbdev);
 
 	dvb_media_device_free(dvbdev);
 
-- 
2.43.0

