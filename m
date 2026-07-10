Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5723E3DA7EE;
	Fri, 10 Jul 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673639; cv=none; b=q8ODGCWioqmsuDzyHLSTUvza63x9qAyNuOCCwjtzz+yReg9Zuw936yBgbLYmyD/Ovrk2Ox3e1XVcHaZOwYsHf3f3+TrSTzuYgjxADZxFBr09U5bjNO6JhzpvqN5/ZkRIENQXWilEKaXonEYNiio7py58oEiNfZiuyMS/3b/1GNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673639; c=relaxed/simple;
	bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kL7mEM4bJNYtHXt1hgwfbbMRSeNFvXvoR5PAdRkoTxzQRkOxid3SUC+icDLqH32GSTGQBYcSucW56GaPfKFEpYlT70dyLD7iFY+HStKT4lu3vgjwz4/I7e0lGJ3+AoDQsS5MktkN3yoCz1tSDVllkEHwKlODC3ZH50JY0scJKZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=pqaVoVc+; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Q7tS2vmA; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="pqaVoVc+";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Q7tS2vmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673630; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pqaVoVc+xqwi4zltj+mcYWczHgP/iJginifwqnX3TdaDGrn9Fo2biGHB4LkJUYEog
	 u2BKKbjSMb+PJvjwn8U7aD1Umnb3MtMioRxmS4T2Hs7LgdSeJZJqiwjAGKsrxzjo1t
	 XhRRdDolDRqHN/jWkkxCauK1pm5+ch5mJ4IJ3Ty5sygL4HxvpeK4StAbkIRYeosNWU
	 mUxh8khTw26WwJJVtEGoxfULdBIIbt73S+xo2JdlyqB+PMTmQqkNggOKKheYr7tG3O
	 uhb6YALZxnGWhS2siP7468iU4dOUW35VCwD0Sv82LWC6nVFari0Ne6m5zexY3n0qui
	 yE1VwSj9VYHKA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id CCE7D40B54; Fri, 10 Jul 2026 09:53:50 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673629; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q7tS2vmA86o248eMBvJZbYEhyUISrTe2nv47HVo3EBB7Wxrw/q2cjF2Q/s1a683pj
	 BoBwF+MTN5v6MmQc7WN1g5SAoqY0NzP9lX+ggsZPVjvkpArpwCtP34JWz2KigVZg4e
	 6L0xbtr9uexxKL+seFkxe6wfL9blzBpwgYSgfoEFoYy6gvzgZ3t9n0FXXuHercC8Gb
	 ArHomzEUtOdrVqrjnuDjawTYJZawhFr+ZEK3GKuww4egj8dYWc46AUqlVpofx+Ap1z
	 aJPjdLb7TV96CXOc2nFahvHojnRrNmcHsgaXzd50an5BycQdq1m405O6IWFL8/cCJK
	 Z4M3GggQWecXA==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id B556540B4C;
	Fri, 10 Jul 2026 09:53:49 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] media: sunxi-cir: Ensure no more interrupts can occur before free
Date: Fri, 10 Jul 2026 09:53:32 +0100
Message-ID: <e74a0caf91aaefaf98476a191e6489c606632bf1.1783673420.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only call rc_free_device() once the hardware has been stopped.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/sunxi-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 28e840a7e5b8..af1ee08ffdbe 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -374,8 +374,8 @@ static void sunxi_ir_remove(struct platform_device *pdev)
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	rc_unregister_device(ir->rc);
-	rc_free_device(ir->rc);
 	sunxi_ir_hw_exit(&pdev->dev);
+	rc_free_device(ir->rc);
 }
 
 static void sunxi_ir_shutdown(struct platform_device *pdev)
-- 
2.55.0

