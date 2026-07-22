Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61574C9562;
	Wed, 22 Jul 2026 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715823; cv=none; b=Kk6Ofm9I48BneARL5gQ8pRBamhYrWDfeV1bw5ws9LtqX55sw6iFXzgMoIqpgPqxJHQZJwsq9R9cJZS639n1AiOevfaQmezRuuxJ14ryJ4GIJFWHKg70mEnvG/nVNhk1/elZNRmnTyetrQDbiyF09hEGtLkLZr0hP6b+4h+dgYnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715823; c=relaxed/simple;
	bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/2CZJp7Q1ABMQZkI/Rc+XnrHv3ZpRRqsMlnx24WzbSIyeLeORkRgFl6AX3I7FXz87VbjqXB8i6VwhYHAb4+G4BQ6tFTEHYNTV0Z5m17M8zYz3F7FPOhO1QLhPz+cA3VEk8t7zbNn4pHfXQ0uw2dEXcES8PR5itEfZvsfKofkvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=p8nIqaVy; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=mDQMFol5; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="p8nIqaVy";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="mDQMFol5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715820; bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p8nIqaVy2DRAugJh8aw//UBb54MV40uLKDuKRL1RlRkX+MpGQcinX4Og9iqb3+Z6l
	 C9vTi7FtrqrajL9bKCSxY4S69e5YoaXj9FP785NDijsteKl8d3oSMfJ+O0eLtkWFyK
	 bNG6N3Ai7ykyR+R+lEScdY/++kzhcf7gLgUP/yHpFDlaS11CNpuKxBu2ojkO71EU1j
	 RK2jydoXQyr/9pa9yoViRbJJV/EaghpzUisfrEJe/6rzzEHwJirrnsDf47ZFP4KYJp
	 kPi+MXEVF3zqhzY/fCIqZhV+HZhMzZFScF6eLJNacTqFkrlVBn+ttXWzWhvwlEF+Tq
	 pL69BC263WWrQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 7A8424254A; Wed, 22 Jul 2026 11:23:40 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715819; bh=v0aZIk+G8qQOaUMq8H69z/O75gsUb1OibfhX/UC/5PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mDQMFol5QBHHj3Osr3lFNkgmOfBFQ3HLbZ0N14Iuyn3D4GVP/e2erCiWqaO/I0u3n
	 vDdg3N6fLu3cEJCs1HxkpKzVW2c61m/Z+/WiOGdAL1EPqvDxz8YX2JjSJFAdfU840n
	 93TeS/6TRrvENsGMVBQrTSe2HSHrvG67Hansj69c9xhhzRH+MeS7Fwv7t6RnIyiekt
	 sBHMtgtLfctNuQTjSscPdiBiSYfQ1KGFzCVDCItN8NddINsVqBDGq1ckSb0SlbGF30
	 lmh6f0MreVpEmGqoGikiSJ8NjdQyGq8Mg27wQRHzoMgbnOkc1eV+a4I2uqJhidYcvu
	 kHlBw1NVeHQfw==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 247FB4252C;
	Wed, 22 Jul 2026 11:23:39 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/13] media: meson-ir-tx: Ensure clock is disabled on unbind
Date: Wed, 22 Jul 2026 11:23:19 +0100
Message-ID: <ff9948f8d30ceb0f7d2c962097798dc9ed8a1a40.1784715737.git.sean@mess.org>
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

clk_prepare_enable() needs a call to clk_disable_unprepare() on
driver unbind. Make it devm managed.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/media/rc/meson-ir-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index fded2c256f2a..e7bb107e6a84 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -288,8 +288,8 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
 	if (!np)
 		return -ENODEV;
 
-	clock = devm_clk_get(ir->dev, "xtal");
-	if (IS_ERR(clock) || clk_prepare_enable(clock))
+	clock = devm_clk_get_enabled(ir->dev, "xtal");
+	if (IS_ERR(clock))
 		return -ENODEV;
 
 	*clk_nr = IRB_MOD_XTAL3_CLK;
-- 
2.55.0

