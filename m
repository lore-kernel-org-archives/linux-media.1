Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD4D3839AA
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045814; cv=none; b=gjeN9BGHVTNh9oaePpRXlpSKfjmNSXP8eFEDyD5KnX7xzPr4Hwyi/PO5tBhPyddh+OlWRdlfJXO18yrZUGi7gt7GJD/jF8ZkxDlqNVq1QBKnW2hx8JYRZ18TnBFgDZnve3uYXRcB5P7F/14R57Y3izKmvL72JajiCSxCHQLa9NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045814; c=relaxed/simple;
	bh=gxhumfPkxkdaCiQ/1ZpswMsiTMXC8L+ll6GYQzzPgio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LNM0asfJHKwzy54OHpktuakMNKM9k0Oy/J2HUD6PiuXYq2kPK6ScXD0g6qX9TQwA8GWbxDHG7JlAa7A1rjYG8kPe8y3/2oPCVfYeEkwzxsFBIlv52G9V7mupGjYlz2gy0H9WGRT17iX1N0Gl6nBLvf8Fbwsv+eC+dlEetcEhxSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=D7Ixff8d; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=D7Ixff8d; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="D7Ixff8d";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="D7Ixff8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1787045804; bh=gxhumfPkxkdaCiQ/1ZpswMsiTMXC8L+ll6GYQzzPgio=;
	h=From:To:Cc:Subject:Date:From;
	b=D7Ixff8dhm6QlSnBMUxaUfoCtyRnoyy+bvY2N5OOqE1udUiiRad+2dVcZIC7liT9O
	 0OZXOeK7R9CIq4tIy2d6D3/tCYs6rNFmpevjqWqklTw+xuseAnmKikp8pLAeuRR6ra
	 4ZRKflLepQrtQz2AM3bmk0slC04Je9Si3B6efoblYoJsSbGt/YaAgPlgIkxoTNV70o
	 jT+aVf2RHP4QY7usF14lIS1ojs7JMkuFPHgMYgiiZJ9dOlnc2mQY+mD/RqitRqzqGC
	 bnj/zTB/LTrvOs2rxcgywcgfyvumY9vkt1fx669TavZ0vBySuMzUW1St3fsvWJtCfv
	 lvq0OqbU8AhSw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id CD285408BD; Tue, 18 Aug 2026 10:36:44 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1787045804; bh=gxhumfPkxkdaCiQ/1ZpswMsiTMXC8L+ll6GYQzzPgio=;
	h=From:To:Cc:Subject:Date:From;
	b=D7Ixff8dhm6QlSnBMUxaUfoCtyRnoyy+bvY2N5OOqE1udUiiRad+2dVcZIC7liT9O
	 0OZXOeK7R9CIq4tIy2d6D3/tCYs6rNFmpevjqWqklTw+xuseAnmKikp8pLAeuRR6ra
	 4ZRKflLepQrtQz2AM3bmk0slC04Je9Si3B6efoblYoJsSbGt/YaAgPlgIkxoTNV70o
	 jT+aVf2RHP4QY7usF14lIS1ojs7JMkuFPHgMYgiiZJ9dOlnc2mQY+mD/RqitRqzqGC
	 bnj/zTB/LTrvOs2rxcgywcgfyvumY9vkt1fx669TavZ0vBySuMzUW1St3fsvWJtCfv
	 lvq0OqbU8AhSw==
Received: from maru.mess.org (hephaestus.mess.org [82.68.61.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 20F0340192;
	Tue, 18 Aug 2026 10:36:44 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Rik van Riel <riel@surriel.com>,
	Sean Young <sean@mess.org>
Subject: [PATCH 0/4] Fix locking issues in rc core 
Date: Tue, 18 Aug 2026 10:36:30 +0100
Message-ID: <cover.1787045579.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix issues found by Sashiko.

Sean Young (4):
  media: rc: Ensure registered is cleared in error path
  media: rc: Ensure that rc_unregister_device() does not free input
    device
  media: rc: Fix ABBA deadlock by making locks more fine grained
  media: rc: Add missing locking for keymap

 drivers/media/rc/rc-ir-raw.c |  39 ++++++----
 drivers/media/rc/rc-main.c   | 134 +++++++++++++++++++++--------------
 include/media/rc-map.h       |   2 -
 3 files changed, 105 insertions(+), 70 deletions(-)

-- 
2.55.0

