Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD7B3DB641;
	Fri, 10 Jul 2026 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673640; cv=none; b=puNZ8gYoVWneq+uMF/hRBF2ezafkClPgBt/ccmQqZGO0PcqiYL6Po6XUcmScMGVT1RJTu83QQ41WoQ8uDW4d8XKu0uwa5Kc1waXGjwpEGOsVSBdASLWEaZLFKnaDxR0Ucac+Zlwv6II0eadnjeVARiefjQup4SS08IXcDOrdook=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673640; c=relaxed/simple;
	bh=VTN1gzPokpMjTvGP+n6o0ob+YikmETxLkSiXZ9C7eUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDMT/ZdXGidMM1In7sKcSo+ivdu/O9y5TX3AnvWsBp/7ysxo3d0Kj0eKi9leqfWq5HnGcVuDXOjaXNbq52dxMOw/uF1vZyYJW1sqjp2hrrbThDJfLV3efmloatulYUT/hz08cLt8xJEZR7dIMjHv7zQd8WHSYGitXVaV3Y67V00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=QjwaI4gf; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=KoybHE3B; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="QjwaI4gf";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="KoybHE3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673633; bh=VTN1gzPokpMjTvGP+n6o0ob+YikmETxLkSiXZ9C7eUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QjwaI4gfZjikGgu82HdYjbZ3IBl+AE4A8Ye0Aeq4bIee06uM9lY6ZCdJu0MoLtGx4
	 jwAtkFtJ++p8QBqP8AoPDbmxYeK7yQ/r1il2gfD18Ruj/wfzQ1PFESs5rS+D+FT6r/
	 M1MUrl9wU4C4fK5h7HFINEoR8GTR7l/yLmIElzbn7fJjBcYfnxDbZuHg5MzIvCQogI
	 efEZU7rRNJc9kV3SAXnHCs8Uo/rXf1JmgLX5vbDux5WNY7nfOD74e/CDxeZbLuEwTW
	 OFFC1R3moF/EheauSDXoEyeo9QOwYJqP0Vqoyn/SIFp7IvZDdBm59NfuUc4fHRAsTa
	 cfMjio41fEO4A==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 0C33140B2B; Fri, 10 Jul 2026 09:53:53 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673631; bh=VTN1gzPokpMjTvGP+n6o0ob+YikmETxLkSiXZ9C7eUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KoybHE3BX08uWg1kOaSiOcb06STgFgg/c6NzTKAEwAzutIhvnPJmOzJbreIlvCjXf
	 xkPO37jyL/qWXvvDMRB49DtoIJX/0gpRdhtCDqdbIb54ZM8kqmHZCc4cjJlsmifIed
	 tkaNav92YSa2RzIqKRXLqJ0f0jmfnRLCtZcC7Ip53sp3bu0KraEcAVD8dzbeOjgyYx
	 fXuugaSVdsLsM3+AZZy81Y56PsYmrBd3eFjml0XxYQzGWJU3QmI2+SipUtATiKH1ay
	 kYQJU68WN+h1Ms8Fd4y48xhMej/KpkiXyBGAz69i8T0UGpeD9fQkNSpHCUmUiBkvaT
	 R0oo78uOqZrIw==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 1378B40AF1;
	Fri, 10 Jul 2026 09:53:51 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] media: meson-ir-tx: Ensure rc_free_device() is called on unbind
Date: Fri, 10 Jul 2026 09:53:34 +0100
Message-ID: <a11dc2d089d4e288b63412a0d3029393c577ee80.1783673420.git.sean@mess.org>
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

Make rc_dev devm managed.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/meson-ir-tx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index e7bb107e6a84..abb107d19e8c 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -345,7 +345,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "irq request failed\n");
 
-	rc = rc_allocate_device(RC_DRIVER_IR_RAW_TX);
+	rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW_TX);
 	if (!rc)
 		return -ENOMEM;
 
@@ -358,10 +358,8 @@ static int meson_irtx_probe(struct platform_device *pdev)
 	rc->s_tx_duty_cycle = meson_irtx_set_duty_cycle;
 
 	ret = devm_rc_register_device(dev, rc);
-	if (ret < 0) {
-		rc_free_device(rc);
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "rc_dev registration failed\n");
-	}
 
 	return 0;
 }
-- 
2.55.0

