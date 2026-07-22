Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E664C6F16;
	Wed, 22 Jul 2026 10:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715826; cv=none; b=MpUxD8Kukc7MaPWBaeownkVHnrcWc0Yb0/FvPkGUnFgqdcgO7TWLBgpUK04VN3PWqvJP2Xytr6k34ySL9vdVP5bjP/DnyXB/lJ3PgvrAGMyeWNsaPD2MMZhg+oc9K+XjegPH519YVOpPa1fh25ChH14xg0RkP/eHKTqUakGu1zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715826; c=relaxed/simple;
	bh=jqslKCSwrVbWt146DlZm+Nc3XR/IkUMq73PIcZIrDNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ehtp17usVoUp1zQ1BToM47A4p8FiA6LHDm8G8iHLlxiUpqI8gJ3sIjFkUTvRSgoPw/ZcYTlThKui27SpuApWE9FZUazJxyaPqqt1KowA0thYNhmJH7OPGiUB7vbVIIYsQqU7FGbLA3S8ZgxahbAkRD0N69enzGl6KBiFcEZlVys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=ilI+7aSz; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Nrq/j9UF; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="ilI+7aSz";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Nrq/j9UF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715823; bh=jqslKCSwrVbWt146DlZm+Nc3XR/IkUMq73PIcZIrDNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ilI+7aSzRSLWKKNsOaw8puzO+6D5aUGoSIHQ7wHaJEpXJJ3PrZo1HRiBRqgh/gWW2
	 Kfq5vUVW8MdNi46Ri3Z0A62P92Zw8dM1bV66wiF2Rp61hi6xAcPkelPqUf1b9J8XeL
	 CqLE9Q3Iqh3Prl+A+coMgkAwOnODGKVKeUSq0cMfCVdzJx2nGgkPPV82NVpT1RP+YO
	 Vyd16hiWJOUuVgXIbO3trrkiTnlnzXm/x/NhR29a1iP+m60OGU4R3NKVn/HCxGmXJg
	 5hrvbTsCS/XzeiXRxzPsY7+hECopZGL9SAc6amD4FqDE5zpU+5Q/zvAM0UM+VBAOzL
	 T6l+9FSUs/Bvg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 2700E4253E; Wed, 22 Jul 2026 11:23:43 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715821; bh=jqslKCSwrVbWt146DlZm+Nc3XR/IkUMq73PIcZIrDNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nrq/j9UFoRv/cQeyhrDZXYKm8rz2y4o9/2aPE0wRbswBsaUpzF5Ov/mvWvty04t9e
	 yvdA/Fv6iCsnI6ch2t5b+1NsjIpYsGpKxPbhsXUfqdElZcWpBk8314tDQVUKhh/tIk
	 6ImN3iQElVpalIM7lXHx8sQYSlCDn+Prdgnh8XwGPcqpMlPp89kAmISH/dJAYGTirc
	 M/+rq5OuIG4IYJyOKqnFAUJkDSv52jTFerZTbnfOoftDo1eiAnh23L0QX9KsYypHUm
	 gdcfJAho9CsKREVDP2HSIQYtDa1f7FViHFzQEDRZ7NTLFxFPzAEc3Pe+Oe9uwOgQcH
	 J5AjbZM7MhOuQ==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 904A04017A;
	Wed, 22 Jul 2026 11:23:41 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/13] media: rc: Use after free in ir_raw_event_handle()
Date: Wed, 22 Jul 2026 11:23:23 +0100
Message-ID: <f6836332ca08640cbe319b9f8a7231ccd44c1935.1784715737.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If rc_unregister_device() is called while IR is being processed, then
ir_raw_event_handle() could call wake_up_process(dev->raw->thread)
after kthread_stop(dev->raw->thread).

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-ir-raw.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index ba24c2f22d39..f066176c9f37 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -637,6 +637,7 @@ int ir_raw_event_register(struct rc_dev *dev)
 	if (IS_ERR(thread))
 		return PTR_ERR(thread);
 
+	get_task_struct(thread);
 	dev->raw->thread = thread;
 
 	mutex_lock(&ir_raw_handler_lock);
@@ -648,8 +649,12 @@ int ir_raw_event_register(struct rc_dev *dev)
 
 void ir_raw_event_free(struct rc_dev *dev)
 {
-	kfree(dev->raw);
-	dev->raw = NULL;
+	if (dev->raw) {
+		if (dev->raw->thread)
+			put_task_struct(dev->raw->thread);
+		kfree(dev->raw);
+		dev->raw = NULL;
+	}
 }
 
 void ir_raw_event_unregister(struct rc_dev *dev)
-- 
2.55.0

