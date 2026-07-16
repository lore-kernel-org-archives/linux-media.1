Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048FD70836;
	Thu, 16 Jul 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237149; cv=none; b=Ax7MmTjURjOeDw3KXX6LJv7WmmGwLeS6PY/li8nQrxkeMzhz7euSUiSP4sH/FSdefmxAe06UgfZMNq7eon/+vtsnzucZfy3ahANRcJlHZ3oo+WRQylTJqs7Hp+aGdlgo7JCYA6IbVSGvi3IsaAALafNGYmiYOnlGj2WBVDHYfOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237149; c=relaxed/simple;
	bh=vIGWW0q7qDZpE2XaivemThfhoGPHq88Yr7BOi4F1Frg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGV503prsi8sWWkKm167QKWAw0P4E9KUhTEbx8s6FfKaXq2bfIrqfurzhQPwdun3NbV2mQYWysvvV5OuuvdPnjV2wgQEM0Yu1UVmtbnqs7TK1xAZ7+12xVAKJbhHpJJdd1Niat8j3acT45k8VLraWZhdz+8xMbokmAsqRGB09bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=V/y6YCXi; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=gyQHv5Ih; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="V/y6YCXi";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="gyQHv5Ih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784237140; bh=vIGWW0q7qDZpE2XaivemThfhoGPHq88Yr7BOi4F1Frg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V/y6YCXiiz5cMvhx+aDquE6lFenmx1UGpSfjtcn8fRi2IJe8KbLhjARD8AVfbhKmY
	 Srtv9iv3obaoT9srIWlIsCh4Z0mQFj1mYtcrPqCTBt0UpepQnGchFJGDu5kHJ9ubUX
	 ap8iozMIrX+3IUVglnHmOoaqXlvXasUYWEeKQ1o35xL3hSgad4Cs5iqgdLnWMriEE4
	 COMXNjYfc+pbTLLxbn4X02+kFyAATGTWhGlBWE7B6Y+osITbrLaI+o1ErtfAQ3tFpx
	 ueskNsGPPG+UXiY6Iwl3LTaVYPmaL6iwig9PI8Ue+Mz0QwZTaHbl4JkYYY/fnItEll
	 vvRMTfzBEOr6A==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 09C0340A3D; Thu, 16 Jul 2026 22:25:40 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784237139; bh=vIGWW0q7qDZpE2XaivemThfhoGPHq88Yr7BOi4F1Frg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gyQHv5Ih9+6y4skIFPqBtqsDoP19x3D9dSWCxjeoSa0Lnk+iz0LQFXw3d0Xe+k+cx
	 m+3lSDlb3TAsZqm2bT9AqMKiCz+nO4FYArxkgnXynNdQu8Ab72TcfrIaKlc1smxMz7
	 i2XdjZkVqTWZoPDc2pfcbFBY/7CV7gEHCvpTju5+RlKAVxeH2Qcv3hAMMsLhSlv+kX
	 A1UM5d9fUncUXxaNMyCax64J+YZTzHARZwpH8NIQvVfD5lNElDhdSQTd2CqeDyyFjG
	 Qm6AErP2yc61pWlcVQWLQdSTOUS+wDQ3TamgksiaL08ljS7rOP7HMr5cw+hI7XhNF9
	 NJlnmhDGtUGTw==
Received: from maru.home (host86-147-232-175.range86-147.btcentralplus.com [86.147.232.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 273F540154;
	Thu, 16 Jul 2026 22:25:39 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guoxiong Yan <yanguoxiong@huawei.com>,
	Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] media: ir-hix5hd2: Ensure rdev is setup before interrupts are enabled
Date: Thu, 16 Jul 2026 22:25:31 +0100
Message-ID: <f0ec782d44f4fef11a0afb681d44ac7b6b745d57.1784236919.git.sean@mess.org>
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

Once the interrupt handler is enabled, priv->rdev can be used. Ensure
it is setup correctly so there is no race condition.

Fixes: a84fcdaa9058 ("[media] rc: Introduce hix5hd2 IR transmitter driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir-hix5hd2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index 1b061e4a3dcf..aa3de4d57a58 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -316,6 +316,9 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto clkerr;
 
+	priv->rdev = rdev;
+	priv->dev = dev;
+
 	if (devm_request_irq(dev, priv->irq, hix5hd2_ir_rx_interrupt,
 			     0, pdev->name, priv) < 0) {
 		dev_err(dev, "IRQ %d register failed\n", priv->irq);
@@ -323,8 +326,6 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 		goto regerr;
 	}
 
-	priv->rdev = rdev;
-	priv->dev = dev;
 	platform_set_drvdata(pdev, priv);
 
 	return ret;
-- 
2.55.0

