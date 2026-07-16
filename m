Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C3D33F58E;
	Thu, 16 Jul 2026 21:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237149; cv=none; b=QYYXq0XzchDTQHB7++zCv7oIsyZZlOMisZW2dQdM0IVi97GwcMud57oMcb12d4nJ81I2RK2xpcpGrytuTL2TiSPa+8efd9a+Y7GjrpqOQ9TejeE6UXGeODdiTrKNKlrj/LtwYZ4saRdsJ7iWh8wVGZM2asrVEb7Z0OUrKaRYksM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237149; c=relaxed/simple;
	bh=jqslKCSwrVbWt146DlZm+Nc3XR/IkUMq73PIcZIrDNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UobgtPfoAOhHNe6IAuPYrJJJhv5rHeUN9u/K9an3Wq7XZ02Gq4Tcpcq/2oSSO8pHbOokmK7RfEhrwdzb5H9+kuppaakZh7K/Q+/j5y56MuLlucrwB/D8H+0IKkEW0z3GFHsuYjVlaJ0M0DFqL+M0Pc6fffuCijwQZcb7ZbKRk3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=A9WfCDIv; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=A9WfCDIv; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="A9WfCDIv";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="A9WfCDIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784237140; bh=jqslKCSwrVbWt146DlZm+Nc3XR/IkUMq73PIcZIrDNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A9WfCDIvzpV94aYCnI1k2geGNNFePFL6Tritq98ubpKqKqYpuA1t/YerkWSCbvFdb
	 REDaEBAKd6d3/1Ur8FUrh3WLEiDjdSf/IYXiqS3pbBSzYH3fNE2AuTFepsF85qQfMI
	 jrCVMbkNhmoVkXXpgMK/g7SuNgsaeU/4N0CesJz3bPZkENRafsXUSMwBBIQhJLTOBi
	 k7NQ7Y9SZfDhxZNbhSJaSV5L9SqEsBSsnZ3XYay+tVubeRhSSzIveohmijt5oxSsFY
	 /pQjTtyoSQbeHmyyGm97DVwd5Vd4i3uwc4ua+d9SIgCfCXIVIrBt6pZEjtsrkPq+CT
	 vkv9hB2sHQHeg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id C33EE40154; Thu, 16 Jul 2026 22:25:40 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784237140; bh=jqslKCSwrVbWt146DlZm+Nc3XR/IkUMq73PIcZIrDNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A9WfCDIvzpV94aYCnI1k2geGNNFePFL6Tritq98ubpKqKqYpuA1t/YerkWSCbvFdb
	 REDaEBAKd6d3/1Ur8FUrh3WLEiDjdSf/IYXiqS3pbBSzYH3fNE2AuTFepsF85qQfMI
	 jrCVMbkNhmoVkXXpgMK/g7SuNgsaeU/4N0CesJz3bPZkENRafsXUSMwBBIQhJLTOBi
	 k7NQ7Y9SZfDhxZNbhSJaSV5L9SqEsBSsnZ3XYay+tVubeRhSSzIveohmijt5oxSsFY
	 /pQjTtyoSQbeHmyyGm97DVwd5Vd4i3uwc4ua+d9SIgCfCXIVIrBt6pZEjtsrkPq+CT
	 vkv9hB2sHQHeg==
Received: from maru.home (host86-147-232-175.range86-147.btcentralplus.com [86.147.232.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 0DFDD40154;
	Thu, 16 Jul 2026 22:25:40 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/11] media: rc: Use after free in ir_raw_event_handle()
Date: Thu, 16 Jul 2026 22:25:32 +0100
Message-ID: <30af3a5f1ce19f3ce68532de85a4e9750319f425.1784236919.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
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

