Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FB3363C43;
	Mon, 13 Jul 2026 21:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978296; cv=none; b=rmwLZWvCy9Dwr3qv6ZYWfzwZBABZSXRSD5Ays2gRMorO9gppxxZZ6ZciRrd4HhkfdLycVA9SiUMZg8dcxQ5IERytbjLKJPiXVgf4pumlpzkY14GVdxCP3Xy8corlbgBWHFdsY+l4wtvzWXFgNj97yZEHdLGdCHb5u12UFDBRKcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978296; c=relaxed/simple;
	bh=/wMd2S6H6xvTmWtuaEoRsTWos8Ya+ZV7pVOSZ2gd67g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QS7VHGV1ZWwoJTuSwr8rk9LuYE2RE7sV7x97owxtA+s9Vi8c7k0pi0XeKJIAPCSffTdbZSuzrTtm0gaYpcMsUoL7ejbbYGoLWC+RKG7ip1bIc/6vXOHsm/8gosFeHw170X+vXQkYqbEu8+5eKdBJka3pWTyubHeNZYbnty65s7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=rb1clmVD; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=rb1clmVD; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="rb1clmVD";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="rb1clmVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978283; bh=/wMd2S6H6xvTmWtuaEoRsTWos8Ya+ZV7pVOSZ2gd67g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rb1clmVDADAClHao1NcD6q20qf7aLV5ZPHJLbrP1kUdA6wyx2Axc7sIHONc3m5zsh
	 Y5Q9Jf6Yoy+P+rWJkZsAbzX85RV92Z3erFkvKUwG3fd0iejgz8Uo9a3iBgx19thJvi
	 LlqgDqZPeTpshPUhDJqJnjm2jz5JxTeuGX4EW/WJyiVqImkGuryD6Uhl4ALHiSs9EY
	 NqaW9BPVu8yMdiXUVHY4qAu+2ZJI/nJMsxDrvvA0G68kZwiJcTrUhmquIfpy8u4IWH
	 xSZjwBXiu4eUvMAQvn4CmTqboV77gCr6HaSxoh7UAoRTXOD+sqE93Dh912t8C65+CY
	 BeMR88hXafPCg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id C449C40A4A; Mon, 13 Jul 2026 22:31:23 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978283; bh=/wMd2S6H6xvTmWtuaEoRsTWos8Ya+ZV7pVOSZ2gd67g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rb1clmVDADAClHao1NcD6q20qf7aLV5ZPHJLbrP1kUdA6wyx2Axc7sIHONc3m5zsh
	 Y5Q9Jf6Yoy+P+rWJkZsAbzX85RV92Z3erFkvKUwG3fd0iejgz8Uo9a3iBgx19thJvi
	 LlqgDqZPeTpshPUhDJqJnjm2jz5JxTeuGX4EW/WJyiVqImkGuryD6Uhl4ALHiSs9EY
	 NqaW9BPVu8yMdiXUVHY4qAu+2ZJI/nJMsxDrvvA0G68kZwiJcTrUhmquIfpy8u4IWH
	 xSZjwBXiu4eUvMAQvn4CmTqboV77gCr6HaSxoh7UAoRTXOD+sqE93Dh912t8C65+CY
	 BeMR88hXafPCg==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id DA28940155;
	Mon, 13 Jul 2026 22:31:22 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/11] media: redrat3: Ensure all urbs are suspended
Date: Mon, 13 Jul 2026 22:30:58 +0100
Message-ID: <57b8e3e0efa4efa11a55d98edb093388844d231b.1783977550.git.sean@mess.org>
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

Ensure that the learn urb is stopped before suspend.

Fixes: c49fcdde38cb ("[media] redrat3: enable carrier reports using wideband receiver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/redrat3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 44678ee322c2..468907d6c3a8 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1167,6 +1167,7 @@ static int redrat3_dev_suspend(struct usb_interface *intf, pm_message_t message)
 	usb_kill_urb(rr3->narrow_urb);
 	usb_kill_urb(rr3->wide_urb);
 	usb_kill_urb(rr3->flash_urb);
+	usb_kill_urb(rr3->learn_urb);
 	return 0;
 }
 
-- 
2.55.0

