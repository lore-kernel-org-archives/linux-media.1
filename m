Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC083D88F0
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673637; cv=none; b=lcKFet9ijszeMNMJxTI046VlXLRP07BZt9vHIyKe03Dt4ZGMkUquGwMQDmyb7vHupKVWzhc+I8eIXUUcwg5+LB3/wlAw3LorZ3JuqUVFPpfVxAvUdUWtkA6piVWKtDWTEUtFFX1NMP3iN9/aJgXRocdCaAOf+f7ct0EEijlnTRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673637; c=relaxed/simple;
	bh=f8X3hs3KfpHJ+ddgwbbAYYOPiPTGEV5jrh6ErK4IAGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=foKp7sQ7q3mIy9an6ORtPOnf9TIQfkyz1llkreJeV/r7xySx8VXx+OAD2606j8wY/nhL63M5JpkpHpD01utmx7clxnNOdcyCUT4ZD004t83e5pfaIGI76jesv1Lm60GPP7UOXmpR+rlrGin2Rvm5dAcG2eQ/2km4FRCGcRQfRw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=f//OWYUx; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=hCpNk2TS; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="f//OWYUx";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="hCpNk2TS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673628; bh=f8X3hs3KfpHJ+ddgwbbAYYOPiPTGEV5jrh6ErK4IAGE=;
	h=From:To:Cc:Subject:Date:From;
	b=f//OWYUxBNawlCd6zcsomzzaxFb9AXvYhz6EOYtQ3jflHMbedDPImph25+0vEtKnq
	 FK5VPohYqzDvnhm6VSoqe47IBajmljRLZ1FPhetLPHNrYhtqyVG7D3berR6PWLnWFP
	 6Iz6Y/dSxM+5xu0u1g/S/5U8QrOw0okYbPzu1+undoHHAx1vZ1Om0GPQ3QzosJBsNP
	 Q1QJazTdx4gVRpV06gz0u8Il1Y8pM1Fb/em25zZyTK2m7bp6zQLKE0002M3YSRpmvR
	 5LJC8DIeB8K0PFuZu90jZIC3O1kKwKyr1Z7pcB4ePn/vhJydjr4rxZBPhRnBnXtNE5
	 GbJg544UvYZsw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id A484140B2D; Fri, 10 Jul 2026 09:53:48 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673627; bh=f8X3hs3KfpHJ+ddgwbbAYYOPiPTGEV5jrh6ErK4IAGE=;
	h=From:To:Cc:Subject:Date:From;
	b=hCpNk2TSM0HiQFkm4gyyDSS9huvtyWz7gh2kh0oNe9PlhDxqA/TO55VIpfQHooY6L
	 UjOGAYounpETgQH1Z5VY+VLQKYndKsAV4jrUvEXGl3NtXQse0/n/po0usUbyjWtg7w
	 HXy424rldO3tWDzj0V3CDZme3JUjYUysYUMVphxrzS/+Oaa46XzdAyOD/jUsHuSo1h
	 9ryCRYrfJrx0hDJAkzN6zGmLZYi+xk7Mpvv5EP9DOLPypRRYcsDhkiacZJFqwWaW8V
	 NgdIolsr4sbCbJ9QPYq5NhZzlBUdvOzR7VAb2g5D2kvc1/yCDyTFBmRZZ5kpx+0eSx
	 Z8Ufh9vSrLXIw==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 9DFDA40194;
	Fri, 10 Jul 2026 09:53:47 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Sean Young <sean@mess.org>
Subject: [PATCH 0/7] Fix leaks in rc core 
Date: Fri, 10 Jul 2026 09:53:28 +0100
Message-ID: <cover.1783673420.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Sean Young (7):
  media: streamzap: Add missing rc_unregister_device()
  media: redrat3: Ensure rc device is freed if enable_detector() fails
  media: redrat3: Ensure we don't read beyond the end of the packet
  media: sunxi-cir: Ensure no more interrupts can occur before free
  media: meson-ir-tx: Ensure clock is disabled on unbind
  media: meson-ir-tx: Ensure rc_free_device() is called on unbind
  media: ir-hix5hd2: Ensure rdev is setup before interrupts are enabled

 drivers/media/rc/ir-hix5hd2.c  |  5 +++--
 drivers/media/rc/meson-ir-tx.c | 10 ++++------
 drivers/media/rc/redrat3.c     | 15 ++++++++++++++-
 drivers/media/rc/streamzap.c   |  1 +
 drivers/media/rc/sunxi-cir.c   |  2 +-
 5 files changed, 23 insertions(+), 10 deletions(-)

-- 
2.55.0

