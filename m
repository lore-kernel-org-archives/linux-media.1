Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D164C900E;
	Wed, 22 Jul 2026 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715822; cv=none; b=PxDkEDp5LdPakHmjefsscQlFzSqbUgIrGVjpew1yjpqJZ62xztMYXF5SOQBfHs4zR06eLQQ6v4hVozqJW5aWGsucuDN/3W2wxxSpu6FLKQUs12xi8boN2uIDyC9RSR060XKKZWRkWq85jKzTB0D5ASeDaJhk46vkAP3nwGNcCF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715822; c=relaxed/simple;
	bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/immrmCEi1cQk7UgCcYJmsMkfLsY/5vUKDtK3hoQrRIrfqjMGYXN6sZvkZ/mz/dgxXzKJddyPQPY+EZAWyj0AkUXbfOrj0ZTd9bO9QHQlyLdJ1Eq5TIOZyf9pJC5yEQ6YhQLRAFm4zLRNQm5lvVZeB7SNq+lW+BOY7QCcoMbak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=a+ppJtpy; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Uv2FKRFT; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="a+ppJtpy";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Uv2FKRFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715819; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a+ppJtpyAATcCXU3G/xQl9DMxrcl1gkAlSh56EZ72Mol1bjLALaDa3jQSbG5XHons
	 ZOLc65wXl2ksd58VogQ0DEv5Jhbs/DNAAgD5od+bCs4Z++hYekZTsvOOk6F3yR40V9
	 184JLGyS5F7C6RigdI1ZNBrkpeBvHwLNIjRJ1TIqWVb49JcE2R8gHlFcAKWprNVsp6
	 DUf5oXk+y0IptKnyjcGO6s3qcijjGX8eXtXCYa2D2lDKDp+zJvvz5lLFZxft+nswF2
	 D8BSuHsh1vlFyo7WaeZICleToJbrpgY+UAXBD2/h5cYJZtn2egslW1LFlccwYZOu5N
	 2JUeJeQJS/4MA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id A5D6A42546; Wed, 22 Jul 2026 11:23:39 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715818; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uv2FKRFT84ykdKx7onLLSFTGseJbNEemYGtWO+rOyasrKPrnWmQMAdrYVvhXq0ZNx
	 pQ85hOrm9R2FigNnlnekCma9uR1rl/MjaBsHQ7eDL7a4NXvE+At+/MhuCJIItC5hdX
	 0HNuWSjKRxyGHc93YXKf/YZ2VIU4h5Ug0/f8t/r92u/kfXNjeW7StJztyptjttCzRx
	 kP0iiW9C4oVsY5ub4bY3PykIaKMRa3BwrwcZ0G3ZafuTLMbo5i0JSvE1+LPA5ZBKq+
	 vWb4JwcuhyekZ3rleVemrKwscQ0Y3wHBtAgngJ0Ol0qAi0+60AuNBYp1y7cvkQNR0U
	 QsqmOC9ssDEcg==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 6F0C042526;
	Wed, 22 Jul 2026 11:23:38 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/13] media: sunxi-cir: Ensure no more interrupts can occur before free
Date: Wed, 22 Jul 2026 11:23:18 +0100
Message-ID: <d16aa75a7f94678499b37e45a5215f231658e0b0.1784715737.git.sean@mess.org>
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

