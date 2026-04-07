Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697DC3A75A5;
	Tue,  7 Apr 2026 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556523; cv=none; b=ppl1HToVCtXh0xJoUP39eacpnsQgGaeLW/z7bV1ajZ6mwgLAkxMsdUH+dCORDbscMwZW+Y5RD+gedULWfAp1HxQsaovfiorRWGkPDrRJsAMz2yv7nFXvgkroSMkr98UFwXW2okK5fWbWMXIaXrynYPmE6M13hWDFsn/OGlOVAhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556523; c=relaxed/simple;
	bh=FF81oGCkaM1al5wTM45wM9udUtbVp+kmfVYy65JbJVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z+cVt3ltouwdRDzixQbqzemkmRFbw1ZP4nRbKbk16pl9K4HGFDqX7o7toev6c5IvIIlRS4Z4O865KlPUW3MI+6H0i05lgNkChX1FIsQy5RuxYkP8qtE3O8NRkywRyH/sU4/eKHe3UE1Q7p+Wzr5qFqFmMqNGLq6ZSSdJtgVR20s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doe8hmpq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doe8hmpq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5DEC116C6;
	Tue,  7 Apr 2026 10:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775556523;
	bh=FF81oGCkaM1al5wTM45wM9udUtbVp+kmfVYy65JbJVc=;
	h=From:To:Cc:Subject:Date:From;
	b=doe8hmpqOgMHgpuqlIxjNOlv/09XZ9XWaih4D0HLiftNXoxzonf8DKb2F+M5CkAIo
	 K9Uxar3m+OM3bLLDdH+gLk1lXWwSybFfkxdQNZWClJRhzs4Gyri5QeHZJFDImjJfNA
	 UocjY039NQX7stk2OxMoKc06m4zDoZ96zF0q+3THaTW/ByJ5fuc3HZRyxW+MnB6GtU
	 Y3/zfTbguKyxnxnxUJ68CBU5Wg2rZrE5G8G7CN/o81LVKUCJGALSlmENfXKxOKmsEj
	 r2emCmA8iSvaH9ABltEPzAoo1+WYtODBGjmGLDJR4Em6cDMRP8zE9T4rpuYwfsck6g
	 7Dt2dakaeAHww==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wA3MO-0000000B3Y1-3Nlu;
	Tue, 07 Apr 2026 12:08:40 +0200
From: Johan Hovold <johan@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] media: vpif_capture: fix OF node reference imbalance
Date: Tue,  7 Apr 2026 12:08:31 +0200
Message-ID: <20260407100831.2635227-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver reuses the OF node of the parent device but fails to take
another reference to balance the one dropped by the platform bus code
when unbinding the parent and releasing the child devices.

Fix this by using the intended helper for reusing OF nodes.

Fixes: 4a5f8ae50b66 ("[media] davinci: vpif_capture: get subdevs from DT when available")
Cc: stable@vger.kernel.org	# 4.13
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/ti/davinci/vpif_capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index 15df3ea2f77e..91cb6223561a 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1498,7 +1498,7 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 	 * video ports & endpoints data.
 	 */
 	if (pdev->dev.parent && pdev->dev.parent->of_node)
-		pdev->dev.of_node = pdev->dev.parent->of_node;
+		device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
 	if (!IS_ENABLED(CONFIG_OF) || !pdev->dev.of_node)
 		return pdev->dev.platform_data;
 
-- 
2.52.0

